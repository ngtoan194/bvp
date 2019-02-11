<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.UUID" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id" value="${UUID.randomUUID()}"></c:set>
<style>
    .icon-post-count {
        margin-right: 30px;
        position: absolute;
        right: 0px;
        background-color: #0d8150;
        color: #FFFFFF;
        border-radius: 35%;
        padding: 2px;
        font-size: 10px;
        padding-left: 5px;
        padding-right: 5px;
        font-weight: bold;
        float: right;
    }
</style>
<div class="col-md-3 col-sm-12" ng-controller="${id}">
    <div class="menu-left">
        <div class="inner-content-left">
            <h4 class="title-left">Hỏi đáp</h4>
            <ul class="menu-left-main">
                <li>
                    <a href="/tu-van-online/moi-nhat">Mới nhất</a>
                </li>
                <li>
                    <a href="/tu-van-online/da-tra-loi">Đã được trả lời</a>
                </li>
                <li ng-if="${isDoctor}">
                    <a href="/tu-van-online/cau-hoi-cho-tra-loi/${userId}">Chờ trả lời</a>
                </li>
                <c:if test="${isLogin}">
                    <li>
                        <a href="/tu-van-online/dang-theo-doi">Câu hỏi đang theo dõi</a>
                    </li>
                    <c:if test="${!isAdmin}">
                        <li ng-if="${isUser}">
                            <a href="/tu-van-online/cau-hoi-cua-toi">Câu hỏi đã tạo</a>
                        </li>
                        <li ng-if="${isDoctor}">
                            <a href="/tu-van-online/cau-hoi-cua-toi">Bài viết đã tạo</a>
                        </li>
                    </c:if>
                    <c:if test="${isAdmin}">
                        <li>
                            <a href="/tu-van-online/cau-hoi-cho-duyet">Câu hỏi chờ duyệt
                                <span class="icon-post-count">{{dataClassify.unclassifiedCount}}</span>
                            </a>
                        </li>
                        <li>
                            <a href="/tu-van-online/cau-hoi-da-duyet">Câu hỏi đã duyệt</a>
                        </li>
                        <%--<li role="presentation" id="qua-24h">--%>
                            <%--<a href="/tu-van-online/cau-hoi-cho-tra-loi-qua-24h">Câu hỏi chờ trả lời quá--%>
                                <%--24h</a>--%>
                        <%--</li>--%>
                    </c:if>
                </c:if>

                <li>
                    <a href="/tu-khoa">Từ khóa</a>
                </li>
            </ul>
        </div>
        <div class="inner-content-left">
            <div class="post-newest">
                <h4 class="title-left">Từ khóa nổi bật</h4>
                <div class="key-word">
                    <a ng-repeat="item in hotestTags" href="/tu-van-online/tu-khoa/{{item.id}}"
                       class="tag-item">{{item.name}}</a>
                </div>
            </div>
        </div>

        <div class="inner-content-left">
            <div class="post-newest">
                <h4 class="title-left">Xem theo chuyên khoa</h4>
                <div class="chuyen-khoa">
                    <div class="input-text">
                        <select style="width:100%;" ui-select2 class="form-control selectpicker"
                                ng-change="getListPost()" ng-model="value">
                            <option value="">Tất cả</option>
                            <option ng-repeat="item in listCat" value="{{item.department.id}}">
                                {{item.department.name}}
                            </option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('${id}', function ($scope, $http, httpRequest) {
        $scope.serviceUrl = $scope.$parent.serviceId;

        $scope.dataClassify = {};
        httpRequest.get("/post/get-classify-count"
            , function (data) {
                if (data.success) {
                    $scope.dataClassify = data.data;
                }
            }, function (data) {
            });

        $scope.hotestTags = [];
        $http({
            method: 'GET',
            url: '/tag/search?page=1&size=10'
        }).then(function successCallback(response) {
            $scope.hotestTags = response.data.data.data;
        }, function errorCallback(response) {
        });

        $scope.isActive = 1;
        $scope.listDepartments = [];
        $http({
            method: 'GET',
            url: "/department/get-all"
//            + "?isActive=" + $scope.isActive
        }).then(function successCallback(response) {
            if (response.data.success) {
                $scope.listCat = response.data.data.department;
            }
        }, function errorCallback(response) {
        });
        $scope.getListPost = function () {
            if ($scope.value)
                location.href = "/tu-van-online/chuyen-khoa/" + $scope.value;
        }
    });
</script>
