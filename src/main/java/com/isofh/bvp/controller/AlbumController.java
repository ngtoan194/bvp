package com.isofh.bvp.controller;

import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.constants.DefaultConst;
import com.isofh.bvp.constants.field.CommonField;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.AlbumInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

@Controller
@RequestMapping(value = "/album")
public class AlbumController extends BaseController {

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject searchAlbum(
            @RequestParam(value = CommonField.PAGE, required = false, defaultValue = DefaultConst.PAGE) String page,
            @RequestParam(value = CommonField.SIZE, required = false, defaultValue = DefaultConst.SIZE) String size,
            @RequestParam(value = "name", required = false, defaultValue = DefaultConst.STRING) String name,
            @RequestParam(value = "belongDepartment", required = false, defaultValue = DefaultConst.NUMBER) String belongDepartment,
            @RequestParam(value = "pageId", required = false, defaultValue = DefaultConst.NUMBER) String pageId
    ) throws SocketTimeoutException, UnknownHostException {

        ServiceReturnEntity<JsonObject> data = new AlbumInfo().search(page, size, name, belongDepartment, pageId);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.Album.SEARCH_ERROR);
        }
    }

    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject createAlbum(@RequestBody JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new AlbumInfo().create(jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Album.CREATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Album.CREATE_ERROR);
    }

    @RequestMapping(value = {"/delete/{id}"}, method = RequestMethod.DELETE)
    public @ResponseBody
    JsonObject deleteAlbum(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new AlbumInfo().delete(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Album.DELETE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Album.DELETE_ERROR);
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject deleteAlbum(@PathVariable String id,
                           @RequestBody JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new AlbumInfo().update(id, jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Album.UPDATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Album.UPDATE_ERROR);
    }


}
