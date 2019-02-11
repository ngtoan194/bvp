package com.isofh.bvp.controller;

import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.constants.DefaultConst;
import com.isofh.bvp.constants.field.CommonField;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.VideoInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

@Controller
@RequestMapping(value = "/video")
public class VideoController extends BaseController {

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject search(
            @RequestParam(value = CommonField.PAGE, required = false, defaultValue = DefaultConst.PAGE) String page,
            @RequestParam(value = CommonField.SIZE, required = false, defaultValue = DefaultConst.SIZE) String size,
            @RequestParam(value = "name", required = false, defaultValue = DefaultConst.STRING) String name,
            @RequestParam(value = "isHotVideo", required = false, defaultValue = DefaultConst.NUMBER) String isHotVideo,
            @RequestParam(value = CommonField.WEB_TYPE, required = false, defaultValue = DefaultConst.NUMBER) String webType
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new VideoInfo().search(page, size, name, isHotVideo, webType);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.Video.SEARCH_ERROR);
        }
    }

    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject create(
            @RequestBody JsonObject jsonObject
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new VideoInfo().create(jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Video.CREATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Video.CREATE_ERROR);
    }

    @RequestMapping(value = {"/delete/{id}"}, method = RequestMethod.DELETE)
    public @ResponseBody
    JsonObject delete(
            @PathVariable String id
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new VideoInfo().delete(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Video.DELETE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Video.DELETE_ERROR);
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject update(
            @PathVariable String id,
            @RequestBody JsonObject jsonObject
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new VideoInfo().update(id, jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Video.UPDATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Video.UPDATE_ERROR);
    }

    @RequestMapping(value = "/active/{id}", method = RequestMethod.POST)
    public @ResponseBody
    JsonObject active(
            @PathVariable String id,
            @RequestBody JsonObject jsonObject
    ) throws UnknownHostException, SocketTimeoutException {
        ServiceReturnEntity<JsonObject> data = new VideoInfo().active(id, jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Video.ACTIVE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Video.ACTIVE_ERROR);
    }

}
