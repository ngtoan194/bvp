<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 11/15/18
  Time: 10:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-page" ng-controller="pageNewsController">
    <div class="detail-page">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-12">
                    <div class="menu-left">
                        <div class="inner-content-left">
                            <div class="post-newest">
                                <h4 class="title-left">Hoạt động nổi bật</h4>
                                <div class="newest-item" ng-repeat="hotNews in listHotNews">
                                    <a href="/khoa-phong/hoat-dong/chi-tiet/{{hotNews.news.linkAlias}}?pageId={{pageId}}"
                                       class="newest-item-image">
                                        <img style="width: 100%; height: 100%; object-fit: cover;"
                                             ng-src="{{hotNews.news.imagePreview.absoluteUrl('/images/img_default_news.png')}}"
                                             alt="">
                                    </a>
                                    <p class="newest-title">
                                        <a href="/khoa-phong/hoat-dong/chi-tiet/{{hotNews.news.linkAlias}}?pageId={{pageId}}">{{hotNews.news.title}}</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="inner-content-left">
                            <h4 class="title-left">Hoạt động theo tháng</h4>
                            <ul class="menu-left-main">
                                <li ng-repeat="item in list_month"
                                    class='{{(item==filterMonth)?"active-menu-left":""}}'>
                                    <a href="javascript:void(0)" ng-click="viewMonth(item)">Tháng
                                        {{item.month}}/{{item.year}}</a>
                                </li>
                            </ul>
                            <div class="all-new">
                                <a href="#" ng-click="viewMonth(null)" class="more">Hiển thị tất cả</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 col-sm-12">
                    <div class="list-news">
                        <div class="head-sub-page">
                            <div class="col-md-8">
                                <h4 class="title-sub-page">Hoạt động mới nhất</h4>
                            </div>
                            <div class="col-md-4">
                                <div class="search-news">
                                    <input type="text" class="form-control" placeholder="Tìm kiếm bài viết"
                                           ng-enter="loadFirstPage()" ng-model="content">
                                    <button><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="list-new-item" ng-repeat="item in data">
                            <a href="/khoa-phong/hoat-dong/chi-tiet/{{item.news.linkAlias}}?pageId={{pageId}}"
                               class="image-news">
                                <img ng-src="{{item.news.imagePreview.absoluteUrl('/images/img_default_news.png')}}"
                                     alt="">
                            </a>
                            <div class="infonews">
                                <h4 class="title-news-item">
                                    <a href="/khoa-phong/hoat-dong/chi-tiet/{{item.news.linkAlias}}?pageId={{pageId}}">{{item.news.title}}</a>
                                </h4>
                                <p class="date-time-news">
                                    {{
                                    item.news.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")
                                    }}
                                </p>
                                <div class="surmary-news-item">
                                    {{item.news.contentPreview}}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="pagination-page text-center" ng-show="loading==false && !finish">
                        <ul class="pagination">
                            <li ng-click="loadPage(1)" class="{{page==1?'disabled':''}}">
                                <a class="page-link"><i class="fa fa-angle-left" style="margin-top: 8px;"></i></a>
                            </li>
                            <li ng-repeat="itemPage in listPage" class="{{page==itemPage?'active':''}}"
                                ng-click="loadPage(itemPage)" style="cursor: pointer;">
                                <a class="page-link" style="{{page==itemPage?'color: white; background: #0d8150;':''}}">{{itemPage}}</a>
                            </li>
                            <li ng-click="loadPage(totalPage)" class="{{page==totalPage?'disabled':''}}">
                                <a class="page-link"><i class="fa fa-angle-right" style="margin-top: 8px;"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('pageNewsController', function ($scope, $http, httpRequest) {
        $scope.pageId = common.getQueryStringHref("pageId");

        $scope.list_month = []
        var date = new Date();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();
        $scope.list_month.push({
            month: month,
            year: year
        });
        for (var i = 3; i > 0; i--) {
            month--;
            if (month <= 0) {
                month = 12;
                year--;
            }
            $scope.list_month.push({
                month: month,
                year: year
            })
        }
        $scope.viewMonth = function (item) {
            $scope.filterMonth = item;
            $scope.data = [];
            $scope.loadFirstPage();
        }

        $scope.filterMonth = null;
        $scope.loading = false;
        $scope.finish = false;

        var urlPage = common.getQueryStringHref("trang");
        if (urlPage) {
            if (urlPage % 1 === 0) {
                urlPage = urlPage;
            } else {
                urlPage = 1;
            }
        } else {
            urlPage = 1;
        }

        $scope.data = [];
        $scope.size = 10;
        $scope.content = common.getQueryStringHref("q");
        if ($scope.content == null)
            $scope.content = "";
        $scope.webType = 1;
        $scope.belongDepartment = 1;
        $scope.loadPage = function (urlPage) {
            $scope.page = urlPage;
            var url = "/mgrNews/newsSearch?"
                + "page=" + $scope.page
                + "&size=" + $scope.size
                + "&content=" + $scope.content
                + "&webtype=" + $scope.webType
                + "&belongDepartment=" + $scope.belongDepartment
                + "&pageId=" + $scope.pageId
                + "&month=" + ($scope.filterMonth ? ($scope.filterMonth.month + "/" + $scope.filterMonth.year) : null)
            httpRequest.get(url
                , function (data) {
                    if (data.success) {
                        $scope.data = data.data.data;
                        $scope.totalPage = common.getTotalPage($scope.size, data.data.total);
                        $scope.sttNews = 1 + ($scope.page - 1) * $scope.size;
                        $scope.listPage = [];
                        for (var i = $scope.page - 5; i < $scope.page + 5; i++) {
                            if (i > 0 && i <= $scope.totalPage)
                                $scope.listPage.push(i);
                        }
                        var query = common.getQueryStringHref("q");
                        if (query == null) {
                            query = "";
                        }
//                        window.history.replaceState({}, "", "/tin-tuc?trang=" + $scope.page + "&q=" + query);
                    }
                }, function (data) {
                }, true);
        };

        $scope.loadPage(urlPage);

        $scope.loadFirstPage = function () {
            $scope.data = [];
            $scope.page = 0;
            $scope.loadPage(1);
        }
        $scope.showMenuName = function () {
            if ($scope.menuName == null)
                $scope.menuName = "HOẠT ĐỘNG MỚI NHẤT"
            return $scope.menuName;
        }

        $scope.listHotNews = [];
        httpRequest.get("/mgrNews/newsSearch?page=1"
            + "&size=3"
            + "&isHotNews=1"
            + "&webType=1"
            + "&belongDepartment=1"
            + "&pageId=" + $scope.pageId
            , function (data) {
                if (data.success) {
                    $scope.listHotNews = data.data.data;
                }
            }, function (data) {
            });
    });
</script>
<script>
    jQuery(document).ready(function () {
        $("#menu-news").addClass("awemenu-active-trail")
    });
</script>
