package com.isofh.bvp.dataaccess;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.library.ClientInfo;
import com.isofh.utils.ConvertUtils;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

public class DepartmentInfo {

    public ServiceReturnEntity<JsonObject> getAll() throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Department.GET_ALL);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonArray> getListDoctorDepartment() throws SocketTimeoutException, UnknownHostException {
        JsonArray department = StaticDataInfo.getData(StaticDataInfo.CONSTANT_DATA_STATIC.DATA_DEPARTMENT, new JsonArray());
        if (department.size() == 0) {
            ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Department.GET_LIST_DOCTOR_DEPARTMENT);
            if (result.isOK()) {
                ServiceReturnEntity<JsonObject> data = result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
                }.getType());
                if (data.getCode() == 0) {
                    department = ConvertUtils.toJsonArray(data.getData().get("departments"));
                    StaticDataInfo.setData(StaticDataInfo.CONSTANT_DATA_STATIC.DATA_DEPARTMENT, department);
                }
            }
        }
        new Thread(() -> {
            try {
                ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Department.GET_LIST_DOCTOR_DEPARTMENT);
                if (result.isOK()) {
                    ServiceReturnEntity<JsonObject> data = result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
                    }.getType());
                    if (data.getCode() == 0) {
                        StaticDataInfo.setData(StaticDataInfo.CONSTANT_DATA_STATIC.DATA_DEPARTMENT, ConvertUtils.toJsonArray(data.getData().get("departments")));
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }).start();
        return new ServiceReturnEntity<JsonArray>(0, department, "");

    }

}
