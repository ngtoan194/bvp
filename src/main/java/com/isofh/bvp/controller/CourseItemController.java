package com.isofh.bvp.controller;

import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.constants.DefaultConst;
import com.isofh.bvp.constants.field.CommonField;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.CourseItemInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;


@Controller
@RequestMapping(value = "/course-item")
public class CourseItemController extends BaseController {

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject search(
            @RequestParam(value = CommonField.PAGE, required = false, defaultValue = DefaultConst.PAGE) String page,
            @RequestParam(value = CommonField.SIZE, required = false, defaultValue = DefaultConst.SIZE) String size,
            @RequestParam(value = "courseId", required = false, defaultValue = DefaultConst.NUMBER) String courseId,
            @RequestParam(value = "name", required = false, defaultValue = DefaultConst.STRING) String name
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new CourseItemInfo().search(page, size, courseId, name);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.CourseItem.SEARCH_ERROR);
        }
    }

    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject create(@RequestBody JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new CourseItemInfo().create(jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.CourseItem.CREATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.CourseItem.CREATE_ERROR);
    }

    @RequestMapping(value = {"/delete/{id}"}, method = RequestMethod.DELETE)
    public @ResponseBody
    JsonObject delete(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new CourseItemInfo().delete(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.CourseItem.DELETE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.CourseItem.DELETE_ERROR);
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject update(@PathVariable String id,
                      @RequestBody JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new CourseItemInfo().update(id, jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.CourseItem.UPDATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.CourseItem.UPDATE_ERROR);
    }
}
