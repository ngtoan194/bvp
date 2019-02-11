<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 11/15/18
  Time: 10:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    input.remove-videodetector {
        display: none;
    }
</style>
<div class="main-page" ng-controller="pageLeaderController">
    <div class="clinic">
        <div class="banner-clinnic" style="background-image: url({{pageDetail.bannerImage.absoluteUrl()}});">
        </div>
        <div class="leader">
            <div class="container">
                <div class="leader-old">
                    <h4 class="title-left"
                        style="background: linear-gradient(55deg, {{pageDetail.color2}}, {{pageDetail.color3}}); border-left: 3px solid {{pageDetail.color3}};color: {{pageDetail.color}};">
                        Lãnh đạo qua các thời kỳ
                    </h4>
                    <div class="row">
                        <div class="col-md-6">
                            <h4 class="leader-title" style="color: {{pageDetail.reward}};">Trưởng đơn vị</h4>
                            <div class="leader-old-item" ng-repeat="item in oldDirectors">
                                {{item.oldDirectors.location}}.
                                {{item.oldDirectors.mos}}
                                <strong> {{item.oldDirectors.name}}</strong>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h4 class="leader-title" style="color: {{pageDetail.reward}};">Phó đơn vị</h4>
                            <div class="leader-old-item" ng-repeat="item in oldDeputyDirectors">
                                {{item.oldDeputyDirectors.location}}.
                                {{item.oldDeputyDirectors.mos}}
                                <strong> {{item.oldDeputyDirectors.name}}</strong>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="leader-moment">
                    <h4 class="title-left"
                        style="background: linear-gradient(55deg, {{pageDetail.color2}}, {{pageDetail.color3}}); border-left: 3px solid {{pageDetail.color3}};color: {{pageDetail.color}};">
                        Lãnh đạo Hiện nay
                    </h4>
                    <div class="row">
                        <div class="leader-new-item" ng-repeat="item in directors">
                            <div class="images-leader">
                                <img ng-src="{{item.directors.avatar.absoluteUrl()}}" alt="">
                            </div>
                            <div class="info-leader">
                                <p class="name-leader">{{item.directors.mos}}
                                    <br><strong> {{item.directors.name}}</strong>
                                </p>
                                <p class="job">{{item.directors.title}}</p>
                            </div>
                        </div>
                        <div class="leader-new-item" ng-repeat="item in deputyDirectors">
                            <div class="images-leader">
                                <img ng-src="{{item.deputyDirectors.avatar.absoluteUrl()}}" alt="">
                            </div>
                            <div class="info-leader">
                                <p class="name-leader">{{item.deputyDirectors.mos}}
                                    <br><strong>{{item.deputyDirectors.name}}</strong>
                                </p>
                                <p class="job">{{item.deputyDirectors.title}}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('pageLeaderController', function ($scope, httpRequest, $sce) {

    });
</script>
<script>
    jQuery(document).ready(function () {
        $("#menu-leader").addClass("awemenu-active-trail")
    });
</script>
