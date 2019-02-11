package com.isofh.bvp.dataaccess;

import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.library.ClientInfo;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

public class VideoInfo {

    public ServiceReturnEntity<JsonObject> search(String page, String size, String name, String isHotVideo, String webType) throws SocketTimeoutException, UnknownHostException {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("?");
        stringBuilder.append("page=").append(page).append("&");
        stringBuilder.append("size=").append(size).append("&");
        stringBuilder.append("name=").append(name).append("&");
        stringBuilder.append("isHotVideo=").append(isHotVideo).append("&");
        stringBuilder.append("webType=").append(webType);

        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Video.SEARCH + stringBuilder);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> create(JsonObject video) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.POST, Constants.Api.Video.CREATE, video);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> delete(String videoId) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.DELETE, Constants.Api.Video.DELETE + "/" + videoId);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> update(String videoId, JsonObject video) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.Video.UPDATE + "/" + videoId, video);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> active(String videoId, JsonObject isHotVideo) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.Video.ACTIVE + "/" + videoId, isHotVideo);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> getDetail(String id) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Video.GET_DETAIL + "/" + id);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> getByAlias(String linkAlias) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Video.GET_BY_ALIAS + "/" + linkAlias);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

}
