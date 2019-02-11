<%--
  Created by IntelliJ IDEA.
  User: Nguyen Toan
  Date: 1/22/2018
  Time: 3:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.UUID" %>
<c:set var="id" value="${UUID.randomUUID()}"></c:set>
<style>
    .error {
        color: red;
    }

    .btn-success {
        color: #fff;
        background-color: #05733e;
        border-color: #05733e;
    }

    .modal-footer {
         border-top: 1px solid #ffffff;
    }
</style>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="online-counseling main-section" ng-controller="postHomeController">
    <div class="container">
        <div class="title-page">
            <h2 class="title-main" ng-if="${!isLogin}">
                <a href="/tu-van-online/moi-nhat">giải đáp y học</a>
            </h2>
            <h2 class="title-main" ng-if="${isUser}">
                <a href="/tu-van-online/da-tra-loi">giải đáp y học</a>
            </h2>
            <h2 class="title-main" ng-if="${isDoctor}">
                <a href="/tu-van-online/cau-hoi-cho-tra-loi/${userId}">giải đáp y học</a>
            </h2>
            <h2 class="title-main notranslate" ng-if="${isAdmin}">
                <a href="/tu-van-online/cau-hoi-cho-duyet">{{'giải đáp y học' | translate}}</a>
            </h2>
            <p class="sub-title notranslate">
                {{'Giải đáp thắc mắc miễn phí cùng các bác sĩ Bệnh viện Phổi Trung Ương'|translate}}
            </p>
            <a href="#modal-quick-question" ng-click="showPopupQuestion()" data-toggle="modal" ng-if="${isUser}"
               class="btn-dat-cau-hoi notranslate">{{'Đặt câu hỏi nhanh' | translate}}</a>
        </div>
        <div class="row">
            <div class="col-md-6 col-sm-12" ng-repeat="item in data">
                <div class="counseling-items">
                    <div class="head-counseling">
                        <span class="counseler-avatar">
                             <img ng-if="item.postAuthor.thumbnail" alt=""
                                  ng-src="{{item.postAuthor.thumbnail.absoluteUrl()}}">
                            <img ng-if="!item.postAuthor.thumbnail" alt=""
                                 src="/static/images/Profile1.png">
                        </span>
                        <div class="info">
                            <span class="counseler-name">{{item.postAuthor.name}}</span>
                            <span class="counseler-mail">{{item.postAuthor.email}}</span>
                            <span class="counseler-time">{{item.post.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")}}</span>
                        </div>
                        <p class="job"><a href="/cau-hoi/{{item.post.linkAlias}}">{{item.post.title}}</a></p>
                    </div>
                    <div class="content-conseling">
                        <p class="question" ng-bind-html="item.post.content"></p>
                        <p class="awnser" ng-bind-html="item.comment.content">...
                            <a href="/cau-hoi/{{item.post.linkAlias}}" class="more-conseling">Xem thêm </a>
                        </p>
                        <p class="khoa">{{item.commentAuthor.name}}</p>
                    </div>

                </div>
            </div>
        </div>
        <div id="modal-quick-question" class="modal modal-quick-question fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content" style="margin-top: 90px">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" ng-click="closePopupQuestion()">&times;
                        </button>
                        <h4 class="modal-title">Đặt câu hỏi nhanh</h4>
                    </div>
                    <div class="modal-body">
                        <form id="form-create-post" novalidate="novalidate" ng-validate="validationOptions">
                            <div>
                                <div class="input-item">
                                    <label class="label">Tên</label>
                                    <div class="input-text">
                                        <input type="text" name="fullname" id="fullname" ${isLogin?'readonly':''}
                                               value="${userFullName}" ng-model="user.name" class="form-control">
                                    </div>
                                </div>
                                <div class="input-item" ng-if="${socialType} != 1">
                                    <label class="label">Email</label>
                                    <div class="input-text">
                                        <input type="text" name="email" id="email" ng-model="user.email"
                                               class="form-control">
                                    </div>
                                </div>
                                <div class="input-item">
                                    <label class="label">Tiêu đề câu hỏi</label>
                                    <div class="input-text">
                                        <input type="text" name="title_post" ng-model="post.title" id="title_post"
                                               value="Hỏi bác sĩ bệnh viện phổi" class="form-control">
                                    </div>
                                </div>
                                <div class="input-item">
                                    <label class="label">Nội dung câu hỏi</label>
                                    <div class="input-text">
                                    <textarea name="content_post" id="content_post" ng-model="post.content" cols="30"
                                              rows="3" class="form-control" maxlength="2000"></textarea>
                                    </div>
                                </div>
                                <div class="input-item check-cau-hoi">
                                    <div class="checkbox-item">
                                    <span class="check-input">
                                        <input type="checkbox" class="checkbox-input"
                                               id="private_mode" ng-model="post.isPrivateBool"/>
                                        <label></label></span>
                                        <span class="title-checkbox">Không hiển thị tên người hỏi</span>
                                    </div>
                                </div>
                                <div>
                                    <div ng-repeat="itemImage in listImages" data-lightbox="image-1"
                                         href="{{itemImage.imageUrl.imageUrl()}}"
                                         style="position: relative; width: 100px; height: 100px; margin: 3px; display: inline-block; float: left">
                                        <label ng-click="fileMgr.remove(itemImage)"
                                               style="position: absolute; left: 5px; top: 5px; cursor: pointer">
                                            <i class="fa fa-times-circle"></i>
                                        </label>
                                        <img src="/static/images/loading/loading.gif"
                                             style="width: 40px;height: 40px;position: absolute;top: 30px;left: 30px;"
                                             ng-if="itemImage.uploading"/>
                                        <img alt="image" onerror="ImgError(this);"
                                             style="width: 100px; height: 100px; object-fit: cover;"
                                             ng-src="{{itemImage.imageUrl.absoluteUrl()}}"/>
                                    </div>
                                    <div class="input-item" style="cursor: pointer;"
                                         ng-if="listImages && listImages.length<4">
                                        <div class="multiple-file-upload"
                                             ng-click="fileMgr.chooseFile('${id}')">
                                            <label class="files">Thêm ảnh: </label>
                                            <span class="them-anh">
                                        <input type="file" style="display: none"
                                               accept="image/*" class="choose-file"
                                               data-id="${id}" id="${id}"
                                               data-bind-to="new-new-post"
                                               ng-file-change="fileMgr.selectFile"
                                               ng-model="fileImage"/>
                                    </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" ng-if="${isLogin}" ng-click="createPost()"
                                            class="btn btn-success">Đăng
                                    </button>
                                    <button type="button" ng-if="${!isLogin}" ng-click="createPostIsNotLogin()"
                                            class="btn btn-success">Đăng
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('postHomeController', function ($scope, httpRequest, fileManager) {
        $scope.data = [];
        $scope.page = 1;
        $scope.size = 2;
        $scope.loadPage = function () {
            httpRequest.get("/post/get-highlight-post"
                , function (data) {
                    if (data.success) {
                        $scope.data = data.data.data;
                    }
                }, function (data) {
                });
        };
        $scope.loadPage();
        $scope.post = {};
        $scope.listImages = [];
        if ($scope.post && $scope.post.imageUrls) {
            for (var i = 0; i < $scope.post.imageUrls.length; i++) {
                $scope.listImages.push({
                    imageUrl: $scope.post.imageUrls[i],
                    thumbnailUrl: $scope.post.thumbnailImageUrls[i],
                    uploading: false
                });
            }
        }
        $scope.fileMgr = {
            remove: function (item) {
                for (var i = 0; i < $scope.listImages.length; i++) {
                    if ($scope.listImages[i].id == item.id) {
                        $scope.listImages.splice(i, 1);
                        break;
                    }
                }
            },
            uploadSuccess: function (id, imageUrl, thumbnailUrl) {
                for (var i = 0; i < $scope.listImages.length; i++) {
                    if ($scope.listImages[i].id == id) {
                        $scope.listImages[i].imageUrl = imageUrl;
                        $scope.listImages[i].thumbnailUrl = thumbnailUrl;
                        $scope.listImages[i].uploading = false;
                        $scope.$apply();
                        break;
                    }
                }
            },
            chooseFile: function (id) {
                setTimeout(function () {
                    $('#' + id).trigger('click');
                });
            },
            selectFile: function () {
                var selector = $(event.target);
                for (var i = 0; i < selector[0].files.length; i++) {
                    var filePath = URL.createObjectURL(selector[0].files[i]);
                    var fileId = filePath.substring(filePath.length - 5, filePath.length);

                    $scope.listImages.push({
                        id: fileId,
                        uploading: true,
                        imageUrl: filePath,
                        thumbnailUrl: filePath
                    })

                    fileManager.upload(selector[0].files[i], function (data) {
                        if (data.success) {
                            var imageUrl = data.data.images[0].image;
                            var thumbnailUrl = data.data.images[0].thumbnail;
                            $scope.fileMgr.uploadSuccess(fileId, imageUrl, thumbnailUrl);
                        } else {
                            $scope.fileMgr.remove(fileId);
                        }
                    }, function (data) {
                        $scope.fileMgr.remove(fileId);
                    });
                }
            },
        }
        $.validator.addMethod("title_max_length", function (value, element) {
            return value.length <= 70;
        }, "Vui lòng nhập tiêu đề dưới 70 ký tự");
        $.validator.addMethod("content_max_length", function (value, element) {
            return value.length <= 2000;
        }, "Vui lòng nhập nội dung dưới 2000 ký tự");
        $.validator.addMethod("isEmail", function (value, element) {
            if (value)
                return value.isEmail();
            return true;
        }, "Vui lòng nhập đúng định dạng email!");
        $scope.validationOptions = {
            rules: {
                title_post: {
                    required: true,
                    title_max_length: true
                },
                content_post: {
                    required: true,
                    content_max_length: true
                }, fullname: {
                    required: true,
                }, email: {
                    required: true,
                    isEmail: true
                }
            },
            messages: {
                title_post: {
                    required: "Vui lòng nhập tiêu đề câu hỏi!"
                },
                content_post: {
                    required: "Vui lòng nhập nội dung câu hỏi!"
                }, fullname: {
                    required: "Vui lòng nhập tên của bạn!"
                }, email: {
                    required: "Vui lòng nhập email của bạn!"
                }
            }
        }
        $scope.createPost = function () {
            if ($("#form-create-post").valid()) {
                $scope.post.imageUrls = [];
                $scope.post.thumbnailImageUrls = [];
                for (var i = 0; i < $scope.listImages.length; i++) {
                    if ($scope.listImages[i].uploading) {
                        alertSmallBox("Một số ảnh vấn đang được tải lên, vui lòng chờ", success);
                        return;
                    }
                    $scope.post.imageUrls.push($scope.listImages[i].imageUrl);
                    $scope.post.thumbnailImageUrls.push($scope.listImages[i].thumbnailUrl);
                }
                $scope.post.isPrivate = $scope.post.isPrivateBool ? 1 : 0;
                httpRequest.post("/post/create", {
                    post: $scope.post,
                }, function (data) {
                    debugger
                    if (data.success) {
                        alertSmallBox(data.data, success);
                        setTimeout(function () {
                            location.href = '/cau-hoi/' + data.linkAlias;
                        }, 1000);
                    }
                }, function (data) {
                }, true);
            }
        }
        $scope.device = {};
        $scope.user = {};
        if (${isLogin}) {
            $scope.user.name = '${userFullName}';
        }
        if (${isLogin}) {
            $scope.user.email = '${userEmail}';
        }
        $scope.createPostIsNotLogin = function () {
            if ($("#form-create-post").valid()) {
                $scope.post.imageUrls = [];
                $scope.post.thumbnailImageUrls = [];
                for (var i = 0; i < $scope.listImages.length; i++) {
                    if ($scope.listImages[i].uploading) {
                        alertSmallBox("Một số ảnh vấn đang được tải lên, vui lòng chờ");
                        return;
                    }
                    $scope.post.imageUrls.push($scope.listImages[i].imageUrl);
                    $scope.post.thumbnailImageUrls.push($scope.listImages[i].thumbnailUrl);
                }
                httpRequest.post("/user/create-by-email"
                    , {user: $scope.user}
                    , function (data) {
                        if (data.success) {
                            alertSmallBox(data.data, success);
                            httpRequest.post("/post/create"
                                , {post: $scope.post}
                                , function (data) {
                                    if (data.success) {
                                        alertSmallBox(data.data, success);
                                        setTimeout(function () {
                                            location.href = '/cau-hoi/' + data.linkAlias;
                                        }, 1000);
                                    }
                                }, function (data) {
                                }, true);

                        } else {
                            confirmDialog("XÁC NHẬN", "Email/tên này đã được sử dụng, bạn có muốn đăng nhập không?", function () {
                                storageMgr.write("dataQuestion", JSON.stringify($scope.post));
                                location.href = '/dang-nhap?returnUrl=/dat-cau-hoi';
                            }, function () {
                                alertSmallBox("Vui lòng nhập email/tên khác", error);
                            });

                        }
                    }, function (data) {
                    }, true);
            }
        }
        $scope.showPopupQuestion = function () {
            $scope.post.title = "Hỏi bác sĩ bệnh viện phổi";
        }
        $scope.closePopupQuestion = function () {
            $scope.post = {};
        }
    });
</script>

