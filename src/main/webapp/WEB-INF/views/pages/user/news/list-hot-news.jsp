<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/19/2018
  Time: 9:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="inner-content-left" ng-controller="listHotNewsController">
    <div class="post-newest">
        <h4 class="title-left">Tin nổi bật</h4>
        <div class="newest-item" ng-repeat="hotNews in listHotNews |limitTo:3">
            <a href="/tin-tuc/{{hotNews.news.linkAlias}}" class="newest-item-image">
                <img style="width: 100%;object-fit: cover"
                        ng-src="{{hotNews.news.imagePreview?hotNews.news.imagePreview.absoluteUrl():'/images/img_default_news.png'}}"
                     alt="">
            </a>
            <p class="newest-title">
                <a href="/tin-tuc/{{hotNews.news.linkAlias}}">{{hotNews.news.title}}</a>
            </p>
        </div>
    </div>
</div>
<script>
    ngApp.controller('listHotNewsController', function ($scope, $http, httpRequest) {
        $scope.listHotNews = [];
        try {
            $scope.listHotNews = JSON.parse(storageMgr.read("data-hot-news"));
        } catch (e) {

        }
        $scope.loadListHotNews = function () {
            httpRequest.get("/mgrNews/newsSearch?"
                + "page=1"
                + "&size=3"
                + "&isHotNews=1"
                + "&webType=1"
                , function (data) {
                    if (data.success) {
                        storageMgr.write("data-hot-news", JSON.stringify(data.data.data));
                        if (!$scope.listHotNews || $scope.listHotNews.length == 0) {
                            $scope.listHotNews = data.data.data;
                        }
                    }
                }, function (data) {
                });
        }
        $scope.loadListHotNews();
    });
</script>