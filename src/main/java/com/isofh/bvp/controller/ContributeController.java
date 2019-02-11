package com.isofh.bvp.controller;


import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.ContributeInfo;
import com.isofh.bvp.dataaccess.FileInfo;
import com.isofh.bvp.dataaccess.NewsInfo;
import com.isofh.bvp.models.BASE64DecodedMultipartFile;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.library.ClientInfo;
import com.isofh.utils.ConvertUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class ContributeController extends BaseController {

    @RequestMapping(value = "/contribute/searchContribute", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject searchHomePage(@RequestParam String page,
                              @RequestParam String size,
                              @RequestParam(required = false) String content,
                              @RequestParam(required = false) String title,
                              @RequestParam(required = false) String author,
                              @RequestParam(required = false) String startDate,
                              @RequestParam(required = false) String endDate) throws SocketTimeoutException, UnknownHostException {

        ServiceReturnEntity<JsonObject> data = new ContributeInfo().searchHomePage(page, size, content, title, author, startDate, endDate);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.Contribute.GET_LIST_CONTRIBUTE_ERROR);
        }
    }

    @RequestMapping(value = {"/contribute/createContribute"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject createHomePage(@RequestBody JsonObject homePage) throws IOException {
        JsonObject obj = ConvertUtils.toJsonObject(homePage.get("contribute"));
        int type = ConvertUtils.toInt(obj.get("type"));
        String content = ConvertUtils.toString(obj.get("content"));

        Pattern p = Pattern.compile("src=\"(?<base64>data:(.*?))\"");
        Matcher match2 = p.matcher(content);
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
                    JsonObject jsonObject = result.getData();
                    JsonArray jsonArray = ConvertUtils.toJsonArray(jsonObject.get("images"));
                    if (jsonArray.size() > 0) {
                        jsonObject = ConvertUtils.toJsonObject(jsonArray.get(0));
                        String image = ClientInfo.getServerImage() + ConvertUtils.toString(jsonObject.get("image"));
                        content = content.replace(item, image);
                    }
                }
            }
        }
        obj.addProperty("content", content);
        ServiceReturnEntity<JsonObject> data = new ContributeInfo().createHomePage(homePage);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Contribute.CREATE_CONTRIBUTE_SUCCESS);
        } else {
            return notOk(Constants.Resources.Message.Contribute.CREATE_CONTRIBUTE_ERROR);
        }
    }

    @RequestMapping(value = {"/contribute/deleteContribute/{id}"}, method = RequestMethod.DELETE)
    public @ResponseBody
    JsonObject deleteHomePage(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new ContributeInfo().deleteHomePage(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Contribute.DELETE_CONTRIBUTE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Contribute.DELETE_CONTRIBUTE_ERROR);
    }

    @RequestMapping(value = {"/contribute/updateContribute/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject deleteHomePage(@PathVariable String id,
                              @RequestBody JsonObject dataUpdateHomePage) throws IOException {
        JsonObject obj = ConvertUtils.toJsonObject(dataUpdateHomePage.get("contribute"));
        int type = ConvertUtils.toInt(obj.get("type"));
        String content = ConvertUtils.toString(obj.get("content"));

        Pattern p = Pattern.compile("src=\"(?<base64>data:(.*?))\"");
        Matcher match2 = p.matcher(content);
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
                    JsonObject jsonObject = result.getData();
                    JsonArray jsonArray = ConvertUtils.toJsonArray(jsonObject.get("images"));
                    if (jsonArray.size() > 0) {
                        jsonObject = ConvertUtils.toJsonObject(jsonArray.get(0));
                        String image = ClientInfo.getServerImage() + ConvertUtils.toString(jsonObject.get("image"));
                        content = content.replace(item, image);
                    }
                }
            }
        }
        obj.addProperty("content", content);
        ServiceReturnEntity<JsonObject> data = new ContributeInfo().updateHomePage(id, dataUpdateHomePage);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Contribute.UPDATE_CONTRIBUTE_SUCCESS);
        } else {
            return notOk(Constants.Resources.Message.Contribute.UPDATE_CONTRIBUTE_ERROR);
        }
    }

    @RequestMapping(value = {"/contribute/getDetailContribute/{id}"}, method = RequestMethod.DELETE)
    public @ResponseBody
    JsonObject getDetailHomePage(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new ContributeInfo().getDetail(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        }
        return notOk(Constants.Resources.Message.Contribute.GET_DETAIL_CONTRIBUTE_ERROR);
    }

    @RequestMapping(value = {"/contribute/getByAliasContribute/{alias}"}, method = RequestMethod.DELETE)
    public @ResponseBody
    JsonObject getByAlias(@PathVariable String alias) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new ContributeInfo().getByAlias(alias);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        }
        return notOk(Constants.Resources.Message.Contribute.GET_BY_ALIAS_CONTRIBUTE_ERROR);
    }

    /**
     * @return video page
     */
    @RequestMapping(value = {"/goc-tri-an"}, method = RequestMethod.GET)
    public String contribute(ModelMap model) {
        model.addAttribute("pageTitle", "Góc tri ân");
        return "contribute";
    }

    @RequestMapping(value = {"/tin-tri-an/{linkAlias:.+}"}, method = RequestMethod.GET)
    public String getDetailContribute(@PathVariable String linkAlias,
                                      ModelMap model) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new ContributeInfo().getByAlias(linkAlias);
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject dataContribute = ConvertUtils.toJsonObject(ConvertUtils.toJsonObject(data.getData().get("contribute")));
            model.addAttribute("dataContribute", dataContribute);
            model.addAttribute("pageTitle", "Góc tri ân - " + ConvertUtils.toString(dataContribute.get("title")));
            return "contribute-detail";
        }
        return "page404";
    }
}
