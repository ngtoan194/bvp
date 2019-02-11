package com.isofh.bvp.controller;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.FileInfo;
import com.isofh.bvp.dataaccess.UserInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.bvp.models.UploadAvatarModel;
import com.isofh.bvp.security.CustomAuthenticationProvider;
import com.isofh.library.ClientInfo;
import com.isofh.utils.ConvertUtils;
import com.isofh.utils.FacebookUtils;
import com.isofh.utils.ImageUtils;
import com.isofh.utils.StringUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.RequestContext;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.util.ArrayList;

@Controller
@RequestMapping(value = "/user")
public class LoginController extends BaseController {

    @Autowired
    public CustomAuthenticationProvider authenticationProvider;

    @RequestMapping(value = {"/login"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject login(@RequestBody JsonObject model, RequestContext requestContext,
                     HttpServletRequest request) {
        String username = ConvertUtils.toString(model.get("username"));
        String password = ConvertUtils.toString(model.get("password"));

        try {
            ServiceReturnEntity<JsonObject> result = new UserInfo().login(username, StringUtils.getMD5(password));
            int code = result.getCode();
            if (result.getCode() == 2) {
                return notOk(Constants.Resources.Message.User.ACCOUNT_BLOCK);
            } else if (result.getCode() == 3) {
                return notOk(Constants.Resources.Message.User.LOGIN_ERROR3);
            } else if (result.getCode() == 0 && result.getData() != null) {
                return handlerLoginResult(result, request);
            }

        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (SocketTimeoutException e) {
            e.printStackTrace();
        }
        return notOk(Constants.Resources.Message.User.LOGIN_ERROR);

    }

    private JsonObject handlerLoginResult(ServiceReturnEntity<JsonObject> result,
                                          HttpServletRequest request) {
        int code = result.getCode();
        JsonObject data = result.getData();
        JsonObject dataUser = ConvertUtils.toJsonObject(data.get("user"));
        int role = ConvertUtils.toInt(dataUser.get("role"));
        if ((7 & role) != 0) {
            switch (code) {
                case 0:
                    JsonObject jsonObject = result.getData();
                    JsonObject account = ConvertUtils.toJsonObject(jsonObject.get("user"));
                    JsonObject department = ConvertUtils.toJsonObject(jsonObject.get("department"));
                    account.add("department", department);
                    ArrayList<GrantedAuthority> roles = new ArrayList<>();
                    roles.add(new SimpleGrantedAuthority("ROLE_" + ConvertUtils.toString(account.get("role"))));
                    UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(jsonObject, "", roles);
                    token.setDetails(new WebAuthenticationDetails(request));
                    Authentication authentication = this.authenticationProvider.authenticate(token);
                    SecurityContextHolder.getContext().setAuthentication(authentication);
                    return ok(account);
                case 1:
                case 2:
                    return notOk(Constants.Resources.Message.User.ACCOUNT_BLOCK);
            }
            return notOk(Constants.Resources.Message.User.LOGIN_ERROR);
        } else {
            return notOk(Constants.Resources.Message.User.LOGIN_ERROR2);
        }
    }

    @RequestMapping(value = "/upload-avatar", method = RequestMethod.POST)
    public @ResponseBody
    JsonObject upload(UploadAvatarModel data) {
        try {
            float ratio = data.getOrgHeight() * 1f / data.getClientHeight();
            float ratio2 = data.getOrgWidth() * 1f / data.getClientWidth();
            if (ratio2 < ratio)
                ratio = ratio2;
            int fromX = Math.round(data.getCropPointX() * ratio);
            int fromY = Math.round(data.getCropPointY() * ratio);
            int width = Math.round(data.getImageCropWidth() * ratio);
            int height = Math.round(data.getImageCropHeight() * ratio);
            BufferedImage imageCroped = null;

            imageCroped = ImageUtils.cropImage(data.getFile().getBytes(), fromX, fromY, width, height);


            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(imageCroped, FilenameUtils.getExtension(data.getFile().getOriginalFilename()), baos);
            baos.flush();
            byte[] imageInByte = baos.toByteArray();
            ServiceReturnEntity<JsonObject> result1 = FileInfo.uploadImage(data.getFile().getOriginalFilename(), imageInByte);

            JsonObject jsonObject = result1.getData();
            if (data.isUploadOriginImage()) {
                ServiceReturnEntity<JsonObject> result2 = FileInfo.uploadImage(data.getFile().getOriginalFilename(), data.getFile().getBytes());
                JsonArray image = ConvertUtils.toJsonArray(result2.getData().get("images"));
                jsonObject.add("originImages", image);
            }

            return ok(result1.getData());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return notOk();
    }

    @RequestMapping(value = {"/register"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject register(@RequestBody JsonObject jsonObject,
                        HttpServletRequest request) throws UnknownHostException, SocketTimeoutException {
        JsonObject device = ConvertUtils.toJsonObject(jsonObject.get("device"));
        JsonObject user = ConvertUtils.toJsonObject(jsonObject.get("user"));
        user.addProperty("password", StringUtils.getMD5(ConvertUtils.toString(user.get("password"))));

        ServiceReturnEntity<JsonObject> data = new UserInfo().register(device, user);
        if (data.getCode() == 0 && data.getData() != null) {
            jsonObject = data.getData();
            JsonObject account = ConvertUtils.toJsonObject(jsonObject.get("user"));
            JsonObject department = ConvertUtils.toJsonObject(jsonObject.get("department"));
            account.add("department", department);
            ArrayList<GrantedAuthority> roles = new ArrayList<>();
            roles.add(new SimpleGrantedAuthority("ROLE_" + ConvertUtils.toString(account.get("role"))));
            UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(jsonObject, "", roles);
            token.setDetails(new WebAuthenticationDetails(request));
            Authentication authentication = this.authenticationProvider.authenticate(token);
            SecurityContextHolder.getContext().setAuthentication(authentication);
            return ok(Constants.Resources.Message.User.REGISTER_SUCCESS);
        }
        if (data.getCode() == 2) {
            return notOk(Constants.Resources.Message.User.DOUBLE_EMAIL_OR_NICKNAME);
        }
        return notOk(Constants.Resources.Message.User.REGISTER_ERROR);
    }

    @RequestMapping(value = {"/login/fb"}, method = RequestMethod.GET)
    public String loginFb(@RequestParam(required = false) String code, @RequestParam(required = false) String returnUrl, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String url =  "https://" + request.getServerName();
        if (request.getServerName().equals("localhost"))
            url += ":" + request.getServerPort();
        if (request.getServerName().equals("test.bvptw.org"))
            url += ":" + request.getServerPort();
        if (request.getServerName().equals("123.24.206.9"))
            url += ":" + request.getServerPort();

        FacebookUtils oFB = new FacebookUtils("619131945209744", "f0f9bde26f7c13acea15ca3748541e7e", url + "/user/login/fb");
        if (StringUtils.isNullOrWhiteSpace(code)) {
            response.sendRedirect(oFB.authorizationLinkGet());
        } else {
            oFB.accessTokenGet(code);
            if (oFB.get_token().length() > 0) {
                ClientInfo.DataResponse result = new ClientInfo().requestApi(ClientInfo.MethodType.GET, "", "https://graph.facebook.com/me?access_token=" + oFB.get_token() + "&fields=id,name,email");
                String json = result.getBody();
                JsonObject jsonObject = ConvertUtils.toJsonObject(json);
                try {
                    ServiceReturnEntity<JsonObject> result2 = new UserInfo().loginSocial(1, ConvertUtils.toString(jsonObject.get("id")), ConvertUtils.toString(jsonObject.get("email")), ConvertUtils.toString(jsonObject.get("name")));
                    JsonObject result3 = handlerLoginResult(result2, request);
                    if (ConvertUtils.toBoolean(result3.get("success")))
                        response.sendRedirect("/");
                } catch (UnknownHostException e) {
                    e.printStackTrace();
                } catch (SocketTimeoutException e) {
                    e.printStackTrace();
                }
            }
        }
        return "login";
    }
    @RequestMapping(value = {"/login/gg"}, method = RequestMethod.POST)
    public @ResponseBody
    JsonObject loginGg(@RequestBody JsonObject model, RequestContext requestContext,
                       HttpServletRequest request) {
        String name = ConvertUtils.toString(model.get("displayName"));
        String email = ConvertUtils.toString(model.get("email"));
        String id = ConvertUtils.toString(model.get("id"));

        try {
            ServiceReturnEntity<JsonObject> result = new UserInfo().loginSocial(2, id, email, name);
            return handlerLoginResult(result, request);
        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (SocketTimeoutException e) {
            e.printStackTrace();
        }
        return notOk(Constants.Resources.Message.User.LOGIN_ERROR4);
    }
}
