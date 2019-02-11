<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 11/15/18
  Time: 9:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    input.remove-videodetector {
        display: none;
    }
</style>
<div class="main-page" ng-controller="pageDetailController">
    <div class="detail-page" ng-if="pageDetail.type !=2">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-12" ng-if="pageDetail.type !=2">
                    <div class="menu-left">
                        <div class="inner-content-left">
                            <div class="post-newest">
                                <h4 class="title-left">Tin nổi bật</h4>
                                <div class="newest-item" ng-repeat="hotNews in listHotNews">
                                    <a href="/tin-tuc/{{hotNews.news.linkAlias}}" class="newest-item-image">
                                        <img style="width: 100%; height: 100%; object-fit: cover;"
                                             ng-src="{{hotNews.news.imagePreview.absoluteUrl()}}" alt="">
                                    </a>
                                    <p class="newest-title">
                                        <a href="/tin-tuc/{{hotNews.news.linkAlias}}">{{hotNews.news.title}}</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 col-sm-12" ng-if="pageDetail.type == 1">
                    <ul class="breadcrumb">
                        <li><a style="text-transform: uppercase;">{{menu}}</a></li>
                        <li ng-if="menu2 && menu2!= null"><a style="text-transform: uppercase;">{{menu2}}</a></li>
                        <li class="active"><a href="" style="text-transform: uppercase;">{{menuName}}</a></li>
                    </ul>
                    <div class="content-detail">
                        <div class="title-page">
                            <h2 class="title-main">{{pageDetail.title}}</h2>
                            <div class="detail-inner">
                                <p ng-bind-html="asHtml(pageDetail.content)"></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 col-sm-12" ng-if="pageDetail.type == 3">
                    <div class="content-detail">
                        <div class="title-page">
                            <h2 class="title-main">{{pageDetail.title}}</h2>
                            <div class="detail-inner">
                                <div ng-bind-html="embedFlash"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('pageDetailController', function ($scope, httpRequest, $sce) {
        $scope.menuId = common.getQueryStringHref("menuId");
        $scope.menu = common.getQueryStringHref("menu");
        $scope.menu2 = common.getQueryStringHref("menu2");
        $scope.menuName = common.getQueryStringHref("menuName");
        $scope.listHotNews = [];
        $scope.pageDetail =${dataPage};
        $scope.loadNews = function () {
            httpRequest.get("/mgrNews/newsSearch?"
                + "page=1"
                + "&size=4"
                + "&isHotNews=1"
                + "&webType=1"
                , function (data) {
                    if (data.success) {
                        $scope.listHotNews = data.data.data;
                    }
                }, function (data) {
                });

        }
        $scope.loadNews();
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
                $scope.embedFlash = $sce.trustAsHtml("<embed src='" + url.absoluteUrlFile() + "' bgcolor='#05733e' type='application/pdf' allowscriptaccess='none' height='100%' width='100%'></embed>");
            } else {
                $scope.embedFlash = "";
            }
        };
        $scope.loadFlash($scope.pageDetail.file);


    });
</script>
