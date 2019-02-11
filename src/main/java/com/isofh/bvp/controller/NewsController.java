package com.isofh.bvp.controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.constants.DefaultConst;
import com.isofh.bvp.constants.field.CommonField;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.FileInfo;
import com.isofh.bvp.dataaccess.NewsInfo;
import com.isofh.bvp.models.BASE64DecodedMultipartFile;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.library.ClientInfo;
import com.isofh.utils.ConvertUtils;
import com.isofh.utils.StringUtils;
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

public class NewsController extends BaseController {

    @RequestMapping(value = "/mgrNews/newsSearch", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject getListMenu(
            @RequestParam(value = CommonField.PAGE, required = false, defaultValue = DefaultConst.PAGE) String page,
            @RequestParam(value = CommonField.SIZE, required = false, defaultValue = DefaultConst.SIZE) String size,
            @RequestParam(value = "content", required = false, defaultValue = DefaultConst.STRING) String content,
            @RequestParam(value = "isHotNews", required = false, defaultValue = DefaultConst.NUMBER) String isHotNews,
            @RequestParam(value = "menuId", required = false, defaultValue = DefaultConst.NUMBER) String menuId,
            @RequestParam(value = "webType", required = false, defaultValue = DefaultConst.NUMBER) String webType,
            @RequestParam(value = "fromHoiLao", required = false, defaultValue = DefaultConst.NUMBER) String fromHoiLao,
            @RequestParam(value = "charity", required = false, defaultValue = DefaultConst.NUMBER) String charity,
            @RequestParam(value = "highlightNoti", required = false, defaultValue = DefaultConst.NUMBER) String highlightNoti,
            @RequestParam(value = "belongDepartment", required = false, defaultValue = DefaultConst.NUMBER) String belongDepartment,
            @RequestParam(value = "pageId", required = false, defaultValue = DefaultConst.NUMBER) String pageId,
            @RequestParam(value = "type", required = false, defaultValue = DefaultConst.NUMBER) String type,
            @RequestParam(value = "title", required = false, defaultValue = DefaultConst.STRING) String title,
            @RequestParam(value = "startDate", required = false, defaultValue = DefaultConst.DATE) String startDate,
            @RequestParam(value = "endDate", required = false, defaultValue = DefaultConst.DATE) String endDate
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new NewsInfo().search(page, size, content, isHotNews, menuId, webType, fromHoiLao, charity, highlightNoti, belongDepartment, pageId, type, title, startDate, endDate);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.Menu.SEARCH_ERROR);
        }
    }

    @RequestMapping(value = "/admin/tin-tuc/them-moi", method = RequestMethod.GET)
    public String createNews(ModelMap model) throws UnknownHostException, SocketTimeoutException {
        return editNews(model, "");
    }

    @RequestMapping(value = {"/admin/tin-tuc/sua-tin-tuc/{id}"}, method = RequestMethod.GET)
    public String editNews(ModelMap model, @PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        JsonObject dataNews = new JsonObject();
        JsonObject dataMenu = new JsonObject();
        model.addAttribute("pageTitle", "Tạo mới tin tức");
        if (!StringUtils.isNullOrWhiteSpace(id)) {
            ServiceReturnEntity<JsonObject> data = new NewsInfo().getNewsDetail(id);
            if (data.getCode() == 0 && data.getData() != null) {
                JsonObject temp = ConvertUtils.toJsonObject(data.getData());
                dataNews = ConvertUtils.toJsonObject(temp.get("news"));
                dataMenu = ConvertUtils.toJsonObject(temp.get("menu"));
                model.addAttribute("pageTitle", "Sửa tin tức");
            } else {
                return "page404";
            }
        }
        model.addAttribute("dataNews", ConvertUtils.toJson(dataNews));
        model.addAttribute("dataMenu", ConvertUtils.toJson(dataMenu));
        return "admin-add-news";
    }

    @RequestMapping(value = "/news/createNews", method = RequestMethod.POST)
    public @ResponseBody
    JsonObject createNews(@RequestBody JsonObject news) throws IOException {
        JsonObject dataNews = ConvertUtils.toJsonObject(news.get("news"));
        String newsId = ConvertUtils.toString(dataNews.get("id"));
        JsonObject newsObject = ConvertUtils.toJsonObject(news.get("news"));
        String content = ConvertUtils.toString(newsObject.get("content"));

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
        if (content.length() > 30000) {
            return notOk(Constants.Resources.Message.News.MAXIMUM_CONTENT_LENGTH);
        }

        newsObject.addProperty("content", content);

        ServiceReturnEntity<JsonObject> data = null;
        if (StringUtils.isNullOrWhiteSpace(newsId)) {
            data = new NewsInfo().create(news);
        } else {
            data = new NewsInfo().update(newsId, news);
        }
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject obj;
            if (StringUtils.isNullOrWhiteSpace(newsId)) {
                obj = ok(data.getData());
                obj.addProperty("message", Constants.Resources.Message.News.CREATE_NEWS_SUCCESS);
                return obj;
            } else {
                obj = ok(data.getData());
                obj.addProperty("message", Constants.Resources.Message.News.UPDATE_NEWS_SUCCESS);
                return obj;
            }
        }
        if (StringUtils.isNullOrWhiteSpace(newsId)) {
            return notOk(Constants.Resources.Message.News.CREATE_NEWS_ERROR);
        }
        return notOk(Constants.Resources.Message.News.UPDATE_NEWS_ERROR);
    }

    @RequestMapping(value = "/news/deleteNews/{id}", method = RequestMethod.DELETE)
    public @ResponseBody
    JsonObject deleteNews(@PathVariable String id) throws UnknownHostException, SocketTimeoutException {
        ServiceReturnEntity<JsonObject> data = new NewsInfo().delete(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.News.DELETE_NEWS_SUCCESS);
        }
        return notOk(Constants.Resources.Message.News.DELETE_NEWS_ERROR);
    }

    @RequestMapping(value = "/news/setHotNews/{id}", method = RequestMethod.POST)
    public @ResponseBody
    JsonObject setHotNews(@PathVariable String id,
                          @RequestBody JsonObject isHotNews) throws UnknownHostException, SocketTimeoutException {
        ServiceReturnEntity<JsonObject> data = new NewsInfo().setHotNews(id, isHotNews);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        }
        return notOk(Constants.Resources.Message.News.SET_HOT_NEWS_ERROR);
    }

    @RequestMapping(value = "/news/assignToMenu/{id}", method = RequestMethod.POST)
    public @ResponseBody
    JsonObject assignToMenu(@PathVariable String id,
                            @RequestBody JsonObject object) throws UnknownHostException, SocketTimeoutException {
        ServiceReturnEntity<JsonObject> data = new NewsInfo().assignToMenu(id, object);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        }
        return notOk(Constants.Resources.Message.News.SET_HOT_NEWS_ERROR);
    }

    @RequestMapping(value = "/news/setCharity/{id}", method = RequestMethod.POST)
    public @ResponseBody
    JsonObject setCharity(@PathVariable String id,
                          @RequestBody JsonObject setCharity) throws UnknownHostException, SocketTimeoutException {
        ServiceReturnEntity<JsonObject> data = new NewsInfo().setCharity(id, setCharity);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        }
        return notOk(Constants.Resources.Message.News.SET_CHARITY_ERROR);
    }


    @RequestMapping(value = {"/news/getDetail/{id}"}, method = RequestMethod.GET)
    public @ResponseBody
    JsonObject getnewsdetail2(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new NewsInfo().getNewsDetail(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.News.GET_LIST_NEWS_ERROR);
        }
    }

    @RequestMapping(value = {"/news/acceptMoveToBvp/{id}"}, method = RequestMethod.POST)

    public @ResponseBody
    JsonObject acceptMove(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new NewsInfo().acceptMove(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.News.ACCEPT_MOVE_TO_BVP_SUCCESS);
        } else {
            return notOk(Constants.Resources.Message.News.ACCEPT_MOVE_TO_BVP_ERROR);
        }
    }

    @RequestMapping(value = {"/news/cancelMoveToBvp/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject cancelMove(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new NewsInfo().cancelMove(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.News.CANCEL_MOVE_TO_BVP_SUCCESS);
        } else {
            return notOk(Constants.Resources.Message.News.CANCEL_MOVE_TO_BVP_ERROR);
        }
    }

    @RequestMapping(value = {"/news/moveToBvp/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject moveToBvp(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new NewsInfo().moveToBvp(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.News.MOVE_TO_BVP_SUCCESS);
        } else {
            return notOk(Constants.Resources.Message.News.MOVE_TO_BVP_ERROR);
        }
    }

    @RequestMapping(value = {"/news/rejectMoveToBvp/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject rejectMove(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new NewsInfo().rejectMove(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.News.REJECT_MOVE_TO_BVP_SUCCESS);
        } else {
            return notOk(Constants.Resources.Message.News.REJECT_MOVE_TO_BVP_ERROR);
        }
    }

    @RequestMapping(value = {"/tin-tuc/{alias:.+}"}, method = RequestMethod.GET)
    public String getnewsdetail(ModelMap model,
                                HttpServletRequest request,
                                @PathVariable String alias) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new NewsInfo().getNewsDetailAlias(alias);
        JsonObject objResult = new JsonObject();

        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject dataNewsDetail = data.getData();
            JsonObject temp = ConvertUtils.toJsonObject(dataNewsDetail.get("news"));
            JsonObject menu = ConvertUtils.toJsonObject(dataNewsDetail.get("menu"));
            objResult.addProperty("success", true);
            objResult.add("data", temp);

            model.addAttribute("dataNewsDetail", new Gson().toJson(temp));
            model.addAttribute("dataMenu", new Gson().toJson(menu));


            model.addAttribute("pageTitle", ConvertUtils.toString(temp.get("title")));
            model.addAttribute("pageLinkAlias", ClientInfo.getWebUrl() + "/tin-tuc/" + ConvertUtils.toString(temp.get("linkAlias")));
            model.addAttribute("pageContentPreview", ConvertUtils.toString(temp.get("contentPreview")));
            model.addAttribute("pageImagePreview", ClientInfo.getServerImage() + "/" + ConvertUtils.toString(temp.get("imagePreview")));

//            JsonArray tags = ConvertUtils.toJsonArray(temp.get("tags"));
//            String tags2 = "";
//            for (int i = 0; i < tags.size(); i++) {
//                tags2 = tags2 + tags.get(i).getAsString() + ", ";
//            }
//
//            model.addAttribute("keywords", tags2);
//            model.addAttribute("news_keywords", tags2);

            return "news-detail";
        } else {
            return "news";
        }
    }

    @RequestMapping(value = "/tin-tuc", method = RequestMethod.GET)
    public String adminNew(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Tin tức");
        return "news";
    }

    @RequestMapping(value = {"/tin-tuc/tin-trong-nuoc"}, method = RequestMethod.GET)
    public String tintrongnuoc(ModelMap model) {
        model.addAttribute("pageTitle", "Tin tức - Tin trong nước");
        return "news";
    }

    @RequestMapping(value = {"/tin-tuc/tin-quoc-te"}, method = RequestMethod.GET)
    public String tinquocte(ModelMap model) {
        model.addAttribute("pageTitle", "Tin tức - Tin quốc tế");
        return "news";
    }

    @RequestMapping(value = {"/tin-tuc/tin-noi-bo"}, method = RequestMethod.GET)
    public String tinnoibo(ModelMap model) {
        model.addAttribute("pageTitle", "Tin tức - Tin nội bộ");
        return "news";
    }


}
