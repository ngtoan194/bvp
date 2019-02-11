package com.isofh.bvp.controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.DepartmentInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

@Controller
@RequestMapping(value = "/department")
public class DepartmentController extends BaseController {

    @RequestMapping(value = "/get-all", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject search() throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new DepartmentInfo().getAll();
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.Department.GET_ALL_ERROR);
        }
    }

    @RequestMapping(value = "/get-list-doctor-department", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject getListDoctorDepartment() throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonArray> data = new DepartmentInfo().getListDoctorDepartment();
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk();
        }
    }

}
