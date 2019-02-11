<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 11/15/18
  Time: 9:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    input.remove-videodetector {
        display: none;
    }
</style>
<div class="main-page" ng-controller="pageDetail2Controller">
    <div class="clinic">
        <div class="banner-clinnic" style="background-image: url({{pageDetail.bannerImage.absoluteUrl()}});">
        </div>
        <div class="leader">
            <div class="container">
                <div class="leader-old">
                    <h4 class="title-left"
                        style="background: linear-gradient(55deg, {{pageDetail.employees}}, {{pageDetail.reward}}); border-left: 3px solid #00468d; color: {{pageDetail.function}}">
                        Lãnh đạo qua các thời kỳ
                    </h4>
                    <div class="row">
                        <div class="col-md-6">
                            <h4 class="leader-title">Trưởng khoa</h4>
                            <div class="leader-old-item" ng-repeat="item in oldDirectors">
                                {{item.oldDirectors.localtionOldDirectors}}.
                                {{item.oldDirectors.mosOldDirectors}}
                                <strong> {{item.oldDirectors.nameOldDirectors}}</strong>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h4 class="leader-title">Phó Trưởng khoa</h4>
                            <div class="leader-old-item" ng-repeat="item in oldDeputyDirectors">
                                {{item.oldDeputyDirectors.localtionOldDeputyDirectors}}.
                                {{item.oldDeputyDirectors.mosOldDeputyDirectors}}
                                <strong> {{item.oldDeputyDirectors.nameOldDeputyDirectors}}</strong>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="leader-moment">
                    <h4 class="title-left"
                        style="background: linear-gradient(55deg, {{pageDetail.employees}}, {{pageDetail.reward}});  border-left: 3px solid #00468d; color: {{pageDetail.function}}">
                        Lãnh đạo Khoa Hiện nay</h4>
                    <div class="row">
                        <div class="leader-new-item" ng-repeat="item in directors">
                            <div class="images-leader">
                                <img ng-src="{{item.directors.avatar.absoluteUrl()}}" alt="">
                            </div>
                            <div class="info-leader">
                                <p class="name-leader">{{item.directors.mosDirectors}}
                                    <strong> {{item.directors.nameDirectors}}</strong>
                                </p>
                                <p class="job">Trưởng Khoa</p>
                            </div>
                        </div>
                        <div class="leader-new-item" ng-repeat="item in deputyDirectors">
                            <div class="images-leader">
                                <img ng-src="{{item.deputyDirectors.avatar.absoluteUrl()}}" alt="">
                            </div>
                            <div class="info-leader">
                                <p class="name-leader">{{item.deputyDirectors.mosDeputyDirectors}} <strong>
                                    {{item.deputyDirectors.mosDeputyDirectors}}</strong></p>
                                <p class="job">Phó trưởng Khoa</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('pageDetail2Controller', function ($scope, httpRequest, $sce) {

    });
</script>
