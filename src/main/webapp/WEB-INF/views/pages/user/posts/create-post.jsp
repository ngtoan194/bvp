<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 11/20/18
  Time: 9:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.UUID" %>
<c:set var="id" value="${UUID.randomUUID()}"></c:set>
<div class="main-page" ng-controller="createPostController">
    <div class="detail-page">
        <div class="container">
            <div class="row">
                <jsp:include page="/WEB-INF/views/pages/user/posts/menu-left-post.jsp"/>
                <div class="col-md-9 col-sm-12">
                    <div class="dao-tao-content">
                        <h4 class="title-sub-page">${pageTitle}</h4>
                        <div class="cau-hoi-form">
                            <div class="form-dat-kham">
                                <form id="form-post" novalidate="novalidate" ng-validate="validationOptions">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12">
                                                <div class="cau-hoi-inner">
                                                    <div class="input-item">
                                                        <label class="label">Tiêu đề {{getTypePost()}}</label>
                                                        <div class="input-text">
                                                            <input type="text" class="form-control"
                                                                   ng-model="dataPost.title"
                                                                   name="title_post" id="title_post"
                                                                   ng-readonly="{{isEditMode}}" autocomplete="off">
                                                        </div>
                                                    </div>
                                                    <div class="input-item">
                                                        <label class="label">Nội dung</label>
                                                        <div class="input-text">
                                                        <textarea class="form-control"
                                                                  name="content_post" id="content_post"
                                                                  cols="30" rows="10" type="text"
                                                                  ng-model="dataPost.content"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="input-item">
                                                        <label class="label">Từ khóa</label>
                                                        <select style="width:100%;"
                                                                ng-model="tags" multiple
                                                                ui-select2="tagOption">
                                                            <option disabled selected>Chọn từ khóa</option>
                                                            <option ng-repeat="item in dataTags"
                                                                    value="{{item.id}}">{{item.name}}
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="input-item">
                                                        <label class="label">Chuyên khoa</label>
                                                        <select class="select2 text" style="width: 100%;"
                                                                id="choose-category" ng-model="departmentId">
                                                            <option selected disabled value="">Chọn chuyên khoa</option>
                                                            <option ng-repeat="item in dataDepartments"
                                                                    value="{{item.department.id}}">
                                                                {{item.department.name}}
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="input-item check-cau-hoi"
                                                         ng-if="!isArticle && isAuthorPost()">
                                                        <div class="checkbox-item">
                                                        <span class="check-input">
                                                            <input type="checkbox" class="checkbox-input"
                                                                   id="private_mode" ng-model="dataPost.isPrivateBool"/>
                                                            <label for=""></label></span>
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
                                                             ng-if="listImages && listImages.length<maxFile">
                                                            <div class="multiple-file-upload"
                                                                 ng-click="fileMgr.chooseFile('${id}')">
                                                                <label class="files">Thêm ảnh: </label>
                                                                <span class="them-anh">
                                                                <input type="file" style="display: none"
                                                                       multiple
                                                                       accept="image/*" class="choose-file"
                                                                       data-id="${id}" id="${id}"
                                                                       data-bind-to="new-new-post"
                                                                       ng-file-change="fileMgr.selectFile"
                                                                       ng-model="fileImage"/>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="action">
                                                    <a id="btn-kham-tai-vien" ng-click="create()"
                                                       class="btn-dat-kham btn-primary btn">{{isEditMode?"Lưu":"Đăng"}}</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>

    </div>
</div>
<script>
    $(document).ready(function () {
        $("#choose-category").select2();
    });
    ngApp.controller('createPostController', function ($scope, $http, fileManager, httpRequest) {
        $scope.isArticle = ${isArticle};
        $scope.isEditMode = ${isEditMode};
        $scope.dataTags = ${dataTags};
        $scope.dataDepartments = ${dataDepartments};
        var data = ${dataPost};
        if (data) {
            $scope.dataPost = data.post;
            $scope.dataAuthor = data.author;
            $scope.departmentId = '${departmentId}';
            $scope.tags = ${tags};
        }
        $scope.listImages = [];
        if ($scope.dataPost && $scope.dataPost.images) {
            var imagesTemp = JSON.parse($scope.dataPost.images);
            for (var i = 0; i < imagesTemp.length; i++) {
                $scope.listImages.push({
                    imageUrl: imagesTemp[i].image,
                    uploading: false
                });
            }
        }
        $scope.tagOption = {
            maximumSelectionLength: 5,
            formatSelectionTooBig: function (limit) {
                return 'Too many selected items';
            },
            language: {
                maximumSelected: function (e) {
                    return "Bạn chỉ được chọn tối đa " + e.maximum + " từ khóa";
                }
            }
        }
        $scope.getMaxLengthContent = function () {
            if ($scope.isArticle)
                return 5000;
            return 1000;
        }
        $scope.getTypePost = function () {
            if ($scope.isArticle)
                return "bài viết";
            return "câu hỏi";
        }
        $.validator.addMethod("title_max_length", function (value, element) {
            return value.length <= 70;
        }, "Vui lòng nhập tiêu đề dưới 70 ký tự");
        $.validator.addMethod("content_max_length", function (value, element) {
            return value.length <= ($scope.isArticle ? 5000 : 2000);
        }, "Vui lòng nhập nội dung dưới " + ($scope.isArticle ? 5000 : 2000) + " ký tự");
        $scope.validationOptions = {
            rules: {
                title_post: {
                    required: true,
                    title_max_length: true
                },
                content_post: {
                    required: true,
                    content_max_length: true
                }
            },
            messages: {
                title_post: {
                    required: "Vui lòng nhập tiêu đề " + $scope.getTypePost()
                },
                content_post: {
                    required: "Vui lòng nhập nội dung " + $scope.getTypePost()
                }
            }
        }
        if (storageMgr.read("dataQuestion")) {
            $scope.dataPost = JSON.parse(storageMgr.read("dataQuestion"));
        }
        if ($scope.dataPost && $scope.dataPost.isAssigned == 1 || $scope.dataPost && $scope.dataPost.isPublished == 1) {
            $("#choose-category").prop("disabled", "disabled");
        }
        if ($scope.dataPost && $scope.dataPost.isPrivate == 1) {
            $scope.dataPost.isPrivateBool = true;
        } else {
            if (!$scope.dataPost) {
                $scope.dataPost = {};
            }
            $scope.dataPost.isPrivateBool = false;
        }
//        $scope.dataPost.isPrivateBool = $scope.dataPost.isPrivate == 1;
        $("#choose-category").val($scope.departmentId).trigger('change');
        $scope.dataPost.listImages = [];
        $scope.maxFile = $scope.isArticle ? 1 : 4;
        $scope.isAuthorPost = function () {
            if (!$scope.isEditMode)
                return true;
            return $scope.isEditMode && $scope.dataAuthor.id ==
            ${userId}
        }
        $scope.create = function () {
            if ($("#form-post").valid()) {
                var listImages = [];
                for (var i = 0; i < $scope.listImages.length; i++) {
                    if ($scope.listImages[i].uploading) {
                        alertSmallBox("Một số ảnh vấn đang được tải lên, vui lòng chờ");
                        return;
                    }
                    listImages.push(
                        {image: $scope.listImages[i].imageUrl}
                    );
                }
//                if ($scope.isArticle && $scope.dataPost.imageUrls.length == 0) {
//                    alertSmallBox("Vui lòng chọn ảnh cho bài viết", error);
//                    return;
//                }
                $scope.dataPost.isPrivate = $scope.dataPost.isPrivateBool ? 1 : 0;
                $scope.dataPost.images = JSON.stringify(listImages, function (key, value) {
                    if (key === "$$hashKey") {
                        return undefined;
                    }
                    return value;
                });
                $("body").addClass("loading");
                httpRequest.post("/post/create"
                    , {
                        departmentId: $scope.departmentId,
                        post: $scope.dataPost,
                        tags: $scope.tags,
                        isArticle: $scope.isArticle
                    }, function (data) {
                        if (data.success) {
                            alertSmallBox(data.data, success);
                            storageMgr.write("dataQuestion", "");
                            setTimeout(function () {
                                if ($scope.isArticle)
                                    location.href = '/bai-viet/' + data.linkAlias;
                                else
                                    location.href = '/cau-hoi/' + data.linkAlias;
                            }, 1000);
                        } else {
                            alertSmallBox(data.message, error);
                        }
                    }, function (data) {
                    }, true);
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
                    var fileName = selector[0].value.replace("C:\\fakepath\\", "").toLocaleLowerCase();
                    var fileId = filePath.substring(filePath.length - 5, filePath.length);
                    if (common.endWith(fileName, ".jpg") ||
                        common.endWith(fileName, ".png") ||
                        common.endWith(fileName, ".gif")) {

                        $scope.listImages.push({
                            id: fileId,
                            uploading: true,
                            imageUrl: filePath,
                            thumbnailUrl: filePath
                        })
                        if ($scope.listImages.length > $scope.maxFile) {
                            alertSmallBox($scope.getTypePost() + " chỉ cho phép chọn " + $scope.maxFile + " ảnh", error);
                            $scope.listImages = [];
                            return;
                        } else {
                            fileManager.upload(selector[0].files[i], function (data, fileId) {
                                if (data.success) {
                                    var imageUrl = data.data.images[0].image;
                                    var thumbnailUrl = data.data.images[0].thumbnail;
                                    $scope.fileMgr.uploadSuccess(fileId, imageUrl, thumbnailUrl);
                                } else {
                                    $scope.fileMgr.remove(fileId);
                                }
                            }, function (data, fileId) {
                                $scope.fileMgr.remove(fileId);
                            }, fileId);
                        }
                    } else {
                        alertSmallBox("Vui lòng chọn hình ảnh có định dạng png, jpg, gif")
                    }
                }
            },
        }
    });
</script>
<style>
    ul.select2-selection__rendered {
        height: 35px;
        margin-top: 5px;
    }
</style>
