package com.isofh.bvp.dataaccess;

import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.library.ClientInfo;
import com.isofh.utils.ConvertUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

public class UserInfo {
    public static JsonObject getCurrentUser() {
        try {
            String user = null;
            Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            if (principal != null && principal.equals("anonymousUser"))
                return null;
            if (principal instanceof UserDetails) {
                user = ((UserDetails) principal).getUsername();
            } else {
                user = principal.toString();
            }
            return ConvertUtils.toJsonObject(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean isLogin() {
        return getCurrentUser() != null;
    }

    public static int getSocialType() {
        if (isLogin()) {
            JsonObject currentUser = getCurrentUser();
            return ConvertUtils.toInt(currentUser.get("socialType"));
        }
        return 0;
    }

    public static String getCurrentUserFullName() {
        if (isLogin()) {
            JsonObject currentUser = getCurrentUser();
            return ConvertUtils.toString(currentUser.get("name"));
        }
        return "";
    }

    public static String getCurrentUserEmail() {
        if (isLogin()) {
            JsonObject currentUser = getCurrentUser();
            return ConvertUtils.toString(currentUser.get("email"));
        }
        return "";
    }

    public static String getCurrentUserAvatar() {
        if (isLogin()) {
            JsonObject currentUser = getCurrentUser();
            return ConvertUtils.toString(currentUser.get("avatarUrl"));
        }
        return "";
    }

    public static String getCurrentUserId() {
        if (isLogin()) {
            JsonObject currentUser = getCurrentUser();
            return ConvertUtils.toString(currentUser.get("id"));
        }
        return "";
    }

    public static String getCurrentUserRole() {
        if (isLogin()) {
            JsonObject currentUser = getCurrentUser();
            return ConvertUtils.toString(currentUser.get("role"));
        }
        return "";
    }

    public static Integer getCurrentAdminRole() {
        if (isLogin()) {
            JsonObject currentUser = getCurrentUser();
            return ConvertUtils.toInt(currentUser.get("adminRole"));
        }
        return 0;
    }

    public static boolean isAdmin() {
        if (isLogin()) {
            JsonObject currentUser = getCurrentUser();
            return (ConvertUtils.toInt(currentUser.get("role")) & 4) == 4;
        }
        return false;
    }

    public static boolean isUser() {
        if (isLogin()) {
            JsonObject currentUser = getCurrentUser();
            return ConvertUtils.toInt(currentUser.get("role")) == 1;
        }
        return false;
    }

    public static boolean isDoctor() {
        if (isLogin()) {
            JsonObject currentUser = getCurrentUser();
            return ConvertUtils.toInt(currentUser.get("role")) == 2;
        }
        return false;
    }

    public static String getThumbnailAvatarUrl() {
        if (isLogin()) {
            JsonObject currentUser = getCurrentUser();
            return ConvertUtils.toString(currentUser.get("thumbnailAvatarUrl"));
        }
        return "";
    }

    public static JsonObject userInfo() {
        if (isLogin()) {
            JsonObject currentUser = getCurrentUser();
            return currentUser;
        }
        return new JsonObject();
    }

    public static String getAuthorization() {
        if (isLogin()) {
            JsonObject currentUser = getCurrentUser();
            return ConvertUtils.toString(currentUser.get("loginToken"));
        }
        return "";
    }

    public enum Role {
        User(1),
        Doctor(2),
        Admin(4);
        int value;

        Role(int value) {
            this.value = value;
        }

        public int getValue() {
            return value;
        }
    }

    public ServiceReturnEntity<JsonObject> block(String id, JsonObject obj) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.User.BLOCK + "/" + id, obj);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> changePassword(String id, String oldPassword, String newPassword) throws SocketTimeoutException, UnknownHostException {
        JsonObject dataPass = new JsonObject();
        dataPass.addProperty("oldPassword", oldPassword);
        dataPass.addProperty("newPassword", newPassword);
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.User.CHANGE_PASSWORD + "/" + id, dataPass);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> create(JsonObject jsonObject) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.POST, Constants.Api.User.CREATE, jsonObject);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> forgotPassword(JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.User.FORGOT_PASSWORD, jsonObject);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> getUserByID(String UserId) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.User.GET_USER_BY_ID + "/" + UserId);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> login(String username, String password) throws UnknownHostException, SocketTimeoutException {
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("usernameOrEmail", username);
        jsonObject.addProperty("password", password);

        JsonObject jsonObject1 = new JsonObject();
        jsonObject1.addProperty("os", 0);
        jsonObject1.addProperty("devideId", "");
        jsonObject1.addProperty("token", "");
        jsonObject.add("device", jsonObject1);


        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.User.LOGIN, jsonObject);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> loginSocial(int socialType, String socialId, String email, String name) throws SocketTimeoutException, UnknownHostException {
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("socialType", socialType);
        jsonObject.addProperty("socialId", socialId);
        jsonObject.addProperty("name", name);
        jsonObject.addProperty("email", email);

        JsonObject jsonObject1 = new JsonObject();
        jsonObject1.addProperty("os", 0);
        jsonObject1.addProperty("devideId", "");
        jsonObject1.addProperty("token", "");
        jsonObject.add("device", jsonObject1);


        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.User.LOGIN_SOCIAL, jsonObject);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> register(JsonObject device, JsonObject user) throws SocketTimeoutException, UnknownHostException {
        JsonObject jsonObject = new JsonObject();

        device.addProperty("os", 0);
        device.addProperty("deviceId", "");
        device.addProperty("token", "");

        jsonObject.add("device", device);
        jsonObject.add("user", user);

        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.POST, Constants.Api.User.USER_REGISTER, jsonObject);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> resetPassword(String id) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.User.RESET_PASSWORD + "/" + id);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> search(String page, String size, String name, String email, String socialType, String username, String role, String deleted, String block, String isHighlight, String colIndex, String departmentId, String gender) throws UnknownHostException, SocketTimeoutException {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("?");
        stringBuilder.append("page=").append(page).append("&");
        stringBuilder.append("size=").append(size).append("&");
        stringBuilder.append("name=").append(name).append("&");
        stringBuilder.append("email=").append(email).append("&");
        stringBuilder.append("socialType=").append(socialType).append("&");
        stringBuilder.append("username=").append(username).append("&");
        stringBuilder.append("role=").append(role).append("&");
        stringBuilder.append("deleted=").append(deleted).append("&");
        stringBuilder.append("block=").append(block).append("&");
        stringBuilder.append("isHighlight=").append(isHighlight).append("&");
        stringBuilder.append("colIndex=").append(colIndex).append("&");
        stringBuilder.append("departmentId=").append(departmentId).append("&");
        stringBuilder.append("gender=").append(gender);
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.User.SEARCH + stringBuilder.toString());
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> update(String id, JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.User.UPDATE + "/" + id, jsonObject);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> setHighLight(String id, JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.User.SET_HIGH_LIGHT + "/" + id, jsonObject);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> updatePassword(String password, String token) throws SocketTimeoutException, UnknownHostException {
        JsonObject dataPass = new JsonObject();
        dataPass.addProperty("password", password);
        dataPass.addProperty("token", token);
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.User.UPDATE_PASSWORD , dataPass);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> getTokenPasswordInfo(String tokenId) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, Constants.Api.User.GET_TOKEN_PASSWORD_INFO + "/" + tokenId);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> createByEmail(JsonObject user) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.POST, Constants.Api.User.CREATE_BY_EMAIL, user);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> updateEmail(String id, JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.User.USER_UPDATE_EMAIL + "/" + id, jsonObject);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

    public ServiceReturnEntity<JsonObject> verifyEmail(String tokenId) throws UnknownHostException, SocketTimeoutException {
        ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.PUT, Constants.Api.User.VERIFY_EMAIL + "/" + tokenId);
        if (result.isOK()) {
            return result.getData(new TypeToken<ServiceReturnEntity<JsonObject>>() {
            }.getType());
        }
        return new ServiceReturnEntity<>();
    }

}
