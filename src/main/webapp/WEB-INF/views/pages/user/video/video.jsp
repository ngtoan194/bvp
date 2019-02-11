<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/21/2018
  Time: 10:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-page" ng-controller="videoController">
    <div class="album-page">

        <div class="album-list">

            <div class="container">
                <div class="title-page ">
                    <h2 class="color-black">Danh sách video</h2>
                </div>
                <div class="album-inner">
                    <div class="head-album">
                        <div class="row">
                            <div class="col-md-8 col-sm-8 col-xs-12">
                                <h2 class="title-sub-page">Các hình ảnh của Bệnh viện phổi trung ương</h2>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <div class="sort">
                                    <div class="input-text">
                                        <input type="text" class="form-control" ng-model="name"
                                               ng-enter="loadPage(1, true)"
                                               placeholder="Nhập tên video để tìm kiếm...">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-6 col-xs-12" style="min-height: 360px;" ng-repeat="item in data">
                            <div class="album-item">
                                <div class="album-image">
                                    <a href="/video/{{item.video.linkAlias}}">
                                        <img ng-src="{{item.video.thumbnail.absoluteUrl()}}" alt="">
                                    </a>
                                    <div class="over-lay"></div>
                                </div>
                                <div class="album-content">
                                    <%--<span class="number-images">Số lượng:  15 ảnh</span>--%>
                                    <p class="album-notice">Video</p>
                                    <a href="/video/{{item.video.linkAlias}}" class="view-album">
                                        <img src="/static/images/quickview.png" alt="">
                                    </a>
                                    <h4 class="title-album" style="font-size: 15px;">
                                        <a href="/video/{{item.video.linkAlias}}">{{item.video.name}}</a>
                                    </h4>
                                    <span class="date-time-album">{{item.video.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")}}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="pagination-page text-center">
                        <ul class="pagination">
                            <li ng-click="loadPage(1, true)" class="{{page==1?'disabled':''}}">
                                <a class="page-link">
                                    <i class="fa fa-angle-left" style="margin-top: 8px;"></i>
                                </a>
                            </li>
                            <li ng-repeat="itemPage in listPage" class="{{page==itemPage?'active':''}}"
                                ng-click="loadPage(itemPage, true)" style="cursor: pointer;">
                                <a class="page-link" style="{{page==itemPage?'color: white; background: #0d8150;':''}}">{{itemPage}}</a>
                            </li>
                            <li ng-click="loadPage(totalPage, true)" class="{{page==totalPage?'disabled':''}}">
                                <a class="page-link">
                                    <i class="fa fa-angle-right" style="margin-top: 8px;"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('videoController', function ($scope, httpRequest) {
        $scope.data = [];
        $scope.page = 1;
        $scope.size = 6;
        $scope.name = "";
        $scope.isHotVideo = 1;
        $scope.webType = 1;
        $scope.loadPage = function (urlPage, first) {
            $scope.page = urlPage;
            httpRequest.get("/video/search"
                + "?page=" + $scope.page
                + "&size=" + $scope.size
                + "&name=" + $scope.name
                + "&isHotVideo=" + $scope.isHotVideo
                + "&webType=" + $scope.webType
                , function (data) {
                    if (data.success) {
                        $scope.data = data.data.data;
                        $scope.totalPage = common.getTotalPage($scope.size, data.data.total);
                        $scope.stt = 1 + ($scope.page - 1) * $scope.size;
                        $scope.listPage = [];
                        for (var i = $scope.page - 5; i < $scope.page + 5; i++) {
                            if (i > 0 && i <= $scope.totalPage)
                                $scope.listPage.push(i);
                        }
                    }
                }, function (data) {
                }, first);
        }
        $scope.loadPage(1, false);
    });
</script>