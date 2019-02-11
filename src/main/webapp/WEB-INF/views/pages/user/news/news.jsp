<%--
  Created by IntelliJ IDEA.
  User: Huyen
  Date: 10/24/2018
  Time: 11:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-page" ng-controller="newsController">
    <div class="detail-page">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-12">
                    <div class="menu-left">
                        <jsp:include page="/WEB-INF/views/pages/user/news/list-hot-news.jsp"/>
                        <div class="inner-content-left">
                            <h4 class="title-left">Tin theo tháng</h4>
                            <ul class="menu-left-main">
                                <li ng-repeat="item in list_month"
                                    class='{{(item==filterMonth)?"active-menu-left":""}}'>
                                    <a href="javascript:void(0)" ng-click="loadFirstPage(item)">Tháng
                                        {{item.month}}/{{item.year}}</a>
                                </li>
                            </ul>
                            <div>
                                <ul class="menu-left-main">
                                    <li>
                                        <a href="#" ng-click="loadFirstPage(null)" class="more">Hiển thị tất cả</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 col-sm-12">
                    <ul class="breadcrumb">
                        <li><a href="/tin-tuc">TIN TỨC</a></li>
                        <li class="active"><a style="text-transform: uppercase;" href="{{checkHref(dataMenu)}}">{{showMenuName()}}</a>
                        </li>
                    </ul>
                    <div class="list-news">
                        <div class="head-sub-page">
                            <div class="col-md-8">
                                <%--<h4 class="title-sub-page">{{showMenuName()}}</h4>--%>
                            </div>
                            <div class="col-md-4">
                                <div class="search-news">
                                    <input type="text" class="form-control" placeholder="Tìm kiếm bài viết"
                                           ng-enter="loadPage(1)" ng-model="title">
                                    <button><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div>
                        <div class="list-new-item" ng-repeat="item in data">
                            <a href="/tin-tuc/{{item.news.linkAlias}}" class="image-news">
                                <img style=" object-fit: cover;"
                                     ng-src="{{item.news.imagePreview?item.news.imagePreview.absoluteUrl():'/static/images/img_default_news.png'}}"
                                     alt="">
                            </a>
                            <div class="infonews">
                                <h4 class="title-news-item">
                                    <a href="/tin-tuc/{{item.news.linkAlias}}">{{item.news.title}}</a>
                                </h4>
                                <p class="date-time-news">
                                    {{item.news.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")}}
                                </p>
                                <div class="surmary-news-item">{{item.news.contentPreview}}</div>
                            </div>
                        </div>
                    </div>
                    <div class="pagination-page text-center">
                        <ul class="pagination">
                            <li ng-click="loadPage(1)" class="{{page==1?'disabled':''}}">
                                <a class="page-link">
                                    <i class="fa fa-angle-left" style="margin-top: 8px;"></i>
                                </a>
                            </li>
                            <li ng-repeat="itemPage in listPage" class="{{page==itemPage?'active':''}}"
                                ng-click="loadPage(itemPage)" style="cursor: pointer;">
                                <a class="page-link" style="{{page==itemPage?'color: white; background: #0d8150;':''}}">{{itemPage}}</a>
                            </li>
                            <li ng-click="loadPage(totalPage)" class="{{page==totalPage?'disabled':''}}">
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
    ngApp.controller('newsController', function ($scope, $http, httpRequest) {
        $scope.menuId = common.getQueryStringHref("menuId");
        $scope.menuName = common.getQueryStringHref("menuName");
        if ($scope.menuId == null) {
            $scope.menuId = "";
        }
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

        $scope.loading = false;
        $scope.finish = false;


        var urlPage = common.getQueryStringHref("trang");
        if (urlPage) {
            if (urlPage % 1 === 0) {
                $scope.page = urlPage;
            } else {
                urlPage = 1;
            }
        } else {
            urlPage = 1;
        }


        $scope.data = [];
        $scope.size = 10;
        $scope.isHotNews = "";
        $scope.content = common.getQueryStringHref("q");
        if ($scope.content == null)
            $scope.content = "";
        $scope.webType = 1;
        $scope.fromHoiLao = "";
        $scope.charity = "";
        $scope.news = [];
        $scope.highlightNoti = "";
        $scope.belongDepartment = "";
        $scope.pageId = "";
        $scope.type = "";
        $scope.title = "";
        $scope.startDate = "";
        $scope.endDate = "";

        $scope.loadPage = function (urlPage) {
            $scope.page = urlPage;
            var url = "/mgrNews/newsSearch?"
                + "page=" + $scope.page
                + "&size=" + $scope.size
                + "&content=" + $scope.content
                + "&isHotNews=" + $scope.isHotNews
                + "&menuId=" + $scope.menuId
                + "&webType=1"
                + "&fromHoiLao=" + $scope.fromHoiLao
                + "&charity=" + $scope.charity
                + "&highlightNoti=" + $scope.highlightNoti
                + "&belongDepartment=" + $scope.belongDepartment
                + "&pageId=" + $scope.pageId
                + "&type=" + $scope.type
                + "&title=" + $scope.title
                + "&startDate=" + $scope.startDate
                + "&endDate=" + $scope.endDate
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
                        var menuName = common.getQueryStringHref("menuName");
                        if (query == null) {
                            query = "";
                        }
                        if ($scope.menuId == null) {
                            $scope.menuId = "";
                        }
                        if (menuName == null) {
                            menuName = "";
                        }
                        if ($scope.menuId == null || $scope.menuId == "") {
                            window.history.replaceState({}, "", "/tin-tuc?menuId=" + $scope.menuId + "&menuName=" + menuName + "&trang=" + $scope.page + "&q=" + query);
                        }
                        if ($scope.menuId != null || $scope.menuId != "") {
                            window.history.replaceState({}, "", "/tin-tuc?menuId=" + $scope.menuId + "&menuName=" + menuName + "&trang=" + $scope.page + "&q=" + query);
                        }
                    }
                }, function (data) {
                }, true);
        };
        $scope.loadPage(urlPage);

        $scope.loadFirstPage = function (item) {
            $scope.data = [];
            $scope.page = 0;
            if (item) {
                if (item.month < 10) {
                    $scope.startDate = item.year + "-0" + item.month + "-01"
                    $scope.endDate = item.year + "-0" + item.month + "-30"
                } else {
                    $scope.startDate = item.year + "-" + item.month + "-01"
                    $scope.endDate = item.year + "-" + item.month + "-30"
                }
            } else {
                $scope.startDate = "";
                $scope.endDate = "";
            }
            $scope.loadPage(1);
        }
        $scope.showMenuName = function () {
            if ($scope.menuName == null)
                $scope.menuName = "TIN MỚI NHẤT"
            return $scope.menuName;
        }
        $scope.checkHref = function (dataMenu) {
            var url = "";
            if (dataMenu == undefined || !dataMenu) {
                url = "";
            } else if (dataMenu && dataMenu.href) {
                url = dataMenu.href;
                if (url.indexOf("?") == -1) {
                    url = url + "?menuId=" + dataMenu.id + "&menuName=" + dataMenu.name;
                } else {
                    url = url + "&menuId=" + dataMenu.id + "&menuName=" + dataMenu.name;
                }
            }
            return url;
        };
    });
</script>
<script>
    jQuery(document).ready(function () {
        $("#menu-news").addClass("awemenu-active-trail")
    });
</script>