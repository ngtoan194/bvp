package com.isofh.bvp.dataaccess;

import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.library.ClientInfo;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.text.ParseException;

public class SlidePlaceInfo {
    public ServiceReturnEntity<JsonObject> search(String page, String size, String name, String webType) throws UnknownHostException, SocketTimeoutException, ParseException {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("?");
        stringBuilder.append("page=").append(page).append("&");
        stringBuilder.append("size=").append(size).append("&");
        stringBuilder.append("name=").append(name).append("&");
        stringBuilder.append("webType=").append(webType);
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.SlidePlace.SEARCH + stringBuilder);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> getByName(String name) throws UnknownHostException, SocketTimeoutException, ParseException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.SlidePlace.GET_BY_NAME + "/" + name);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> update(String id, JsonObject object) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.SlidePlace.UPDATE + "/" + id, object);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }
}
