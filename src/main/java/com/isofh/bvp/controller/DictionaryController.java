package com.isofh.bvp.controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.DataDictionaryInfo;
import com.isofh.bvp.dataaccess.MenuInfo;
import com.isofh.bvp.dataaccess.UserInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.utils.ConvertUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@Controller
public class DictionaryController extends BaseController {

    @Autowired
    ServletContext context;

    @RequestMapping(value = "/dictionary/dictionary")
    public ResponseEntity<byte[]> getDictionary() throws IOException {
        String path = context.getRealPath("WEB-INF/configs/dictionary.json");
        File file = new File(path);
        if (!file.exists()) {

            JsonArray dic;
            JsonObject result = new DataDictionaryInfo().get(DataDictionaryInfo.DataDictionary.DATA_DICTIONARY, new JsonObject());
            dic = ConvertUtils.toJsonArray(result.get("dic"), new JsonArray());
            JsonObject jsonObject = new JsonObject();
            jsonObject.add("dic", dic);
            List<String> lines = Arrays.asList(ConvertUtils.toJson(dic));
            Files.write(Paths.get(path), lines, Charset.forName("UTF-8"));
            file = new File(path);
        }
        MultiValueMap multiValueMap = new HttpHeaders();
        multiValueMap.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<byte[]>(IOUtils.toByteArray(new FileInputStream(file)), multiValueMap, HttpStatus.OK);
    }

    @RequestMapping(value = "/dictionary/get-dictionary")
    public @ResponseBody
    JsonObject getDictionary(HttpServletRequest request) throws IOException {
        JsonArray dic;
        JsonObject result = new DataDictionaryInfo().get(DataDictionaryInfo.DataDictionary.DATA_DICTIONARY, new JsonObject());
        dic = ConvertUtils.toJsonArray(result.get("dic"), new JsonArray());
        if (dic.size() == 0) {
            dic = initFirsttime(request);
        }
        JsonObject jsonObject = new JsonObject();
        jsonObject.add("dic", dic);
        new DataDictionaryInfo().save(DataDictionaryInfo.DataDictionary.DATA_DICTIONARY, jsonObject);

        List<String> lines = Arrays.asList(ConvertUtils.toJson(dic));
        String path = request.getServletContext().getRealPath("/WEB-INF/configs/dictionary.json");
        Path file = Paths.get(path);
        Files.write(file, lines, Charset.forName("UTF-8"));
        JsonArray finalDic = dic;
        InputStream inputStream = request.getSession().getServletContext().getResourceAsStream("/WEB-INF/configs/default_dictionary.json");
        new Thread(() -> {
            try {
                reflector(inputStream, finalDic);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }).start();
        return ok(dic);
    }

    void reflector(InputStream inputStream, JsonArray dic) throws IOException {
        HashMap<String, JsonObject> map = new HashMap<>();
        for (int i = 0; i < dic.size(); i++) {
            JsonObject jsonObject = ConvertUtils.toJsonObject(dic.get(i));
            String key = ConvertUtils.toString(jsonObject.get("key"));
            map.put(key, jsonObject);
        }
        addFromDefaultDic(inputStream, map);
        addListMenu(map);
        addListDoctor(map);
        dic = ConvertUtils.toJsonArray(ConvertUtils.toJson(map.values()));
        JsonObject jsonObject = new JsonObject();
        jsonObject.add("dic", dic);
        new DataDictionaryInfo().save(DataDictionaryInfo.DataDictionary.DATA_DICTIONARY, jsonObject);
        inputStream.close();
    }

    void addFromDefaultDic(InputStream inputStream, HashMap<String, JsonObject> map) {
        try {
            String dataDefault = IOUtils.toString(inputStream, StandardCharsets.UTF_8);
            JsonArray dic = ConvertUtils.toJsonArray(dataDefault, new JsonArray());
            for (int i = 0; i < dic.size(); i++) {
                JsonObject jsonObject = ConvertUtils.toJsonObject(dic.get(i));
                String key = ConvertUtils.toString(jsonObject.get("key"));
                if (!map.containsKey(key)) {
                    map.put(key, jsonObject);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    void addListDoctor(HashMap<String, JsonObject> map) {
        try {
            ServiceReturnEntity<JsonObject> data = new UserInfo().search("1","10","","","","","2","","","","","","");
            if (data.getCode() == 0 && data.getData() != null) {
                JsonObject jsonObject = data.getData();
                JsonArray jsonArray = ConvertUtils.toJsonArray(jsonObject.get("data"));
                for (int i = 0; i < jsonArray.size(); i++) {
                    jsonObject = ConvertUtils.toJsonObject(jsonArray.get(i));
                    JsonObject doctor = ConvertUtils.toJsonObject(jsonObject.get("user"));
                    JsonObject department = ConvertUtils.toJsonObject(jsonObject.get("department"));
                    String name = ConvertUtils.toString(doctor.get("name"));
                    String departmentName = getPosition(doctor, department);
                    if (!map.containsKey(name)) {
                        jsonObject = new JsonObject();
                        jsonObject.addProperty("key", name);
                        jsonObject.addProperty("isDoctor", true);
                        map.put(name, jsonObject);
                    } else {
                        jsonObject = map.get(name);
                        jsonObject.addProperty("isDoctor", true);
                    }
                    if (!map.containsKey(departmentName)) {
                        jsonObject = new JsonObject();
                        jsonObject.addProperty("key", departmentName);
                        jsonObject.addProperty("isPosition", true);
                        map.put(departmentName, jsonObject);
                    } else {
                        jsonObject = map.get(departmentName);
                        jsonObject.addProperty("isPosition", true);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    String getPosition(JsonObject doctor, JsonObject department) {
        String departmentName = "";
        if (department != null)
            departmentName = ConvertUtils.toString(department.get("name"));
        if (departmentName == null)
            departmentName = "";
        switch (ConvertUtils.toInt(doctor.get(("index")))) {
            case 0:
                return "Trưởng khoa " + departmentName + " - Bệnh viện Phổi trung ương";
            case 1:
                return "Phó khoa " + departmentName + " - Bệnh viện Phổi trung ương";
            default:
                return "Bác sỹ " + departmentName + " - Bệnh viện Phổi trung ương";
        }
    }

    void addListMenu(HashMap<String, JsonObject> map) throws UnknownHostException, SocketTimeoutException {
        try {
            ServiceReturnEntity<JsonObject> serviceReturnEntity = new MenuInfo().search("1", "20", "", "","1","1","");
            if (serviceReturnEntity.getCode() == 0) {
                JsonObject jsonObject = serviceReturnEntity.getData();
                JsonArray jsonArray = ConvertUtils.toJsonArray(jsonObject.get("data"));
                for (int i = 0; i < jsonArray.size(); i++) {
                    jsonObject = ConvertUtils.toJsonObject(jsonArray.get(i));
                    jsonObject = ConvertUtils.toJsonObject(jsonObject.get("menu"));
                    String name = ConvertUtils.toString(jsonObject.get("name"));
                    if (!map.containsKey(name)) {
                        jsonObject = new JsonObject();
                        jsonObject.addProperty("key", name);
                        jsonObject.addProperty("isMenu", true);
                        map.put(name, jsonObject);
                    } else {
                        jsonObject = map.get(name);
                        jsonObject.addProperty("isMenu", true);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    JsonArray initFirsttime(HttpServletRequest request) throws IOException {
        HashMap<String, JsonObject> map = new HashMap<>();
        JsonArray dic;
        InputStream inputStream = request.getSession().getServletContext().getResourceAsStream("/WEB-INF/configs/default_dictionary.json");
        addFromDefaultDic(inputStream, map);
        addListDoctor(map);
        addListMenu(map);
        dic = ConvertUtils.toJsonArray(ConvertUtils.toJson(map.values()));
        return dic;
    }

    @RequestMapping(value = "/dictionary/update")
    public @ResponseBody
    JsonObject update(HttpServletRequest request, @RequestBody JsonObject jsonObject) throws IOException {
        InputStream inputStream = request.getSession().getServletContext().getResourceAsStream("/WEB-INF/configs/dictionary.json");
        String dataDefault = IOUtils.toString(inputStream, StandardCharsets.UTF_8);
        JsonArray jsonArray = ConvertUtils.toJsonArray(dataDefault);
        String key = ConvertUtils.toString(jsonObject.get("key"));
        int i;
        for (i = 0; i < jsonArray.size(); i++) {
            JsonObject jsonObject1 = ConvertUtils.toJsonObject(jsonArray.get(i));
            String key2 = ConvertUtils.toString(jsonObject1.get("key"));
            if (key.equals(key2)) {
                jsonArray.set(i, jsonObject);
                break;
            }
        }
        if (i >= jsonArray.size()) {
            jsonArray.add(jsonObject);
        }

        jsonObject = new JsonObject();
        jsonObject.add("dic", jsonArray);
        new DataDictionaryInfo().save(DataDictionaryInfo.DataDictionary.DATA_DICTIONARY, jsonObject);

        List<String> lines = Arrays.asList(ConvertUtils.toJson(jsonArray));
        String path = request.getServletContext().getRealPath("/WEB-INF/configs/dictionary.json");
        Path file = Paths.get(path);
        Files.write(file, lines, Charset.forName("UTF-8"));
        return ok(jsonArray);
    }

    @RequestMapping(value = "/dictionary/delete/{key}", method = RequestMethod.DELETE)
    public @ResponseBody
    JsonObject delete(HttpServletRequest request, @PathVariable String key) throws IOException {
        InputStream inputStream = request.getSession().getServletContext().getResourceAsStream("/WEB-INF/configs/dictionary.json");
        String dataDefault = IOUtils.toString(inputStream, StandardCharsets.UTF_8);
        JsonArray jsonArray = ConvertUtils.toJsonArray(dataDefault);
        int i;
        for (i = 0; i < jsonArray.size(); i++) {
            JsonObject jsonObject1 = ConvertUtils.toJsonObject(jsonArray.get(i));
            String key2 = ConvertUtils.toString(jsonObject1.get("key"));
            if (key.equals(key2)) {
                jsonArray.remove(i);
                break;
            }
        }
        JsonObject jsonObject = new JsonObject();
        jsonObject.add("dic", jsonArray);
        new DataDictionaryInfo().save(DataDictionaryInfo.DataDictionary.DATA_DICTIONARY, jsonObject);

        List<String> lines = Arrays.asList(ConvertUtils.toJson(jsonArray));
        String path = request.getServletContext().getRealPath("/WEB-INF/configs/dictionary.json");
        Path file = Paths.get(path);
        Files.write(file, lines, Charset.forName("UTF-8"));
        return ok(jsonArray);
    }

}
