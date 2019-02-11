<%--
  Created by IntelliJ IDEA.
  User: Huyen
  Date: 10/19/2018
  Time: 8:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-3 col-sm-12" ng-controller="menuByGroupController">
    <div class="menu-left">
        <div class="inner-content-left">
            <h4 class="title-left">Tin tức sự kiện</h4>
            <ul class="menu-left-main">
                <li ng-repeat="item2 in menuByGroup | orderBy:'+index'">
                    <a href="{{checkHref(item2)}}">{{item2.name}}</a>
                </li>
            </ul>
        </div>
        <div class="inner-content-left">
            <div class="post-newest">
                <h4 class="title-left">Tin mới nhất</h4>
                <div class="newest-item" ng-repeat="item in listNews">
                    <a href="{{item.news.id}}" class="newest-item-image">
                        <img style="width: 100%; height: 100%; object-fit: cover;"
                             ng-src="{{item.news.imagePreview.absoluteUrl()}}" alt="">
                    </a>
                    <p class="newest-title"><a href="{{item.news.linkAlias}}">{{item.news.title}}</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('menuByGroupController', function ($scope, httpRequest, $sce) {
        $scope.listNews = [];
        httpRequest.get("/mgrNews/newsSearch"
            + "?page=1"
            + "&size=3"
            + "&webType=1"
            , function (data) {
                if (data.success) {
                    $scope.listNews = data.data.data;
                }
            }, function (data) {
            });
        $scope.menuByGroup = [];
        $scope.loadMenuByGroup = function () {
            httpRequest.get("/menu/getByGroup/1"
                , function (data) {
                    if (data.success) {
                        $scope.menuByGroup = data.data.menus;
                    }
                }, function (data) {
                });
        }
        $scope.loadMenuByGroup();
        $scope.checkHref = function (item) {
            var url = item.href;
            if (url == null) {
                url = "#";
            }
            if (url.indexOf("?") == -1) {
                url = url + "?menuId=" + item.id + "&menuName=" + item.name;
            } else {
                url = url + "&menuId=" + item.id + "&menuName=" + item.name;
            }
            return url;
        }
    });
</script>
