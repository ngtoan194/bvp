<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/31/18
  Time: 8:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-4 tt-wrap" ng-controller="charityHomeController">
    <h2 class="title-special">
        <a href="/tin-tuc?menuId=151&menuName=góc%20từ%20thiện&trang=1&q=">Góc từ thiện</a>
    </h2>
    <div class="tt-item">
        <div class="tt-image">
            <a href="/tin-tuc/{{charityHome[0].news.linkAlias}}">
                <img ng-src="{{charityHome[0].news.imagePreview.absoluteUrl()}}" alt="">
            </a>
        </div>
        <div class="tt-title">
            <a href="/tin-tuc/{{charityHome[0].news.linkAlias}}">{{charityHome[0].news.title}}</a>
        </div>
        <div class="tt-surmary">
            {{charityHome[0].news.contentPreview}}
        </div>
        <div class="tt-action">
            <a href="/tin-tuc/{{charityHome[0].news.linkAlias}}" class="btn btn-detail">Chi tiết</a>
        </div>
    </div>
</div>
<script>
    ngApp.controller('charityHomeController', function ($scope, $http, httpRequest) {
        $scope.charityHome = [];
        $scope.page = 1;
        $scope.size = 1;
        $scope.title = "";
        $scope.content = "";
        $scope.isHotNews = "";
        $scope.webType = 1;
        $scope.fromHoiLao = "";
        $scope.charity = 1;
        httpRequest.get("/mgrNews/newsSearch?"
            + "page=" + $scope.page
            + "&size=" + $scope.size
            + "&content=" + $scope.content
            + "&isHotNews=" + $scope.isHotNews
            + "&webType=" + $scope.webType
            + "&fromHoiLao=" + $scope.fromHoiLao
            + "&charity=" + $scope.charity
            , function (data) {
                if (data.success) {
                    $scope.charityHome = data.data.data;
                }
            }, function (data) {
            });
    });
</script>