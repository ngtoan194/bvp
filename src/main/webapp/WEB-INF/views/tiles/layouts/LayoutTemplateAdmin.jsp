<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/09/18
  Time: 8:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="com.isofh.bvp.dataaccess.UserInfo" %>
<c:set var="isLogin" scope="session" value="${UserInfo.isLogin()}"/>
<c:set var="userFullName" scope="session" value="${UserInfo.getCurrentUserFullName()}"/>
<c:set var="userId" scope="session" value="${UserInfo.getCurrentUserId()}"/>
<c:set var="role" scope="session" value="${UserInfo.getCurrentUserRole()}"/>
<c:set var="adminRole" scope="session" value="${UserInfo.getCurrentAdminRole()}"/>
<c:set var="isAdmin" scope="session" value="${UserInfo.isAdmin()}"/>
<c:set var="isUser" scope="session" value="${UserInfo.isUser()}"/>
<c:set var="isDoctor" scope="session" value="${UserInfo.isDoctor()}"/>
<c:set var="thumbnailAvatarUrl" scope="session" value="${UserInfo.getThumbnailAvatarUrl()}"/>
<c:set var="userEmail" scope="session" value="${UserInfo.getCurrentUserEmail()}"/>
<c:set var="socialType" scope="session" value="${UserInfo.getSocialType()}"/>
<c:set var="userInfo" scope="session" value="${UserInfo.userInfo()}"/>
<html>
<head>
    <meta name="keywords" content="html5, css3, template, responsive, adaptive"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <meta http-equiv="content-language" content="vi"/>
    <meta name="AUTHOR" content="BỆNH VIỆN PHỔI TRUNG ƯƠNG"/>
    <meta name="COPYRIGHT" content="BỆNH VIỆN PHỔI TRUNG ƯƠNG"/>
    <meta name="keywords"
          content="Bệnh viện phổi trung ương, benhvienphoitrunguong, benh vien phoi trung uong, cham soc suc khoe chu dong, chăm sóc sức khỏe chủ động, đặt khám online, dat kham online, tư vấn hỏi đáp, tu van hoi dap"/>
    <meta name="news_keywords"
          content="Bệnh viện phổi trung ương, benhvienphoitrunguong, benh vien phoi trung uong, cham soc suc khoe chu dong, chăm sóc sức khỏe chủ động, đặt khám online, dat kham online, tư vấn hỏi đáp, tu van hoi dap"/>
    <title><tiles:insertAttribute name="title" ignore="true"/></title>
    <link rel="shortcut icon" href="/static/images/logo_tab.png" type="image/x-icon"/>

    <!-- Bootstrap -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/static/css/fonts/font-awesome.min.css" rel="stylesheet">
    <!-- bootstrap-datetimepicker -->
    <link href="/static/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <!-- Datatables -->
    <link href="/static/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="/static/css/iCheck/green.css" rel="stylesheet">
    <!-- Switchery -->
    <link href="/static/css/switchery.css" rel="stylesheet">
    <!-- PNotify -->
    <link href="/static/css/pnotify/pnotify.css" rel="stylesheet">
    <link href="/static/css/pnotify/pnotify.buttons.css" rel="stylesheet">
    <link href="/static/css/pnotify/pnotify.nonblock.css" rel="stylesheet">
    <!-- select2 -->
    <link href="/static/css/select2.min.css" rel="stylesheet">
    <!-- jquery-confirm -->
    <link href="/static/css/jquery-confirm.min.css" rel="stylesheet">
    <!-- Custom styling plus plugins -->
    <link href="/static/css/custom.min.css" rel="stylesheet">
    <link href="/static/css/loading.css" rel="stylesheet">
    <link href="/static/css/toan-style.css" rel="stylesheet">
    <link href="/static/css/owl.carousel.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="/static/js/jquery/jquery.min.js"></script>
    <script src="/static/js/owl.carousel.js"></script>
    <!-- Bootstrap -->
    <script src="/static/js/bootstrap.min.js"></script>
    <!-- Bootstrap -->
    <script src="/static/js/ckeditor/ckeditor.js"></script>
    <!-- Datatables -->
    <script src="/static/js/jquery.dataTables.min.js"></script>
    <script src="/static/js/dataTables/dataTables.bootstrap.min.js"></script>
    <!-- bootstrap-datetimepicker -->
    <script src="/static/js/moment.min.js"></script>
    <script src="/static/js/bootstrap-datetimepicker.min.js"></script>
    <!-- jQuery Tags Input -->
    <script src="/static/js/jquery.tagsinput.js"></script>
    <script src="/static/js/bootstrap-tagsinput.js"></script>
    <!-- iCheck -->
    <script src="/static/js/icheck.min.js"></script>
    <!-- angular -->
    <script src="/static/js/angular/angular.min.js" type="text/javascript"></script>
    <script src="/static/js/angular/angular-sanitize.js" type="text/javascript"></script>
    <script src="/static/js/angular/angular-validate.min.js" type="text/javascript"></script>
    <!-- jquery-confirm -->
    <script src="/static/js/jquery-confirm.min.js"></script>
    <!-- select2 -->
    <script src="/static/js/select2/select2.min.js" type="text/javascript"></script>
    <script src="/static/js/select2/ui.select2.js"></script>
    <!-- Switchery -->
    <script src="/static/js/switchery.min.js"></script>
    <!-- PNotify -->
    <script src="/static/js/pnotify/pnotify.js"></script>
    <script src="/static/js/pnotify/pnotify.buttons.js"></script>
    <script src="/static/js/pnotify/pnotify.nonblock.js"></script>
    <!-- jquery.validate -->
    <script src="/static/js/jquery.validate.min.js"></script>
    <!-- angular-translate -->
    <script data-require="angular-translate@*" data-semver="2.5.0" src="/static/js/angular/angular-translate.js"></script>
    <%--<script src="/static/js/custom.min.js"></script>--%>
    <script src="/static/scripts/app.js"></script>
    <script src="/static/scripts/app-controller.js"></script>
    <script src="/static/scripts/mllibrary.js"></script>
    <script src="/static/scripts/mlmodule/ml.checkdate.v1.4.js"></script>
    <script src="/static/scripts/mlmodule/ml.validate.v1.0.js"></script>
    <script src="/static/scripts/mllibrary.js" type="text/javascript"></script>
</head>
<body class="nav-md" ng-app="bvpApp" ng-cloak ng-controller="bvpController">
<div class="container body" ng-controller="getAvatarController">
    <div class="main_container">
        <jsp:include page="/WEB-INF/views/tiles/template/defaultHeaderAdmin.jsp"/>
        <tiles:insertAttribute name="body"/>
        <jsp:include page="/WEB-INF/views/tiles/template/defaultFooterAdmin.jsp"/>
    </div>
    <script>
        ngApp.controller('getAvatarController', function ($scope) {
            $scope.adminAvatarUrl = (server_url + "/user/get-avatar/${userId}");
        });
    </script>
</div>

<!-- Custom Theme Scripts -->
<script src="/static/js/custom.js"></script>

<div class="modalloading" style="display: none">
    <div style="margin: auto auto">
        <img src="/static/images/loading/loading.gif" style="width: 80px;"/><br/>
        Đang xử lý
    </div>
</div>
</body>
</html>
