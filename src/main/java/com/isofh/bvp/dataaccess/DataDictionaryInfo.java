package com.isofh.bvp.dataaccess;

import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.library.ClientInfo;
import com.isofh.utils.ConvertUtils;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

public class DataDictionaryInfo {
    public enum DataDictionary {
        DATA_DICTIONARY, DATA_WEBSITE_COUNTER
    }

    public ServiceReturnEntity<JsonObject> save(DataDictionary key, JsonObject value) throws SocketTimeoutException, UnknownHostException {
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("key", key.toString());
        jsonObject.addProperty("value", ConvertUtils.toJson(value));
        JsonObject jsonObject1 = new JsonObject();
        jsonObject1.add("keyValue", jsonObject);
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.POST, Constants.Api.KeyValue.CREATE_OR_UPDATE, jsonObject1);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }


    public JsonObject get(DataDictionary key) throws SocketTimeoutException, UnknownHostException {
        return get(key, null);
    }

    public JsonObject get(DataDictionary key, JsonObject defaultValue) throws SocketTimeoutException, UnknownHostException {
        try {

            ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.KeyValue.GET_VALUE + "/" + key.toString());
            if (result.isOK()) {
                ServiceReturnEntity<JsonObject> res = result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
                }.getType());
                if (res.getCode() == 0) {
                    return ConvertUtils.toJsonObject(ConvertUtils.toString(ConvertUtils.toJsonObject(ConvertUtils.toJsonObject(res.getData()).get("keyValue")).get("value")));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return defaultValue;
    }
}
