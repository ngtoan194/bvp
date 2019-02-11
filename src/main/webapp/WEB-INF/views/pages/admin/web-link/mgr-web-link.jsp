<%--
  Created by IntelliJ IDEA.
  User: Huyen
  Date: 10/19/2018
  Time: 2:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="right_col" role="main" ng-controller="adminWebLinkController">
    <div class="">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size: 18px;">Danh sách web link
                        </h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Settings 1</a>
                                    </li>
                                    <li><a href="#">Settings 2</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="dataTables_length" id="datatable_length" style="width: 40%; float: left;">
                                    <label style="font-weight: normal; text-align: left; white-space: nowrap;">Hiện</label>
                                    <label>
                                        <select name="datatable_length" aria-controls="datatable"
                                                ng-init="size ='10'" n ng-model="size"
                                                class="form-control input-sm" ng-change="loadPage(1)">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                    </label>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div id="datatable_filter" class="dataTables_filter">
                                    <button type="submit" class="btn btn-success" ng-click="showPopupAddWebLink()">Thêm
                                        mới
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-striped table-bordered dataTable no-footer">
                                    <thead>
                                    <tr class="table-tr-th">
                                        <th class="time-item text-center">STT</th>
                                        <th class="time-item text-center">Tên web link</th>
                                        <th class="time-item text-center">Link</th>
                                        <th class="time-item text-center">Ảnh</th>
                                        <th class="time-item text-center">Ngày tạo</th>
                                        <th class="time-item text-center">Tiện ích</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="table-tr-th">
                                        <td class="time-item text-center"></td>
                                        <td class="time-item text-center">
                                            <div class="time-item">
                                                <input type="text" class="form-control"
                                                       placeholder="Nhập tên web link để tìm kiếm"
                                                       ng-model="name" ng-enter="loadPage(1)">
                                            </div>
                                        </td>
                                        <td class="time-item text-center"></td>
                                        <td class="time-item text-center"></td>
                                        <td class="time-item text-center"></td>
                                        <td class="time-item text-center"></td>
                                    </tr>
                                    <tr class="table-tr-th" ng-repeat="item in webLink">
                                        <td class="time-item text-center">
                                            {{$index + sttWebLink}}
                                        </td>
                                        <td class="time-item text-center">
                                            {{item.webLink.name}}
                                        </td>
                                        <td class="time-item text-center">
                                            <a style="width: 50px !important; text-overflow: clip; word-break: break-word;"
                                               href="{{item.webLink.link}}">{{item.webLink.link}}</a>
                                        </td>
                                        <td class="time-item text-center">
                                            <img style="height: 100px; object-fit: cover !important"
                                                 ng-src="{{item.webLink.image.absoluteUrl()}}">
                                        </td>
                                        <td class="time-item text-center">
                                            {{item.webLink.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")}}
                                        </td>
                                        <td class="time-item text-center">
                                            <div class="btn-group">
                                                <button data-toggle="dropdown" type="button"
                                                        class="btn btn-success dropdown-toggle btn-xs">
                                                    <span class="caret"></span>
                                                </button>
                                                <ul role="menu" class="dropdown-menu">
                                                    <li>
                                                        <a data-toggle="modal" ng-click="showdataUpdate(item)">
                                                            <i class="fa fa-pencil-square-o"></i>Sửa
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a data-toggle="modal"
                                                           ng-click="deleteWebLink(item)">
                                                            <i class="fa fa-times"></i>Xóa
                                                        </a>
                                                    </li>
                                                </ul>
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
                                <div class="paging_simple_numbers" id="datatable_paginate">
                                    <ul class="pagination pull-right">
                                        <li ng-click="loadPage(1)" style="cursor: pointer;"
                                            class="paginate_button previous {{page==1?'disabled':''}}">
                                            <a>Trang đầu</a>
                                        </li>
                                        <li ng-repeat="itemPage in listPage | limitTo : 10" style="cursor: pointer;"
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

                    <div class="modal fade bs-example-modal-lg" id="modal-add-webLink" tabindex="-1"
                         role="dialog"
                         aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content" style="width: 600px; margin: 150px">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span
                                            aria-hidden="true" ng-click="closedPopupWebLink()">×</span>
                                    </button>
                                    <h3 class="modal-title" ng-if="dataWebLink.id == null">Thêm mới web link</h3>
                                    <h3 class="modal-title" ng-if="dataWebLink.id != null">Thêm mới web link</h3>
                                </div>
                                <form id="form-webLink" novalidate="novalidate"
                                      class="smart-form" ng-validate="validationWebLink">
                                    <div class="modal-body">
                                        <div class="form-item">
                                            <div class="input-inner">
                                                <span class="form-label">Tên web link*</span>
                                                <div class="input-text">
                                                    <input type="text" class="form-control" name="name"
                                                           placeholder="Nhập tên web link..."
                                                           ng-model="dataWebLink.name">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-item">
                                            <div class="input-inner">
                                                <span class="form-label">Web link*</span>
                                                <div class="input-text">
                                                    <input type="text" class="form-control" name="link"
                                                           placeholder="Nhập web link..."
                                                           ng-model="dataWebLink.link">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="input-inner">
                                            <div class="form-label" style="margin-top: 10px;">Ảnh*
                                            </div>
                                            <div class="input input-file" style="margin-top: 10px;">
                                                <div class="button"
                                                     style="margin-top: 5px; margin-right: 20px;">
                                                    <input type="file" id="select-file-image-cover"
                                                           name="file1"
                                                           accept="image/x-png,image/gif,image/jpeg"
                                                           ng-file-change="imgWebLinkThumbnail.selectFile"
                                                           file-input-id="{{webLink.id}}"
                                                           ng-model="dataWebLink.image">Chọn
                                                </div>
                                                <input type="text" style="padding-right: 80px !important;"
                                                       class="form-control" id="text-file-name"
                                                       placeholder="Chọn file ảnh" readonly
                                                       ng-model="dataWebLink.image"/>
                                            </div>
                                            <div style="width: 100%; height: auto; display: flex;align-items:center; justify-content:center;">
                                                <img style="max-width: 100%; max-height:229px; margin-top: 10px;"
                                                     ng-if="dataWebLink.image"
                                                     id="img-cover"
                                                     ng-src="{{dataWebLink.image.absoluteUrl()}}">
                                                <img ng-if="uploadingImg"
                                                     src="/static/images/loading/loading2.gif"
                                                     style="width: 69px; position: absolute; top: 65%; left: 44%;"/>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary" ng-click="createWebLink()"
                                                    ng-if="!dataWebLink.id && !uploadingImg">Thêm mới
                                            </button>
                                            <button type="button" class="btn btn-primary" ng-click="updateWebLink()"
                                                    ng-if="dataWebLink.id && !uploadingImg">Cập nhật
                                            </button>
                                            <button type="button" class="btn btn-default" data-dismiss="modal"
                                                    ng-click="closedPopupWebLink()">
                                                Hủy
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
<script>
    ngApp.controller('adminWebLinkController', function ($scope, $http, httpRequest, fileManager) {
        $scope.webLink = [];
        $scope.dataWebLink = {};
        $scope.sttWebLink = 1;
        $scope.name = "";
        $scope.size = 10;
        $scope.link = "";
        $scope.image = "";
        $scope.startDate = "";
        $scope.endDate = "";
        var urlPage = common.getQueryStringHash("trang");
        if (urlPage) {
            if (urlPage % 1 === 0) {
                $scope.page = urlPage;
            } else {
                urlPage = 1;
            }
        } else {
            urlPage = 1;
        }
        $scope.loadPage = function (urlPage) {
            $scope.page = urlPage;
            var url = "/webLink/searchWebLink?"
                + "&page=" + $scope.page
                + "&size=" + $scope.size
                + "&name=" + $scope.name
                + "&link=" + $scope.link
                + "&image=" + $scope.image
                + "&startDate=" + $scope.startDate
                + "&endDate=" + $scope.endDate
            httpRequest.get(url
                , function (data) {
                    if (data.success) {
                        $scope.webLink = data.data.data;
                        $scope.totalPage = common.getTotalPage($scope.size, data.data.total);
                        $scope.sttWebLink = 1 + ($scope.page - 1) * $scope.size;
                        $scope.listPage = [];
                        for (var i = $scope.page - 5; i < $scope.page + 5; i++) {
                            if (i > 0 && i <= $scope.totalPage)
                                $scope.listPage.push(i);
                        }
                        window.history.replaceState({}, "", "/admin/web-link?trang=" + $scope.page);
                    }
                }, function (data) {
                }, true);
        };
        $scope.loadPage(urlPage);
        $scope.uploadingImg = false;
        $scope.imgWebLinkThumbnail = {
            chooseFile: function () {
                $("[file-input-id]").trigger("click");
            },
            selectFile: function () {
                var selector = $(event.target);
                var fileName = selector[0].value.replace("C:\\fakepath\\", "").toLocaleLowerCase();
                if (common.endWith(fileName, ".jpg") ||
                    common.endWith(fileName, ".png") ||
                    common.endWith(fileName, ".gif")) {
                    $scope.dataWebLink.image = URL.createObjectURL(selector[0].files[0]);
                    $scope.uploadingImg = true;
                    fileManager.upload(selector[0].files[0], function (data) {
                        if (data.success) {
                            $scope.dataWebLink.image = data.data.images[0].image;
                            $scope.uploadingImg = false;
                            $scope.$apply();
                        } else {
                            alertSmallBox("Thêm ảnh lỗi");
                        }
                    }, function (response) {
                    });
                } else {
                    $("#select-file-image-cover").val("");
                    alertSmallBox("Vui lòng chọn hình ảnh có định dạng png, jpg, gif")
                }
            }
        };
        $.validator.addMethod("noFirstSpace", function (value, element) {
            return value && value[0] != ' ';
        }, "Vui lòng không để khoảng trống đầu dòng!");
        $scope.validationWebLink = {
            rules: {
                name: {
                    required: true,
                    noFirstSpace: true
                },
                link: {
                    required: true,
                    url: true
                },
                file1: {
                    required: function () {
                        if (!$scope.dataWebLink.image) {
                            return true;
                        }
                        return false;
                    }
                }
            },
            errorPlacement: function (error, element) {
                if (element.attr("id") === "select-file-image-cover") {
                    error.insertAfter($("#text-file-image-cover-name").parent());
                } else {
                    error.insertAfter(element.parent());
                }
            },
            messages: {
                name: {
                    required: "Vui lòng nhập tên web link!",
                },
                link: {
                    required: "Vui lòng nhập link web",
                    url: "Vui lòng nhập đúng định dạng link web!"
                },
                file1: {
                    required: "Vui lòng chọn ảnh cho web link!"
                }
            }
        }

        $scope.createWebLink = function () {
            if (!$scope.dataWebLink.image) {
                alertSmallBox("Vui lòng chọn ảnh!", error);
                return;
            }
            if ($("#form-webLink").valid()) {
                httpRequest.post("/webLink/createWebLink"
                    , {webLink: $scope.dataWebLink}
                    , function (data) {
                        if (data.success) {
                            alertSmallBox(data.data, success);
                            $scope.loadPage(urlPage);
                            $scope.closedPopupWebLink();
                        } else {
                            alertSmallBox(data.message, error);
                        }
                    }, function (data) {
                    }, true);
            }
        }

        $scope.resetImgInput = function () {
            $("#select-file-image-cover").val("");
        }
        $scope.canceldataWebLink = function () {
            $scope.dataWebLink = {};
            $scope.resetImgInput();
        }
        $scope.deleteWebLink = function (item) {
            debugger
            confirmDialog("Xác nhận", "Bạn có chắc chắn muốn xóa web link này?", function () {
                $http({
                    method: 'DELETE',
                    url: '/webLink/deleteWebLink/' + item.webLink.id,
                }).then(function successCallback(response) {
                    debugger
                    if (response.data.success) {
                        alertSmallBox(response.data.data, success);
                        $scope.loadPage(urlPage);
                    }
                    else
                        alertSmallBox(response.data.message, error);
                });
            });
        }
        $scope.showdataUpdate = function (item) {
            debugger
            $scope.showPopupAddWebLink();
            $scope.dataWebLink = JSON.parse(JSON.stringify(item.webLink));
            $scope.webLinkId = $scope.dataWebLink.id;
        }

        $scope.updateWebLink = function () {
            if (!$scope.dataWebLink.image) {
                alertSmallBox("Vui lòng chọn ảnh!", error);
                return;
            }
            if ($("#form-webLink").valid()) {
                httpRequest.post("/webLink/updateWebLink/" + $scope.webLinkId,
                    {webLink: $scope.dataWebLink},
                    function (data) {
                        if (data.success) {
                            alertSmallBox(data.data, success);
                            $scope.loadPage(urlPage);
                            $scope.closedPopupWebLink();
                        } else {
                            alertSmallBox(data.message, error);
                        }
                    }, function (data) {
                    }, true);
            }
        }
        $scope.showPopupAddWebLink = function () {
            $("#modal-add-webLink").modal('show');
        }
        $scope.closedPopupWebLink = function () {
            $("label.error").attr("style", "display:none;");
            $("#modal-add-webLink").modal('hide');
            $scope.canceldataWebLink();
        }
    });
</script>