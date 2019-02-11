<%--
  Created by IntelliJ IDEA.
  User: Huyen
  Date: 10/23/2018
  Time: 8:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<div class="news main-section" ng-controller="listNewsController">
    <div class="container">
        <div class="title-page">
            <h2 class="title-main notranslate">{{'Tin Tức Sự kiện' | translate}}</h2>
            <p class="sub-title has-line notranslate">{{'Tin nổi bật' | translate}}</p>
        </div>
        <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12" ng-repeat="item in newsHome" ng-repeat-done="initSlideNews()">
                <div class="news-item">
                    <div class="news-image">
                        <a href="/tin-tuc/{{item.news.linkAlias}}">
                            <img style="width: 100%; height: 100%; object-fit: cover;"
                                 ng-src="{{item.news.imagePreview.absoluteUrl()}}"
                                 alt="{{item.news.title}}" title="{{item.news.title}}">
                        </a>
                    </div>
                    <div style="font-weight: bold; font-family: 'Arimo', sans-serif; font-size: 15px; margin-top: 10px; margin-bottom: 10px; overflow: hidden; -o-text-overflow: ellipsis; text-overflow: ellipsis; display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 3; line-height: 20px; max-height: 60px;">
                        <a href="/tin-tuc/{{item.news.linkAlias}}">{{item.news.title}}</a>
                    </div>
                    <div class="news-surmary">
                        {{item.news.contentPreview}}
                    </div>
                    <div class="news-action">
                        <a href="/tin-tuc/{{item.news.linkAlias}}" class="btn btn-detail">Xem chi tiết</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="view-all">
            <a href="/tin-tuc">Xem tất cả <img src="/static/images/all-icon.png" alt=""></a>
        </div>
    </div>
</div>
<script>
    ngApp.controller('listNewsController', function ($scope, $http, httpRequest) {
        $scope.initSlideNews2 = function () {
            function height2() {
                $('.row').each(function () {

                    // Cache the highest
                    var highestBox = 0;

                    // Select and loop the elements you want to equalise
                    $('.news-item', this).each(function () {

                        // If this box is higher than the cached highest then store it
                        if ($(this).height() > highestBox) {
                            highestBox = $(this).height();
                        }

                    });
                    $('.news-item', this).height(highestBox);
                    // Set the height of all those children to whichever was highest

                    $('.news-title', this).each(function () {

                        // If this box is higher than the cached highest then store it
                        if ($(this).height() > highestBox) {
                            highestBox = $(this).height();
                        }

                    });
                    $('.news-title', this).height(highestBox);

                });
            }

            height2();

//            if ($(window).width() > 1200) {
//                $(window).load(function () {'use strict';
//
//                })
//            }

        }
        $scope.initSlideNews = function () {
            setTimeout(function () {
                $scope.initSlideNews2();
            }, 2000);
        }
        $scope.newsHome = [];
        $scope.page = 1;
        $scope.size = 4;
        $scope.title = "";
        $scope.content = "";
        $scope.isHotNews = 1;
        $scope.webType = 1;
        $scope.fromHoiLao = "";
        $scope.charity = "";
        $scope.charity = "";
        $scope.highlightNoti = "";
        $scope.belongDepartment = "";
        $scope.pageId = "";
        $scope.type = "";
        $scope.startDate = "";
        $scope.endDate = "";
        $scope.menuId = "";
        httpRequest.get("/mgrNews/newsSearch?"
            + "page=" + $scope.page
            + "&size=" + $scope.size
            + "&content=" + $scope.content
            + "&isHotNews=" + $scope.isHotNews
            + "&menuId=" + $scope.menuId
            + "&webType=" + webType
            + "&fromHoiLao=" + $scope.fromHoiLao
            + "&charity=" + $scope.charity
            + "&highlightNoti=" + $scope.highlightNoti
            + "&belongDepartment=" + $scope.belongDepartment
            + "&pageId=" + $scope.pageId
            + "&type=" + $scope.type
            + "&title=" + $scope.title
            + "&startDate=" + $scope.startDate
            + "&endDate=" + $scope.endDate
            , function (data) {
                if (data.success) {
                    $scope.newsHome = data.data.data;
                }
            }, function (data) {
            });
    });
</script>