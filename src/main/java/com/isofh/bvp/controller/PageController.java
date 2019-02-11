package com.isofh.bvp.controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.constants.DefaultConst;
import com.isofh.bvp.constants.field.CommonField;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.FileInfo;
import com.isofh.bvp.dataaccess.PageInfo;
import com.isofh.bvp.models.BASE64DecodedMultipartFile;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.library.ClientInfo;
import com.isofh.utils.ConvertUtils;
import com.isofh.utils.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping(value = "/page")
public class PageController extends BaseController {

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject searchPage(
            @RequestParam(value = CommonField.PAGE, required = false, defaultValue = DefaultConst.PAGE) String page,
            @RequestParam(value = CommonField.SIZE, required = false, defaultValue = DefaultConst.SIZE) String size,
            @RequestParam(value = "name", required = false, defaultValue = DefaultConst.STRING) String name,
            @RequestParam(value = "type", required = false, defaultValue = DefaultConst.NUMBER) String type,
            @RequestParam(value = CommonField.WEB_TYPE, required = false, defaultValue = DefaultConst.WEB_TYPE) String webType
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new PageInfo().search(page, size, name, type, webType);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.Page.SEARCH_ERROR);
        }
    }

    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject createPage(@RequestBody JsonObject jsonObject) throws IOException {
        JsonObject page = ConvertUtils.toJsonObject(jsonObject.get("page"));
        int type = ConvertUtils.toInt(page.get("type"));
        String dataRegex = "";
        if (type == 1) {
            dataRegex = ConvertUtils.toString(page.get("content"));
        } else if (type == 2) {
            dataRegex = ConvertUtils.toString(page.get("commonInfo"));
        }
        if (type == 1 || type == 2) {
            Pattern p = Pattern.compile("src=(\\\\\"|\")(?<base64>data:(.*?))(\\\\\"|\")");
            Matcher match2 = p.matcher(dataRegex);
            ArrayList<String> data2 = new ArrayList<>();
            Pattern p2 = Pattern.compile("data:(?<mime>[\\w/\\-\\.]+);(?<encoding>\\w+),(?<data>.*)");
            while (match2.find()) {
                data2.add(match2.group("base64"));
            }
            if (data2.size() > 0) {
                for (String item : data2) {
                    match2 = p2.matcher(item);
                    if (match2.find()) {
                        byte[] bytes = Base64.getDecoder().decode(match2.group("data").getBytes());
                        ServiceReturnEntity<JsonObject> result = FileInfo.uploadImage(new BASE64DecodedMultipartFile(bytes));
                        JsonObject dataImage = result.getData();
                        JsonArray jsonArray = ConvertUtils.toJsonArray(dataImage.get("images"));
                        if (jsonArray.size() > 0) {
                            dataImage = ConvertUtils.toJsonObject(jsonArray.get(0));
                            String image = ClientInfo.getServerImage() + ConvertUtils.toString(dataImage.get("image"));
                            dataRegex = dataRegex.replace(item, image);
                        }
                    }
                }
            }
            if (dataRegex.length() > 30000) {
                return notOk(Constants.Resources.Message.News.MAXIMUM_CONTENT_LENGTH);
            }

            if (type == 1) {
                page.addProperty("content", dataRegex);
            } else if (type == 2) {
                page.addProperty("commonInfo", dataRegex);
            }
        }
        ServiceReturnEntity<JsonObject> data = new PageInfo().create(jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Page.CREATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Page.CREATE_ERROR);
    }

    @RequestMapping(value = {"/delete/{id}"}, method = RequestMethod.DELETE)
    public @ResponseBody
    JsonObject deletePage(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new PageInfo().delete(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Page.DELETE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Page.DELETE_ERROR);
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject deletePage(@PathVariable String id,
                          @RequestBody JsonObject jsonObject) throws IOException {
        JsonObject page = ConvertUtils.toJsonObject(jsonObject.get("page"));
        int type = ConvertUtils.toInt(page.get("type"));
        String dataRegex = "";
        if (type == 1) {
            dataRegex = ConvertUtils.toString(page.get("content"));
        } else if (type == 2) {
            dataRegex = ConvertUtils.toString(page.get("commonInfo"));
        }
        if (type == 1 || type == 2) {
            Pattern p = Pattern.compile("src=(\\\\\"|\")(?<base64>data:(.*?))(\\\\\"|\")");
            Matcher match2 = p.matcher(dataRegex);
            ArrayList<String> data2 = new ArrayList<>();
            Pattern p2 = Pattern.compile("data:(?<mime>[\\w/\\-\\.]+);(?<encoding>\\w+),(?<data>.*)");
            while (match2.find()) {
                data2.add(match2.group("base64"));
            }
            if (data2.size() > 0) {
                for (String item : data2) {
                    match2 = p2.matcher(item);
                    if (match2.find()) {
                        byte[] bytes = Base64.getDecoder().decode(match2.group("data").getBytes());
                        ServiceReturnEntity<JsonObject> result = FileInfo.uploadImage(new BASE64DecodedMultipartFile(bytes));
                        JsonObject dataImage = result.getData();
                        JsonArray jsonArray = ConvertUtils.toJsonArray(dataImage.get("images"));
                        if (jsonArray.size() > 0) {
                            dataImage = ConvertUtils.toJsonObject(jsonArray.get(0));
                            String image = ClientInfo.getServerImage() + ConvertUtils.toString(dataImage.get("image"));
                            dataRegex = dataRegex.replace(item, image);
                        }
                    }
                }
            }
            if (dataRegex.length() > 30000) {
                return notOk(Constants.Resources.Message.News.MAXIMUM_CONTENT_LENGTH);
            }

            if (type == 1) {
                page.addProperty("content", dataRegex);
            } else if (type == 2) {
                page.addProperty("commonInfo", dataRegex);
            }
        }
        ServiceReturnEntity<JsonObject> data = new PageInfo().update(id, jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Page.UPDATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Page.UPDATE_ERROR);
    }

    @RequestMapping(value = {"/get-detail/{id}"}, method = RequestMethod.DELETE)
    public @ResponseBody
    JsonObject getDetailPage(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new PageInfo().getDetail(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        }
        return notOk(Constants.Resources.Message.Page.SEARCH_ERROR);
    }


//    @RequestMapping(value = {"/page/{id}", "/khoa-phong/{id}", "/page-file/{id}"}, method = RequestMethod.GET)
//    public String getDetailPage(@PathVariable String id,
//                                ModelMap model) throws SocketTimeoutException, UnknownHostException {
//        ServiceReturnEntity<JsonObject> data = new PageInfo().getDetailPage(id);
//        if (data.getCode() == 0 && data.getData() != null) {
//            JsonObject dataPage = ConvertUtils.toJsonObject(data.getData().get("page"));
//            model.addAttribute("dataPage", dataPage);
//            if (dataPage.get("type").getAsInt() == 1) {
//                model.addAttribute("pageTitle", "Page - " + ConvertUtils.toString(dataPage.get("name")));
//            } else if (dataPage.get("type").getAsInt() == 2) {
//                model.addAttribute("pageTitle", "Khoa phòng " + ConvertUtils.toString(dataPage.get("name")));
//            } else if (dataPage.get("type").getAsInt() == 3) {
//                model.addAttribute("pageTitle", "Page - file " + ConvertUtils.toString(dataPage.get("name")));
//            }
//            return "pagedetail";
//        }
//        return "home";
//    }

}
