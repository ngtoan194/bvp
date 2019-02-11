<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/31/18
  Time: 8:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-4" ng-controller="listCourseController">
    <div class="info-item">
        <h2 class="title-special notranslate">
            <a href="/khoa-hoc?courseId=2&courseItemId=8">Khoá học trực tuyến</a>
        </h2>

        <div class="image-info">
            <a href="/khoa-hoc?courseId={{course[0].course.id}}">
                <img ng-src="{{course[0].course.thumbnail.absoluteUrl()}}" alt="">
            </a>
        </div>
    </div>
</div>
<script>
    ngApp.controller('listCourseController', function ($scope, httpRequest) {
        $scope.course = [];
        $scope.page = 1;
        $scope.size = 2;
        var url = "/course/search?"
            + "&page=" + $scope.page
            + "&size=" + $scope.size
        httpRequest.get(url,function (data) {
            if (data.success) {
                $scope.course = data.data.data;
            }
        }, function (data) {
        });
    });
</script>