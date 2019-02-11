<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/21/2018
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    input.remove-videodetector {
        display: none;
    }
</style>
<div class="main-page" ng-controller="videoDetailController">
    <div class="detail-page">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-12">
                    <div class="menu-left">
                        <div class="inner-content-left">
                            <div class="post-newest">
                                <h4 class="title-left">Video nổi bật</h4>
                                <div class="newest-item" ng-repeat="item in listHotVideo | limitTo:3">
                                    <a href="/video/{{item.video.linkAlias}}" class="newest-item-image">
                                        <img style="width: 100%; height: 100%; object-fit: cover;"
                                             ng-src="{{item.video.thumbnail.absoluteUrl()}}" alt="">
                                    </a>
                                    <p class="newest-title">
                                        <a href="/video/{{item.video.linkAlias}}">{{item.video.name}}</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 col-sm-12">
                    <div class="content-detail">
                        <div class="title-page">
                            <h2 class="title-main">{{dataVideo.name}}</h2>
                            <div class="detail-inner">
                                <p style="text-align: center;" ng-bind-html="embedFlash"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('videoDetailController', function ($scope, httpRequest, $sce) {
        $scope.dataVideo =${dataVideo};
        $scope.listHotVideo = [];
        $scope.page = 1;
        $scope.size = 4;
        $scope.isHotVideo = 1;
        $scope.webType = 1;
        $scope.loadHotVideo = function () {
            httpRequest.get("/video/search"
                + "?page=" + $scope.page
                + "&size=" + $scope.size
                + "&isHotVideo=" + $scope.isHotVideo
                + "&webType=" + $scope.webType
                , function (data) {
                    if (data.success) {
                        $scope.listHotVideo = data.data.data;
                        for (var i = 0; i < $scope.listHotVideo.length; i++) {
                            if ($scope.listHotVideo[i].id === $scope.dataVideo.id) {
                                $scope.listHotVideo.splice(i, 1);
                                break;
                            }
                        }
                    }
                }, function (data) {
                });
        }
        $scope.loadHotVideo();
        $scope.asHtml = function (html) {
            var div = $("<div>");
            div.append(html);
            var iframe = div.find("iframe");
            if (iframe) {
                iframe.attr("allowfullscreen", "allowfullscreen");
                iframe.attr("mozallowfullscreen", "mozallowfullscreen");
                iframe.attr("msallowfullscreen", "msallowfullscreen");
                iframe.attr("oallowfullscreen", "oallowfullscreen");
                iframe.attr("webkitallowfullscreen", "webkitallowfullscreen");
                iframe.attr("width", 420);
                iframe.attr("height", 315);
            }
            return $sce.trustAsHtml(div.html());
        }

        $scope.loadFlash = function (url) {
            if (url) {
                $scope.embedFlash = $sce.trustAsHtml("<iframe width='100%' height='480' allowfullscreen mozallowfullscreen msallowfullscreen oallowfullscreen webkitallowfullscreen src='" + url + "' ></iframe>");
            } else {
                $scope.embedFlash = "";
            }
        };
        $scope.loadFlash($scope.dataVideo.url);

    });
</script>