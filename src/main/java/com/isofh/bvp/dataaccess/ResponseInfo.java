package com.isofh.bvp.dataaccess;

import com.google.gson.JsonObject;
import com.isofh.utils.ConvertUtils;

public class ResponseInfo {
    public Object data;
    public String message;
    public int status_code;
    public boolean success;

    public ResponseInfo() {
        success = false;
        status_code = 0;
        message = "";
        data = null;
    }

    ResponseInfo(Object data, String message, int status_code, boolean success) {
        this.data = data;
        this.message = message;
        this.status_code = status_code;
        this.success = success;
    }

    JsonObject toJsonObject() {
        return ConvertUtils.toJsonObject(ConvertUtils.toJson(this));
    }

    public static JsonObject ok() {
        return ok(200);
    }

    public static JsonObject ok(int status) {
        return ok(status, "");
    }

    public static JsonObject ok(Object data) {
        return ok(200, data);
    }

    public static JsonObject ok(int status_code, Object data) {
        return ok(status_code, data, "");
    }

    public static JsonObject ok(int status_code, Object data, String message) {
        ResponseInfo responseInfo = new ResponseInfo(data, message, status_code, true);
        return responseInfo.toJsonObject();
    }


    public static JsonObject notOk() {
        return notOk(500);
    }

    public static JsonObject notOk(int status) {
        return notOk(status, "");
    }

    public static JsonObject notOk(String message) {
        return notOk(500, message);
    }

    public static JsonObject notOk(int status_code, String message) {
        return notOk(status_code, new Object(), message);
    }

    public static JsonObject notOk(int status_code, Object data, String message) {
        ResponseInfo responseInfo = new ResponseInfo(data, message, status_code, false);
        return responseInfo.toJsonObject();
    }

}
