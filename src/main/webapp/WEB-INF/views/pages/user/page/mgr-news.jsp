<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 11/15/18
  Time: 2:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</style>
<div class="container" ng-controller="mgrPageNewsController">
    <div class="right_col" role="main">
        <div class="">
            <div class="clearfix"></div>
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2 style="min-width: 50%; font-size: 26px; font-weight: bold;">Quản lý hoạt động khoa phòng
                                <small></small>
                            </h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <div class="row" style="margin-bottom: 10px;">
                                <div class="col-sm-12">
                                    <a style="float: right;" type="submit" ng-click="showPopupNews()"
                                       class="btn btn-success">Thêm mới</a>
                                </div>
                            </div>
                            <div class="row">
                                <div>
                                    <div class="well padding-10">
                                        <table class="table table-striped table-bordered dataTable no-footer">
                                            <thead>
                                            <tr class="table-tr-th">
                                                <th style="text-align: center">STT</th>
                                                <th style="text-align: center">Tiêu đề</th>
                                                <th style="text-align: center">Tin nổi bật</th>
                                                <th style="text-align: center">Ngày tạo</th>
                                                <th style="text-align: center">Tiện ích</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr class="table-tr-th">
                                                <td></td>
                                                <td>
                                                    <div class="time-item">
                                                        <input type="text" class="form-control"
                                                               placeholder="Nhập tên tiêu đề để tìm kiếm"
                                                               ng-model="dataSearch.title" ng-enter="loadPage(1)">
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="time-item text-center">
                                                        <div class="item-control">
                                                            <select name="" id="select-type"
                                                                    class="select-type form-control"
                                                                    ng-model="dataSearch.isHotNews"
                                                                    ng-change="loadPage(1)">
                                                                <option value="">Tất cả</option>
                                                                <option ng-value="0">Tin thường</option>
                                                                <option ng-value="1">Tin nổi bật</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr class="table-tr-th" ng-repeat="item in data">
                                                <td class="text-center">{{$index + stt}}</td>
                                                <td class="text-center">
                                                    {{item.news.title}}
                                                </td>
                                                <td class="text-center">
                                                    <a ng-if="item.news.isHotNews">
                                                        <i style="color: #05733e;" class="fa fa-check-circle"></i>
                                                    </a>
                                                </td>
                                                <td class="text-center">
                                                    {{item.news.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")}}
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
                                                                   href="/khoa-phong/hoat-dong/chi-tiet/{{item.news.linkAlias}}">
                                                                    <i class="fa fa-eye"></i>Xem chi tiết
                                                                </a>
                                                            </li>
                                                            <li style="cursor: pointer;" ng-if="!item.news.isHotNews">
                                                                <a ng-click="setHotNews(item.news)">
                                                                    <i class="fa fa-check-circle"></i>Chọn tin nổi bật
                                                                </a>
                                                            </li>
                                                            <li style="cursor: pointer;" ng-if="item.news.isHotNews">
                                                                <a ng-click="setHotNews(item.news)">
                                                                    <i class="fa fa-times-circle"></i>Hủy tin nổi bật
                                                                </a>
                                                            </li>
                                                            <li style="cursor: pointer;">
                                                                <a ng-click="showDataUpdate(item.news)">
                                                                    <i class="fa fa-pencil-square-o"></i>Sửa
                                                                </a>
                                                            </li>
                                                            <li style="cursor: pointer;">
                                                                <a data-toggle="modal"
                                                                   ng-click="delete(item.news)">
                                                                    <i class="fa fa-times"></i>Xóa
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr ng-if="data.length == 0">
                                                <td colspan="5">
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
                                                    class="paginate_button previous {{page==1?'disabled':''}}">
                                                    <a>Trang đầu</a>
                                                </li>
                                                <li ng-repeat="itemPage in listPage | limitTo : 10"
                                                    style="cursor: pointer;"
                                                    class="paginate_button {{page==itemPage?'active':''}}"
                                                    ng-click="loadPage(itemPage)">
                                                    <a>{{itemPage}}</a>
                                                </li>
                                                <li ng-click="loadPage(totalPage)" style="cursor: pointer;"
                                                    class="paginate_button next {{page==totalPage?'disabled':''}}">
                                                    <a>Trang cuối</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade bs-example-modal-lg" id="modal-news" tabindex="-1"
                                 role="dialog" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">
                                                <span aria-hidden="true" ng-click="closedPopupNews()">×</span>
                                            </button>
                                            <h2 class="modal-title" style="font-size: 28px">
                                                {{dataNews.id?"Cập nhật":"Thêm mới"}}
                                            </h2>
                                        </div>
                                        <form id="form-news" novalidate="novalidate" class="smart-form"
                                              ng-validate="validationNews">
                                            <div class="modal-body" style="height: 525px;">
                                                <div class="col-md-5">
                                                    <div class="form-item">
                                                        <div class="input-inner">
                                                            <span class="form-label">Tiêu đề </span>
                                                            <div class="input-text">
                                                                <input class="form-control" name="title"
                                                                       placeholder="Nhập tiêu đề page..." type="text"
                                                                       ng-model="dataNews.title">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-item">
                                                        <div class="input-inner">
                                                            <span class="form-label">Nội dung xem trước </span>
                                                            <div class="text-area">
                                                             <textarea class="form-control" name="contentPreview"
                                                                       ng-model="dataNews.contentPreview" rows="5"
                                                                       placeholder="Nhập nội dung xem trước..."></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-item" style="margin-top: 15px;">
                                                        <span class="form-label">Tin nổi bật</span>
                                                        <div class="checkbox-style">
                                                            <a style="cursor: pointer"
                                                               ng-click="checkIsHotNews(checkHotNews?false:true)">
                                                                <i ng-if="!checkHotNews"
                                                                   class="fa fa-square-o fa-lg"></i>
                                                                <i ng-if="checkHotNews"
                                                                   class="fa fa-check-square-o fa-lg"></i>
                                                            </a>
                                                            <span class="label-form">chọn là tin nổi bật</span>
                                                        </div>
                                                    </div>
                                                    <div class="form-item">
                                                        <div class="input-inner">
                                                        <span class="form-label" style="margin-top: 10px;">
                                                            Ảnh
                                                        </span>
                                                            <div class="input input-file" style="margin-top: 10px;">
                                                                <div class="button"
                                                                     style="margin-top: 5px;">
                                                                    <input type="file" id="select-file-image-cover"
                                                                           name="image"
                                                                           accept="image/x-png,image/gif,image/jpeg"
                                                                           ng-file-change="fileMgr.selectFile"
                                                                           file-input-id="{{dataNews.id}}"
                                                                           ng-model="dataNews.imagePreview">
                                                                </div>
                                                            </div>
                                                            <div style="width: 100%; height: auto; display: flex;align-items:center; justify-content:center;">
                                                                <img style="max-width: 100%; max-height:229px; margin-top: 10px;"
                                                                     ng-if="dataNews.imagePreview"
                                                                     id="img-cover"
                                                                     ng-src="{{dataNews.imagePreview.absoluteUrl()}}">
                                                                <img ng-if="uploading"
                                                                     src="/static/images/loading/loading2.gif"
                                                                     style="width: 69px; position: absolute; top: 65%; left: 44%;"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-7">
                                                    <div class="form-item">
                                                        <div class="form-item">
                                                            <div class="input-inner">
                                                                <span style="margin-top: 10px;"><strong>Nội dung </strong></span>
                                                                <div class="textarea">
                                                                <textarea type="text"
                                                                          ng-model="dataNews.content"
                                                                          name="content" id="content"
                                                                          ckeditor></textarea>
                                                                    <b class="tooltip tooltip-bottom-right"></b>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button class="btn btn-success" ng-if="!dataNews.id && !uploading"
                                                        ng-click="create()">Thêm
                                                </button>
                                                <button class="btn btn-success" ng-if="dataNews.id && !uploading"
                                                        ng-click="update()">Cập nhật
                                                </button>
                                                <button class="btn btn-success"
                                                        ng-click="closedPopupNews()">Hủy
                                                </button>
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
    </div>
</div>
<script>
    ngApp.controller('mgrPageNewsController', function ($scope, $http, httpRequest, fileManager) {
        $scope.pageId = common.getQueryStringHref("pageId");
        $scope.pathNamePage = window.location.pathname;
        $scope.listNews = [];
        $scope.dataNews = {};
        $scope.stt = 1;
        $scope.dataSearch = {
            size: 10,
            content: '',
            isHotNews: '',
            webType: 1,
            belongDepartment: 1,
            pageId: $scope.pageId,
            title: '',
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
            var url = "/mgrNews/newsSearch?"
                + "page=" + $scope.dataSearch.page
                + "&size=" + $scope.dataSearch.size
                + "&content=" + $scope.dataSearch.content
                + "&isHotNews=" + $scope.dataSearch.isHotNews
                + "&webType=" + $scope.dataSearch.webType
                + "&belongDepartment=" + $scope.dataSearch.belongDepartment
                + "&pageId=" + $scope.dataSearch.pageId
                + "&title=" + $scope.dataSearch.title
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
        $scope.resetImgInput = function () {
            $("#select-file-image-cover").val("");
            for (instance in CKEDITOR.instances) {
                CKEDITOR.instances[instance].setData("");
            }
        }
        $scope.cancelData = function () {
            $scope.dataNews = {};
            $scope.checkHotNews = false;
            $scope.resetImgInput();
        }
        $scope.showPopupNews = function () {
            $("#modal-news").modal('show');
        }
        $scope.closedPopupNews = function () {
            $scope.cancelData();
            $("#modal-news").modal('hide');
        }
        $scope.checkIsHotNews = function (item) {
            $scope.checkHotNews = item;
        }
        $scope.cancelHotNews = function (item) {
            debugger
            if (item.isHotNews == 1) {
                var content = "Bạn có chắc chắn muốn hủy chọn tin nổi bật này này?";
                var data = {isHotNews: 0};
                var message = "Hủy tin nổi bật thành công!";
                var error = "Hủy tin nổi bật thất bại";
            } else {
                content = "Bạn có chắc chắn muốn chọn tin tức này thành tin nổi bật?";
                data = {isHotNews: 1}
                message = "Chọn tin tức thành tin nổi bật thành công!";
                var error = "Hủy chọn tin tức thành tin nổi bật thất bại";
            }
            confirmDialog("XÁC NHẬN", content, function () {
                httpRequest.post("/news/setHotNews/" + item.id,
                    data,
                    function (data) {
                        if (data.success) {
                            debugger
                            alertSmallBox(message, "success");
                            $scope.loadPage(urlPage);
                        } else {
                            alertSmallBox(error, error);
                        }
                    }, function (data) {
                    }, true);
            })
        };
        $scope.fileMgr = {
            chooseFile: function () {
                $("[file-input-id]").trigger("click");
            },
            selectFile: function () {
                var selector = $(event.target);
                var fileName = selector[0].value.replace("C:\\fakepath\\", "").toLocaleLowerCase();
                if (common.endWith(fileName, ".jpg") ||
                    common.endWith(fileName, ".png") ||
                    common.endWith(fileName, ".gif")) {
                    $scope.dataNews.imagePreview = URL.createObjectURL(selector[0].files[0]);
                    $scope.uploading = true;
                    fileManager.upload(selector[0].files[0], function (data) {
                        if (data.success) {
                            $scope.dataNews.imagePreview = data.data.images[0].image;
                            $scope.uploading = false;
                            $scope.$apply();
                        } else {
                            alertSmallBox("Thêm ảnh lỗi", error);
                        }
                    }, function (response) {
                    });

                } else {
                    alertSmallBox("Vui lòng chọn hình ảnh có định dạng png, jpg, gif")
                }
            }
        };
        $.validator.addMethod("requiredTile", function (value, element) {
            if ((!value || value.trim() == ""))
                return false;
            return true;
        }, "Vui lòng nhập tiêu đề!");
        $.validator.addMethod("requiredContentPreview", function (value, element) {
            if ((!value || value.trim() == ""))
                return false;
            return true;
        }, "Vui lòng nhập nội dung xem trước!");
        $scope.validationNews = {
            rules: {
                title: {
                    requiredTile: true,
                    maxlength: 150
                },
                contentPreview: {
                    requiredContentPreview: true,
                    maxlength: 500
                },
                image: {
                    required: function () {
                        if (!$scope.dataNews.imagePreview)
                            return true;
                        return false;
                    }
                }
            },
            errorPlacement: function (error, element) {
                if (element.attr("id") === "select-file-image-cover") {
                    error.insertAfter($("#text-file-name-image-cover").parent());
                } else {
                    error.insertAfter(element.parent());
                }
            },
            messages: {
                title: {
                    required: "Vui lòng nhập tiêu đề tin tức!",
                    maxlength: "Tiêu đề tin tức vui lòng nhập tối đa 150 ký tự!"
                },
                contentPreview: {
                    required: "Vui lòng nhập Văn bản xem trước!",
                    maxlength: "Nội dung xem trước của tin tức vui lòng nhập tối đa 500 ký tự!"
                },
                image: {
                    required: "Vui lòng chọn ảnh!"
                }
            }
        };
        $scope.create = function () {
            $scope.dataNews.isHotNews = $scope.checkHotNews ? 1 : 0;
            $scope.dataNews.webType = 1;
            $scope.dataNews.belongDepartment = 1;
            if ($("#form-news").valid()) {
                httpRequest.post("/news/createNews"
                    , {news: $scope.dataNews, pageId: $scope.pageId}
                    , function (data) {
                        if (data.success) {
                            alertSmallBox(data.message, success);
                            $scope.closedPopupNews();
                            $scope.cancelData();
                            $scope.loadPage(1);
                        } else {
                            alertSmallBox(data.message, error);
                        }
                    }, function (data) {
                    }, true);
            }
        };
        $scope.delete = function (item) {
            confirmDialog("Xác nhận", "Bạn có chắc chắn muốn xóa hoạt động này?", function () {
                $http({
                    method: 'DELETE',
                    url: '/news/deleteNews/' + item.id,
                }).then(function successCallback(response) {
                    if (response.data.success) {
                        alertSmallBox(response.data.data, success);
                        urlPage = common.getQueryStringHref("trang");
                        if (!urlPage) {
                            urlPage = 1
                        }
                        $scope.loadPage(urlPage);
                    }
                    else
                        alertSmallBox(response.data.message, error);
                });
            });
        };
        $scope.showDataUpdate = function (item) {
            $scope.showPopupNews();
            $scope.dataNews = JSON.parse(JSON.stringify(item));
            $scope.checkHotNews = $scope.dataNews.isHotNews;
            setTimeout(function () {
                CKEditorSetup.SetData("content", item.content);
            }, 500);
        }
        $scope.update = function () {
            $scope.dataNews.isHotNews = $scope.checkHotNews ? 1 : 0;
            if ($("#form-news").valid()) {
                httpRequest.post("/news/createNews"
                    , {news: $scope.dataNews, pageId: $scope.pageId}
                    , function (data) {
                        if (data.success) {
                            alertSmallBox(data.message, success);
                            $scope.closedPopupNews();
                            urlPage = common.getQueryStringHref("trang");
                            if (!urlPage) {
                                urlPage = 1
                            }
                            $scope.loadPage(urlPage);
                        } else {
                            alertSmallBox(data.message, error);
                        }
                    }, function (data) {
                    }, true);
            }
        };
        $scope.setHotNews = function (item) {
            if (item.isHotNews == 1) {
                var content = "Bạn có chắc chắn muốn hủy chọn hoạt động nổi bật này?";
                var data = {isHotNews: 0};
                var message = "Hủy hoạt động nổi bật thành công!";
                var error = "Hủy hoạt động nổi bật thất bại!"
            } else {
                content = "Bạn có chắc chắn muốn chọn hoạt động này thành hoạt động nổi bật?";
                data = {isHotNews: 1}
                message = "Chọn hoạt động nổi bật thành công!";
                error = "Chọn hoạt động nổi bật thất bại!"
            }
            confirmDialog("XÁC NHẬN", content, function () {
                httpRequest.post("/news/setHotNews/" + item.id,
                    data,
                    function (data) {
                        if (data.success) {
                            alertSmallBox(message, "success");
                            urlPage = common.getQueryStringHref("trang");
                            if (!urlPage) {
                                urlPage = 1
                            }
                            $scope.loadPage(urlPage);
                        } else {
                            alertSmallBox(error, error);
                        }
                    }, function (data) {
                    }, true);
            })
        };

    });
</script>