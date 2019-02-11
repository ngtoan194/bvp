package com.isofh.bvp.dataaccess;

import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.library.ClientInfo;
import com.isofh.utils.StringUtils;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

public class MenuInfo {

    public JsonObject getAll(String role, String isActive, String webType) throws SocketTimeoutException, UnknownHostException {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("?");
        stringBuilder.append("role=").append(role).append("&");
        stringBuilder.append("isActive=").append(isActive).append("&");
        stringBuilder.append("webType=").append(webType);

        JsonObject menu = StaticDataInfo.getData(StaticDataInfo.CONSTANT_DATA_STATIC.DATA_MENU, role, new JsonObject());
        if (menu.size() == 0) {
            ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Menu.GET_ALL + stringBuilder);
            if (result.isOK()) {
                ServiceReturnEntity<JsonObject> data = result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
                }.getType());
                if (data.getCode() == 0) {
                    menu = data.getData();
                    StaticDataInfo.setData(StaticDataInfo.CONSTANT_DATA_STATIC.DATA_MENU, role, menu);
                }
            }
        }
        new Thread(() -> {
            try {
                ClientInfo.DataResponse result2 = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Menu.GET_ALL + stringBuilder);
                if (result2.isOK()) {
                    ServiceReturnEntity<JsonObject> data = result2.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
                    }.getType());
                    if (data.getCode() == 0) {
                        StaticDataInfo.setData(StaticDataInfo.CONSTANT_DATA_STATIC.DATA_MENU, role, data.getData());
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }).start();
        return menu;
    }

    public ServiceReturnEntity<JsonObject> search(String page, String size, String name, String level, String isActive, String webType, String role) throws SocketTimeoutException, UnknownHostException {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("?");
        stringBuilder.append("page=").append(page).append("&");
        stringBuilder.append("size=").append(size).append("&");
        stringBuilder.append("name=").append(name).append("&");
        stringBuilder.append("level=").append(level).append("&");
        stringBuilder.append("isActive=").append(isActive).append("&");
        stringBuilder.append("webType=").append(webType).append("&");
        stringBuilder.append("role=").append(role);

        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Menu.SEARCH + stringBuilder);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> create(JsonObject menu) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.POST, Constants.Api.Menu.CREATE, menu);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> delete(String id) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.DELETE, Constants.Api.Menu.DELETE + "/" + id);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> update(String id, JsonObject object) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.Menu.UPDATE + "/" + id, object);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> setActive(String id, JsonObject isActive) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.Menu.ACTIVE + "/" + id, isActive);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> getDetail(String menuId) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Menu.GET_DETAIL + "/" + menuId);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> getByGroup(String group) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.Menu.GET_BY_GROUP + "/" + group);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> setGroup(String id, JsonObject group) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.Menu.SET_GROUP + "/" + id, group);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

}
