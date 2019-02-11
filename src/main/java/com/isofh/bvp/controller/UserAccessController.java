package com.isofh.bvp.controller;

import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.UserAccessInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

@Controller
@RequestMapping(value = "/user-access")
public class UserAccessController extends BaseController {

    @RequestMapping(value = "/get-count", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject getAll() throws SocketTimeoutException, UnknownHostException {
        JsonObject data = new UserAccessInfo().getCount();
        return ok(data);
    }

    @RequestMapping(value = {"/create/{onlineCounterKey}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject create(@PathVariable String onlineCounterKey) throws SocketTimeoutException, UnknownHostException {
        JsonObject object = new JsonObject();
        object.addProperty("deviceId", onlineCounterKey);
        ServiceReturnEntity<JsonObject> data = new UserAccessInfo().create(object);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.UserAccess.CREATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.UserAccess.CREATE_ERROR);
    }

}
