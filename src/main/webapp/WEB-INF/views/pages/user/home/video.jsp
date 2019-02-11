<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/31/18
  Time: 8:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-4 video-wrap" ng-controller="listHotVideoController">
    <h2 class="title-special">
        <a href="/video">Video nổi bật</a>
    </h2>
    <div class="list-media">
        <div class="media-preview" ng-if="video && video.length>0">
            <a class="media-item">
                <div class="video-media">
                    <div class="video-image">
                <span class="play-button">
                    <img ng-src="/static/images/play-video.png" alt="">
                </span>
                        <img ng-src="{{currentVideo.thumbnail.absoluteUrl()}}" class="image-video" alt="">
                    </div>
                    <iframe class="video-real"
                            ng-src="{{trustAsResourceUrl(currentVideo.url)}}"
                            frameborder="0" allow="autoplay; encrypted-media"
                            allowfullscreen></iframe>
                </div>
                <div class="video-title">
                    <p>{{currentVideo.name}}</p>
                </div>
            </a>
        </div>
        <div class="media-thumnail" ng-if="video && video.length>0">
            <a class="media-item" ng-repeat="item in video">
                <div class="video-media" ng-click="selectVideo(item)">
                    <div class="video-image" style="cursor: pointer;">
                    <span class="play-button">
                        <img src="/static/images/play-video.png" alt="">
                    </span>
                        <img ng-src="{{item.video.thumbnail.absoluteUrl()}}" class="image-video" alt="">
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>
<script>
    ngApp.controller('listHotVideoController', function ($scope, httpRequest, $sce) {
        $scope.trustAsResourceUrl = function (url) {
            return $sce.trustAsResourceUrl(url + "?enablejsapi=1");
        }
        $scope.initVideo2 = function () {
            $('.media-item').each(function (ev) {
                var real_video = $(this).find('.video-real');
                $(this).on('click', function (ev) {
                    $(real_video)[0].src += "&autoplay=1";
                    ev.preventDefault();
                    $(this).addClass('open-video');
                });

            })
        }
        $scope.initVideo = function () {
            setTimeout(function () {
                $scope.initVideo2();
            }, 3000)
        }
        $scope.initVideo();
        $scope.video = [];
        $scope.isHotVideo = 1;
        $scope.page = 1;
        $scope.size = 3;
        $scope.webType = 1;
        var url = "/video/search?"
            + "page=" + $scope.page
            + "&size=" + $scope.size
            + "&isHotVideo=" + $scope.isHotVideo
            + "&webType=" + $scope.webType
        httpRequest.get(url
            , function (data) {
                if (data.success) {
                    $scope.video = data.data.data;
                    if ($scope.video && $scope.video.length > 0) {
                        $scope.selectVideo($scope.video[0]);
                    }
                }
            }, function (data) {
            });

        $scope.selectVideo = function (item) {
            $scope.currentVideo = item.video;
            if (item) {
                $scope.trustAsResourceUrl($scope.currentVideo.url);
            } else {
                $scope.currentVideo = $scope.video[0];
                $scope.trustAsResourceUrl($scope.currentVideo.url);
            }
        }

    });
</script>