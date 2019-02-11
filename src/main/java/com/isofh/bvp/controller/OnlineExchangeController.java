package com.isofh.bvp.controller;

import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.constants.DefaultConst;
import com.isofh.bvp.constants.field.CommonField;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.OnlineExchangeInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

@Controller
@RequestMapping(value = "/online-exchange")
public class OnlineExchangeController extends BaseController {

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject search(
            @RequestParam(value = CommonField.PAGE, required = false, defaultValue = DefaultConst.PAGE) String page,
            @RequestParam(value = CommonField.SIZE, required = false, defaultValue = DefaultConst.SIZE) String size,
            @RequestParam(value = "topic", required = false, defaultValue = DefaultConst.STRING) String topic,
            @RequestParam(value = "active", required = false, defaultValue = DefaultConst.NUMBER) String active,
            @RequestParam(value = "startTime", required = false, defaultValue = DefaultConst.DATE) String startTime,
            @RequestParam(value = "endTime", required = false, defaultValue = DefaultConst.DATE) String endTime
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new OnlineExchangeInfo().search(page, size, topic, active, startTime, endTime);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.OnlineExchange.SEARCH_ERROR);
        }
    }

    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject create(@RequestBody JsonObject onlineExchange) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new OnlineExchangeInfo().create(onlineExchange);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.OnlineExchange.CREATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.OnlineExchange.CREATE_ERROR);
    }

    @RequestMapping(value = {"/delete/{id}"}, method = RequestMethod.DELETE)
    public @ResponseBody
    JsonObject delete(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new OnlineExchangeInfo().delete(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.OnlineExchange.DELETE_SUCCESS);
        } else if (data.getCode() == 2) {
            return notOk(Constants.Resources.Message.OnlineExchange.DELETE_ERROR_CODE_2);
        }
        return notOk(Constants.Resources.Message.OnlineExchange.DELETE_ERROR);
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject update(@PathVariable String id,
                      @RequestBody JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new OnlineExchangeInfo().update(id, jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.OnlineExchange.UPDATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.OnlineExchange.UPDATE_ERROR);
    }

    @RequestMapping(value = {"/active/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject setActive(@PathVariable String id,
                         @RequestBody JsonObject active) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new OnlineExchangeInfo().active(id, active);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.OnlineExchange.SET_ACTIVE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.OnlineExchange.SET_ACTIVE_ERROR);
    }

    @RequestMapping(value = "/get-detail/{id}", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject getDetail(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new OnlineExchangeInfo().getDetail(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.OnlineExchange.SEARCH_ERROR);
        }
    }

    @RequestMapping(value = "/get-by-alias/{alias}", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject getByAlias(@PathVariable String alias) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new OnlineExchangeInfo().getByAlias(alias);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.OnlineExchange.SEARCH_ERROR);
        }
    }

}
