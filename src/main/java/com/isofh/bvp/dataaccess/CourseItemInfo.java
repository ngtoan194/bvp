package com.isofh.bvp.dataaccess;

import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.library.ClientInfo;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

public class CourseItemInfo {

    public ServiceReturnEntity<JsonObject> search(String page, String size, String courseId, String name) throws SocketTimeoutException, UnknownHostException {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("?");
        stringBuilder.append("page=").append(page).append("&");
        stringBuilder.append("size=").append(size).append("&");
        stringBuilder.append("courseId=").append(courseId).append("&");
        stringBuilder.append("name=").append(name);
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.CourseItem.SEARCH + stringBuilder);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> create(JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.POST, Constants.Api.CourseItem.CREATE, jsonObject);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> delete(String courseItemId) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.DELETE, Constants.Api.CourseItem.DELETE + "/" + courseItemId);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> update(String courseItemId, JsonObject courseItem) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.CourseItem.UPDATE + "/" + courseItemId, courseItem);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> getByCourse(String id) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.CourseItem.GET_BY_COURSE + "/" + id);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

//    public ServiceReturnEntity<JsonObject> getListCommentCourseItem(String courseItemId) throws SocketTimeoutException, UnknownHostException {
//        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.CourseItem.GET_LIST_COMMENT_COURSE + "/" + courseItemId);
//        if (result.isOK()) {
//            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
//            }.getType());
//        }
//        return new ServiceReturnEntity<>();
//    }
//
//    public ServiceReturnEntity<JsonObject> createCommentCourseItem(String courseItemId, JsonObject contentCourseItem) throws SocketTimeoutException, UnknownHostException {
//        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.POST, Constants.Api.CourseItem.CREATE_COMMENT_COURSE + "/" + courseItemId, contentCourseItem);
//        if (result.isOK()) {
//            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
//            }.getType());
//        }
//        return new ServiceReturnEntity<>();
//    }
//
//    public ServiceReturnEntity<JsonObject> deleteCommentCourseItem(String courseItemCommentId) throws SocketTimeoutException, UnknownHostException {
//        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.DELETE, Constants.Api.CourseItem.DELETE_COMMENT_COURSE + "/" + courseItemCommentId);
//        if (result.isOK()) {
//            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
//            }.getType());
//        }
//        return new ServiceReturnEntity<>();
//    }
//
//    public ServiceReturnEntity<JsonObject> updateCommentCourseItem(String courseItemCommentId, JsonObject courseItemComment) throws SocketTimeoutException, UnknownHostException {
//        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.CourseItem.UPDATE_COMMENT_COURSE + "/" + courseItemCommentId, courseItemComment);
//        if (result.isOK()) {
//            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
//            }.getType());
//        }
//        return new ServiceReturnEntity<>();
//    }

}
