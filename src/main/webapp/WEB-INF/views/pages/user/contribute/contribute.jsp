<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2018
  Time: 8:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-page" ng-controller="contributeController">
    <div class="detail-page">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-12">
                    <div class="menu-left">
                        <jsp:include page="/WEB-INF/views/pages/user/news/list-hot-news.jsp"/>
                    </div>
                </div>
                <div class="col-md-9 col-sm-12">
                    <div class="list-news">
                        <div class="head-sub-page">
                            <div class="col-md-8">
                                <h4 class="title-sub-page">GÓC TRI ÂN</h4>
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
                            <a href="/tin-tri-an/{{item.contribute.linkAlias}}" class="image-news">
                                <img style="width: 100%;height: 200px; object-fit: cover;"
                                     ng-src="{{item.contribute.authorAvatar.absoluteUrl()}}"
                                     alt=""></a>
                            <div class="infonews">
                                <h4 class="title-news-item">
                                    <a href="/tin-tri-an/{{item.contribute.linkAlias}}">{{item.contribute.title}}</a>
                                </h4>
                                <p class="date-time-news">
                                    {{
                                    item.contribute.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")
                                    }}
                                </p>
                                <div class="surmary-news-item">{{item.contribute.contentPreview}}</div>
                            </div>
                        </div>
                    </div>
                    <div class="pagination-page text-center" ng-show="loading==false && !finish">
                        <ul class="pagination">
                            <li ng-click="loadPage(1, true)" class="{{page==1?'disabled':''}}">
                                <a class="page-link"><i class="fa fa-angle-left" style="margin-top: 8px;"></i></a>
                            </li>
                            <li ng-repeat="itemPage in listPage | limitTo : 10" class="{{page==itemPage?'active':''}}"
                                ng-click="loadPage(itemPage, true)" style="cursor: pointer;">
                                <a class="page-link" style="{{page==itemPage?'color: white; background: #0d8150;':''}}">{{itemPage}}</a>
                            </li>
                            <li ng-click="loadPage(totalPage, true)" class="{{page==totalPage?'disabled':''}}">
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
    ngApp.controller('contributeController', function ($scope, $http, httpRequest) {
        $scope.menuId = common.getQueryStringHref("menuId");
        $scope.menuName = common.getQueryStringHref("menuName");

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
        $scope.sttContribute = 1;
        $scope.size = 10;
        $scope.content = common.getQueryStringHref("q");
        if (!$scope.content)
            $scope.content = "";
        $scope.title = "";
        $scope.author = "";
        $scope.startDate = "";
        $scope.endDate = "";
        $scope.loadPage = function (urlPage, firstLoading) {
            $scope.page = urlPage
            httpRequest.get("/contribute/searchContribute"
                + "?page=" + $scope.page
                + "&size=" + $scope.size
                + "&content=" + $scope.content
                + "&title=" + $scope.title
                + "&author=" + $scope.author
                + "&startDate=" + $scope.startDate
                + "&endDate=" + $scope.endDate
                , function (data) {
                    if (data.success) {
                        $scope.data = data.data.data;
                        $scope.totalPage = common.getTotalPage($scope.size, data.data.total);
                        $scope.sttContribute = 1 + ($scope.page - 1) * $scope.size;
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
                            window.history.replaceState({}, "", "/goc-tri-an?menuId=" + $scope.menuId + "&menuName=" + menuName + "&trang=" + $scope.page + "&q=" + query);
                        }
                        if ($scope.menuId != null || $scope.menuId != "") {
                            window.history.replaceState({}, "", "/goc-tri-an?menuId=" + $scope.menuId + "&menuName=" + menuName + "&trang=" + $scope.page + "&q=" + query);
                        }
                    }
                }

                ,

                function (data) {
                }

                ,
                firstLoading
            )
            ;
        };
        $scope.loadPage(urlPage, false)
    });
</script>
<script>
    jQuery(document).ready(function () {
        $("#menu-news").addClass("awemenu-active-trail")
    });
</script>