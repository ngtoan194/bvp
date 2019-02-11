package com.isofh.bvp.controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.constants.DefaultConst;
import com.isofh.bvp.constants.field.CommonField;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.TagInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

@Controller
@RequestMapping(value = "/tag")
public class TagController extends BaseController {

    @RequestMapping(value = "/get-all", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject getAll() throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonArray> data = new TagInfo().getAll();
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.Tag.SEARCH_ERROR);
        }
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject search(
            @RequestParam(value = CommonField.PAGE, required = false, defaultValue = DefaultConst.PAGE) String page,
            @RequestParam(value = CommonField.SIZE, required = false, defaultValue = DefaultConst.SIZE) String size,
            @RequestParam(value = "name", required = false, defaultValue = DefaultConst.STRING) String name
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new TagInfo().search(page, size, name);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.Tag.SEARCH_ERROR);
        }
    }

    @RequestMapping(value = {"/create-multiple"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject create(@RequestBody JsonObject object) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new TagInfo().createMultiple(object);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        }
        return notOk(Constants.Resources.Message.Tag.CREATE_ERROR);
    }

    @RequestMapping(value = {"/delete/{id}"}, method = RequestMethod.DELETE)
    public @ResponseBody
    JsonObject delete(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new TagInfo().delete(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Tag.DELETE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Tag.DELETE_ERROR);
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject update(@PathVariable String id,
                      @RequestBody JsonObject object) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new TagInfo().update(id, object);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Tag.UPDATE_SUCCESS);
        } else if (data.getCode() == 2) {
            return notOk(Constants.Resources.Message.Tag.UPDATE_ERROR_CODE2);
        }
        return notOk(Constants.Resources.Message.Tag.UPDATE_ERROR);
    }

}
