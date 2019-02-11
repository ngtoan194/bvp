<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/12/18
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div ng-controller="slidePlaceController">
    <div ng-if="dataSlide && dataSlide.slide && dataSlide.slide.active==1 && dataSlide.slideItems && dataSlide.slideItems.length>0"
         id="{{dataSlide.slidePlace.name}}" class="banner owl-carousel">
        <div class="slider-item" ng-repeat="item in dataSlide.slideItems">
            <a target="_blank" href="{{item.href}}">
                <img ng-src="{{item.image.absoluteUrl()}}" alt="">
            </a>
        </div>
    </div>
</div>
<script>
    ngApp.controller('slidePlaceController', function ($scope, $http, httpRequest) {
        $scope.name = "slide-home";
        $scope.dataSlide = {};
        $scope.loadSlidePlace = function () {
            httpRequest.get("/slide-place/get-name/" + $scope.name
                , function (data) {
                    if (data.success) {
                        $scope.dataSlide = data.data;
                        setTimeout(function () {
                            if ($scope.dataSlide && $scope.dataSlide.slide && $scope.dataSlide.slide.active == 1 && $scope.dataSlide.slideItems && $scope.dataSlide.slideItems.length > 0) {
                                $('#' + $scope.dataSlide.slidePlace.name).owlCarousel({
                                    autoplayTimeout: $scope.dataSlide.slide.intervalTime,
                                    loop: true,
                                    margin: 0,
                                    nav: false,
                                    dots: false,
                                    autoplay: $scope.dataSlide.slide.autoPlay,
                                    items: 1,
                                    autoplayHoverPause: true
                                });
                            }
                        }, 200);
                    }
                }, function (data) {
                });
        };
        $scope.loadSlidePlace();

        $scope.hrefSlide = function (item) {
            if (item) {
                window.open(item, '_blank');
            } else {
                return;
            }
        }
    });
</script>