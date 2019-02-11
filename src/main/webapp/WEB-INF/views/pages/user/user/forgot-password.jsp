<%--
  Created by IntelliJ IDEA.
  User: Nguyen Toan
  Date: 2/26/2018
  Time: 4:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<style>
    label.error {
        text-transform: none;
        color: red;
    }
</style>
<div class="wrapper login-form">
    <jsp:include page="/WEB-INF/views/tiles/template/defaultHeaderLogin.jsp"/>
    <div class="main-page" ng-controller="forgotPasswordController">
        <div class="detail-page">
            <div class="head-login">
                <h2 class="title-login">
                    Quên Mật Khẩu
                </h2>
            </div>
            <div class="login-main">
                <form id="form-forgot-PW" ng-validate="validationForgotPW">
                    <h4 class="title-form-login">Quên Mật Khẩu</h4>
                    <div class="input-item">
                        <div class="input-text">
                            <input type="email" name="email" id="forgotPass" ng-model="email" placeholder="Nhập địa chỉ Email" class="form-control" autofocus>
                        </div>
                    </div>
                    <div class="action">
                        <a ng-click="forgotPassword()" id="btnSend" class="btn-login btn-primary btn">Gửi Mật Khẩu</a>
                        <a href="/dang-nhap" class="fogot-pwd-link">Tôi nhớ mật khẩu của mình</a>
                    </div>
                    <jsp:include page="/WEB-INF/views/pages/user/user/login-social.jsp"/>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('forgotPasswordController', function ($scope, httpRequest) {
        $("#forgotPass").keyup(function(event) {
            if (event.keyCode === 13) {
                $("#btnSend").click();
            }
        });
        $scope.email = "";
        $.validator.addMethod("isEmail", function (value, element) {
            debugger
            return value.isEmail();
        }, "Vui lòng nhập đúng định dạng email!");
        $scope.validationForgotPW = {
            rules: {
                email: {
                    required: true,
                    isEmail: true,
                    email: true
                }
            },
            messages: {
                email: {
                    required: "Vui lòng nhập địa chỉ email tài khoản của bạn!",
                    email: "Vui lòng nhập đúng định dạng email!"
                }
            }
        }
        $scope.forgotPassword = function () {
            if ($("#form-forgot-PW ").valid()) {
                httpRequest.post("/user/forgot-password"
                    , {email: $scope.email, webType: 1}
                    , function (data) {
                        if (data.success) {
                            alertSmallBox(data.data, success);
                            setTimeout(function () {
                                location.href = "/dang-nhap"
                            },2000)
                        } else {
                            alertSmallBox(data.message, error);
                        }
                    }, function (data) {
                    }, true);
            }
        }
    })
</script>
<style>
    label.error {
        width: 100%;
        text-align: left;
    }
</style>
