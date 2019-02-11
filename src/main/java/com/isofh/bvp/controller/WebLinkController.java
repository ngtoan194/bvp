package com.isofh.bvp.controller;


import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.WebLinkInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

@Controller
public class WebLinkController extends BaseController{
    
    @RequestMapping(value = "webLink/searchWebLink", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject getListWebLink(@RequestParam String page,
                              @RequestParam String size,
                              @RequestParam(required = false) String name,
                              @RequestParam(required = false) String link,
                              @RequestParam(required = false) String image,
                              @RequestParam(required = false) String startDate,
                              @RequestParam(required = false) String endDate) throws SocketTimeoutException, UnknownHostException {

        ServiceReturnEntity<JsonObject> data = new WebLinkInfo().searchWebLink(page, size, name, link, image, startDate, endDate);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.WebLink.SEARCH_ERROR);
        }
    }

    @RequestMapping(value = {"webLink/createWebLink"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject createWebLink(@RequestBody JsonObject webLink) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new WebLinkInfo().createWebLink(webLink);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.WebLink.CREATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.WebLink.CREATE_ERROR);
    }

    @RequestMapping(value = {"webLink/deleteWebLink/{id}"}, method = RequestMethod.DELETE)
    public @ResponseBody
    JsonObject deleteWebLink(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new WebLinkInfo().deleteWebLink(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.WebLink.DELETE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.WebLink.DELETE_ERROR);
    }

    @RequestMapping(value = {"webLink/updateWebLink/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject deleteWebLink(@PathVariable String id,
                             @RequestBody JsonObject dataUpdateWebLink) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new WebLinkInfo().updateWebLink(id, dataUpdateWebLink);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.WebLink.UPDATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.WebLink.UPDATE_ERROR);
    }
}
