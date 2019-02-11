package com.isofh.bvp.controller;

import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.constants.DefaultConst;
import com.isofh.bvp.constants.field.CommonField;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.SlideInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

@Controller
@RequestMapping(value = "/slide")
public class SlideController extends BaseController {

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject getListSlide(
            @RequestParam(value = CommonField.PAGE, required = false, defaultValue = DefaultConst.PAGE) String page,
            @RequestParam(value = CommonField.SIZE, required = false, defaultValue = DefaultConst.SIZE) String size,
            @RequestParam(value = "name", required = false, defaultValue = DefaultConst.STRING) String name,
            @RequestParam(value = "active", required = false, defaultValue = DefaultConst.NUMBER) String active,
            @RequestParam(value = "intervalTime", required = false, defaultValue = DefaultConst.NUMBER) String intervalTime,
            @RequestParam(value = "autoPlay", required = false, defaultValue = DefaultConst.NUMBER) String autoPlay,
            @RequestParam(value = CommonField.WEB_TYPE, required = false, defaultValue = DefaultConst.NUMBER) String webType
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new SlideInfo().search(page, size, name, active, intervalTime, autoPlay, webType);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.Slide.SEARCH_ERROR);
        }
    }

    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject createSlide(@RequestBody JsonObject slide) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new SlideInfo().create(slide);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Slide.CREATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Slide.CREATE_ERROR);
    }

    @RequestMapping(value = {"/delete/{id}"}, method = RequestMethod.DELETE)
    public @ResponseBody
    JsonObject deleteSlide(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new SlideInfo().delete(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Slide.DELETE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Slide.DELETE_ERROR);
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject updateSlide(@PathVariable String id,
                           @RequestBody JsonObject slide) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new SlideInfo().update(id, slide);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Slide.UPDATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Slide.UPDATE_ERROR);
    }


    @RequestMapping(value = "/active/{id}", method = RequestMethod.POST)
    public @ResponseBody
    JsonObject activeSlide(@PathVariable String id,
                           @RequestBody JsonObject slide) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new SlideInfo().active(id, slide);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Slide.ACTIVE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Slide.ACTIVE_ERROR);
    }

}
