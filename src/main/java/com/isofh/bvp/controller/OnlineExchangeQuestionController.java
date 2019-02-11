package com.isofh.bvp.controller;


import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.constants.DefaultConst;
import com.isofh.bvp.constants.field.CommonField;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.OnlineExchangeQuestionInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

@Controller
@RequestMapping(value = "/online-exchange-question")
public class OnlineExchangeQuestionController extends BaseController {

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject search(
            @RequestParam(value = CommonField.PAGE, required = false, defaultValue = DefaultConst.PAGE) String page,
            @RequestParam(value = CommonField.SIZE, required = false, defaultValue = DefaultConst.SIZE) String size,
            @RequestParam(value = "exchangeId", required = false, defaultValue = DefaultConst.NUMBER) String exchangeId,
            @RequestParam(value = "content", required = false, defaultValue = DefaultConst.STRING) String content,
            @RequestParam(value = "approval", required = false, defaultValue = DefaultConst.NUMBER) String approval,
            @RequestParam(value = "name", required = false, defaultValue = DefaultConst.STRING) String name,
            @RequestParam(value = "email", required = false, defaultValue = DefaultConst.STRING) String email,
            @RequestParam(value = "doctorId", required = false, defaultValue = DefaultConst.NUMBER) String doctorId
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new OnlineExchangeQuestionInfo().search(page, size, exchangeId, content, approval, name, email, doctorId);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.OnlineExchangeQuestion.SEARCH_ERROR);
        }
    }

    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject create(
            @RequestBody JsonObject jsonObject
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new OnlineExchangeQuestionInfo().create(jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.OnlineExchangeQuestion.CREATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.OnlineExchangeQuestion.CREATE_ERROR);
    }

    @RequestMapping(value = {"/delete/{id}"}, method = RequestMethod.DELETE)
    public @ResponseBody
    JsonObject delete(
            @PathVariable String id
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new OnlineExchangeQuestionInfo().delete(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.OnlineExchangeQuestion.DELETE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.OnlineExchangeQuestion.DELETE_ERROR);
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject update(
            @PathVariable String id,
            @RequestBody JsonObject jsonObject
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new OnlineExchangeQuestionInfo().update(id, jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.OnlineExchangeQuestion.UPDATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.OnlineExchangeQuestion.UPDATE_ERROR);
    }

    @RequestMapping(value = {"/approval/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject approval(
            @PathVariable String id,
            @RequestBody JsonObject jsonObject
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new OnlineExchangeQuestionInfo().approval(id, jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.OnlineExchangeQuestion.APPROVAL_SUCCESS);
        }
        return notOk(Constants.Resources.Message.OnlineExchangeQuestion.APPROVAL_ERROR);
    }

}
