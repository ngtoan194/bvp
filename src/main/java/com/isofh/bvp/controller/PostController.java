package com.isofh.bvp.controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.constants.DefaultConst;
import com.isofh.bvp.constants.field.CommonField;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.PostsInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.utils.ConvertUtils;
import com.isofh.utils.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

@Controller
@RequestMapping(value = "/post")
public class PostController extends BaseController {

    @RequestMapping(value = {"/search"}, method = RequestMethod.GET)
    public @ResponseBody
    JsonObject search(
            @RequestParam(value = CommonField.PAGE, required = false, defaultValue = DefaultConst.PAGE) String page,
            @RequestParam(value = CommonField.SIZE, required = false, defaultValue = DefaultConst.SIZE) String size,
            @RequestParam(value = "isAnswered", required = false, defaultValue = DefaultConst.NUMBER) String isAnswered,
            @RequestParam(value = "isAssigned", required = false, defaultValue = DefaultConst.NUMBER) String isAssigned,
            @RequestParam(value = "isPublished", required = false, defaultValue = DefaultConst.NUMBER) String isPublished,
            @RequestParam(value = "authorId", required = false, defaultValue = DefaultConst.NUMBER) String authorId,
            @RequestParam(value = "departmentId", required = false, defaultValue = DefaultConst.NUMBER) String departmentId,
            @RequestParam(value = "assigneeId", required = false, defaultValue = DefaultConst.NUMBER) String assigneeId,
            @RequestParam(value = "startTime", required = false, defaultValue = DefaultConst.DATE_TIME) String startTime
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new PostsInfo().search(page, size, isAnswered, isAssigned, isPublished, authorId, departmentId, assigneeId, startTime);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.Post.LOADING_POSTS_ERROR);
        }
    }

    @RequestMapping(value = {"/get-followed-by-user/{userId}"}, method = RequestMethod.GET)
    public @ResponseBody
    JsonObject getFollowedByUser(
            @PathVariable String userId,
            @RequestParam(value = CommonField.PAGE, required = false, defaultValue = DefaultConst.PAGE) String page,
            @RequestParam(value = CommonField.SIZE, required = false, defaultValue = DefaultConst.SIZE) String size
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new PostsInfo().getFollowedByUser(userId, page, size);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.Post.LOADING_POSTS_ERROR);
        }
    }

    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject createSlide(@RequestBody JsonObject postData) throws SocketTimeoutException, UnknownHostException {

        String departmentId = ConvertUtils.toString(postData.get("departmentId"));
        JsonArray tags = ConvertUtils.toJsonArray(postData.get("tags"));
        JsonObject post = ConvertUtils.toJsonObject(postData.get("post"));
        Boolean isArticle = ConvertUtils.toBoolean(postData.get("isArticle"));

        String id = ConvertUtils.toString(post.get("id"));
        ServiceReturnEntity<JsonObject> data = null;
        if (StringUtils.isNullOrWhiteSpace(id)) {
            data = new PostsInfo().create(departmentId, tags, post);
        } else {
            data = new PostsInfo().update(departmentId, tags, id, post);
        }
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject result;
            if (StringUtils.isNullOrWhiteSpace(id)) {
                post = ConvertUtils.toJsonObject(data.getData().get("post"));
                result = ok(isArticle ? Constants.Resources.Message.Post.DOCTOR_CREATE_POST_SUCCESS : Constants.Resources.Message.Post.USER_CREATE_POST_SUCCESS);
            } else {
                post = ConvertUtils.toJsonObject(data.getData().get("post"));
                result = ok(Constants.Resources.Message.Post.UPDATE_POST_SUCCESS);
            }
            result.addProperty("linkAlias", ConvertUtils.toString(post.get("linkAlias")));
            return result;
        }
        if (StringUtils.isNullOrWhiteSpace(id)) {
            return notOk(isArticle ? Constants.Resources.Message.Post.CREATE_POST_ERROR : Constants.Resources.Message.Post.CREATE_QUESTION_ERROR);
        }
        return notOk(Constants.Resources.Message.Post.EDIT_POST_ERROR);
    }

    @RequestMapping(value = {"/delete/{id}"}, method = RequestMethod.DELETE)
    public @ResponseBody
    JsonObject deleteSlide(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new PostsInfo().delete(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Post.DELETE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Post.DELETE_ERROR);
    }

    @RequestMapping(value = {"/like/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject like(@PathVariable String id, @RequestBody JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new PostsInfo().like(id, jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok();
        }
        return notOk();
    }

    @RequestMapping(value = {"/follow/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject follow(@PathVariable String id, @RequestBody JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new PostsInfo().follow(id, jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok();
        }
        return notOk();
    }

    @RequestMapping(value = {"/get-classify-count"}, method = RequestMethod.GET)
    public @ResponseBody
    JsonObject search() throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new PostsInfo().getClassifyCount();
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk();
        }
    }

    @RequestMapping(value = {"/assign"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject assign(@RequestBody JsonObject postData) throws UnknownHostException, SocketTimeoutException {
        String postId = ConvertUtils.toString(postData.get("postId"));
        String doctorId = ConvertUtils.toString(postData.get("doctorId"));
        String departmentId = ConvertUtils.toString(postData.get("departmentId"));
        ServiceReturnEntity<JsonObject> data = new PostsInfo().assign(postId, departmentId, doctorId);
        if (data.getCode() == 0) {
//            if (ConvertUtils.toInt(data.getData().get("isUpdated")) == 1) {
            return ok(Constants.Resources.Message.Post.ASSIGN_SUCCESS);
//            }
        }
        return notOk(Constants.Resources.Message.Post.ASSIGN_ERROR);
    }

    @RequestMapping(value = {"/get-highlight-post"}, method = RequestMethod.GET)
    public @ResponseBody
    JsonObject getHighlightPost() throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new PostsInfo().getHighlightPost();
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        }
        return notOk("get high light post error!");
    }

    @RequestMapping(value = {"/get-by-tag/{tagId}"}, method = RequestMethod.GET)
    public @ResponseBody
    JsonObject getByTag(
            @PathVariable String tagId,
            @RequestParam(value = CommonField.PAGE, required = false, defaultValue = DefaultConst.PAGE) String page,
            @RequestParam(value = CommonField.SIZE, required = false, defaultValue = DefaultConst.SIZE) String size
            ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new PostsInfo().getByTag(tagId, page, size);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.Post.LOADING_POSTS_ERROR);
        }
    }
}
