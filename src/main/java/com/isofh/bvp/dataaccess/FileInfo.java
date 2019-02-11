package com.isofh.bvp.dataaccess;

import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.library.ClientInfo;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public class FileInfo {

    public static ServiceReturnEntity<JsonObject> uploadImage(String filename, byte[] file) throws IOException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.POST, Constants.Api.Image.UPLOAD, filename, file);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();

    }

    public static ServiceReturnEntity<JsonObject> uploadImage(MultipartFile file) throws IOException {
        return uploadImage(file.getOriginalFilename(), file.getBytes());
    }

    public static ServiceReturnEntity<JsonObject> uploadFile(String fileName, byte[] fileUpload) throws IOException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.POST, Constants.Api.File.UPLOAD, fileName, fileUpload);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public static ServiceReturnEntity<JsonObject> uploadFile(MultipartFile fileUpload) throws IOException {
        return uploadFile(fileUpload.getOriginalFilename(), fileUpload.getBytes());
    }
}
