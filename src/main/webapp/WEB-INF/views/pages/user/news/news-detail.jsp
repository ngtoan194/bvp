<%--
  Created by IntelliJ IDEA.
  User: Huyen
  Date: 10/18/2018
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-page" ng-controller="newsdetailController">
    <div class="detail-page">
        <div class="container">
            <div class="row">
                <jsp:include page="/WEB-INF/views/pages/user/news/menu-by-group.jsp"/>
                <div class="col-md-9 col-sm-12">
                    <div class="content-detail">
                        <ul class="breadcrumb">
                            <li><a href="/tin-tuc">Tin tức</a></li>
                            <li class="active"><a href="{{dataMenu.href}}">{{dataMenu.name}}</a></li>
                        </ul>
                        <h4 class="title-sub-page">{{detail.title}}</h4>
                        <div class="share share-top">
                            <p class="date-time">{{detail.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")}}</p>
                            <h3 class="title-share">Chia sẻ bài viết này:</h3>
                            <%--<div class="icon-share">--%>
                            <%--<a href="#" class="fa fa-facebook" onclick="shareFb()"></a>--%>
                            <%--</div>--%>
                            <%--<div class="icon-share ">--%>
                            <%--<a href="#" class="fa fa-google-plus" onclick="shareGg()"></a>--%>
                            <%--</div>--%>
                            <div style="position: relative; display: inline-block; width: 200px;">
                                <div class="fl"
                                     style="min-width: 40px;display: inline-block;position: absolute;left: 10px; bottom: -5px;"
                                     id="btnShareGg">
                                    <div class="g-plusone" data-size="tall">Chia sẻ</div>
                                    <script type="text/javascript">
                                        (function () {
                                            var po = document.createElement('script'),
                                                s = document.getElementsByTagName('script')[0];

                                            po.type = 'text/javascript';
                                            po.async = true;
                                            po.src = 'https://apis.google.com/js/plusone.js';

                                            s.parentNode.insertBefore(po, s);
                                        })();
                                    </script>
                                </div>
                                <div class="fl"
                                     style="margin-left: 10px; min-width: 40px;display: inline-block;position: absolute;left: 60px;bottom: -1px;"
                                     id="btnShareFb">

                                    <div class="fb-share-button" data-href="" data-layout="button"
                                         data-size="small" data-mobile-iframe="true">
                                        <a class="fb-xfbml-parse-ignore"
                                           id="facebook-share-url"
                                           target="_blank" href=""></a>
                                    </div>
                                    <div id="fb-root"></div>
                                    <script>
                                        $("#facebook-share-url").data("href", location.href).attr("href", "https://www.facebook.com/sharer/sharer.php?u=" + location.href);
                                        $("#facebook-share-url").data("data-href", location.href).attr("data-href", location.href);
                                        (function (d, s, id) {
                                            var js, fjs = d.getElementsByTagName(s)[0];
                                            if (d.getElementById(id))
                                                return;
                                            js = d.createElement(s);
                                            js.id = id;
                                            js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.11&appId=147228845910639';
                                            fjs.parentNode.insertBefore(js, fjs);
                                        }(document, 'script', 'facebook-jssdk'));
                                    </script>
                                </div>
                            </div>
                        </div>
                        <div class="title-page">
                            <div class="detail-inner" id="contributeContent">
                                <p ng-bind-html="asHtml(detail.content)"></p>
                            </div>
                        </div>
                    </div>
                    <div class="share share-bottom">
                        <div class="icon-share">
                            <a ng-click="openPopupWindow('https://www.facebook.com/sharer/sharer.php?u=')"
                               class="fa fa-facebook"></a>
                        </div>
                        <div class="icon-share ">
                            <a ng-click="openPopupWindow('https://plus.google.com/share?app=110&url=')"
                               class="fa fa-google-plus"></a>
                        </div>
                    </div>
                    <div class="related-news">
                        <h4 class="title-sub-page">Các tin liên quan</h4>
                        <div class="continue-lesson-inner">
                            <div class="row">
                                <div class="col-md-4 col-sm-4" ng-repeat="item in news | limitTo:3">
                                    <a href="/tin-tuc/{{item.news.linkAlias}}" class="related-item"
                                       style="background-image: url({{item.news.imagePreview.absoluteUrl()}});">
                                        <span href="/tin-tuc/{{item.news.linkAlias}}" class="title-related">{{item.news.title}}</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('newsdetailController', function ($scope, httpRequest, $sce) {
        $scope.shareFb = function () {
            $('#findthis', window.parent.frames[0].document)
        }
        $scope.Gg = function () {
            $('#findthis', window.parent.frames[0].document)
        }
        $scope.detail =${dataNewsDetail};
        $scope.dataMenu =${dataMenu};
        debugger
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
        $scope.news = [];
        $scope.searchNews = {
            page: 1,
            size: $scope.dataMenu.id ? 4 : 3,
            menuId: $scope.dataMenu.id ? $scope.dataMenu.id : "",
            webType: 1,

        }
        $scope.loadNews = function () {
            httpRequest.get("/mgrNews/newsSearch?"
                + "page=" + $scope.searchNews.page
                + "&size=" + $scope.searchNews.size
                + "&menuId=" + $scope.searchNews.menuId
                + "&webType=" + $scope.searchNews.webType
                , function (data) {
                    if (data.success) {
                        $scope.news = data.data.data;
                        for (var i = 0; i < $scope.news.length; i++) {
                            if ($scope.news[i].news.id === $scope.detail.id) {
                                $scope.news.splice(i, 1);
                                break;
                            }
                        }
                    }
                }, function (data) {
                }, true);
        }
        $scope.loadNews();
        $scope.openPopupWindow = function (url) {
            $scope.urlNews = window.location.href;
            newwindow = window.open(url + $scope.urlNews, 'name', 'height=450,width=600,left=30, top=100');
            if (window.focus) {
                newwindow.focus()
            }
            return false;
        };
    });
</script>