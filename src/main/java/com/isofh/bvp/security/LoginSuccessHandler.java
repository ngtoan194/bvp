package com.isofh.bvp.security;

import com.google.gson.JsonObject;
import com.isofh.bvp.constants.Constants;
import com.isofh.bvp.dataaccess.ResponseInfo;
import com.isofh.bvp.dataaccess.UserInfo;
import com.isofh.utils.ConvertUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
    @Override
    protected void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
            throws IOException {
        try {
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            JsonObject jsonObject = ResponseInfo.ok(Constants.Resources.Message.User.LOGIN_SUCCES);
            jsonObject.add("user", UserInfo.getCurrentUser());
            response.getWriter().print(ConvertUtils.toJson(jsonObject));
            response.getWriter().flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}