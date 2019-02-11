package com.isofh.bvp.controller.page;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.DepartmentInfo;
import com.isofh.bvp.dataaccess.PostsInfo;
import com.isofh.bvp.dataaccess.TagInfo;
import com.isofh.bvp.dataaccess.UserInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.utils.ConvertUtils;
import com.isofh.utils.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

@Controller
public class PostWebController extends BaseController {

    @RequestMapping(value = {"/tu-van-online"}, method = RequestMethod.GET)
    public String searchPosts(ModelMap model) {
        model.addAttribute("pageTitle", "Tư vấn online - Tìm kiếm ");
        model.addAttribute("titleSubPage", "Danh sách câu hỏi tìm kiếm");
        model.addAttribute("serviceId", Constants.Api.Post.SEARCH);
        return "search-post";
    }

    @RequestMapping(value = {"/tu-van-online/da-tra-loi"}, method = RequestMethod.GET)
    public String answeredPostsPage(ModelMap model) {
        model.addAttribute("pageTitle", "Tư vấn online - Câu hỏi đã trả lời");
        model.addAttribute("titleSubPage", "Danh sách câu hỏi đã được trả lời");
        JsonObject searchPost = new JsonObject();
        searchPost.addProperty("isAnswered", "1");
        searchPost.addProperty("isAssigned", "");
        searchPost.addProperty("isPublished", "");
        searchPost.addProperty("authorId", "");
        searchPost.addProperty("departmentId", "");
        searchPost.addProperty("assigneeId", "");
        searchPost.addProperty("startTime", "");
        searchPost.addProperty("tagId", "");
        searchPost.addProperty("userId", "");
        model.addAttribute("searchPost", searchPost);
        model.addAttribute("menuItem", "da-tra-loi");
        return "layout-list-post";
    }

    @RequestMapping(value = {"/tu-van-online/moi-nhat"}, method = RequestMethod.GET)
    public String lastestPostsPage(ModelMap model) {
        model.addAttribute("pageTitle", "Tư vấn online - Câu hỏi mới nhất");
        model.addAttribute("titleSubPage", "Danh sách câu hỏi mới nhất");
        JsonObject searchPost = new JsonObject();
        searchPost.addProperty("isAnswered", "");
        searchPost.addProperty("isAssigned", "");
        searchPost.addProperty("isPublished", "");
        searchPost.addProperty("authorId", "");
        searchPost.addProperty("departmentId", "");
        searchPost.addProperty("assigneeId", "");
        searchPost.addProperty("startTime", "");
        searchPost.addProperty("tagId", "");
        searchPost.addProperty("userId", "");
        model.addAttribute("searchPost", searchPost);
        model.addAttribute("menuItem", "moi-nhat");
        return "layout-list-post";
    }

    @RequestMapping(value = {"/tu-van-online/cau-hoi-cua-toi"}, method = RequestMethod.GET)
    public String getPostsCreatedByUser(ModelMap model) {
        model.addAttribute("pageTitle", "Tư vấn online - Câu hỏi đã tạo");
        model.addAttribute("titleSubPage", "Danh sách câu hỏi đã tạo");
        JsonObject searchPost = new JsonObject();
        searchPost.addProperty("isAnswered", "");
        searchPost.addProperty("isAssigned", "");
        searchPost.addProperty("isPublished", "");
        searchPost.addProperty("authorId", UserInfo.getCurrentUserId());
        searchPost.addProperty("departmentId", "");
        searchPost.addProperty("assigneeId", "");
        searchPost.addProperty("startTime", "");
        searchPost.addProperty("tagId", "");
        searchPost.addProperty("userId", "");
        model.addAttribute("searchPost", searchPost);
        model.addAttribute("menuItem", "da-tao");
        return "layout-list-post";
    }

    @RequestMapping(value = {"/tu-van-online/dang-theo-doi"}, method = RequestMethod.GET)
    public String getPostsFollowedByUser(ModelMap model) {
        model.addAttribute("pageTitle", "Tư vấn online - Câu hỏi đang theo dõi");
        model.addAttribute("titleSubPage", "Danh sách câu hỏi đang theo dõi");
        JsonObject searchPost = new JsonObject();
        searchPost.addProperty("isAnswered", "");
        searchPost.addProperty("isAssigned", "");
        searchPost.addProperty("isPublished", "");
        searchPost.addProperty("authorId", "");
        searchPost.addProperty("departmentId", "");
        searchPost.addProperty("assigneeId", "");
        searchPost.addProperty("startTime", "");
        searchPost.addProperty("tagId", "");
        searchPost.addProperty("userId", UserInfo.getCurrentUserId());
        model.addAttribute("searchPost", searchPost);
        model.addAttribute("menuItem", "dang-theo-doi");
        return "layout-list-post";
    }

    @RequestMapping(value = {"/tu-van-online/cau-hoi-cho-duyet"}, method = RequestMethod.GET)
    public String getPostsNeedApprove(ModelMap model) {
        model.addAttribute("pageTitle", "Tư vấn online - Câu hỏi chờ duyệt");
        model.addAttribute("titleSubPage", "Danh sách câu hỏi chờ duyệt");
        JsonObject searchPost = new JsonObject();
        searchPost.addProperty("isAnswered", "");
        searchPost.addProperty("isAssigned", "0");
        searchPost.addProperty("isPublished", "");
        searchPost.addProperty("authorId", "");
        searchPost.addProperty("departmentId", "");
        searchPost.addProperty("assigneeId", "");
        searchPost.addProperty("startTime", "");
        searchPost.addProperty("tagId", "");
        searchPost.addProperty("userId", "");
        model.addAttribute("searchPost", searchPost);
        model.addAttribute("menuItem", "cho-duyet");
        return "layout-list-post";
    }

    @RequestMapping(value = {"/tu-van-online/cau-hoi-da-duyet"}, method = RequestMethod.GET)
    public String getPostsApproved(ModelMap model) {
        model.addAttribute("pageTitle", "Tư vấn online - Câu hỏi đã duyệt");
        model.addAttribute("titleSubPage", "Danh sách câu hỏi đã duyệt");
        JsonObject searchPost = new JsonObject();
        searchPost.addProperty("isAnswered", "");
        searchPost.addProperty("isAssigned", "1");
        searchPost.addProperty("isPublished", "");
        searchPost.addProperty("authorId", "");
        searchPost.addProperty("departmentId", "");
        searchPost.addProperty("assigneeId", "");
        searchPost.addProperty("startTime", "");
        searchPost.addProperty("tagId", "");
        searchPost.addProperty("userId", "");
        model.addAttribute("searchPost", searchPost);
        model.addAttribute("menuItem", "da-duyet");
        return "layout-list-post";
    }

    @RequestMapping(value = {"/tu-van-online/cau-hoi-cho-tra-loi-qua-24h"}, method = RequestMethod.GET)
    public String getpostnotansweredin24h(ModelMap model) {
        model.addAttribute("pageTitle", "Tư vấn online - Câu hỏi chờ trả lời quá 24h");
        model.addAttribute("titleSubPage", "Danh sách câu hỏi chờ trả lời quá 24h");
        model.addAttribute("serviceId", Constants.Api.Post.POST_NOT_ANSWERED_IN_24H);
        model.addAttribute("menuItem", "da-duyet");
        return "layout-list-post";
    }

    @RequestMapping(value = {"/tu-van-online/cau-hoi-cho-tra-loi/{doctorId}"}, method = RequestMethod.GET)
    public String getPostsUnansweredListOfDoctor(
            ModelMap model,
            @PathVariable String doctorId, HttpServletRequest request) {
        model.addAttribute("pageTitle", "Tư vấn online - Câu hỏi chờ trả lời");
        model.addAttribute("titleSubPage", "Danh sách câu hỏi chờ trả lời");
        JsonObject searchPost = new JsonObject();
        searchPost.addProperty("isAnswered", "0");
        searchPost.addProperty("isAssigned", "1");
        searchPost.addProperty("isPublished", "");
        searchPost.addProperty("authorId", "");
        searchPost.addProperty("departmentId", "");
        searchPost.addProperty("assigneeId", "");
        searchPost.addProperty("startTime", "");
        searchPost.addProperty("tagId", "");
        searchPost.addProperty("userId", "");
        model.addAttribute("searchPost", searchPost);
        model.addAttribute("menuItem", "cho-tra-loi");
        return "layout-list-post";
    }

    @RequestMapping(value = {"/tu-van-online/chuyen-khoa/{id}"}, method = RequestMethod.GET)
    public String getPostByDepartmentId(
            ModelMap model,
            @PathVariable String id
    ) {
        model.addAttribute("pageTitle", "Tư vấn online - Bài viết theo chuyên khoa");
        model.addAttribute("titleSubPage", "Danh sách câu hỏi theo chuyên khoa");
        JsonObject searchPost = new JsonObject();
        searchPost.addProperty("isAnswered", "");
        searchPost.addProperty("isAssigned", "0");
        searchPost.addProperty("isPublished", "");
        searchPost.addProperty("authorId", "");
        searchPost.addProperty("departmentId", id);
        searchPost.addProperty("assigneeId", "");
        searchPost.addProperty("startTime", "");
        searchPost.addProperty("tagId", "");
        searchPost.addProperty("userId", "");
        model.addAttribute("searchPost", searchPost);
        return "layout-list-post";
    }

    @RequestMapping(value = {"/tu-van-online/tu-khoa/{id}"}, method = RequestMethod.GET)
    public String getPostByTagId(
            ModelMap model,
            @PathVariable String id
    ) {
        model.addAttribute("pageTitle", "Tư vấn online - Bài viết theo từ khóa");
        model.addAttribute("titleSubPage", "Danh sách câu hỏi theo từ khóa");
        JsonObject searchPost = new JsonObject();
        searchPost.addProperty("isAnswered", "");
        searchPost.addProperty("isAssigned", "0");
        searchPost.addProperty("isPublished", "");
        searchPost.addProperty("authorId", "");
        searchPost.addProperty("departmentId", "");
        searchPost.addProperty("assigneeId", "");
        searchPost.addProperty("startTime", "");
        searchPost.addProperty("tagId", id);
        searchPost.addProperty("userId", "");
        model.addAttribute("searchPost", searchPost);
        return "layout-list-post";
    }

    @RequestMapping(value = {"/dat-cau-hoi"}, method = RequestMethod.GET)
    public String createQuestion(ModelMap model) throws SocketTimeoutException, UnknownHostException {
        return editPost(model, "");
    }

    @RequestMapping(value = {"/tao-bai-viet"}, method = RequestMethod.GET)
    public String createPost(ModelMap model) throws SocketTimeoutException, UnknownHostException {
        return editPost(model, "");
    }

    @RequestMapping(value = {"/sua-cau-hoi/{linkAlias:.+}"}, method = RequestMethod.GET)
    public String editQuestion(ModelMap model, @PathVariable String linkAlias) throws SocketTimeoutException, UnknownHostException {
        return editPost(model, linkAlias);
    }

    @RequestMapping(value = {"/sua-bai-viet/{linkAlias:.+}"}, method = RequestMethod.GET)
    public String editPost(ModelMap model, @PathVariable String linkAlias) throws SocketTimeoutException, UnknownHostException {
        JsonObject post = new JsonObject();
        JsonArray data_tags = new JsonArray();
        String departmentId = "";

        model.addAttribute("isArticle", false);
        model.addAttribute("isEditMode", false);
        if (!StringUtils.isNullOrWhiteSpace(linkAlias)) {
            ServiceReturnEntity<JsonObject> data = new PostsInfo().getByAlias(linkAlias);
            if (data.getCode() == 0 && data.getData() != null) {
                model.addAttribute("isEditMode", true);
                JsonObject dataPostDetail = data.getData();
                JsonObject author = ConvertUtils.toJsonObject(dataPostDetail.get("author"));

                if (ConvertUtils.toInt(author.get("role")) == UserInfo.Role.Doctor.getValue()) {
                    model.addAttribute("pageTitle", "Sửa bài viết");
                    model.addAttribute("isArticle", true);
                } else {
                    model.addAttribute("pageTitle", "Sửa câu hỏi");
                }
                JsonObject objDepartment = ConvertUtils.toJsonObject(dataPostDetail.get("department"));
                departmentId = ConvertUtils.toString(objDepartment.get("id"));
                JsonArray objTags = ConvertUtils.toJsonArray(dataPostDetail.get("tags"));
                for (int i = 0; i < objTags.size(); i++) {
                    JsonObject item = ConvertUtils.toJsonObject(objTags.get(i));
                    data_tags.add(ConvertUtils.toString(item.get("id")));
                }
                post = ConvertUtils.toJsonObject(dataPostDetail);
            } else
                return "page404";
        } else {
            if (UserInfo.isDoctor()) {
                model.addAttribute("pageTitle", "Tạo bài viết");
                model.addAttribute("isArticle", true);
            } else {
                model.addAttribute("pageTitle", "Đặt câu hỏi");
            }
        }
        model.addAttribute("dataPost", ConvertUtils.toJson(post));
        model.addAttribute("tags", ConvertUtils.toJson(data_tags));
        model.addAttribute("departmentId", departmentId);
        ServiceReturnEntity<JsonObject> tags = new TagInfo().search("", "", "");
        ServiceReturnEntity<JsonObject> departments = new DepartmentInfo().getAll();
        model.addAttribute("dataTags", ConvertUtils.toJson(tags.getCode() == 0 ? ConvertUtils.toJsonArray(tags.getData().get("data")) : new JsonArray()));
        model.addAttribute("dataDepartments", ConvertUtils.toJson(departments.getCode() == 0 ? ConvertUtils.toJsonArray(departments.getData().get("department")) : new JsonArray()));
        return "create-post";
    }

//    @RequestMapping(value = {"/bai-viet/{linkAlias:.+}"}, method = RequestMethod.GET)
//    public String getPost(ModelMap model, @PathVariable String linkAlias) throws SocketTimeoutException, UnknownHostException {
//        return getPostDetail(model, linkAlias);
//    }

    @RequestMapping(value = {"/cau-hoi/{alias:.+}", "/bai-viet/{alias:.+}"}, method = RequestMethod.GET)
    public String getPostDetail(ModelMap model, @PathVariable String alias) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new PostsInfo().getByAlias(alias);
        JsonObject objResult = new JsonObject();
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject dataPostDetail = data.getData();
            JsonObject temp = ConvertUtils.toJsonObject(dataPostDetail);
            objResult.addProperty("success", true);
            objResult.add("data", temp);
            model.addAttribute("dataPostDetail", new Gson().toJson(temp));
            JsonObject temp2 = ConvertUtils.toJsonObject(dataPostDetail.get("post"));
            model.addAttribute("pageTitle", temp2.get("title").getAsString());
            return "post-detail";
        } else {
            return "page404";
        }
    }

}
