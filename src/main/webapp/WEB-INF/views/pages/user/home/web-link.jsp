<%--
  Created by IntelliJ IDEA.
  User: Huyen
  Date: 10/19/2018
  Time: 5:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-4" ng-controller="listWebLinkController">
    <div class="info-item">
        <h2 class="title-special">
            {{'WEBlink' | translate}}
        </h2>
        <div class="input-text">
            <select style="width:100%;" ui-select2 class="form-control selectpicker"
                    ng-change="linkWeb()" ng-init="value=''" ng-model="value">
                <option value=''>Tất cả</option>
                <option ng-repeat="item in webLink" ng-value="item.webLink.link">
                    {{item.webLink.name}}
                </option>
            </select>
        </div>
        <div class="image-link" style=" margin-top: 10px;">
            <a ng-repeat="item in webLink" href="{{item.webLink.link}}" target="_blank">
                <img style="width: 60px; height:60px; object-fit: cover;" ng-src="{{item.webLink.image.absoluteUrl()}}"
                     alt="">
            </a>
        </div>
    </div>
</div>
<script>
    ngApp.controller('listWebLinkController', function ($scope, httpRequest) {
        $scope.webLink = [];
        $scope.name = "";
        $scope.page = 1;
        $scope.size = 12;
        $scope.link = "";
        $scope.image = "";
        $scope.startDate = "";
        $scope.endDate = "";
        var url = "/webLink/searchWebLink?"
            + "page=" + $scope.page
            + "&size=" + $scope.size
            + "&name=" + $scope.name
            + "&link=" + $scope.link
            + "&image=" + $scope.image
            + "&startDate=" + $scope.startDate
            + "&endDate=" + $scope.endDate
        httpRequest.get(url
            , function (data) {
                if (data.success) {
                    $scope.webLink = data.data.data;
                }
            }, function (data) {
            });
        $scope.linkWeb = function () {
            window.open(
                $scope.value, '_blank'
            );
        }
    });
</script>