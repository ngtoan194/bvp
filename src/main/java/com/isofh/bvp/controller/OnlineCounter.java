package com.isofh.bvp.controller;

import com.google.gson.JsonObject;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.listener.SessionCounter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

@Controller
public class OnlineCounter extends BaseController {
    @RequestMapping(value = {"/online-counter/get-counter"}, method = RequestMethod.GET)
    public @ResponseBody
    JsonObject getCounter() throws SocketTimeoutException, UnknownHostException {
        return ok(SessionCounter.getDataOnline());
    }

    @RequestMapping(value = {"/online-counter/create"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject IncreateCounter(HttpServletRequest req) {
        SessionCounter.count(req);
        return ok(SessionCounter.getDataOnline());
    }
}
