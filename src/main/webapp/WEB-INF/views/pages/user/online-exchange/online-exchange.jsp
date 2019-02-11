<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 11/01/18
  Time: 4:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .ui-dialog-buttons {
        z-index: 9999;
    }

    .notifyjs-corner {
        position: fixed;
        margin: 5px;
        z-index: 9999;
    }

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
<div class="main-page" ng-controller="onlineExchangeController">
    <div class="detail-page">
        <div class="text-giao-luu">
            <div class="container">
                <div class="text-inner">
                    <div class="title-page">
                        <h2 class="title-main">
                            <%--Giao lưu trực tuyến--%>
                            <span>Chủ đề: </span>{{dataOnlineExchange.topic}}
                        </h2>
                    </div>
                    <div class="text-main">
                        <h3 style="font-weight: 700; color: #0d8150; text-align: center;">
                            </h3>
                    </div>
                    <p class="giao-luu-icon">
                        <img src="/static/images/clock-icon.png" class="icon-gl" alt="">
                        <span>Thời gian: </span> {{dataOnlineExchange.startTime.toDateObject('-').format("HH:mm dd/MM/yyyy")}}
                    </p>
                    <p class="giao-luu-icon">
                        <img src="/static/images/marker-icon.png" class="icon-gl" alt="">
                        <span>Địa điểm: </span> {{dataOnlineExchange.location}}
                    </p>
                </div>
            </div>
        </div>
        <div class="title-page">
            <h2 class="title-main">
                Khách mời
            </h2>
        </div>
        <div class="speakers main-section">
            <div class="speaker-slider owl-carousel">
                <div class="speaker-item" ng-repeat="item in dataDoctor">
                    <div class="image-inner">
                        <a href="/bac-si/{{item.id}}" class="image-speacker" style="width: 196px; height: 196px;">
                            <img ng-if="item.gender == 0 && item.thumbnail"
                                 ng-src="{{item.thumbnail.absoluteUrl()}}" alt="">
                            <img ng-if="item.gender == 0 && !item.thumbnail" alt=""
                                 src="/static/images/avatarDoctorFemale.png">
                            <img ng-if="item.gender == 1 && item.thumbnail"
                                 ng-src="{{item.thumbnail.absoluteUrl()}}" alt="">
                            <img ng-if="item.gender == 1 && !item.thumbnail"
                                 src="/static/images/avatarDoctorMale.png" alt="">
                        </a>
                    </div>
                    <div class="info-speaker color-white">
                        <a href="/bac-si/{{item.uid}}">
                            <p class="name-speaker">{{item.name}}</p>
                            <p class="position-speaker">{{getPosition(item, item.department)}}</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="notic text-center">
                <strong class='label-notic' id="duration"></strong>
                <a ng-if="checkPutQuestion() && !${isAdmin}" style="cursor: pointer; background-color: #058f52;"
                   ng-click="showPopupPutQuestion()"
                   class="btn-dat-cau-hoi">Đặt câu hỏi</a>
                <a ng-if="${isAdmin}" style="cursor: pointer; background-color: #058f52;"
                   class="btn-dat-cau-hoi">Đặt câu hỏi</a>
            </div>
            <div class="ds-cau-hoi giao-luu-tt">
                <div class="comment question">
                    <ul>
                        <li ng-repeat="item in listComment">
                            <div class="parent-comment">
                                <a href="{{checkInfo.href(item)}}" class="img-user">
                                    <img ng-src="{{checkInfo.img(item)}}" alt="">
                                </a>
                                <div class="comment-content">
                                    <div class="name-user">
                                        <span class="name">
                                            <a class="name"
                                               href="{{checkInfo.href(item)}}">{{checkInfo.name(item)}}</a>
                                        </span>
                                        <p class="time-post">
                                            {{item.onlineExchangeQuestion.createdDate.toDateObject('-').format("HH:mm dd/MM/yyyy")}}</p>
                                    </div>
                                    <p style="word-break: break-word;" class="summary-comment"
                                       ng-bind-html="item.onlineExchangeQuestion.content"></p>
                                </div>
                            </div>
                            <ul>
                                <li class="sub-comment">
                                    <article class="sub-inner">
                                        <a href="/bac-si/{{item.doctor.id}}" class="img-user">
                                            <img ng-if="item.doctor.gender == 0 && item.doctor.thumbnail"
                                                 ng-src="{{item.doctor.thumbnail.absoluteUrl()}}" alt="">
                                            <img ng-if="item.doctor.gender == 0 && !item.doctor.thumbnail" alt=""
                                                 src="/static/images/avatarDoctorFemale.png">
                                            <img ng-if="item.doctor.gender == 1 && item.doctor.thumbnail"
                                                 ng-src="{{item.doctor.thumbnail.absoluteUrl()}}" alt="">
                                            <img ng-if="item.doctor.gender == 1 && !item.doctor.thumbnail"
                                                 src="/static/images/avatarDoctorMale.png" alt="">
                                        </a>
                                        <div class="comment-content">
                                            <div class="name-user">
                                                <span class="name">
                                                    <a class="name" href="/bac-si/{{item.doctor.id}}">{{item.doctor.name}}</a>
                                                </span>
                                                <p class="time-post">
                                                    {{
                                                    item.onlineExchangeQuestion.createdDate.toDateObject('-').format("HH:mm dd/MM/yyyy")
                                                    }}
                                                </p>
                                            </div>
                                            <p class="summary-comment" style="word-break: break-word;"
                                               ng-bind-html="item.onlineExchangeQuestion.answer"></p>
                                        </div>
                                    </article>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.comment -->
                <div class="pagination-page text-center">
                    <ul class="pagination">
                        <li ng-click="loadComment(1, true)" class="{{page==1?'disabled':''}}">
                            <a class="page-link"><i class="fa fa-angle-left" style="margin-top: 8px;"></i></a>
                        </li>
                        <li ng-repeat="itemPage in listPage | limitTo : 10" class="{{page==itemPage?'active':''}}"
                            ng-click="loadComment(itemPage, true)" style="cursor: pointer;">
                            <a class="page-link" style="{{page==itemPage?'color: white; background: #0d8150;':''}}">{{itemPage}}</a>
                        </li>
                        <li ng-click="loadComment(totalPage, true)" class="{{page==totalPage?'disabled':''}}">
                            <a class="page-link"><i class="fa fa-angle-right" style="margin-top: 8px;"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="modal fade in" id="modal-put-question" tabindex="-1" role="dialog"
             style="display: none; margin-top: 69px;">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style="margin-top: 75px">
                    <div class="modal-header">
                        <button type="button" ng-click="closedPopupPutQuestion()" class="close" data-dismiss="modal">×
                        </button>
                        <h4 class="modal-title">Đặt câu hỏi</h4>
                    </div>
                    <form id="form-put-question" class="smart-form" novalidate="novalidate"
                          style="padding-left: 10px; padding-right: 10px;" ng-validate="validationQuestion">
                        <fieldset>
                            <section>
                                <label class="label-put-question">
                                    Họ tên
                                </label>
                                <label class="input">
                                    <input type="text" name="name" id="name"
                                           ng-model="dataQuestion.name" placeholder="Nhập họ tên">
                                </label>
                            </section>
                            <section>
                                <label class="label-put-question">
                                    Email
                                </label>
                                <label class="input">
                                    <input type="email" name="email" id="email"
                                           ng-model="dataQuestion.email" placeholder="Nhập email">
                                </label>
                            </section>
                            <section>
                                <label class="label-put-question">
                                    Nội dung
                                </label>
                                <label class="input">
                                    <textarea style="width: 100%;" name="content" id="content"
                                              ng-model="dataQuestion.content" rows="5"></textarea>
                                </label>
                            </section>
                            <section>
                                <div class="input-item check-cau-hoi">
                                    <div class="checkbox-item">
                                        <span class="check-input">
                                            <input type="checkbox"
                                                   class="checkbox-input"
                                                   id="hideInfo" ng-model="dataQuestion.hideInfo">
                                            <label></label>
                                        </span>
                                        <span class="title-checkbox" style="margin-left: 5px;">Không hiển thị tên người hỏi</span>
                                    </div>
                                </div>
                            </section>
                        </fieldset>
                        <footer>
                            <button type="button" class="btn btn-primary" style="background-color: #058f52;"
                                    ng-click="checkLogin()">
                                Đặt câu hỏi
                            </button>
                        </footer>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('onlineExchangeController', function ($scope, $http, httpRequest) {
        $scope.dataOnlineExchange = ${onlineExchange};
        $scope.dataDoctor = ${doctors};
        $scope.getPosition = function (user, department) {
            return getPositionDoctor(user, department)
        };
        $scope.userInfo = ${userInfo};
        $scope.showPopupPutQuestion = function () {
            $('#modal-put-question').show('modal-dialog');
            if (!$scope.userInfo.loginToken) {

            } else {
                $scope.dataQuestion.email = $scope.userInfo.email;
                $scope.dataQuestion.name = $scope.userInfo.name;
                $('#email').attr('readonly', true)
                $('#name').attr('readonly', true)
            }
        };
        $scope.closedPopupPutQuestion = function () {
            $('#modal-put-question').hide('modal-dialog');
            $scope.dataQuestion = {};
        };
        $scope.dataQuestion = {};
        if (storageMgr.read("dataHadAccount")) {
            $scope.dataHadAccount = JSON.parse(storageMgr.read("dataHadAccount"));
        } else {
            $scope.dataHadAccount = {};
        }
        if ($scope.dataHadAccount.content) {
            $scope.showPopupPutQuestion();
            $scope.dataQuestion.content = $scope.dataHadAccount.content;
            $scope.dataQuestion.hideInfo = $scope.dataHadAccount.hideInfo;
            storageMgr.write("dataHadAccount", "");
        }

        setTimeout(function () {
            $('.speaker-slider').owlCarousel({
                loop: true,
                margin: 0,
                nav: true,
                dots: false,
                autoplay: true,
                navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 2
                    },
                    1000: {
                        items: 4
                    },
                    1200: {
                        items: 6
                    }
                }
            })
        }, 2000);
        $scope.listQuestion = [];
        $scope.putQuestion = function () {
            if ($("#form-put-question").valid()) {
                if (!$scope.dataQuestion.content) {
                    alertSmallBox("Vui lòng nhập nội dung câu hỏi!", error);
                    return;
                }
                if ($scope.dataQuestion.hideInfo) {
                    $scope.dataQuestion.hideInfo = 1;
                } else {
                    $scope.dataQuestion.hideInfo = 0;
                }
                $http({
                    method: 'POST',
                    url: '/online-exchange-question/create',
                    data: {
                        onlineExchangeId: $scope.dataOnlineExchange.id,
                        onlineExchangeQuestion: {
                            content: $scope.dataQuestion.content,
                            hideInfo: $scope.dataQuestion.hideInfo
                        }
                    }
                }).then(function successCallback(response) {
                    if (response.data.success) {
                        $scope.closedPopupPutQuestion();
                        alertSmallBox(response.data.data, success);
                    } else {
                        alertSmallBox(response.data.message, error);
                        $scope.closedPopupPutQuestion();
                    }
                }, function errorCallback(response) {
                    alertSmallBox(response.data.data, error);
                    $scope.closedPopupPutQuestion();
                });
            }
        };

        $scope.dateNow = new Date();
        $scope.endDateNow = new Date($scope.dataOnlineExchange.endTime).getTime();
        $scope.checkPutQuestion = function () {
            return !$scope.endDateNow < $scope.dateNow
        };
        $.validator.addMethod("noFirstSpace", function (value, element) {
            return value && value[0] != ' ';
        }, "Vui lòng không để khoảng trống đầu dòng!");
        $scope.validationQuestion = {
            rules: {
                name: {
                    required: true,
                    noFirstSpace: true
                }, email: {
                    required: true,
                    email: true,
                    noFirstSpace: true,
                }, content: {
                    required: true,
                    noFirstSpace: true,
                },
            },
            messages: {
                name: {
                    required: "Vui lòng nhập họ và tên...!",
                }, email: {
                    required: "Vui lòng nhập email...!",
                    email: "Vui lòng nhập đúng định dạng email...!"
                }, content: {
                    required: "Vui lòng nội dung câu hỏi...!",
                },
            }
        }
        $scope.createByEmail = function () {
            if ($("#form-put-question").valid()) {
                if (!$scope.dataQuestion.content) {
                    alertSmallBox("Vui lòng nhập nội dung câu hỏi!", error);
                    return;
                }
                httpRequest.post("/user/create-by-email"
                    , {user: {email: $scope.dataQuestion.email, name: $scope.dataQuestion.name}}
                    , function (data) {
                        if (data.success) {
                            alertSmallBox(data.data, success);
                            $scope.putQuestion();
                        } else {
                            confirmDialog("XÁC NHẬN", "Email/tên này đã được sử dụng, bạn có muốn đăng nhập không?", function () {
                                $scope.dataHadAccount.content = $scope.dataQuestion.content;
                                $scope.dataHadAccount.hideInfo = $scope.dataQuestion.hideInfo;
                                storageMgr.write("dataHadAccount", JSON.stringify($scope.dataHadAccount));
                                location.href = '/dang-nhap?returnUrl=' + window.location.pathname + window.location.search;
                            }, function () {
                                alertSmallBox("Vui lòng nhập email/tên khác", error);
                            });
                        }
                    }, function (data) {
                    }, true);
            }
        }

        $scope.checkLogin = function () {
            if (${isLogin}) {
                $scope.putQuestion();
            } else {
                $scope.createByEmail();
            }
        }

        $scope.stt = 1;
        $scope.approval = 1;
        $scope.size = 10;
        var urlPage = common.getQueryStringHref("trang");
        if (urlPage) {
            if (urlPage % 1 === 0) {
                $scope.page = urlPage;
            } else {
                urlPage = 1;
            }
        } else {
            urlPage = 1;
        }
        $scope.listComment = [];
        $scope.loadComment = function (urlPage, firstLoading) {
            $scope.page = urlPage;
            $scope.firstLoading = firstLoading;
            var url = "/online-exchange-question/search?"
                + "exchangeId=" + $scope.dataOnlineExchange.id
                + "&page=" + $scope.page
                + "&size=" + $scope.size
                + "&approval=" + $scope.approval
            httpRequest.get(url, function (data) {
                if (data.success) {
                    $scope.listComment = data.data.data;
                    $scope.totalPage = common.getTotalPage($scope.size, data.data.total);
                    $scope.stt = 1 + ($scope.page - 1) * $scope.size;
                    $scope.listPage = [];
                    for (var i = $scope.page - 5; i < $scope.page + 5; i++) {
                        if (i > 0 && i <= $scope.totalPage)
                            $scope.listPage.push(i);
                    }
                    window.history.replaceState({}, "", window.location.pathname + "?trang=" + $scope.page);
                }
            }, function (data) {
            }, $scope.firstLoading);
        };
        $scope.loadComment(urlPage, false);

        $scope.checkInfo = {
            name: function (item) {
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
                    if (item.author.thumbnail)
                        return item.author.thumbnail.absoluteUrl();
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
        }

        // Set the date we're counting down to
        var countDownDate = new Date($scope.dataOnlineExchange.endTime);
        countDownDate = countDownDate.getTime();

        // Update the count down every 1 second
        var x = setInterval(function () {

            // Get todays date and time
            var now = new Date();

            // Find the distance between now an the count down date
            var distance = countDownDate - now.getTime();

            // Time calculations for hours, minutes and seconds
            var hours = now.format("hh");
            var minutes = now.format("mm");
            var seconds = now.format("ss");
//            da

            // Output the result in an element with id="demo"
            var smalltime = "0";
            if (hours < 10) {
                hours = smalltime + hours;
            }
            if (minutes < 10) {
                minutes = smalltime + minutes;
            }
            if (seconds < 10) {
                seconds = smalltime + seconds;
            }
            $("#duration").html("Còn " + hours + ":" + minutes + ":" + seconds + " để");
//            document.getElementById("demo").innerHTML = days + "d " + hours + "h " + minutes + "m " + seconds + "s ";

            if (now < $scope.dataOnlineExchange.startTime) {
                clearInterval(x);
                $("#duration").html('Chưa đến thời gian diễn ra giao lưu trực tuyến!');
            }

            // If the count down is over, write some text
            if (distance < 0) {
                clearInterval(x);
                $("#duration").html('Hết thời gian đặt câu hỏi');
            }
        }, 1000);

    });
</script>
<style>
    .smart-form {
        margin: 0;
        outline: 0;
        color: #666;
        position: relative;
    }

    label.error {
        text-transform: lowercase;
        color: red;
        font-size: 12px;
    }

    .smart-form .input {
        position: relative;
        display: block;
        font-weight: 400;
    }

    .smart-form .input-file .button {
        position: absolute;
        top: 4px;
        right: 4px;
        float: none;
        height: 22px;
        margin: 0;
        padding: 0 14px;
        font-size: 13px;
        line-height: 22px;
    }

    .smart-form .input-file .button input {
        position: absolute;
        top: 0;
        right: 0;
        padding: 0;
        font-size: 30px;
        cursor: pointer;
        opacity: 0;
    }

    .smart-form .button {
        background-color: #058f52;
        opacity: .8;
    }

    .smart-form .input input, .smart-form .select select, .smart-form .textarea textarea {
        display: block;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        width: 100%;
        height: 32px;
        line-height: 32px;
        padding: 5px 10px;
        outline: 0;
        border-width: 1px;
        border-style: solid;
        border-radius: 0;
        background: #fff;
        font: 13px/16px 'Open Sans', Helvetica, Arial, sans-serif;
        color: #404040;
        appearance: normal;
        -moz-appearance: none;
        -webkit-appearance: none;
    }

    .smart-form .col {
        float: left;
        min-height: 1px;
        padding-right: 15px;
        padding-left: 15px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
    }

    .smart-form fieldset {
        display: block;
        padding: 25px 14px 5px;
        border: none;
        background: rgba(255, 255, 255, .9);
        position: relative;
    }

    .smart-form .button {
        float: right;
        height: 31px;
        overflow: hidden;
        margin: 10px 0 0 5px;
        padding: 0 25px;
        outline: 0;
        border: 0;
        font: 300 15px/31px 'Open Sans', Helvetica, Arial, sans-serif;
        text-decoration: none;
        color: #fff;
        cursor: pointer;
    }

    .smart-form section {
        margin-bottom: 15px;
        position: relative;
    }

    .smart-form footer .btn {
        float: right;
        margin: 10px 0 0 5px;
        padding: 0 22px;
        font: 300 15px/29px 'Open Sans', Helvetica, Arial, sans-serif;
        cursor: pointer;
    }

    .smart-form footer {
        min-height: 45px;
        display: block;
        padding: 7px 14px 15px;
        border-top: 1px solid rgba(0, 0, 0, .1);
        background: rgba(248, 248, 248, .9);
    }

    .smart-form .input input {
        border-color: #BDBDBD;
        transition: border-color .3s;
        -o-transition: border-color .3s;
        -ms-transition: border-color .3s;
        -moz-transition: border-color .3s;
        -webkit-transition: border-color .3s;
    }

    .smart-form *, .smart-form :after, .smart-form :before {
        margin: 0;
        padding: 0;
        box-sizing: content-box;
    }

    label.label-put-question {
        font-weight: 300;
        color: black;
        margin-bottom: 5px;
    }
</style>