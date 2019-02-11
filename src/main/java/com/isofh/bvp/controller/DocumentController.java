package com.isofh.bvp.controller;

import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.constants.DefaultConst;
import com.isofh.bvp.constants.field.CommonField;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.DocumentInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

@Controller
@RequestMapping(value = "/document")
public class DocumentController extends BaseController {

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject searchDocument(
            @RequestParam(value = CommonField.PAGE, required = false, defaultValue = DefaultConst.PAGE) String page,
            @RequestParam(value = CommonField.SIZE, required = false, defaultValue = DefaultConst.SIZE) String size,
            @RequestParam(value = "code", required = false, defaultValue = DefaultConst.STRING) String code,
            @RequestParam(value = "name", required = false, defaultValue = DefaultConst.STRING) String name,
            @RequestParam(value = "publishedDate", required = false, defaultValue = DefaultConst.DATE) String publishedDate,
            @RequestParam(value = "effectiveDate", required = false, defaultValue = DefaultConst.DATE) String effectiveDate,
            @RequestParam(value = "publishedOrg", required = false, defaultValue = DefaultConst.STRING) String publishedOrg,
            @RequestParam(value = "type", required = false, defaultValue = DefaultConst.NUMBER) String type,
            @RequestParam(value = "webType", required = false, defaultValue = DefaultConst.NUMBER) String webType,
            @RequestParam(value = "menuId", required = false, defaultValue = DefaultConst.NUMBER) String menuId
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new DocumentInfo().search(page, size, code, name, publishedDate, effectiveDate, publishedOrg, type, webType, menuId);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.Document.SEARCH_ERROR);
        }
    }

    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject createDocument(@RequestBody JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new DocumentInfo().create(jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Document.CREATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Document.CREATE_ERROR);
    }

    @RequestMapping(value = {"/delete/{id}"}, method = RequestMethod.DELETE)
    public @ResponseBody
    JsonObject deleteDocument(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new DocumentInfo().delete(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Document.DELETE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Document.DELETE_ERROR);
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject deleteDocument(@PathVariable String id,
                              @RequestBody JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new DocumentInfo().update(id, jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Document.UPDATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Document.UPDATE_ERROR);
    }

}
