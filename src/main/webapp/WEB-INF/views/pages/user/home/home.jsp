<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/09/18
  Time: 8:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<jsp:include page="/WEB-INF/views/pages/user/slide/slide.jsp"/>
<div class="bg-green">
    <div class="main-page">
        <!-- tin tuc -->
        <jsp:include page="/WEB-INF/views/pages/user/home/news.jsp"/>
        <!-- dich vu tai benh vien -->
        <jsp:include page="/WEB-INF/views/pages/user/home/hospital-utility.jsp"/>
        <!-- giai dap y hoc -->
        <jsp:include page="/WEB-INF/views/pages/user/home/post.jsp"/>
        <!-- giao luu truc tuyen -->
        <jsp:include page="/WEB-INF/views/pages/user/home/online-exchange.jsp"/>
        <!-- danh sach bac si -->
        <jsp:include page="/WEB-INF/views/pages/user/home/doctor.jsp"/>
        <div class="special-list main-section">
            <div class="container">
                <div class="row">
                    <!-- goc tri an -->
                    <jsp:include page="/WEB-INF/views/pages/user/home/contribute.jsp"/>
                    <!-- goc tu thien -->
                    <jsp:include page="/WEB-INF/views/pages/user/home/charity.jsp"/>
                    <!-- video -->
                    <jsp:include page="/WEB-INF/views/pages/user/home/video.jsp"/>
                </div>
            </div>
        </div>
        <div class="another-info main-section">
            <div class="container">
                <div class="row">
                    <!-- khoa hoc -->
                    <jsp:include page="/WEB-INF/views/pages/user/home/course.jsp"/>
                    <!-- tai lieu -->
                    <jsp:include page="/WEB-INF/views/pages/user/home/document.jsp"/>
                    <!-- web link -->
                    <jsp:include page="/WEB-INF/views/pages/user/home/web-link.jsp"/>
                </div>
            </div>
        </div>
    </div>
</div>