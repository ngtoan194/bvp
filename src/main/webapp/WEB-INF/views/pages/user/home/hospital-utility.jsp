<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/25/18
  Time: 3:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    button.owl-next {
        background-color: Transparent;
        background-repeat: no-repeat;
        border: none;
        cursor: pointer;
        overflow: hidden;
    }
    button.owl-prev {
        background-color: Transparent;
        background-repeat: no-repeat;
        border: none;
        cursor: pointer;
        overflow: hidden;
    }
</style>
<div class="service main-section" ng-controller="hospitalUtilityController">
    <div class="container">
        <div class="title-page">
            <h2 class="title-main">{{'Dịch vụ tại bệnh viện' | translate}}</h2>
            <%--<p class="sub-title">Các dịch vụ khám chữa bệnh tại bệnh viện theo quyết định của Bộ Y tế</p>--%>
        </div>

    </div>
    <div class="service-inner">
        <div class="container">
            <div class="service-slider owl-carousel">
                <div class="slider-image" ng-repeat="item in utilities" ng-repeat-done="initSlideService()">
                    <a href="{{item.hospitalUtility.href}}"><img ng-src="{{item.hospitalUtility.image.absoluteUrl()}}" alt=""></a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('hospitalUtilityController', function ($scope, httpRequest) {
        $scope.initSlideService = function () {
            setTimeout(function () {
                $('.service-slider').owlCarousel({
                    loop: true,
                    autoplayTimeout: 2000,
                    autoplay: true,
                    margin: 30,
                    dots: false,
                    navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
                    responsive: {
                        0: {
                            items: 1,
                            nav: false
                        },
                        600: {
                            items: 2,
                            nav: false
                        },
                        1000: {
                            items: 3,
                            nav: true
                        }
                    }
                })
            }, 2000);
        }
        try {
            $scope.utilities = JSON.parse(storageMgr.read("data-hospital-utility"));
        } catch (e) {

        }
        $scope.utilities = [];
        $scope.dataSearch = {
            name: '',
            page: 1,
            size: 9999,
        }
        $scope.loadUtility = function () {
            var url = "/hospital-utility/search?"
                + "name=" + $scope.dataSearch.name
                + "&page=" + $scope.dataSearch.page
                + "&size=" + $scope.dataSearch.size
            httpRequest.get(url
                , function (data) {
                    if (data.success) {
                        storageMgr.write("data-hospital-utility", JSON.stringify(data.data.data));
                        if (!$scope.utilities || $scope.utilities.length == 0) {
                            $scope.utilities = data.data.data;
                        }
                    }
                }, function (data) {
                });
        }
        $scope.loadUtility();

    });
</script>
