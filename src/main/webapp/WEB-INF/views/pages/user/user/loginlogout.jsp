<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/12/18
  Time: 3:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="link-join" style="margin-top: 15px;">
    <a ng-if="${!isLogin}" href="/dang-nhap" class="login btn join-btn">Đăng Nhập</a>
    <a ng-if="${!isLogin}" href="/dang-ky" class="register btn join-btn">Đăng Ký</a>
    <div ng-if="${isLogin}" class="headder-account" ng-controller="loginLogoutController">
        <div class="dropdown dropdown-acc">
            <div class="account-headding dropdown-toggle" data-toggle="dropdown">
                <span class="notice-number">200</span>
                <span class="image-account-head">
                <img ng-src="{{avatarUrl.absoluteUrl()}}" alt="">
            </span>
                <span class="account-name"> ${userFullName}
                <span class="fa fa-caret-down"> </span>
            </span>
            </div>
            <ul class="dropdown-menu">
                <li>
                    <a href="#" class="noticee">
                        <i class="fa fa-bell"></i>Thông Báo
                        <span class="number-notice-item">300</span>
                    </a>
                </li>
                <%--<li>--%>
                    <%--<a ng-click="message()">--%>
                        <%--<i class="fa fa-comments"></i>Tin nhắn--%>
                        <%--<span class="number-notice-item">300</span>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <li><a href="/tai-khoan/${userId}"><i class="fa fa-user"></i>Tài khoản</a></li>
                <li><a href="/logout"><i class="fa fa-sign-out"></i>Đăng xuất</a></li>
            </ul>
        </div>
    </div>
    <script>
        ngApp.controller('loginLogoutController', function ($scope, $http) {
            $scope.avatarUrl = (server_url + "/user/get-avatar/${userId}");
            $scope.loadData = function () {
                $http({
                    method: 'GET',
                    url: '/service/notification/getCountUnRead'
                }).then(function successCallback(response) {
                    if (response.data.success) {
                        $scope.dataNotification = response.data.dataNotification;
                    }
                }, function errorCallback(response) {
                });
            };
            $scope.message = function () {
                alertSmallBox("Vui lòng nâng cấp tài khoản để sử dụng tính năng này!", info)
            };
        });
    </script>
</div>