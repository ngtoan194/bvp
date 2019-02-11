<%--
  Created by IntelliJ IDEA.
  User: Huyen
  Date: 10/19/2018
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    input.remove-videodetector{
        display: none;
    }
</style>
<div class="main-page" ng-controller="contributeDetailController">
    <div class="detail-page">
        <div class="container">
            <div class="row">
                <jsp:include page="/WEB-INF/views/pages/user/news/menu-by-group.jsp"/>
                <div class="col-md-9 col-sm-12">
                    <div class="dao-tao-content ds-cau-hoi">
                        <h4 class="title-sub-page">Lời tri ân từ bạn: {{contribute.author}}</h4>
                        <div class="comment question">
                            <ul>
                                <li>
                                    <div class="parent-comment">
                                        <div class="head-question">
                                            <a href="#" class="img-user">
                                                <img ng-src="{{contribute.authorAvatar.absoluteUrl()}}" alt=""></a>
                                            <div class="name-user">
                                                <span class="name">{{contribute.author}}</span>
                                                <p class="time-post">{{contribute.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")}}</p>
                                            </div>
                                            <p class="title-question">{{contribute.title}}</p>
                                        </div>
                                        <div class="comment-content" id="newsContent" style="margin-top: 40px;">
                                            <p class="summary-comment" ng-bind-html="asHtml(contribute.content)"></p>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('contributeDetailController', function ($scope, httpRequest, $sce) {
        $scope.contribute = ${dataContribute};
        $scope.asHtml = function (html) {
            var div = $("<div>");
            div.append(html);
            var iframe = div.find("iframe");
            if(iframe) {
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
    });
</script>