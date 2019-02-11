package com.isofh.bvp.services;

import com.isofh.library.ClientInfo;

import javax.annotation.PostConstruct;

public class CustomService {
    @PostConstruct
    public void initIt() throws Exception {
        ClientInfo.setServerLink("http://123.24.206.9:8983/");
        ClientInfo.setServerMediaUrl("http://123.24.206.9:8983");
        ClientInfo.setWebUrl("http://123.24.206.9:8384");
        ClientInfo.setServerImage("http://123.24.206.9:8983/");
    }
}