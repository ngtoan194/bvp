package com.isofh.bvp.security;

import com.isofh.utils.ConvertUtils;
import com.isofh.utils.ConvertUtils;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {
    public Authentication authenticate(Authentication authentication)
            throws AuthenticationException {
        try {
            String nickname = ConvertUtils.toJson(ConvertUtils.toJsonObject(ConvertUtils.toJsonObject(authentication.getName()).get("user")));
            String password = authentication.getCredentials().toString();
            return new UsernamePasswordAuthenticationToken(
                    nickname, password, authentication.getAuthorities());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean supports(Class<?> authentication) {
        return authentication.equals(
                UsernamePasswordAuthenticationToken.class);
    }
}