<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 12/6/18
  Time: 9:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="footer-count" ng-controller="onlineCounterController">
    <div class="counter-item">Số người truy cập: <span class="count-number">{{dataOnline.monthlyCount}}</span></div>
    <div class="counter-item">Số người online: <span class="count-number">{{dataOnline.onlineCount}}</span></div>
    <div class="counter-item">Tổng lượt truy cập: <span class="count-number">{{dataOnline.totalCount}}</span></div>

    <script>
        ngApp.controller('onlineCounterController', function ($scope, $http) {
            $scope.dataOnline = {};
            $http({
                method: 'GET',
                url: "/user-access/get-count"
            }).then(function successCallback(response) {
                if (response.data.success) {
                    $scope.dataOnline = response.data.data.userAccessCount;
                }
            }, function errorCallback(response) {
            });
        });
    </script>
</div>