package com.isofh.bvp.controller;

import com.google.gson.JsonObject;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.FileInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@RequestMapping(value = "/file")
public class FileController extends BaseController {
    @RequestMapping(value = "/uploadImage", method = RequestMethod.POST)
    public @ResponseBody
    JsonObject upload(@RequestBody MultipartFile file) throws IOException {
        ServiceReturnEntity<JsonObject> result = FileInfo.uploadImage(file);
        return ok(result.getData());
    }

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public @ResponseBody
    JsonObject uploadFiles(@RequestBody MultipartFile file) throws IOException {
        ServiceReturnEntity<JsonObject> result = FileInfo.uploadFile(file);
        return ok(result.getData());
    }
}
