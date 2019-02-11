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

public class TagInfo {

    public ServiceReturnEntity<JsonArray> getAll() throws UnknownHostException, SocketTimeoutException {
        JsonArray tags = StaticDataInfo.getData(StaticDataInfo.CONSTANT_DATA_STATIC.DATA_TAG, new JsonArray());
        if (tags.size() == 0) {
            ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Tag.GET_ALL);
            if (result.isOK()) {
                ServiceReturnEntity<JsonObject> data = result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
                }.getType());
                if (data.getCode() == 0) {
                    tags = ConvertUtils.toJsonArray(data.getData().get("data"));
                    StaticDataInfo.setData(StaticDataInfo.CONSTANT_DATA_STATIC.DATA_TAG, tags);
                }
            }
        }
        new Thread(() -> {
            try {
                ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Tag.GET_ALL);
                if (result.isOK()) {
                    ServiceReturnEntity<JsonObject> data = result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
                    }.getType());
                    if (data.getCode() == 0) {
                        StaticDataInfo.setData(StaticDataInfo.CONSTANT_DATA_STATIC.DATA_TAG, ConvertUtils.toJsonArray(data.getData().get("data")));
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }).start();
        return new ServiceReturnEntity<>(0, tags, "");
    }

    public ServiceReturnEntity<JsonObject> search(String page, String size, String name) throws UnknownHostException, SocketTimeoutException {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("?");
        stringBuilder.append("page=").append(page).append("&");
        stringBuilder.append("size=").append(size).append("&");
        stringBuilder.append("name=").append(name);

        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Tag.SEARCH + stringBuilder);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> createMultiple(JsonObject object) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.POST, Constants.Api.Tag.CREATE_MULTIPLE, object);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>()  {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> delete(String id) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.DELETE, Constants.Api.Tag.DELETE + "/" + id);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> update(String id,JsonObject object) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.Tag.UPDATE + "/" + id, object);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonArray> getHotestTag(int page, int size) throws UnknownHostException, SocketTimeoutException {
        JsonArray tags = StaticDataInfo.getData(StaticDataInfo.CONSTANT_DATA_STATIC.DATA_HOTEST_TAG, new JsonArray());
        if (tags.size() == 0) {
            ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Tag.SEARCH + "?page=" + page + "&size=" + size);
            if (result.isOK()) {
                ServiceReturnEntity<JsonObject> data = result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
                }.getType());
                if (data.getCode() == 0) {
                    tags = ConvertUtils.toJsonArray(data.getData().get("data"));
                    StaticDataInfo.setData(StaticDataInfo.CONSTANT_DATA_STATIC.DATA_HOTEST_TAG, tags);
                }
            }
        }
        new Thread(() -> {
            try {
                ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Tag.SEARCH + "?page=" + page + "&size=" + size);
                if (result.isOK()) {
                    ServiceReturnEntity<JsonObject> data = result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
                    }.getType());
                    if (data.getCode() == 0) {
                        StaticDataInfo.setData(StaticDataInfo.CONSTANT_DATA_STATIC.DATA_HOTEST_TAG, ConvertUtils.toJsonArray(data.getData().get("data")));
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }).start();
        return new ServiceReturnEntity<>(0, tags, "");

    }

}
