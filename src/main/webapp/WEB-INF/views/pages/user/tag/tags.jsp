<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 11/20/18
  Time: 8:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .pagination > .active > a, .pagination > .active > a:focus, .pagination > .active > a:hover, .pagination > .active > span, .pagination > .active > span:focus, .pagination > .active > span:hover {
        background-color: #05733e;
        border-color: #05733e;
    }
</style>
<div class="main-page" ng-controller="tagsController">
    <div class="detail-page">
        <div class="container">
            <div class="row">
                <jsp:include page="/WEB-INF/views/pages/user/posts/menu-left-post.jsp"/>
                <div class="col-md-9 col-sm-12">
                    <div class="content-detail ds-bs">
                        <div class="head-key-word">
                            <h4 class="title-sub-page">Từ khóa</h4>
                            <div class="search-key-word">
                                <div class="search-news">
                                    <input type="text" class="form-control" ng-model="dataSearch.name" ng-enter="loadPage(1)"
                                           placeholder="Tìm kiếm bài viết">
                                    <button ng-click="loadPage(1)"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                            <div style="clear: both">
                                <div id="get-post-loading" style="width: 100%;" ng-show="loading==true">
                                    <div style="margin: 0 auto; text-align:center;">
                                        <img src="/static/images/loading/loading2.gif" style="width: 80px;">
                                        <p style="font-weight:bold;">Đang tải</p>
                                    </div>
                                </div>
                            </div>
                            <div class="key-word-list" ng-show="loading==false">
                                <div class="key-word-item" ng-repeat="item in data">
                                    <div class="row" style="padding:5px;">
                                        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                                            <i class="fa fa-angle-double-right"></i>
                                            <a style="margin-left:10px;" href="/tu-van-online/tu-khoa/{{item.id}}"><strong>{{item.name}}</strong></a>
                                        </div>
                                        <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 pull-right">
                                            <a class="btn btn-xs btn-tag pull-right" ng-if="item.isFollowed == 0"
                                               ng-click="followTag(item)">theo dõi</a>
                                            <a class="btn btn-xs btn-tag pull-right"
                                               style="color: black; background-color: #f5dbdb; border: 1px solid;"
                                               ng-if="item.isFollowed == 1" ng-click="followTag(item)">bỏ theo dõi</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pagination-page text-right" id="datatable_paginate"
                 ng-if="data.length>0">
                <ul class="pagination">
                    <li ng-click="loadPage(1)" style="cursor: pointer;"
                        class="paginate_button previous {{dataSearch.page==1?'disabled':''}}">
                        <a>Trang đầu</a>
                    </li>
                    <li ng-repeat="itemPage in listPage | limitTo : 10" style="cursor: pointer;"
                        class="paginate_button {{dataSearch.page==itemPage?'active':''}}"
                        ng-click="loadPage(itemPage)">
                        <a style="height: 39px;">{{itemPage}}</a>
                    </li>
                    <li ng-click="loadPage(totalPage)" style="cursor: pointer;"
                        class="paginate_button next {{dataSearch.page==totalPage?'disabled':''}}">
                        <a>Trang cuối</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('tagsController', function ($scope, $http) {
        $scope.loading = false;
        $scope.finish = false;
        $scope.data = [];
        $scope.dataSearch = {
            page: 0,
            size: 10,
            name: '',
        }
        $scope.loadPage = function (page) {
            $scope.loading = true;
            $scope.dataSearch.page = page;
            $http({
                method: 'GET',
                url: "/tag/search?page=" + $scope.dataSearch.page + "&size=" + $scope.dataSearch.size + "&name=" + $scope.dataSearch.name
            }).then(function successCallback(response) {
                if (response.data.success) {
                    $scope.data = response.data.data.data;
                    $scope.totalPage = common.getTotalPage($scope.dataSearch.size, response.data.data.total);
                    $scope.listPage = [];
                    $scope.stt = 1 + ($scope.dataSearch.page - 1) * $scope.dataSearch.size;
                    for (var i = $scope.dataSearch.page - 5; i < $scope.dataSearch.page + 5; i++) {
                        if (i > 0 && i <= $scope.totalPage)
                            $scope.listPage.push(i);
                    }
                    $scope.loading = false;
                }
            }, function errorCallback(response) {
                $scope.loading = false;
            });
        }
        $scope.loadPage(1);
        $scope.followTag = function (item) {
            if (!${isLogin}) {
                location.href = "/dang-nhap";
                return;
            }
            item.isFollowed = !item.isFollowed;
            $http({
                method: 'Post',
                url: "/service/tag/follow/" + item.tag.uid
            }).then(function successCallback(response) {
            }, function errorCallback(response) {
            });
        }
    })
    $(document).ready(function () {
        $("#sidebar-left li").removeClass("active");
        $("#sidebar-left li#tu-khoa").addClass("active");
    });
</script>