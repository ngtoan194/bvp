<%--
  Created by IntelliJ IDEA.
  User: Huyen
  Date: 10/19/2018
  Time: 5:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<div class="col-md-4" ng-controller="listContributeController">
    <h2 class="title-special">
        <a href="/goc-tri-an">Góc tri ân</a>
    </h2>
    <div class="testimonial-carousel owl-carousel">
        <div class="testimonial" ng-repeat="item in contribute" ng-repeat-done="initSlideContribute()">
            <div class="testimonial-bg">
                <a href="/tin-tri-an/{{item.contribute.linkAlias}}" class="avartar-testimonial">
                    <img ng-src="{{item.contribute.authorAvatar.absoluteUrl()}}" alt="">
                </a>
                <p class="name-user-testimonial">{{item.contribute.author}}</p>
                <div class="qoute-testimonial"></div>
                <div class="content-testimonial" ng-click="gotoContributeDetail(item)">
                    <div class="testimonial-tex"><p>{{item.contribute.title}}</p></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('listContributeController', function ($scope, httpRequest) {
        $scope.initSlideContribute = function () {
            setTimeout(function () {
                $('.testimonial-carousel').owlCarousel({
                    loop: true,
                    margin: 0,
                    nav: false,
                    dots: true,
                    autoplay: true,
                    items: 1
                })
            }, 4000);
        }
        $scope.contribute = [];
        $scope.title = "";
        $scope.content = "";
        $scope.endDate = "";
        $scope.startDate = "";
        $scope.title = "";
        $scope.page = 1;
        $scope.size = 5;
        $scope.author = "";
        var url = "/contribute/searchContribute?"
            + "page=" + $scope.page
            + "&size=" + $scope.size
            + "&content=" + $scope.content
            + "&title=" + $scope.title
            + "&author=" + $scope.author
            + "&startDate=" + $scope.startDate
            + "&endDate=" + $scope.endDate
        httpRequest.get(url
            , function (data) {
                if (data.success) {
                    $scope.contribute = data.data.data;
                }
            }, function (data) {
            });
        $scope.gotoContributeDetail = function (item) {
            location.href = '/tin-tri-an/' + item.contribute.id;
        }
    });
</script>