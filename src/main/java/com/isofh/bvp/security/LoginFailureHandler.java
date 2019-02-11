package com.isofh.bvp.security;

import com.google.gson.JsonObject;
import com.isofh.bvp.dataaccess.ResponseInfo;
import com.isofh.utils.ConvertUtils;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        try {
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            JsonObject jsonObject= ResponseInfo.notOk(exception.getMessage());
            response.getWriter().print(ConvertUtils.toJson(jsonObject));
            response.getWriter().flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}