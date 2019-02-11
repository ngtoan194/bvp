package com.isofh.bvp.controller.base;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.isofh.bvp.services.SpringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class BaseController {
    @Autowired
    public SpringUtils myService;
    JsonObject jsonObject;

    public BaseController() {
        jsonObject = new JsonObject();
    }

    public JsonObject ok() {
        jsonObject.addProperty("success", true);
        return jsonObject;
    }

    public JsonObject ok(JsonElement data, String message) {
        jsonObject.addProperty("success", true);
        jsonObject.addProperty("message", message);
        jsonObject.add("data", data);
        return jsonObject;
    }

    public JsonObject ok(JsonElement data) {
        jsonObject.addProperty("success", true);
        jsonObject.add("data", data);
        return jsonObject;
    }

    public JsonObject ok(String data) {
        jsonObject.addProperty("success", true);
        jsonObject.addProperty("data", data);
        return jsonObject;
    }

    public JsonObject ok(int data) {
        jsonObject.addProperty("success", true);
        jsonObject.addProperty("data", data);
        return jsonObject;
    }

    public JsonObject ok(long data) {
        jsonObject.addProperty("success", true);
        jsonObject.addProperty("data", data);
        return jsonObject;
    }

    public JsonObject ok(boolean data) {
        jsonObject.addProperty("success", true);
        jsonObject.addProperty("data", data);
        return jsonObject;
    }

    public JsonObject notOk(String message) {
        jsonObject.addProperty("success", false);
        jsonObject.addProperty("message", message);
        return jsonObject;
    }

    public JsonObject notOk() {
        return notOk("");
    }

}
