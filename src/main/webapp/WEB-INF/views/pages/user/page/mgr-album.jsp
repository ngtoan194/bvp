<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 11/15/18
  Time: 2:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.UUID" %>
<c:set var="idImg" value="${UUID.randomUUID()}"></c:set>
<style>
    a.btn.btn-success {
        background-color: #0e8150;
        border-color: #0a5d39;
    }

    i.fa {
        margin-right: 5px;
        color: #0e8150;
    }

    button.btn.btn-success.dropdown-toggle.btn-xs {
        height: 15px;
        background: #0e8150;
    }

    .form-item {
        margin-bottom: 15px;
    }

    span.form-label {
        font-weight: bold;
    }

    .btn-primary {
        color: #fff;
        background-color: #0e8150 !important;
        border-color: #0a5d39 !important;
    }

    .btn-primary:hover {
        color: #fff;
        background-color: #0e8150 !important;
        border-color: #0a5d39 !important;
    }

    .btn-primary.active, .btn-primary:active, .open > .dropdown-toggle.btn-primary {
        color: #fff;
        background-color: #0e8150 !important;
        border-color: #0a5d39 !important;
    }

    .btn-primary:active:hover {
        color: #fff;
        background-color: #0e8150 !important;
        border-color: #0a5d39 !important;
    }

    .btn-primary.focus, .btn-primary:focus {
        color: #fff;
        background-color: #0e8150 !important;
        border-color: #0a5d39 !important;
    }

    .btn.active.focus, .btn.active:focus, .btn.focus, .btn:active.focus, .btn:active:focus, .btn:focus {
        outline: none;
    }

    label.error{
        color: red;
    }

    .dropdown-menu .divider {
         margin: 1;
    }
</style>
<!-- page content -->
<div class="container">
    <div class="right_col" role="main" ng-controller="mgrPageAlbumController">
        <div class="">
            <div class="clearfix"></div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2 style="min-width: 50%; font-size: 26px; font-weight: bold;">Quản lý thư viện ảnh
                                <small></small>
                            </h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div class="row" style="margin-bottom: 10px;">
                                <div class="col-sm-12">
                                    <a style="float: right;" type="submit" class="btn btn-success"
                                       ng-click="showPopupAlbum()">
                                        Thêm mới
                                    </a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <table class="table table-striped table-bordered dataTable no-footer">
                                        <thead>
                                        <tr class="table-tr-th">
                                            <th class="text-center">STT</th>
                                            <th class="text-center">Tên album</th>
                                            <%--<th class="text-center">Số lượng ảnh</th>--%>
                                            <th class="text-center">Ảnh đại diện</th>
                                            <th class="text-center">Ngày tạo</th>
                                            <th class="text-center">Tiện ích</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr class="table-tr-th">
                                            <td></td>
                                            <td>
                                                <input type="text" class="form-control"
                                                       placeholder="Nhập tên album để tìm kiếm..."
                                                       ng-model="dataSearch.name" ng-enter="loadPage(1)">
                                            </td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <%--<td></td>--%>
                                        </tr>
                                        <tr class="table-tr-th" ng-repeat="item in data">
                                            <td class="time-item text-center">{{$index + stt}}</td>
                                            <td class="time-item text-center">
                                                {{item.album.name}}
                                            </td>
                                            <%--<td class="time-item text-center">{{item.album.images.length}}</td>--%>
                                            <td class="time-item text-center">
                                                <img style="height: 80px;"
                                                     ng-src="{{item.album.imagePreview.absoluteUrl()}}">
                                            </td>
                                            <td class="time-item text-center">
                                                {{item.album.createdDate.toDateObject('-').format("HH:mm, dd-MM-yyyy")}}
                                            </td>
                                            <td class="time-item text-center">
                                                <div class="btn-group">
                                                    <button data-toggle="dropdown" type="button"
                                                            class="btn btn-success dropdown-toggle btn-xs">
                                                        <span class="caret"></span>
                                                    </button>
                                                    <ul role="menu" class="dropdown-menu">
                                                        <li style="cursor: pointer;">
                                                            <a target="_blank"
                                                               href="/khoa-phong/album/chi-tiet/{{item.album.linkAlias}}">
                                                                <i class="fa fa-eye"></i>Xem chi tiết</a>
                                                        </li>
                                                        <li style="cursor: pointer;">
                                                            <a ng-click="showdataUpdate(item.album)">
                                                                <i class="fa fa-edit"></i>Sửa</a>
                                                        </li>
                                                        <li class="divider"></li>
                                                        <li style="cursor: pointer;">
                                                            <a ng-click="delete(item.album)">
                                                                <i class="fa fa-trash"></i>Xóa</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr ng-if="data.length == 0">
                                            <td colspan="6">
                                                <div class="alert fade in">
                                                    <button class="close" data-dismiss="alert">
                                                        ×
                                                    </button>
                                                    <i class="fa-fw fa fa-info"></i> Không tìm thấy dữ liệu nào.
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-5">
                                    <%--<div class="dataTables_info" id="datatable_info" role="status" aria-live="polite">--%>
                                    <%--Hiển thị từ 1 đến 10 tổng 57 entries--%>
                                    <%--</div>--%>
                                </div>
                                <div class="col-sm-7">
                                    <div class="dataTables_paginate paging_simple_numbers" id="datatable_paginate"
                                         ng-if="data.length>0">
                                        <ul class="pagination">
                                            <li ng-click="loadPage(1)" style="cursor: pointer;"
                                                class="paginate_button previous {{dataSearch.page==1?'disabled':''}}">
                                                <a>Trang đầu</a>
                                            </li>
                                            <li ng-repeat="itemPage in listPage | limitTo : 10" style="cursor: pointer;"
                                                class="paginate_button {{dataSearch.page==itemPage?'active':''}}"
                                                ng-click="loadPage(itemPage)">
                                                <a>{{itemPage}}</a>
                                            </li>
                                            <li ng-click="loadPage(totalPage)" style="cursor: pointer;"
                                                class="paginate_button next {{dataSearch.page==totalPage?'disabled':''}}">
                                                <a>Trang cuối</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade bs-example-modal-lg" id="modal-album" tabindex="-1"
                 role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" style="width: 866px; margin: 115px">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span
                                    aria-hidden="true" ng-click="closedPopupAlbum()">×</span>
                            </button>
                            <h3 class="modal-title">{{dataAlbum.id?"Cập nhật":"Thêm mới"}}</h3>
                        </div>
                        <form id="form-album" novalidate="novalidate"
                              class="smart-form" ng-validate="validationAlbum">
                            <div class="modal-body" style="min-height: 235px;">
                                <div class="col-md-5">
                                    <div class="form-item">
                                        <div class="input-inner">
                                            <span class="form-label">Tên album</span>
                                            <div class="input-text">
                                                <input type="text" class="form-control" name="name"
                                                       placeholder="Nhập tên album..."
                                                       ng-model="dataAlbum.name">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-item" id="select-file">
                                        <div class="form-label" style="margin-top: 10px;">
                                            <span class="form-label">Ảnh đại diện</span>
                                        </div>
                                        <div class="input input-file" style="margin-top: 10px;">
                                            <div class="button"
                                                 style="margin-top: 5px;">
                                                <input type="file"
                                                       id="select-file-image" name="file1"
                                                       accept="image/x-png,image/gif,image/jpeg"
                                                       ng-file-change="fileMgr.selectImgPreview"
                                                       file-input-id="{{dataAlbum.id}}"
                                                       ng-model="dataAlbum.imagePreview">
                                            </div>
                                        </div>
                                        <div style="width: 100%; height: auto; display: flex;align-items:center; justify-content:center;">
                                            <img style="max-width: 100%; margin-top: 10px;"
                                                 ng-if="dataAlbum.imagePreview"
                                                 id="img-temp-avatar"
                                                 ng-src="{{dataAlbum.imagePreview.absoluteUrl()}}">
                                            <img ng-if="uploading"
                                                 src="/static/images/loading/loading2.gif"
                                                 style="width: 69px; position: absolute; top: 65%; left: 44%;"/>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <div class="well padding-10" style="margin: 10px; overflow: hidden;">
                                        <div>
                                            <label class="label"
                                                   style="margin-top: 10px;"><strong>Ảnh</strong>
                                            </label>
                                            <div>
                                                <div style="clear: both;">
                                                    <div ng-repeat="itemImage in listImages"
                                                         data-lightbox="image-1"
                                                         href="{{itemImage.image.imageUrl()}}"
                                                         style="position: relative; width: 100px; height: 100px; margin: 3px; display: inline-block; float: left">
                                                        <label ng-click="fileMgr.remove(itemImage)"
                                                               style="position: absolute; left: 5px; top: 5px; cursor: pointer">
                                                            <i class="fa fa-times-circle"></i>
                                                        </label>
                                                        <img src="/static/images/loading/loading2.gif"
                                                             style="width: 40px;height: 40px;position: absolute;top: 30px;left: 30px;"
                                                             ng-if="itemImage.uploading"/>
                                                        <img alt="image" onerror="ImgError(this);"
                                                             style="width: 100px; height: 100px; object-fit: cover;"
                                                             ng-src="{{itemImage.image.absoluteUrl()}}"/>
                                                    </div>
                                                </div>
                                                <div class="input-item" style="color: #0c4e2e; cursor: pointer;">
                                                    <div class="multiple-file-upload"
                                                         ng-click="fileMgr.chooseFile('${idImg}')">
                                                        <label style="cursor: pointer;" class="files">
                                                            Thêm ảnh: <i class="fa fa-file-image-o"></i>
                                                        </label>
                                                    </div>
                                                    <input type="file" style="display: none"
                                                           multiple id="${idImg}" data-id="${idImg}"
                                                           name="file1" accept="image/*" class="choose-file"
                                                           data-bind-to="new-new-post"
                                                           ng-file-change="fileMgr.selectFile"
                                                           ng-model="fileImage"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" ng-if="!dataAlbum.id && !uploading"
                                        ng-click="create()">Thêm mới
                                </button>
                                <button type="button" class="btn btn-primary" ng-if="dataAlbum.id && !uploading"
                                        ng-click="update()">Cập nhật
                                </button>
                                <button type="button" class="btn btn-default" data-dismiss="modal"
                                        ng-click="closedPopupAlbum()">
                                    Đóng
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->
<script>
    ngApp.controller('mgrPageAlbumController', function ($scope, $http, httpRequest, fileManager) {
        $scope.pageId = common.getQueryStringHref("pageId");
        $scope.pathNamePage = window.location.pathname;
        $scope.data = [];
        $scope.dataAlbum = {};
        $scope.stt = 1;
        $scope.dataSearch = {
            size: 10,
            name: '',
            belongDepartment: 1,
            pageId: $scope.pageId,
        }
        var urlPage = common.getQueryStringHash("trang");
        if (urlPage) {
            if (urlPage % 1 === 0) {
                urlPage = urlPage;
            } else {
                urlPage = 1;
            }
        } else {
            urlPage = 1;
        }
        $scope.loadPage = function (urlPage) {
            $scope.dataSearch.page = urlPage;
            var url = "/album/search?"
                + "page=" + $scope.dataSearch.page
                + "&size=" + $scope.dataSearch.size
                + "&name=" + $scope.dataSearch.name
                + "&belongDepartment=" + $scope.dataSearch.belongDepartment
                + "&pageId=" + $scope.dataSearch.pageId
            httpRequest.get(url
                , function (data) {
                    if (data.success) {
                        $scope.data = data.data.data;
                        $scope.totalPage = common.getTotalPage($scope.dataSearch.size, data.data.total);
                        $scope.stt = 1 + ($scope.dataSearch.page - 1) * $scope.dataSearch.size;
                        $scope.listPage = [];
                        for (var i = $scope.dataSearch.page - 5; i < $scope.dataSearch.page + 5; i++) {
                            if (i > 0 && i <= $scope.totalPage)
                                $scope.listPage.push(i);
                        }
                        window.history.replaceState({}, "", $scope.pathNamePage + "?pageId=" + $scope.pageId + "&trang=" + $scope.dataSearch.page);
                    }
                }, function (data) {
                }, true);
        };
        $scope.loadPage(urlPage);
        $scope.listImages = [];
        if ($scope.dataAlbum && $scope.dataAlbum.images) {
            for (var i = 0; i < $scope.dataAlbum.images.length; i++) {
                $scope.listImages.push({
                    image: $scope.dataAlbum.images[i],
                    uploading: false
                });
            }
        }
        $scope.fileMgr = {
            remove: function (item) {
                for (var i = 0; i < $scope.listImages.length; i++) {
                    if ($scope.listImages[i].image == item.image) {
                        $scope.listImages.splice(i, 1);
                        break;
                    }
                }
            },
            uploadSuccess: function (id, image) {
                for (var i = 0; i < $scope.listImages.length; i++) {
                    if ($scope.listImages[i].id == id) {
                        $scope.listImages[i].image = image;
                        $scope.listImages[i].uploading = false;
                        $scope.$apply();
                        break;
                    }
                }
            },
            chooseFile: function (id) {
                setTimeout(function () {
                    $('#' + id).trigger("click");
                }, 100)
            },
            selectImgPreview: function () {
                var selector = $(event.target);
                var fileName = selector[0].value.replace("C:\\fakepath\\", "").toLocaleLowerCase();
                if (common.endWith(fileName, ".jpg") ||
                    common.endWith(fileName, ".png") ||
                    common.endWith(fileName, ".gif")) {
                    $scope.dataAlbum.imagePreview = URL.createObjectURL(selector[0].files[0]);
                    $scope.uploading = true;
                    fileManager.upload(selector[0].files[0], function (data) {
                        if (data.success) {
                            $scope.dataAlbum.imagePreview = data.data.images[0].image;
                            $scope.uploading = false;
                            $scope.$apply();
                        } else {
                            alertSmallBox("Thêm ảnh lỗi");
                        }
                    }, function (response) {
                    });
                } else {
                    alertSmallBox("Vui lòng chọn hình ảnh có định dạng png, jpg, gif")
                }
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
                            image: filePath,
                        })

                        fileManager.upload(selector[0].files[i], function (data, fileId) {
                            if (data.success) {
                                var images = data.data.images[0].image;
                                $scope.fileMgr.uploadSuccess(fileId, images);
                            } else {
                                $scope.fileMgr.remove(fileId);
                            }
                        }, function (data, fileId) {
                            $scope.fileMgr.remove(fileId);
                        }, fileId);
                    } else {
                        alertSmallBox("Vui lòng chọn hình ảnh có định dạng png, jpg, gif")
                    }
                }
            },
        }
        $scope.removeImgPreview = function (dataAlbum) {
            dataAlbum.imagePreview = "";
            $scope.resetImgInput();
        }
        $scope.resetImgInput = function () {
            $("#select-file-image-cover").val("");
            $("#select-file-image-cover2").val("");
        }
        $scope.cancelData = function () {
            $scope.dataAlbum = {};
            $scope.resetImgInput();
        }
        $scope.showPopupAlbum = function () {
            $scope.listImages = [];
            $("#modal-album").modal('show');
        }
        $scope.closedPopupAlbum = function () {
            $("#modal-album").modal('hide');
            $scope.cancelData();
        }
        $.validator.addMethod("requiredName", function (value, element) {
            if ((!value || value.trim() == ""))
                return false;
            return true;
        }, "Vui lòng nhập tên album!");
        $scope.validationAlbum = {
            rules: {
                name: {
                    requiredName: true,
                },
                file1: {
                    required: function () {
                        if (!$scope.dataAlbum.imagePreview)
                            return true
                        return false
                    }
                }
            },
            errorPlacement: function (error, element) {
                if (element.attr("id") === "select-file-image") {
                    error.insertAfter($("#text-file-image-name").parent());
                } else {
                    error.insertAfter(element.parent());
                }
            },
            messages: {
                file1: {
                    required: "Vui lòng chọn ảnh!",
                }
            },

        }
        $scope.create = function () {
            if ($("#form-album").valid()) {
                if (!$scope.dataAlbum.imagePreview) {
                    alertSmallBox("Vui lòng chọn ảnh đại diện!");
                    return;
                }
                var imageUrls = [];
                for (var i = 0; i < $scope.listImages.length; i++) {
                    imageUrls.push($scope.listImages[i].image);
                }
                if (imageUrls.length > 0) {
                    $scope.dataAlbum.images = imageUrls.toString();
                }
                if (!$scope.dataAlbum.images) {
                    alertSmallBox("Vui lòng chọn ảnh!", error);
                    return;
                }
                $scope.dataAlbum.belongDepartment = 1;
                httpRequest.post("/album/create"
                    , {album: $scope.dataAlbum, pageId: $scope.pageId}
                    , function (data) {
                        if (data.success) {
                            alertSmallBox(data.data, success);
                            $scope.closedPopupAlbum();
                            $scope.loadPage(urlPage);
                        } else {
                            $scope.closedPopupAlbum();
                            alertSmallBox(data.message, error);
                        }
                    }, function (data) {
                    }, true);
            }
        }
        $scope.delete = function (item) {
            confirmDialog("Xác nhận", "Bạn có chắc chắn muốn xóa album này?", function () {
                $("body").addClass("loading");
                $http({
                    method: 'DELETE',
                    url: '/album/delete/' + item.id,
                }).then(function successCallback(response) {
                    if (response.data.success) {
                        alertSmallBox(response.data.data, success);
                        urlPage = common.getQueryStringHref("trang");
                        if (!urlPage) {
                            urlPage = 1
                        }
                        $scope.loadPage(urlPage);
                        $("body").removeClass("loading");
                    }
                    else
                        alertSmallBox(response.data.message, error);
                });
            });
        };
        $scope.showdataUpdate = function (item) {
            $scope.showPopupAlbum();
            $scope.dataAlbum = JSON.parse(JSON.stringify(item));
            if (item.images) {
                var dataImages = item.images.split(",");
                for (var i = 0; i < dataImages.length; i++) {
                    $scope.listImages.push({image: dataImages[i]})
                }
            }
        }
        $scope.update = function () {
            if ($("#form-album").valid()) {
                var imageUrls = [];
                for (var i = 0; i < $scope.listImages.length; i++) {
                    imageUrls.push($scope.listImages[i].image);
                }
                if (imageUrls.length > 0) {
                    $scope.dataAlbum.images = imageUrls.toString();
                }
                if (!$scope.dataAlbum.images) {
                    alertSmallBox("Vui lòng chọn ảnh!", error);
                    return;
                }
                httpRequest.post("/album/update/" + $scope.dataAlbum.id
                    , {album: $scope.dataAlbum, pageId: $scope.pageId}
                    , function (data) {
                        if (data.success) {
                            alertSmallBox(data.data, success);
                            $scope.closedPopupAlbum();
                            urlPage = common.getQueryStringHref("trang");
                            if (!urlPage) {
                                urlPage = 1
                            }
                            $scope.loadPage(urlPage);
                        } else {
                            $scope.closclosedPopupAlbumedPopup();
                            alertSmallBox(data.message, error);
                        }
                    }, function (data) {
                    }, true);
            }
        }
    });
</script>