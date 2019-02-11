package com.isofh.bvp.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
@Order(-1)
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
    @Autowired
    private CustomAuthenticationProvider authProvider;

    @Autowired
    LoginSuccessHandler customSuccessHandler;
    @Autowired
    LoginFailureHandler customFailureHandler;

    @Override
    protected void configure(
            AuthenticationManagerBuilder auth) throws Exception {

        auth.authenticationProvider(authProvider);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.headers().frameOptions().disable();
        http
                .authorizeRequests()
                .antMatchers("/**").permitAll()
                .anyRequest().authenticated()
                .and().logout()
                .deleteCookies("remove")
                .invalidateHttpSession(true)
                .logoutUrl("/logout")
                .logoutSuccessUrl("/home")
                .and().formLogin().loginPage("/dang-nhap")
                .usernameParameter("username").passwordParameter("password")
                .successHandler(customSuccessHandler).permitAll()
                .failureHandler(customFailureHandler).permitAll()
                .and().csrf().disable()
        ;
    }

}
