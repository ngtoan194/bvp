package com.isofh.bvp.controller;

import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.constants.DefaultConst;
import com.isofh.bvp.constants.field.CommonField;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.CommentInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

@Controller
@RequestMapping(value = "/comment")
public class CommentController extends BaseController {

    @RequestMapping(value = {"/search"}, method = RequestMethod.GET)
    public @ResponseBody
    JsonObject getCommentByPostId(
            @RequestParam(value = CommonField.PAGE, required = false, defaultValue = DefaultConst.PAGE) String page,
            @RequestParam(value = CommonField.SIZE, required = false, defaultValue = DefaultConst.SIZE) String size,
            @RequestParam(value = "postId", required = false, defaultValue = DefaultConst.NUMBER) String postId
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new CommentInfo().search(page, size, postId);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk();
        }
    }

    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject create(@RequestBody JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new CommentInfo().create(jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok();
        }
        return notOk();
    }

    @RequestMapping(value = {"/delete/{id}"}, method = RequestMethod.DELETE)
    public @ResponseBody
    JsonObject delete(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new CommentInfo().delete(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok();
        }
        return notOk();
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject update(
            @PathVariable String id,
            @RequestBody JsonObject jsonObject
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new CommentInfo().update(id, jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok();
        }
        return notOk();
    }

    @RequestMapping(value = {"/like/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject like(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new CommentInfo().like(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok();
        }
        return notOk();
    }

}
