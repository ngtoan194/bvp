package com.isofh.bvp.controller;

import com.google.gson.JsonObject;
import com.isofh.bvp.constants.DefaultConst;
import com.isofh.bvp.constants.field.CommonField;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.CourseItemCommentInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;


@Controller
@RequestMapping(value = "/course-item-comment")
public class CourseItemCommentController extends BaseController {

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject search(
            @RequestParam(value = CommonField.PAGE, required = false, defaultValue = DefaultConst.PAGE) String page,
            @RequestParam(value = CommonField.SIZE, required = false, defaultValue = DefaultConst.SIZE) String size,
            @RequestParam(value = "courseItemId", required = false, defaultValue = DefaultConst.NUMBER) String courseItemId
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new CourseItemCommentInfo().search(page, size, courseItemId);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk();
        }
    }

    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject create(@RequestBody JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new CourseItemCommentInfo().create(jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok();
        }
        return notOk();
    }

    @RequestMapping(value = {"/delete/{id}"}, method = RequestMethod.DELETE)
    public @ResponseBody
    JsonObject delete(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new CourseItemCommentInfo().delete(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok();
        }
        return notOk();
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject update(@PathVariable String id,
                      @RequestBody JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new CourseItemCommentInfo().update(id, jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok();
        }
        return notOk();
    }
}
