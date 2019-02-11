<%--
  Created by IntelliJ IDEA.
  User: ngtoan194
  Date: 10/09/18
  Time: 8:12 AM
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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/static/images/logo_tab.png" type="image/x-icon"/>
    <meta property="fb:pages" content="<tiles:insertAttribute name="fb:pages" ignore="true"/>"/>
    <meta property="fb:app_id" content="<tiles:insertAttribute name="fb:app_id" ignore="true"/>"/>
    <meta property="og:url" content="<tiles:insertAttribute name="og:url" ignore="true"/>"/>
    <meta property="og:type" content="<tiles:insertAttribute name="og:type" ignore="true"/>"/>
    <meta property="og:title" content="<tiles:insertAttribute name="og:title" ignore="true"/>"/>
    <meta property="og:description" content="<tiles:insertAttribute name="og:description" ignore="true"/>"/>
    <meta property="og:image" content="<tiles:insertAttribute name="og:image" ignore="true"/>"/>
    <meta property="og:image:type" content="<tiles:insertAttribute name="og:image:type" ignore="true"/>"/>
    <meta property="og:image:width" content="<tiles:insertAttribute name="og:image:width" ignore="true"/>"/>
    <meta property="og:image:height" content="<tiles:insertAttribute name="og:image:height" ignore="true"/>"/>
    <title><tiles:insertAttribute name="title" ignore="true"/></title>
    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans:400,700,600|Open+Sans:400, 600, 800&amp;subset=cyrillic,cyrillic-ext,devanagari,greek,greek-ext,latin-ext,vietnamese"
          rel="stylesheet">
    <link href="/static/fonts/helveticaNeue/stylesheet.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Arimo:400,400i,700|Oswald:400,500,600,700&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,hebrew,latin-ext,vietnamese"
          rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <!-- select2 -->
    <link href="/static/css/select2.min.css" rel="stylesheet">

    <link type="text/css" href="/static/css/bootstrap-select.min.css" rel="stylesheet">
    <link type="text/css" href="/static/css/font-awesome.min.css" rel="stylesheet">
    <link type="text/css" href="/static/css/awemenu.css" rel="stylesheet">
    <link type="text/css" href="/static/css/awemenu-animation.css" rel="stylesheet">
    <link type="text/css" href="/static/css/owl.carousel.css" rel="stylesheet">
    <link type="text/css" href="/static/css/magnific-popup.css" rel="stylesheet">
    <link type="text/css" href="/static/css/animate.css" rel="stylesheet">
    <link type="text/css" href="/static/css/baguetteBox.min.css" rel="stylesheet">
    <!-- bootstrap-datetimepicker -->
    <link href="/static/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <!-- jquery-confirm -->
    <link href="/static/css/jquery-confirm.min.css" rel="stylesheet">
    <!-- PNotify -->
    <link href="/static/css/pnotify/pnotify.css" rel="stylesheet">
    <link href="/static/css/pnotify/pnotify.buttons.css" rel="stylesheet">
    <link href="/static/css/pnotify/pnotify.nonblock.css" rel="stylesheet">

    <link href="/static/css/style.css" rel="stylesheet">
    <link href="/static/css/loading.css" rel="stylesheet">

    <script src="/static/js/jquery/jquery.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/owl.carousel.js"></script>
    <script src="/static/js/awemenu.min.js"></script>
    <script src="/static/js/jquery.MultiFile.js"></script>
    <!-- PNotify -->
    <script src="/static/js/pnotify/pnotify.js"></script>
    <script src="/static/js/pnotify/pnotify.buttons.js"></script>
    <script src="/static/js/pnotify/pnotify.nonblock.js"></script>
    <!-- bootstrap-datetimepicker -->
    <script src="/static/js/moment.min.js"></script>
    <script src="/static/js/bootstrap-datetimepicker.min.js"></script>

    <script src="/static/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/static/scripts/mlmodule/ml.checkdate.v1.4.js" type="text/javascript"></script>
    <!-- Angular JS -->
    <script src="/static/js/angular/angular.min.js" type="text/javascript"></script>
    <script src="/static/js/angular/angular-sanitize.js" type="text/javascript"></script>
    <script src="/static/js/angular/angular-validate.min.js" type="text/javascript"></script>
    <!-- angular-translate -->
    <script data-require="angular-translate@*" data-semver="2.5.0"
            src="/static/js/angular/angular-translate.js"></script>

    <script src="/static/js/baguetteBox.min.js" type="text/javascript"></script>
    <!-- jquery-confirm -->
    <script src="/static/js/jquery-confirm.min.js"></script>
    <!-- select2 -->
    <script src="/static/js/select2/select2.min.js" type="text/javascript"></script>
    <script src="/static/js/select2/ui.select2.js"></script>
    <!-- jquery.validate -->
    <script src="/static/js/jquery.validate.min.js"></script>
    <!-- Custom -->
    <script src="/static/scripts/app.js"></script>
    <script src="/static/scripts/app-controller.js"></script>
    <script src="/static/scripts/mllibrary.js"></script>
    <script src="/static/scripts/mlmodule/ml.checkdate.v1.4.js"></script>
    <script src="/static/scripts/mlmodule/ml.validate.v1.0.js"></script>

</head>
<body ng-app="bvpApp" ng-cloak ng-controller="bvpController">
<div class="wrapper">
    <jsp:include page="/WEB-INF/views/tiles/template/defaultHeader.jsp"/>
    <tiles:insertAttribute name="body"/>
    <jsp:include page="/WEB-INF/views/tiles/template/defaultFooter.jsp"/>
</div>

<script src="/static/js/custom-bvp.js"></script>
<script>
    ngApp.controller('bvpController', function ($scope, $http, $translate) {
        $scope.getPosition = function (user, department) {
            return getPositionDoctor(user, department);
        };
        $scope.departmentAlias = '${departmentAlias}'
        $scope.titleSubPage = '${titleSubPage}'
        $scope.urlHomeServiceId = '${urlHomeServiceId}';
        $scope.changeLanguage = function (lang) {
            $translate.use(lang);
        };
    });
</script>

<div class="modalloading">
    <div style="margin: auto auto">
        <img src="/static/images/loading/loading.gif" style="width: 80px;"/> <br/>
        Đang xử lý
    </div>
</div>
<script>
    var onlineCounterKey = storageMgr.read("ONLINE_COUNTER_KEY");
    if (!onlineCounterKey) {
        onlineCounterKey = guid();
        storageMgr.write("ONLINE_COUNTER_KEY", onlineCounterKey);
    }
    var lastSend = storageMgr.read("LAST_SEND_COUNTER");
    if (!lastSend || new Date().getTime() - lastSend > 300000) {
        $.ajax({
            type: "POST",
            url: "/user-access/create/" + onlineCounterKey,
            success: function (data) {
                if (data && data.success) {
                    storageMgr.write("LAST_SEND_COUNTER", new Date().getTime());
                }
            }
        });
    }
</script>
<!-- Jcrop -->
<script src="/static/js/image-crop/jquery.color.js"></script>
<script src="/static/js/image-crop/jquery.Jcrop.js"></script>
<link href="/static/js/image-crop/jquery.Jcrop.min.css" rel="stylesheet" type="text/css" media="screen"/>
</body>
</html>
