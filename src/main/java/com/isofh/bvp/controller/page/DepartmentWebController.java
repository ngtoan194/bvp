package com.isofh.bvp.controller.page;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.AlbumInfo;
import com.isofh.bvp.dataaccess.NewsInfo;
import com.isofh.bvp.dataaccess.PageInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.library.ClientInfo;
import com.isofh.utils.ConvertUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

@Controller
@RequestMapping(value = "/khoa-phong")
public class DepartmentWebController extends BaseController {

    @RequestMapping(value = {"/{linkAlias:.+}"}, method = RequestMethod.GET)
    public String getDetailPage2(@PathVariable String linkAlias,
                                 ModelMap model) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new PageInfo().getByAlias(linkAlias);
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject dataPage = ConvertUtils.toJsonObject(data.getData().get("page"));
            model.addAttribute("dataPage", dataPage);
            model.addAttribute("pageTitle", "Khoa phòng " + ConvertUtils.toString(dataPage.get("name")));
            return "page-department-detail";
        }
        return "page404";
    }

    @RequestMapping(value = {"/gioi-thieu/{linkAlias:.+}"}, method = RequestMethod.GET)
    public String getDetailPageIntroduce(@PathVariable String linkAlias,
                                         ModelMap model) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new PageInfo().getByAlias(linkAlias);
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject dataPage = ConvertUtils.toJsonObject(data.getData().get("page"));
            model.addAttribute("dataPage", dataPage);
            model.addAttribute("pageTitle", "Khoa phòng " + ConvertUtils.toString(dataPage.get("name")));
            return "page-introduce";
        }
        return "page404";
    }

    @RequestMapping(value = {"/lanh-dao/{linkAlias:.+}"}, method = RequestMethod.GET)
    public String getDetailPageLeader(@PathVariable String linkAlias,
                                      ModelMap model) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new PageInfo().getByAlias(linkAlias);
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject dataPage = ConvertUtils.toJsonObject(data.getData().get("page"));
            model.addAttribute("dataPage", dataPage);
            model.addAttribute("pageTitle", "Khoa phòng " + ConvertUtils.toString(dataPage.get("name")));
            return "page-leader";
        }
        return "page404";
    }

    @RequestMapping(value = {"/hoat-dong/{linkAlias:.+}"}, method = RequestMethod.GET)
    public String getDetailPagehoatdong(@PathVariable String linkAlias,
                                        ModelMap model) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new PageInfo().getByAlias(linkAlias);
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject dataPage = ConvertUtils.toJsonObject(data.getData().get("page"));
            model.addAttribute("dataPage", dataPage);
            model.addAttribute("pageTitle", "Khoa phòng " + ConvertUtils.toString(dataPage.get("name")));
            return "page-news";
        }
        return "page404";
    }

    @RequestMapping(value = {"/album/{linkAlias:.+}"}, method = RequestMethod.GET)
    public String getDetailPageAlbum(@PathVariable String linkAlias,
                                     ModelMap model) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new PageInfo().getByAlias(linkAlias);
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject dataPage = ConvertUtils.toJsonObject(data.getData().get("page"));
            model.addAttribute("dataPage", dataPage);
            model.addAttribute("pageTitle", "Khoa phòng " + ConvertUtils.toString(dataPage.get("name")));
            return "page-album";
        }
        return "page404";
    }

    @RequestMapping(value = {"/hoat-dong/chi-tiet/{alias:.+}"}, method = RequestMethod.GET)
    public String getnewsdetail(ModelMap model,
                                HttpServletRequest request,
                                @PathVariable String alias) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new NewsInfo().getByAlias(alias);
        JsonObject objResult = new JsonObject();

        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject dataNewsDetail = data.getData();
            JsonObject temp = ConvertUtils.toJsonObject(dataNewsDetail.get("news"));
            JsonObject page = ConvertUtils.toJsonObject(dataNewsDetail.get("page"));
            objResult.addProperty("success", true);
            objResult.add("data", temp);

            model.addAttribute("dataNewsDetail", new Gson().toJson(temp));
            model.addAttribute("dataPage", new Gson().toJson(page));

            model.addAttribute("pageTitle", ConvertUtils.toString(temp.get("title")));
            model.addAttribute("pageLinkAlias", ClientInfo.getWebUrl() + "/khoa-phong/hoat-dong/chi-tiet/" + ConvertUtils.toString(temp.get("linkAlias")));
            model.addAttribute("pageContentPreview", ConvertUtils.toString(temp.get("contentPreview")));
            model.addAttribute("pageImagePreview", ClientInfo.getServerImage() + ConvertUtils.toString(temp.get("imagePreview")));

            return "page-news-detail";
        } else {
            return "page404";
        }
    }

    @RequestMapping(value = {"/album/chi-tiet/{alias:.+}"}, method = RequestMethod.GET)
    public String albumDetailPage(ModelMap model, @PathVariable String alias) throws UnknownHostException, SocketTimeoutException {
        ServiceReturnEntity<JsonObject> data = new AlbumInfo().getByAlias(alias);
        JsonObject objResult = new JsonObject();
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject dataAlbumDetail = data.getData();
            JsonObject temp = ConvertUtils.toJsonObject(dataAlbumDetail.get("album"));
            JsonObject page = ConvertUtils.toJsonObject(dataAlbumDetail.get("page"));
            objResult.addProperty("success", true);
            objResult.add("data", temp);
            model.addAttribute("dataAlbumDetail", new Gson().toJson(temp));
            model.addAttribute("dataPage", new Gson().toJson(page));
            model.addAttribute("pageTitle", "Thư viện ảnh " + ConvertUtils.toString(temp.get("name")));
            return "page-album-detail";
        } else {
            return "page404";
        }
    }

    @RequestMapping(value = "/sua-khoa-phong/{linkAlias:.+}", method = RequestMethod.GET)
    public String adminMgrPageUpdate(ModelMap model, @PathVariable String linkAlias) throws UnknownHostException, SocketTimeoutException {
        ServiceReturnEntity<JsonObject> data = new PageInfo().getByAlias(linkAlias);
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject dataPage = ConvertUtils.toJsonObject(data.getData().get("page"));
            model.addAttribute("dataPage", dataPage);
            model.addAttribute("pageTitle", "Khoa phòng " + ConvertUtils.toString(dataPage.get("name")));
            return "user-page";
        }
        return "page404";
    }

    @RequestMapping(value = "/quan-ly-hoat-dong/{linkAlias:.+}", method = RequestMethod.GET)
    public String mgrPageNews(ModelMap model, @PathVariable String linkAlias) throws UnknownHostException, SocketTimeoutException {
        ServiceReturnEntity<JsonObject> data = new PageInfo().getByAlias(linkAlias);
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject dataPage = ConvertUtils.toJsonObject(data.getData().get("page"));
            model.addAttribute("dataPage", dataPage);
            model.addAttribute("pageTitle", "Khoa phòng " + ConvertUtils.toString(dataPage.get("name")));
            return "user-page-news";
        }
        return "page404";
    }

    @RequestMapping(value = "/quan-ly-album/{linkAlias:.+}", method = RequestMethod.GET)
    public String mgrPageAlbum(ModelMap model, @PathVariable String linkAlias) throws UnknownHostException, SocketTimeoutException {
        ServiceReturnEntity<JsonObject> data = new PageInfo().getByAlias(linkAlias);
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject dataPage = ConvertUtils.toJsonObject(data.getData().get("page"));
            model.addAttribute("dataPage", dataPage);
            model.addAttribute("pageTitle", "Khoa phòng " + ConvertUtils.toString(dataPage.get("name")));
            return "user-page-album";
        }
        return "page404";
    }

}
