package com.isofh.bvp.dataaccess;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.library.ClientInfo;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

public class PostsInfo {

    public ServiceReturnEntity<JsonObject> search(
            String page, String size, String isAnswered, String isAssigned, String isPublished, String authorId, String departmentId, String assigneeId, String startTime
    ) throws UnknownHostException, SocketTimeoutException {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("?");
        stringBuilder.append("page=").append(page).append("&");
        stringBuilder.append("size=").append(size).append("&");
        stringBuilder.append("isAnswered=").append(isAnswered).append("&");
        stringBuilder.append("isAssigned=").append(isAssigned).append("&");
        stringBuilder.append("isPublished=").append(isPublished).append("&");
        stringBuilder.append("authorId=").append(authorId).append("&");
        stringBuilder.append("departmentId=").append(departmentId).append("&");
        stringBuilder.append("assigneeId=").append(assigneeId).append("&");
        stringBuilder.append("startTime=").append(startTime);
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Post.SEARCH + stringBuilder);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> getFollowedByUser(String userId, String page, String size) throws UnknownHostException, SocketTimeoutException {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("?");
        stringBuilder.append("page=").append(page).append("&");
        stringBuilder.append("size=").append(size);
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Post.GET_FOLLOWED_BY_USER + "/" + userId + stringBuilder);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> create(String departmentId, JsonArray tags, JsonObject post) throws UnknownHostException, SocketTimeoutException {
        JsonObject jsonObject = new JsonObject();
        if (departmentId != null && !departmentId.equals("")) {
            jsonObject.addProperty("departmentId", departmentId);
        }
        if (tags.size() > 0) {
            jsonObject.add("tags", tags);
        }
        jsonObject.add("post", post);
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.POST, Constants.Api.Post.CREATE, jsonObject);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }


    public ServiceReturnEntity<JsonObject> delete(String id) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.DELETE, Constants.Api.Post.DELETE + "/" + id);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> update(String departmentId, JsonArray tags, String id, JsonObject dataUpdate) throws UnknownHostException, SocketTimeoutException {
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("departmentId", departmentId);
        jsonObject.add("tags", tags);
        jsonObject.add("post", dataUpdate);
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.Post.UPDATE + "/" + id, jsonObject);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> getDetail(String id) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Post.GET_DETAIL + "/" + id);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> getByAlias(String alias) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Post.GET_BY_ALIAS + "/" + alias);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> like(String id, JsonObject jsonObject) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.Post.LIKE + "/" + id, jsonObject);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> follow(String id, JsonObject jsonObject) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.Post.FOLLOW + "/" + id, jsonObject);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> assign(String id, String departmentId, String doctorId) throws SocketTimeoutException, UnknownHostException {
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("departmentId", departmentId);
        jsonObject.addProperty("assigneeId", doctorId);

        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.Post.ASSIGN + "/" + id, jsonObject);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> approvePostDoctor(String postId, int isPublished) throws SocketTimeoutException, UnknownHostException {
        JsonObject JsonObject = new JsonObject();
        JsonObject.addProperty("isPublished", isPublished);
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.Post.STATUS_POST_DOCTOR + "/" + postId, JsonObject);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> getClassifyCount() throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Post.GET_CLASSIFY_COUNT);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> getHighlightPost() throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Post.HIGHLIGHT);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> getListPost(String url, String query, int page, int size) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, url + "?query=" + query + "&page=" + page + "&size=" + size);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> getByTag(String id, String page, String size) throws UnknownHostException, SocketTimeoutException {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("?");
        stringBuilder.append("page=").append(page).append("&");
        stringBuilder.append("size=").append(size).append("&");
        stringBuilder.append("tagId=").append(id);
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.Post.GET_BY_TAG + "/" + id + stringBuilder);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }
}
