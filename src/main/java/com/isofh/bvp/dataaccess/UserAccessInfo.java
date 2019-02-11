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

public class UserAccessInfo {

    public JsonObject getCount() throws UnknownHostException, SocketTimeoutException {
        JsonObject userAccess = StaticDataInfo.getData(StaticDataInfo.CONSTANT_DATA_STATIC.DATA_USER_ACCESS, new JsonObject());
        if (userAccess.size() == 0) {
            ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.UserAccess.GET_COUNT);
            if (result.isOK()) {
                ServiceReturnEntity<JsonObject> data = result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
                }.getType());
                if (data.getCode() == 0) {
                    userAccess = data.getData();
                    StaticDataInfo.setData(StaticDataInfo.CONSTANT_DATA_STATIC.DATA_USER_ACCESS, userAccess);
                }
            }
        }
        new Thread(() -> {
            try {
                ClientInfo.DataResponse result2 = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.UserAccess.GET_COUNT);
                if (result2.isOK()) {
                    ServiceReturnEntity<JsonObject> data = result2.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
                    }.getType());
                    if (data.getCode() == 0) {
                        StaticDataInfo.setData(StaticDataInfo.CONSTANT_DATA_STATIC.DATA_USER_ACCESS, data.getData());
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }).start();
        return userAccess;
    }

    public ServiceReturnEntity<JsonObject> create(JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.POST, Constants.Api.UserAccess.CREATE, jsonObject);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

}
