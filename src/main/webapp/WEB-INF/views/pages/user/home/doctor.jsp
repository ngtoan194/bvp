<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/22/18
  Time: 2:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<div class="doctor-list main-section" ng-controller="doctorHomeController">
    <div class="container">
        <div class="title-page">
            <h2 class="title-main">Bác sĩ tại bệnh viện</h2>
            <p class="sub-title">Đội ngũ bác sĩ có trình độ chuyên môn cao, nhiều năm kinh nghiệm, giàu y
                đức</p>
        </div>
        <div class="doctor-list-inner owl-carousel">
            <div class="doctor-item" ng-repeat="item in doctorHome" ng-repeat-done="initSlideDoctor()">
                <div class="image-doctor">
                    <a ng-if="${isUser} || !${isLogin}" target="_blank" href="/bac-si/{{item.user.id}}">
                        <img ng-if="item.user.gender == 0 && item.user.originImage"
                             ng-src="{{item.user.originImage.absoluteUrl()}}" alt="" style="object-fit: cover;">
                        <img ng-if="item.user.gender == 0 && !item.user.originImage"
                             src="/static/images/avatarDoctorFemale.png" alt="" style="object-fit: cover;">
                        <img ng-if="item.user.gender == 1 && item.user.originImage"
                             ng-src="{{item.user.originImage.absoluteUrl()}}" alt="" style="object-fit: cover;">
                        <img ng-if="item.user.gender == 1 && !item.user.originImage"
                             src="/static/images/avatarDoctorMale.png" alt="" style="object-fit: cover;">
                    </a>
                    <a ng-if="${isDoctor} || ${isAdmin }" target="_blank" href="/tai-khoan/{{item.user.id}}">
                        <img ng-if="item.user.gender == 0 && item.user.originImage"
                             ng-src="{{item.user.originImage.absoluteUrl()}}" alt="" style="object-fit: cover;">
                        <img ng-if="item.user.gender == 0 && !item.user.originImage"
                             src="/static/images/avatarDoctorFemale.png" alt="" style="object-fit: cover;">
                        <img ng-if="item.user.gender == 1 && item.user.originImage"
                             ng-src="{{item.user.originImage.absoluteUrl()}}" alt="" style="object-fit: cover;">
                        <img ng-if="item.user.gender == 1 && !item.user.originImage"
                             src="/static/images/avatarDoctorMale.png" alt="" style="object-fit: cover;">
                    </a>
                </div>
                <div class="doctor-surmary">
                    <p class="name-doctor notranslate">
                        <a ng-if="${isUser} || !${isLogin}" style="color: white;" target="_blank"
                           href="/bac-si/{{item.user.id}}">{{item.user.name | translate}}</a>
                        <a ng-if="${isDoctor} || ${isAdmin }" style="color: white;" target="_blank"
                           href="/tai-khoan/{{item.user.id}}">{{item.user.name| translate}}</a>
                    </p>
                    <p class="j-doctor notranslate">
                        {{getPosition(item.user,item.department) | translate}}
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('doctorHomeController', function ($scope, httpRequest) {
        $scope.initSlideDoctor = function () {
            setTimeout(function () {
                $('.doctor-list-inner').owlCarousel({
                    loop: true,
                    margin: 20,
                    nav: true,
                    navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
                    responsive: {
                        0: {
                            items: 1,
                            dots:false
                        },
                        600: {
                            items: 2,
                            dots:false
                        },
                        992: {
                            items: 3,
                            dots:true
                        },
                        1200: {
                            items: 4,
                            dots:true
                        }
                    }
                })
            }, 2000);
        }
        $scope.doctorHome = [];
        try {
            $scope.doctorHome = JSON.parse(storageMgr.read("data-doctor-home"));
        } catch (e) {

        }
        $scope.dataSearch = {
            page: '1',
            size: '99',
            role: '2',
            isHighlight: '1',
        }
        $scope.loadListDoctor = function () {
            httpRequest.get("/user/search?"
                + "page=" + $scope.dataSearch.page
                + "&size=" + $scope.dataSearch.size
                + "&role=" + $scope.dataSearch.role
                + "&isHighlight=" + $scope.dataSearch.isHighlight
                , function (data) {
                    if (data.success) {
                        storageMgr.write("data-doctor-home", JSON.stringify(data.data.data));
                        if (!$scope.doctorHome || $scope.doctorHome.length == 0) {
                            $scope.doctorHome = data.data.data;
                        }
                    }
                }, function (data) {
                });
        }
        $scope.loadListDoctor();
    });
</script>