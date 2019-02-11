package com.isofh.bvp.controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.MenuInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.utils.ConvertUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

@Controller
@RequestMapping(value = "/menu")
public class MenuController extends BaseController {

    @RequestMapping(value = "/get-all", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject getListMenu(@RequestParam(required = false, defaultValue = "") String role,
                           @RequestParam(required = false, defaultValue = "1") String isActive,
                           @RequestParam(required = false, defaultValue = "1") String webType) throws SocketTimeoutException, UnknownHostException {
        JsonObject data = new MenuInfo().getAll(role, isActive, webType);
        return ok(data);
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject search(@RequestParam String page,
                      @RequestParam String size,
                      @RequestParam(required = false) String name,
                      @RequestParam(required = false) String level,
                      @RequestParam(required = false) String isActive,
                      @RequestParam(required = false) String webType,
                      @RequestParam(required = false) String role) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new MenuInfo().search(page, size, name, level, isActive, webType, role);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.Menu.SEARCH_ERROR);
        }
    }

    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject create(@RequestBody JsonObject object) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new MenuInfo().create(object);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Menu.CREATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Menu.CREATE_ERROR);
    }

    @RequestMapping(value = {"/delete/{id}"}, method = RequestMethod.DELETE)
    public @ResponseBody
    JsonObject delete(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new MenuInfo().delete(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Menu.DELETE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Menu.DELETE_ERROR);
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject update(@PathVariable String id,
                      @RequestBody JsonObject object) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new MenuInfo().update(id, object);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Menu.UPDATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Menu.UPDATE_ERROR);
    }

    @RequestMapping(value = "/setActive/{menuId}", method = RequestMethod.POST)
    public @ResponseBody
    JsonObject setActive(@PathVariable String menuId,
                         @RequestBody JsonObject isActive) throws UnknownHostException, SocketTimeoutException {
        ServiceReturnEntity<JsonObject> data = new MenuInfo().setActive(menuId, isActive);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.Menu.SET_ACTIVE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.Menu.SET_ACTIVE_ERROR);
    }

    @RequestMapping(value = "/getDetail", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject getDetailMenu(@RequestParam(required = false) String menuId) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new MenuInfo().getDetail(menuId);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.Menu.SEARCH_ERROR);
        }
    }

    @RequestMapping(value = "/getByGroup/{group}", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject getListSubMenu(@PathVariable String group) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new MenuInfo().getByGroup(group);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.Menu.SEARCH_ERROR);
        }
    }


    @RequestMapping(value = "/setGroup/{id}", method = RequestMethod.POST)
    public @ResponseBody
    JsonObject setGroup(@PathVariable String id,
                        @RequestBody JsonObject group) throws UnknownHostException, SocketTimeoutException {
        ServiceReturnEntity<JsonObject> data = new MenuInfo().setGroup(id, group);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        }
        return notOk(Constants.Resources.Message.Menu.SET_GROUP_ERROR);
    }

}
