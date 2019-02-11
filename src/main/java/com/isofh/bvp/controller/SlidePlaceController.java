package com.isofh.bvp.controller;


import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.constants.DefaultConst;
import com.isofh.bvp.constants.field.CommonField;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.SlidePlaceInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.text.ParseException;

@Controller
@RequestMapping(value = "/slide-place")
public class SlidePlaceController extends BaseController {

    @RequestMapping(value = {"/search"}, method = RequestMethod.GET)
    public @ResponseBody
    JsonObject slideSearch(
            @RequestParam(value = CommonField.PAGE, required = false, defaultValue = DefaultConst.PAGE) String page,
            @RequestParam(value = CommonField.SIZE, required = false, defaultValue = DefaultConst.SIZE) String size,
            @RequestParam(value = "name", required = false, defaultValue = DefaultConst.STRING) String name,
            @RequestParam(value = CommonField.WEB_TYPE, required = false, defaultValue = DefaultConst.NUMBER) String webType
    ) throws SocketTimeoutException, UnknownHostException, ParseException {
        ServiceReturnEntity<JsonObject> data = new SlidePlaceInfo().search(page, size, name, webType);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.SlidePlace.SEARCH_ERROR);
        }
    }

    @RequestMapping(value = {"/get-name/{name}"}, method = RequestMethod.GET)
    public @ResponseBody
    JsonObject getNameSearch(@PathVariable String name) throws SocketTimeoutException, UnknownHostException, ParseException {
        ServiceReturnEntity<JsonObject> data = new SlidePlaceInfo().getByName(name);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.SlidePlace.SEARCH_ERROR);
        }
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject updateslidePlace(@PathVariable String id,
                                @RequestBody JsonObject dataUpdateSlidePlace) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new SlidePlaceInfo().update(id, dataUpdateSlidePlace);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.SlidePlace.UPDATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.SlidePlace.UPDATE_ERROR);
    }
}
