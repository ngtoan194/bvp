<%--
  Created by IntelliJ IDEA.
  User: Nguyen Toan
  Date: 3/23/2018
  Time: 08:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<style>
    label#newPassword-error {
        color: red;
        text-transform: initial;
        font-size: 13px;
    }

    label#confirmNewPassword-error {
        color: red;
        text-transform: initial;
        font-size: 13px;
    }
</style>
<div class="wrapper login-form">
    <jsp:include page="/WEB-INF/views/tiles/template/defaultHeaderLogin.jsp"/>
    <div class="main-page" ng-controller="recoveryPassword">
        <div class="detail-page">
            <div class="head-login">
                <h2 class="title-login">
                    <img src="/images/icon-login.png" alt=""> THAM GIA <strong>NGAY BÂY GIỜ !</strong>
                </h2>
            </div>
            <div class="login-main">
                <form style="text-transform: none;text-align: left;" id="form-change-password" novalidate="novalidate" ng-validate="validationPassword">
                    <h4 class="title-form-login" style="text-align: center">Đặt lại mật khẩu</h4>
                    <div class="avatar-register">
                        <div class="immages-avartar">
                            <div class="prev-image">
                                <img ng-if="dataUser.originImage" alt=""
                                     ng-src="{{dataUser.originImage.absoluteUrl('/static/images/Profile1.png')}}">
                                <img ng-if="!dataUser.originImage" alt=""
                                     src="/static/images/Profile1.png">
                            </div>
                        </div>
                        <span class="caption-image">{{dataUser.name}}</span>
                        <a class="link-email-xn" href="mailto:{{dataUser.email}}">{{dataUser.email}}</a>
                    </div>
                    <div class="input-item">
                        <div class="input-text">
                            <input class="form-control" type="password" id="newPassword" name="newPassword"
                                   placeholder="Mật khẩu mới"
                                   ng-model="password" autofocus>
                        </div>
                    </div>
                    <div class="input-item">
                        <div class="input-text">
                            <input class="form-control" type="password" id="confirmNewPassword"
                                   name="confirmNewPassword"
                                   placeholder="Xác nhận mật khẩu mới">
                        </div>
                    </div>
                    <div class="action">
                        <a class="btn-login btn-primary btn" ng-click="updatePassword()" id="btnConfirm">Xác nhận</a>
                    </div>
                    <%--<span class="text-nomal">Đăng nhập với tên khác </span><a href="#" class="fogot-pwd-link d-inline">nhấn vào đây</a>--%>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('recoveryPassword', function ($scope, httpRequest) {
        $("#confirmNewPassword").keyup(function(event) {
            if (event.keyCode === 13) {
                $("#btnConfirm").click();
            }
        });
        $scope.dataUser = ${user};
        $scope.password = "";
        $scope.token = '${token}';
        $scope.validationPassword = {
            rules: {
                newPassword: {
                    required: true,
                    minlength: 6
                },
                confirmNewPassword: {
                    required: true,
                    equalTo: "#newPassword"
                }
            },
            messages: {
                newPassword: {
                    required: "Vui lòng nhập mật khẩu mới!",
                    minlength: "Vui lòng nhập mật khẩu tối thiểu 6 ký tự!"
                },
                confirmNewPassword: {
                    required: "Vui lòng nhập xác nhận mật khẩu mới!",
                    equalTo: "Xác nhận mật khẩu không trùng khớp!"
                }
            }
        }

        $scope.updatePassword = function () {
            if ($("#form-change-password").valid()) {
                httpRequest.post("/user/update-password"
                    , {password: $scope.password, token: $scope.token}
                    , function (data) {
                        if (data.success) {
                            alertSmallBox(data.data, success);
                            setTimeout(function () {
                                window.location.href = "/dang-nhap";
                            }, 2000);
                        } else {
                            alertSmallBox(data.data, error);
                        }
                    }, function (data) {
                    }, true);
            }
        }
    });
</script>
