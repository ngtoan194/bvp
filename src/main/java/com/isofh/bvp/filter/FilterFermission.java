package com.isofh.bvp.filter;

import com.isofh.bvp.dataaccess.UserInfo;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FilterFermission implements Filter {
    public void destroy() {
    }

    private String getPrincipal() {
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof UserDetails) {
            userName = ((UserDetails) principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
//        if (req instanceof HttpServletRequest) {
//            HttpServletRequest httpReq = (HttpServletRequest) req;
//            HttpServletResponse httpRes = (HttpServletResponse) resp;
//            String username = getPrincipal();
//            String requestUri = httpReq.getRequestURI().toLowerCase();
//            if (requestUri.startsWith("/static/")
//                    || requestUri.startsWith("/fonts/")
//                    || requestUri.startsWith("/js/")
//                    || requestUri.startsWith("/images/")
//                    || requestUri.startsWith("/css/")
//                    || requestUri.startsWith("/service/")
//                    || requestUri.startsWith("/%7b%7btrustasresourceurl(currentvideo.url)%7d%7d")
//                    || requestUri.startsWith("/{{trustAsResourceUrl(currentVideo.url)}}")
//                    || requestUri.startsWith("/dictionary")
//                    || requestUri == null
//                    || requestUri.startsWith("/slideplace")
//                    || requestUri.startsWith("/onlinecounter")
//                    || requestUri.startsWith("/undefined")
//                    || "".equals(requestUri)
//                    ) {
////                if (requestUri.startsWith("/service/")) {
////                    if (requestUri.equals("/service/user/login/")
////                            || requestUri.equals("/service/user/forgot-password")
////                            || requestUri.equals("/service/user/register")
////                            || requestUri.startsWith("/service/user/update-password")
////                            )
////                        chain.doFilter(req, resp);
////                    else if (username == null || username.equals("anonymousUser")) {
////                        ((HttpServletResponse) resp).setStatus(HttpServletResponse.SC_UNAUTHORIZED);
////                        return;
////                    }
////                }
//                chain.doFilter(req, resp);
//                return;
//            }
//
//            if (requestUri.startsWith("/admin") || requestUri.startsWith("/quan-ly")) {
//                String pathName = httpReq.getServletPath();
//                if (!UserInfo.isLogin() && !UserInfo.isAdmin()) {
//                    if (!pathName.isEmpty()) {
//                        httpRes.sendRedirect("/dang-nhap?returnUrl=" + pathName);
//                    } else {
//                        httpRes.sendRedirect("/dang-nhap");
//                    }
//                    return;
//                }
//            }
////            //check login when create post
//            if (requestUri.startsWith("/dat-cau-hoi") || requestUri.startsWith("/tao-bai-viet") || requestUri.startsWith("/sua-cau-hoi") || requestUri.startsWith("/sua-bai-viet")) {
//                String pathName = httpReq.getServletPath();
//                if (!UserInfo.isLogin()) {
//                    if (!pathName.isEmpty()) {
//                        httpRes.sendRedirect("/dang-nhap?returnUrl=" + pathName);
//                    } else {
//                        httpRes.sendRedirect("/dang-nhap");
//                    }
//                    return;
//                }
//            }
//        }
        HttpServletRequest httpReq = (HttpServletRequest) req;
        HttpServletResponse httpRes = (HttpServletResponse) resp;
        String requestUri = httpReq.getRequestURI().toLowerCase();
        if (requestUri.startsWith("/admin")) {
            String pathName = httpReq.getServletPath();
            if (!UserInfo.isLogin() && !UserInfo.isAdmin()) {
                if (!pathName.isEmpty()) {
                    httpRes.sendRedirect("/dang-nhap?returnUrl=" + pathName);
                } else {
                    httpRes.sendRedirect("/dang-nhap");
                }
                return;
            }
            if(UserInfo.isLogin() && !UserInfo.isAdmin()){
                httpRes.sendRedirect("/");
            }
        }
//            //check login when create post
        if (requestUri.startsWith("/dat-cau-hoi") || requestUri.startsWith("/tao-bai-viet") || requestUri.startsWith("/sua-cau-hoi") || requestUri.startsWith("/sua-bai-viet")) {
            String pathName = httpReq.getServletPath();
            if (!UserInfo.isLogin()) {
                if (!pathName.isEmpty()) {
                    httpRes.sendRedirect("/dang-nhap?returnUrl=" + pathName);
                } else {
                    httpRes.sendRedirect("/dang-nhap");
                }
                return;
            }
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
