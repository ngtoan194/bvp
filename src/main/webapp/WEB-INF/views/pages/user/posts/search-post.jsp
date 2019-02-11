<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 11/15/18
  Time: 4:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.UUID" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id" value="${UUID.randomUUID()}"></c:set>

<style>
    .doctor-post-admin .content-post-admin {
        margin: 20px 0;
    }
    .search-post .list-new-item{
        border-bottom: 1px solid #ddd;
    }

</style>
<div class="main-page" ng-controller="${id}">
    <div class="detail-page search-post">
        <div class="container">
            <div class="row">
                <jsp:include page="/WEB-INF/views/pages/user/posts/menu-left-post.jsp"/>
                <div class="col-md-9 col-sm-12">
                    <div class="dao-tao-content ds-cau-hoi">
                        <h4 class="title-sub-page">{{subPage}}
                            <a ng-if="!${isAdmin}" href="/dat-cau-hoi"
                               class="btn btn-dat-cau-hoi">${isDoctor?"Tạo bài viết":"Đặt câu hỏi"}
                            </a>
                        </h4>
                        <!-- flash file -->
                        <!-- end flash file -->
                        <!-- .comment -->
                        <div class="list-new-item" ng-repeat="item in data">
                            <div class="infonews">
                                <h4 class="title-news-item">
                                    <a href="/cau-hoi/{{item.post.linkAlias}}">{{item.post.title}}</a>
                                </h4>
                                <p class="date-time-news">
                                    {{item.post.createdDate.toDateObject('-').format("HH:mm dd:MM:yyyy")}}
                                </p>
                                <div class="surmary-news-item">{{item.post.content}}</div>
                                <a href="/cau-hoi/{{item.post.linkAlias}}">
                                    <img ng-repeat="img in item.imageUrls"
                                         ng-src="{{img.absoluteUrl()}}" alt="">
                                </a>
                                <p class="awnser ng-binding" style="float: right; margin-top: 15px;">
                                    <a href="/cau-hoi/{{item.post.linkAlias}}" class="more-conseling">Xem thêm </a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('${id}', function ($scope, $http, httpRequest) {
        $scope.subPage = $scope.$parent.titleSubPage;
        $scope.serviceUrl = $scope.$parent.serviceId;
        $scope.loading = false;
        $scope.finish = false;
        $scope.page = 0;
        $scope.data = [];
        $scope.size = 10;
        $scope.query = common.getQueryStringHref("q");
        if ($scope.query == null)
            $scope.query = "";
        $scope.readMore = function () {
            if ($scope.page == 0)
                $scope.data = [];
            $scope.loading = true;
            $scope.page++;
            $http({
                method: 'GET',
                url: "/post/search?"
                + "url=" + $scope.serviceUrl
                + "&query=" + $scope.query
                + "&page=" + $scope.page
                + "&size=" + $scope.size
            }).then(function successCallback(response) {
                $scope.loading = false;
                if (response.data.success) {
                    if (response.data.data.length < $scope.size) {
                        $scope.finish = true;
                    }
                    $scope.data = $scope.data.concat(response.data.data);
                }
            }, function errorCallback(response) {
                $scope.loading = false;
            });
        };
        $scope.readMore();
        $scope.getListPost = function () {
            if ($scope.value)
                location.href = "/chuyen-khoa/" + $scope.value;
        }
    });
</script>
