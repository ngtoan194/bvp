<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/12/18
  Time: 3:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="/static/images/logo_tab.png" type="image/x-icon"/>
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

    <link type="text/css" href="/static/css/bootstrap-select.min.css" rel="stylesheet">
    <link type="text/css" href="/static/css/font-awesome.min.css" rel="stylesheet">
    <link type="text/css" href="/static/css/awemenu.css" rel="stylesheet">
    <link type="text/css" href="/static/css/awemenu-animation.css" rel="stylesheet">
    <link type="text/css" href="/static/css/owl.carousel.css" rel="stylesheet">
    <link type="text/css" href="/static/css/animate.css" rel="stylesheet">
    <!-- PNotify -->
    <link href="/static/css/pnotify/pnotify.css" rel="stylesheet">
    <link href="/static/css/pnotify/pnotify.buttons.css" rel="stylesheet">
    <link href="/static/css/pnotify/pnotify.nonblock.css" rel="stylesheet">

    <link href="/static/css/style.css" rel="stylesheet">
    <link href="/static/css/loading.css" rel="stylesheet">

    <!-- jQuery -->
    <script src="/static/js/jquery/jquery.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/owl.carousel.js"></script>
    <script src="/static/js/awemenu.min.js"></script>
    <script src="/static/js/jquery.MultiFile.js"></script>
    <!-- PNotify -->
    <script src="/static/js/pnotify/pnotify.js"></script>
    <script src="/static/js/pnotify/pnotify.buttons.js"></script>
    <script src="/static/js/pnotify/pnotify.nonblock.js"></script>

    <script src="/static/js/custom-bvp.js"></script>

    <script src="/static/js/jquery.validate.min.js" type="text/javascript"></script>

    <script src="/static/js/angular/angular.min.js" type="text/javascript"></script>
    <script src="/static/js/angular/angular-sanitize.js" type="text/javascript"></script>
    <script src="/static/js/angular/angular-validate.min.js" type="text/javascript"></script>
    <script data-require="angular-translate@*" data-semver="2.5.0"
            src="/static/js/angular/angular-translate.js"></script>

    <script src="/static/js/select2/select2.min.js" type="text/javascript"></script>
    <script src="/static/js/select2/ui.select2.js" type="text/javascript"></script>

    <script src="/static/scripts/mlmodule/ml.validate.v1.0.js" type="text/javascript"></script>
    <script src="/static/scripts/mllibrary.js" type="text/javascript"></script>
    <script src="/static/scripts/app.js" type="text/javascript"></script>
</head>
<body ng-app="bvpApp" ng-cloak>

<tiles:insertAttribute name="body"/>

<div class="modalloading">
    <div style="margin: auto auto">
        <img src="/static/images/loading/loading.gif" style="width: 80px;"/> <br/>
        Đang xử lý
    </div>
</div>

<style>
    .alert-success{
        color:#fff;
        background-color:rgba(38,185,154,.88);
        border-color:rgba(38,185,154,.88)
    }
    .alert-info{
        color:#E9EDEF;
        background-color:rgba(52,152,219,.88);
        border-color:rgba(52,152,219,.88)
    }
    .alert-warning{
        color:#E9EDEF;
        background-color:rgba(243,156,18,.88);
        border-color:rgba(243,156,18,.88)
    }
    .alert-danger,.alert-error{
        color:#E9EDEF;
        background-color:rgba(231,76,60,.88);
        border-color:rgba(231,76,60,.88)
    }
</style>

<!-- Jcrop -->
<script src="/static/js/image-crop/jquery.color.js"></script>
<script src="/static/js/image-crop/jquery.Jcrop.js"></script>
<link href="/static/js/image-crop/jquery.Jcrop.min.css" rel="stylesheet" type="text/css" media="screen"/>
</body>
</html>
