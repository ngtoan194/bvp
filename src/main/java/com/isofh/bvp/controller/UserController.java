package com.isofh.bvp.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.constants.DefaultConst;
import com.isofh.bvp.constants.field.CommonField;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.UserInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.bvp.security.CustomAuthenticationProvider;
import com.isofh.utils.ConvertUtils;
import com.isofh.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/user")
public class UserController extends BaseController {

    @Autowired
    public CustomAuthenticationProvider authenticationProvider;

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject search(
            @RequestParam(value = CommonField.PAGE, required = false, defaultValue = DefaultConst.PAGE) String page,
            @RequestParam(value = CommonField.SIZE, required = false, defaultValue = DefaultConst.SIZE) String size,
            @RequestParam(value = "name", required = false, defaultValue = DefaultConst.STRING) String name,
            @RequestParam(value = "email", required = false, defaultValue = DefaultConst.STRING) String email,
            @RequestParam(value = "socialType", required = false, defaultValue = DefaultConst.NUMBER) String socialType,
            @RequestParam(value = "username", required = false, defaultValue = DefaultConst.STRING) String username,
            @RequestParam(value = "role", required = false, defaultValue = DefaultConst.NUMBER) String role,
            @RequestParam(value = "deleted", required = false, defaultValue = DefaultConst.NUMBER) String deleted,
            @RequestParam(value = "block", required = false, defaultValue = DefaultConst.NUMBER) String block,
            @RequestParam(value = "isHighlight", required = false, defaultValue = DefaultConst.NUMBER) String isHighlight,
            @RequestParam(value = "colIndex", required = false, defaultValue = DefaultConst.NUMBER) String colIndex,
            @RequestParam(value = "departmentId", required = false, defaultValue = DefaultConst.NUMBER) String departmentId,
            @RequestParam(value = "gender", required = false, defaultValue = DefaultConst.NUMBER) String gender
    ) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new UserInfo().search(page, size, name, email, socialType, username, role, deleted, block, isHighlight, colIndex, departmentId, gender);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.User.SEARCH_ERROR);
        }
    }

    @RequestMapping(value = "/get-user-by-id/{id}", method = RequestMethod.GET)
    public @ResponseBody
    JsonObject getUserById(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new UserInfo().getUserByID(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(data.getData());
        } else {
            return notOk(Constants.Resources.Message.User.GET_USER_ERROR);
        }
    }

    @RequestMapping(value = {"/block/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject block(@PathVariable String id,
                     @RequestBody JsonObject object) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new UserInfo().block(id, object);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.User.BLOCK_SUCCESS);
        }
        return notOk(Constants.Resources.Message.User.BLOCK_ERROR);
    }

    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject create(@RequestBody JsonObject object) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new UserInfo().create(object);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.User.CREATE_SUCCESS);
        } else if (data.getCode() == 2) {
            return notOk(Constants.Resources.Message.User.CREATE_ERROR_CODE2);
        }
        return notOk(Constants.Resources.Message.User.CREATE_ERROR);
    }

    @RequestMapping(value = {"/reset-password/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject resetPassword(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new UserInfo().resetPassword(id);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.User.RESET_PASSWORD_SUCCESS);
        }
        return notOk(Constants.Resources.Message.User.RESET_PASSWORD_ERROR);
    }

    @RequestMapping(value = {"/change-password/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject changePassword(@PathVariable String id,
                              @RequestBody JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        String oldPassword = ConvertUtils.toString(jsonObject.get("oldPassword"));
        String newPassword = ConvertUtils.toString(jsonObject.get("newPassword"));
        ServiceReturnEntity<JsonObject> data = new UserInfo().changePassword(id, StringUtils.getMD5(oldPassword), StringUtils.getMD5(newPassword));
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.User.CHANGE_PASSWORD_SUCCESS);
        } else if (data.getCode() == 2) {
            return notOk(Constants.Resources.Message.User.CHANGE_PASSWORD_ERROR_CODE_2);
        }
        return notOk(Constants.Resources.Message.User.CHANGE_PASSWORD_ERROR);
    }

    @RequestMapping(value = {"/update/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject updateMenu(@PathVariable String id,
                          @RequestBody JsonObject object) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new UserInfo().update(id, object);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.User.UPDATE_SUCCESS);
        }
        return notOk(Constants.Resources.Message.User.UPDATE_ERROR);
    }

    @RequestMapping(value = {"/forgot-password"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject forgotPassword(@RequestBody JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new UserInfo().forgotPassword(jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.User.FORGOT_PASSWORD_SUCCESS);
        }
        return notOk(Constants.Resources.Message.User.FORGOT_PASSWORD_ERROR);
    }

    @RequestMapping(value = {"/set-high-light/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject setHighLight(@PathVariable String id,
                            @RequestBody JsonObject object) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new UserInfo().setHighLight(id, object);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.User.SET_HIGH_LIGHT_SUCCESS);
        }
        return notOk(Constants.Resources.Message.User.SET_HIGH_LIGHT_ERROR);
    }

    @RequestMapping(value = {"/update-password"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject setHighLight(@RequestBody JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        String password = ConvertUtils.toString(jsonObject.get("password"));
        String token = ConvertUtils.toString(jsonObject.get("token"));
        ServiceReturnEntity<JsonObject> data = new UserInfo().updatePassword(StringUtils.getMD5(password), token);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.User.UPDATE_PASSWORD_SUCCESS);
        }
        return notOk(Constants.Resources.Message.User.UPDATE_PASSWORD_ERROR);
    }

    @RequestMapping(value = {"/update-email/{id}"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject updateEmail(@PathVariable String id,
                           @RequestBody JsonObject jsonObject) throws SocketTimeoutException, UnknownHostException {
        String password = ConvertUtils.toString(jsonObject.get("password"));
        jsonObject.addProperty("password", StringUtils.getMD5(password));
        ServiceReturnEntity<JsonObject> data = new UserInfo().updateEmail(id, jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            return ok(Constants.Resources.Message.User.UPDATE_EMAIL_SUCCESS);
        } else if (data.getCode() == 2) {
            return notOk(Constants.Resources.Message.User.UPDATE_EMAIL_ERROR_CODE_2);
        }
        return notOk(Constants.Resources.Message.User.UPDATE_EMAIL_ERROR);
    }

    @RequestMapping(value = {"/confirm-email/{tokenId}"}, method = RequestMethod.GET)
    public String activateEmail(ModelMap model, @PathVariable String tokenId) throws SocketTimeoutException, UnknownHostException {
        JsonObject objResult = new JsonObject();
        ServiceReturnEntity<JsonObject> data = new UserInfo().verifyEmail(tokenId);
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject dataUserInfo = data.getData();
            JsonObject temp = ConvertUtils.toJsonObject(dataUserInfo.get("user"));
            JsonObject tempDepartment = ConvertUtils.toJsonObject(dataUserInfo.get("department"));
            objResult.addProperty("success", true);
            objResult.add("data", temp);
            model.addAttribute("dataDepartment", new Gson().toJson(tempDepartment));
            model.addAttribute("dataUserInfo", new Gson().toJson(temp));
            JsonObject temp2 = ConvertUtils.toJsonObject(dataUserInfo.get("user"));
            model.addAttribute("pageTitle", "Tài khoản " + ConvertUtils.toString(temp2.get("nickname")));
            model.addAttribute("isMyProfile", tokenId.equals(UserInfo.getCurrentUserId()));
            return "user-info";
        }
        return "page404";
    }

    @RequestMapping(value = {"/create-by-email"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject createByEmail(@RequestBody JsonObject jsonObject, HttpServletRequest request) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new UserInfo().createByEmail(jsonObject);
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject user = data.getData();
            JsonObject account = ConvertUtils.toJsonObject(user.get("user"));
            ArrayList<GrantedAuthority> roles = new ArrayList<>();
            roles.add(new SimpleGrantedAuthority("ROLE_" + ConvertUtils.toString(account.get("role"))));
            UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(user, "", roles);
            token.setDetails(new WebAuthenticationDetails(request));
            Authentication authentication = this.authenticationProvider.authenticate(token);
            SecurityContextHolder.getContext().setAuthentication(authentication);
            return ok(Constants.Resources.Message.User.CREATE_BY_EMAIL_SUCCESS);
        } else if(data.getCode() == 2){
            return notOk(Constants.Resources.Message.User.CREATE_ERROR_CODE2);
        }
        return notOk(Constants.Resources.Message.User.CREATE_BY_EMAIL_ERROR);
    }


//    @RequestMapping(value = {"/delete/{id}"}, method = RequestMethod.DELETE)
//    public @ResponseBody
//    JsonObject deleteMenu(@PathVariable String id) throws SocketTimeoutException, UnknownHostException {
//        ServiceReturnEntity<JsonObject> data = new UserInfo().delete(id);
//        if (data.getCode() == 0 && data.getData() != null) {
//            return ok(Constants.Resources.Message.Menu.DELETE_SUCCESS);
//        }
//        return notOk(Constants.Resources.Message.Menu.DELETE_ERROR);
//    }

//    @RequestMapping(value = "/setActive/{menuId}", method = RequestMethod.POST)
//    public @ResponseBody
//    JsonObject setActive(@PathVariable String menuId,
//                         @RequestBody JsonObject isActive) throws UnknownHostException, SocketTimeoutException {
//        ServiceReturnEntity<JsonObject> data = new UserInfo().setActive(menuId, isActive);
//        if (data.getCode() == 0 && data.getData() != null) {
//            return ok(Constants.Resources.Message.Menu.SET_ACTIVE_SUCCESS);
//        }
//        return notOk(Constants.Resources.Message.Menu.SET_ACTIVE_ERROR);
//    }

}
