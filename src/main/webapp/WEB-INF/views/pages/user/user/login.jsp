<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/12/18
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<style>
    label#username-error {
        color: red;
        text-transform: initial;
        font-size: 13px;
    }

    label#password-error {
        color: red;
        text-transform: initial;
        font-size: 13px;
    }
</style>
<div class="wrapper login-form" ng-controller="loginController">
    <jsp:include page="/WEB-INF/views/tiles/template/defaultHeaderLogin.jsp"/>
    <div class="main-page">
        <div class="detail-page">
            <div class="head-login">
                <h2 class="title-login">
                    <img src="/static/images/icon-login.png" alt=""> THAM GIA <strong>NGAY BÂY GIỜ !</strong>
                </h2>
            </div>
            <div class="login-main">
                <form id="login-form" novalidate="novalidate" ng-validate="validationLogin">
                    <h4 class="title-form-login">Đăng nhập</h4>
                    <div class="input-item">
                        <div class="input-text">
                            <input type="text" placeholder="Tên tài khoản/Email" id="username" name="username"
                                   class="form-control" ng-model="dataUser.username" ng-enter="login()"
                                   autofocus>
                        </div>
                    </div>
                    <div class="input-item">
                        <div class="input-text">
                            <input type="password" placeholder="Mật khẩu" id="password" name="password"
                                   class="form-control" ng-model="dataUser.password" ng-enter="login()">
                        </div>
                    </div>
                    <div class="action">
                        <a class="btn-login btn-primary btn" id="btnLogin" ng-click="login()">Đăng nhập</a>
                        <a href="/quen-mat-khau" class="fogot-pwd-link">Quên mật khẩu</a>
                    </div>
                    <jsp:include page="/WEB-INF/views/pages/user/user/login-social.jsp"/>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('loginController', function ($scope, $http, httpRequest) {
        $("#password").keyup(function(event) {
            if (event.keyCode === 13) {
                $("#btnLogin").click();
            }
        });
        $scope.dataUser = {};
        $scope.validationLogin = {
            rules: {
                username: {
                    required: true,
                },
                password: {
                    required: true,
                    minlength: 6
                }
            },
            messages: {
                username: {
                    required: "Vui lòng nhập tên tài khoản hoặc email!"
                },
                password: {
                    required: "Vui lòng nhập mật khẩu!",
                    minlength: "Mật khẩu tối thiểu phải có 6 ký tự!"
                }
            }
        }
        $scope.login = function () {
            if ($("#login-form").valid()) {
                httpRequest.post("/user/login"
                    , $scope.dataUser
                    , function (data) {
                        if (data.success) {
                            var user = data.data;
                            var returnUrl = common.getQueryStringHref("returnUrl");
                            if (returnUrl) {
                                location.href = returnUrl;
                            } else {
                                location.href = "/";
                            }
                        } else {
                            $scope.dataUser.password = "";
                            alertSmallBox(data.message, error);
                        }
                    }, function (data) {
                    }, true);
            }
        }
    });
</script>
<style>
    label.error {
        width: 100%;
        text-align: left;
    }
</style>
