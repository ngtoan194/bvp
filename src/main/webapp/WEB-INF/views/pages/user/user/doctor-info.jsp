<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 5/26/2018
  Time: 12:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<div class="main-page" ng-controller="doctorInfoController">
    <div class="detail-page">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-12">
                    <div class="menu-left">
                        <jsp:include page="/WEB-INF/views/pages/user/news/list-hot-news.jsp"/>
                    </div>
                </div>
                <div class="col-md-9 col-sm-12">
                    <div class="content-detail ds-bs">
                        <div class="head-ds-bs">
                            <div class="row">
                                <h4 class="title-sub-page text-center">Thông tin bác sĩ </h4>

                            </div>
                        </div>
                        <div class="content-bs">
                            <div class="row">
                                <div class="col-md-4 col-sm-6">
                                    <img ng-src="{{user.avatar.absoluteUrl('/static/images/Profile1.png')}}" alt="">
                                    <p class="tt-name">{{user.name}}</p>
                                    <p class="Khoa-tt">{{getPosition(user, dataDepartment)}}</p>
                                </div>
                                <div class="col-md-8 col-sm-6">
                                    <div class="info-tt-bs">
                                        <p style="white-space: pre-line;">{{user.introduction}}</p>
                                    </div>
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
    ngApp.controller('doctorInfoController', function ($scope) {
        $scope.isMyProfile = ${isMyProfile};
        $scope.user = ${dataUserInfo};
        $scope.dataDepartment = ${dataDepartment};
        $scope.user.birthday = $scope.user.dob.toDateObject('-').format("dd-MM-yyyy");
        debugger
    })
</script>