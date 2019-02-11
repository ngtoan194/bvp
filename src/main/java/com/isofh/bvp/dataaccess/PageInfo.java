package com.isofh.bvp.dataaccess;

import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.library.ClientInfo;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

public class PageInfo {
    public ServiceReturnEntity<JsonObject> search(String page, String size, String name, String type, String webType) throws SocketTimeoutException, UnknownHostException {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("?");
        stringBuilder.append("page=").append(page).append("&");
        stringBuilder.append("size=").append(size).append("&");
        stringBuilder.append("name=").append(name).append("&");
        stringBuilder.append("type=").append(type).append("&");
        stringBuilder.append("webType=").append(webType);

        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Page.SEARCH + stringBuilder);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> create(JsonObject page) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.POST, Constants.Api.Page.CREATE, page);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> delete(String id) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.DELETE, Constants.Api.Page.DELETE + "/" + id);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> update(String id, JsonObject page) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.Page.UPDATE + "/" + id, page);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> getDetail(String id) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Page.GET_DETAIL + "/" + id);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> getByAlias(String alias) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Page.GET_BY_ALIAS + "/" + alias);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }
}
