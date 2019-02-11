package com.isofh.bvp.dataaccess;

import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.library.ClientInfo;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

public class CommentInfo {

    public ServiceReturnEntity<JsonObject> search(String page, String size, String postId) throws UnknownHostException, SocketTimeoutException {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("?");
        stringBuilder.append("page=").append(page).append("&");
        stringBuilder.append("size=").append(size).append("&");
        stringBuilder.append("postId=").append(postId);
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Comment.SEARCH + stringBuilder);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> create(JsonObject jsonObject) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.POST, Constants.Api.Comment.CREATE, jsonObject);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> delete(String id) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.DELETE, Constants.Api.Comment.DELETE + "/" + id);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> update(String id, JsonObject jsonObject) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.Comment.UPDATE + "/" + id, jsonObject);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> like(String id) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.Comment.LIKE + "/" + id);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> acceptSolution(String id) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.Comment.ACCEPT_SOLUTION + "/" + id);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

}
