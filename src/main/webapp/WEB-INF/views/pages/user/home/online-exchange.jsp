<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/31/18
  Time: 8:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .content-exchange {
    padding: 80px 0px 40px 0px;
    background-color: #0d8150;
    }
</style>
<div class="online-exchange main-section" ng-controller="onlineExchangeHomeController">
    <div class="container" ng-if="data.length>0">
        <div class="title-page">
            <h2 class="title-main">
                <a href="/giao-luu-truc-tuyen/{{data[0].onlineExchange.linkAlias}}">Giao lưu trực tuyến</a>
            </h2>
            <p class="sub-title">
                Đội ngũ bác sĩ có trình độ chuyên môn cao, nhiều năm kinh nghiệm, giàu y đức
            </p>
        </div>
    </div>
    <div class="content-exchange" ng-if="data.length>0">
        <div class="container">
            <div class="row">
                <div class="col-md-12" style="margin: -5% 1% 1% 0%; text-align: center;" ng-if="comment.length<=0">
                    <div class="text-main">
                        <%--<img style="width: 45px;" src="/static/images/icon-topic.png" class="icon-gl" alt="">--%>
                        <a style="color: #ffffff; font-size: 25px; font-family: 'Oswald', sans-serif; text-transform: uppercase; font-weight: 500;"
                           href="/giao-luu-truc-tuyen/{{data[0].onlineExchange.linkAlias}}">
                            <span>Chủ đề: </span>{{data[0].onlineExchange.topic}}
                        </a>
                    </div>
                    <div class="text-main" style="text-align: left; margin-left: 31%; margin-top: 20px;">
                        <img style="width: 24px; margin-bottom: -29px; margin-left: 5px" src="/static/images/address-icon.png" class="icon-gl" alt="">
                        <div style="color: #b9d4c6; font-size: 20px; margin-left: 60px; margin-bottom: 26px">
                            <span>Trạng thái: <span style="color:#ffff00; font-weight: bold">{{checkVerifiedDay()}}</span></span>
                        </div>
                            <%--<div style="font-size: 22px; margin-bottom: 15px; border: 2px solid ghostwhite; width: 37%; border-radius: 44px; text-align: center; padding: 9px; background: linear-gradient(to right, #8fb57e, whitesmoke); margin-left: 45px; color: #0d8150; font-weight: bold; border-style: none;">--%>
                            <%--Đang diễn ra--%>
                            <%--</div>--%>
                        <img style="width: 36px; margin-top: -9px" src="/static/images/icon-clock.png" class="icon-gl" alt="">
                        <a style="color: #b9d4c6; font-size: 20px; font-family: 'Arimo', sans-serif; margin-left: 19px; margin-bottom: 67px">
                           <span>Thời gian: </span> {{data[0].onlineExchange.startTime.toDateObject('-').format("HH:mm, dd/MM/yyyy")}}
                        </a>
                        <br>
                        <img style="width: 36px; margin-top: 19px" src="/static/images/icon-location.png" class="icon-gl" alt="">
                        <a style="color: #b9d4c6; font-size: 20px; font-family: 'Arimo', sans-serif; margin-left: 19px; margin-top: -72px">
                            <div style="margin-left: 61px; margin-top: -31px">
                                <span>Địa điểm: </span>{{data[0].onlineExchange.location}}
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-md-4" ng-if="comment.length>0" ng-repeat="item in comment">
                    <div class="exchange-item" style="border-radius: 10px;">
                        <div class="exchange-image" style="height: 135px;">
                            <a href="{{checkInfo.href(item)}}">
                                <img ng-src="{{checkInfo.img(item)}}">
                            </a>
                        </div>
                        <div class="exchange-content" style="height: 160px;">
                            <p class="title-exchange">
                                <a href="{{checkInfo.href(item)}}">{{checkInfo.fullName(item)}}</a>
                            </p>
                            <div class="review">
                                <%--<span><img src="images/star-view.png" alt="">1,987 lượt xem</span>--%>
                            </div>
                            <div class="surmary-content">
                                <a ng-init="item.expand=true;" href="/giao-luu-truc-tuyen/{{data[0].onlineExchange.linkAlias}}"
                                   ng-bind-html="seeMoreContent(115,item.onlineExchangeQuestion.content,item.expand)"></a>
                            </div>
                        </div>
                        <div class="surmary-doctor">
                            <p class="doctor"> Trả lời bởi:
                                <a ng-if="${isUser} || ${!isLogin}" target="_blank" href="/bac-si/{{item.doctor.id}}">{{item.doctor.name}}</a>
                                <a ng-if="${isDoctor} || ${isAdmin }" target="_blank"
                                   href="/tai-khoan/{{item.doctor.id}}">{{item.doctor.name}}</a>
                            </p>
                        </div>
                        <div class="foot-exchange">
                            <a ng-init="item.expand=true;" href="/giao-luu-truc-tuyen/{{data[0].onlineExchange.linkAlias}}" style="  text-align: justify;"
                               ng-bind-html="seeMoreContent(200,item.onlineExchangeQuestion.answer, item.expand)"></a>
                            <a href="/giao-luu-truc-tuyen/{{data[0].onlineExchange.linkAlias}}"
                               style="float: right; margin-top: 10px;">
                                <%--<img style="width: 35px;" src="/static/images/icon-readmore.png">--%>Xem chi tiết
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('onlineExchangeHomeController', function ($scope, $http) {
        $scope.data = [];
        $scope.page = "1";
        $scope.size = "1";
        $scope.active = "1";
        $scope.loadOnlineExchange = function () {
            $http({
                method: 'GET',
                url: '/online-exchange/search?'
                + "page=" + $scope.page
                + "&size=" + $scope.size
                + "&active=" + $scope.active
            }).then(function successCallback(response) {
                if (response.data.success) {
                    if (response.data.data.data.length > 0) {
                        $scope.data = response.data.data.data;
                        $scope.startTime = response.data.data.data[0].onlineExchange.startTime;
                        $scope.endTime = response.data.data.data[0].onlineExchange.endTime;
                        $scope.loadComment();
                    }
                }
            }, function errorCallback(response) {
            });
        };
        $scope.loadOnlineExchange();
        var today = new Date();
        var currentTime = today.getTime();
        $scope.checkVerifiedDay = function () {
            var startActive = new Date($scope.startTime);
            var endActive = new Date($scope.endTime);
            var millisecondsStartActive = startActive.getTime();
            var millisecondsndActive = endActive.getTime();
            if (currentTime >= millisecondsStartActive && currentTime <= millisecondsndActive) {
                return "Đang diễn ra"
            } else if (currentTime <= millisecondsStartActive){
                return "Sắp diễn ra"
            } else if (currentTime >= millisecondsndActive) {
                return "Đã diễn ra"
            }
        }
        $scope.comment = [];
        $scope.loadComment = function () {
            $http({
                method: 'GET',
                url: '/online-exchange-question/search?'
                + "exchangeId=" + $scope.data[0].onlineExchange.id
                + "&page=1"
                + "&size=3"
                + "&approval=1"
            }).then(function successCallback(response) {
                if (response.data.success) {
                    $scope.comment = response.data.data.data;
//                    if ($scope.comment.length <= 0) {
//                        $scope.loadDoctor();
//                    }
                }
            }, function errorCallback(response) {
            });
        };
        $scope.seeMoreContent = function (minLength, content, status) {
            if (content)
                return seeMoreContent(minLength, content, status);
            return
        };
        $scope.checkInfo = {
            fullName: function (item) {
                if (item.author.id != '${userId}' && item.onlineExchangeQuestion.hideInfo) {
                    return "Ẩn Danh";
                } else {
                    return item.author.name;
                }
            },
            img: function (item) {
                if (item.author.id != '${userId}' && item.onlineExchangeQuestion.hideInfo && item.onlineExchangeQuestion.hideInfo) {
                    return '/static/images/Profile1.png';
                } else {

                    if (item.author.origiImage)
                        return item.author.origiImage.absoluteUrl();
                    else
                        return '/static/images/Profile1.png';
                }
            },
            href: function (item) {
                if (item.author.id != '${userId}' && item.onlineExchangeQuestion.hideInfo && item.onlineExchangeQuestion.hideInfo) {
                    return 'javascript:void(0)';
                } else {
                    return '/tai-khoan/' + item.author.id;
                }
            }
        };
        $scope.shuffleArray = function (array) {
            var i = array.length, t, j;
            array = array.slice();
            while (--i) t = array[i], array[i] = array[j = ~~(Math.random() * (i + 1))], array[j] = t;
            return array;
        }
        $scope.doctor = [];
        $scope.listDoctor = [];
        $scope.loadDoctor = function () {
            $http({
                method: 'GET',
                url: '/service/admin/getListAccountUserByAdmin?'
                + "page=" + "&size=" + "&fullName=" + "&role=2"
                + "&departmentId=" + "&isHighlight=" + "&index="
                + "&nickname=" + "&email=" + "&blocked=" + "&socialType="
            }).then(function successCallback(response) {
                if (response.data.success) {
                    $scope.doctor = response.data.data.data;
                    for (var i = 0; i < $scope.doctor.length; i++) {
                        for (var j = 0; j < $scope.data[0].onlineExchange.doctorIds.length; j++) {
                            if ($scope.doctor[i].user.id == $scope.data[0].onlineExchange.doctorIds[j]) {
                                $scope.listDoctor.push($scope.doctor[i]);
                            }
                        }
                    }
                    $scope.listDoctor = $scope.shuffleArray($scope.listDoctor);
                }
            }, function errorCallback(response) {
            });
        }
        $scope.getPosition = function (user, department) {
            return getPositionDoctor(user, department)
        }
    });
</script>