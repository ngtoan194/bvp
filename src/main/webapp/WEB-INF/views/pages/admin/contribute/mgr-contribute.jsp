<%--
  Created by IntelliJ IDEA.
  User: Huyen
  Date: 10/18/2018
  Time: 4:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="right_col" role="main" ng-controller="adminContributeController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="min-width: 50%; font-size: 18px;">Danh sách góc tri ân
                            <small></small>
                        </h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li>
                                <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-expanded="false"><i class="fa fa-wrench"></i>
                                </a>
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
                                    <a type="submit" class="btn btn-success" href="/admin/goc-tri-an/them-moi">Thêm mới</a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div>
                                <div class="well padding-10">
                                    <table class="table table-striped table-bordered dataTable no-footer">
                                        <thead>
                                        <tr class="table-tr-th">
                                            <th class="time-item text-center">STT</th>
                                            <th class="time-item text-center">Ảnh đại diện</th>
                                            <th class="time-item text-center">Người tri ân</th>
                                            <th class="time-item text-center">Tiêu đề</th>
                                            <th class="time-item text-center">Ngày tạo</th>
                                            <th class="time-item text-center">Sửa/Xóa</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr class="table-tr-th">
                                            <td class="time-item text-center"></td>
                                            <td class="time-item text-center"></td>
                                            <td class="time-item text-center">
                                                <input type="text" style="width: 100%; padding: 5px;"
                                                       class="form-control"
                                                       placeholder="Nhập tên người tri ân để tìm kiếm"
                                                       ng-model="author" ng-enter="loadPage(1)">
                                            </td>
                                            <td class="time-item text-center">
                                                <input type="text" style="width: 100%; padding: 5px;"
                                                       class="form-control"
                                                       placeholder="Nhập tiêu đề tri ân để tìm kiếm"
                                                       ng-model="title" ng-enter="loadPage(1)"></td>
                                            <td class="time-item text-center"></td>
                                            <td class="time-item text-center"></td>
                                        </tr>
                                        <tr class="table-tr-th" ng-repeat="item in contribute" ng-if="item!=null">
                                            <td class="time-item text-center">
                                                {{$index + sttContribute}}
                                            </td>
                                            <td class="time-item text-center" style="min-width: 80px;">
                                                <img style="width: 80px; height: 80px; object-fit: cover !important; "
                                                     ng-src="{{item.contribute.authorAvatar.absoluteUrl('/static/images/Profile1.png')}}">
                                            </td>
                                            <td class="time-item text-center" style="min-width: 80px;">
                                                {{item.contribute.author}}
                                            </td>
                                            <td class="time-item text-center" style="min-width: 80px;">
                                                {{item.contribute.title}}
                                            </td>
                                            <td class="time-item text-center" style="min-width: 80px;">
                                                {{
                                                item.contribute.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")
                                                }}
                                            </td>
                                            <td class="time-item text-center">
                                                <div class="btn-group">
                                                    <button data-toggle="dropdown" type="button"
                                                            class="btn btn-success dropdown-toggle btn-xs">
                                                        <span class="caret"></span>
                                                    </button>
                                                    <ul role="menu" class="dropdown-menu">
                                                        <li>
                                                            <a target="_blank"
                                                               href="/tin-tri-an/{{item.contribute.linkAlias}}">
                                                                <i class="fa fa-eye"></i>Xem chi tiết
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a data-toggle="modal"
                                                              href="/admin/goc-tri-an/sua-goc-tri-an/{{item.contribute.id}}">
                                                                <i class="fa fa-pencil-square-o"></i>Sửa
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a data-toggle="modal"
                                                               ng-click="deleteContribute(item.contribute)">
                                                                <i class="fa fa-times"></i>Xóa
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr ng-if="contribute.length == 0">
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .tag [data-role=remove] {
        padding-top: 6px !important;
        height: 18px !important;
        width: 16px !important;
    }

    .smart-form .label.tag {
        display: inline-block !important;
        color: #FFF !important;
        max-width: 210px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .bootstrap-tagsinput {
        padding-right: 1px !important;
    }
</style>
<style>
    #table-list-mgr th {
        text-align: center;
        vertical-align: middle;
    }
</style>
<script>
    ngApp.controller('adminContributeController', function ($scope, $http, httpRequest, fileManager) {
        $scope.contribute = [];
        $scope.dataContribute = {};
        $scope.sttContribute = 1;
        $scope.title = "";
        $scope.content = "";
        $scope.endDate = "";
        $scope.startDate = "";
        $scope.size = 10;
        $scope.author = "";
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
            var url = "/contribute/searchContribute?"
                + "page=" + $scope.page
                + "&size=" + $scope.size
                + "&content=" + $scope.content
                + "&title=" + $scope.title
                + "&author=" + $scope.author
                + "&startDate=" + $scope.startDate
                + "&endDate=" + $scope.endDate
            httpRequest.get(url, function (data) {
                if (data.success) {
                    $scope.contribute = data.data.data;
                    $scope.totalPage = common.getTotalPage($scope.size, data.data.total);
                    $scope.sttContribute = 1 + ($scope.page - 1) * $scope.size;
                    $scope.listPage = [];
                    for (var i = $scope.page - 5; i < $scope.page + 5; i++) {
                        if (i > 0 && i <= $scope.totalPage)
                            $scope.listPage.push(i);
                    }
                    window.history.replaceState({}, "", "/admin/goc-tri-an?trang=" + $scope.page);
                    setTimeout(function () {
                        $("[rel=tooltip]").tooltip();
                    }, 1000);
                }
            }, function (data) {
            }, true);
        };
        $scope.loadPage(urlPage);
        $scope.uploadingImg = false;
        $scope.imgContributeThumbnail = {
            chooseFile: function () {
                $("[file-input-id]").trigger("click");
            },
            selectFile: function () {
                var selector = $(event.target);
                var fileName = selector[0].value.replace("C:\\fakepath\\", "").toLocaleLowerCase();
                if (common.endWith(fileName, ".jpg") ||
                    common.endWith(fileName, ".png") ||
                    common.endWith(fileName, ".gif")) {
                    $scope.dataContribute.authorAvatar = URL.createObjectURL(selector[0].files[0]);
                    $scope.uploadingImg = true;
                    fileManager.upload(selector[0].files[0], function (data) {
                        if (data.success) {
                            $scope.dataContribute.authorAvatar = data.data.images[0].image;
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
        $.validator.addMethod("isFullName", function (value, element) {
            return value.isFullName();
        }, "Tên người tri ân vui lòng không nhập ký tự đặc biệt hoặc số!");

        $scope.deleteContribute = function (item) {
            confirmDialog("Xác nhận", "Bạn có chắc chắn muốn xóa tri ân này?", function () {
                $http({
                    method: 'DELETE',
                    url: '/contribute/deleteContribute/' + item.id,
                }).then(function successCallback(response) {
                    if (response.data.success) {
                        alertSmallBox(response.data.data, success);
                        $scope.loadPage(urlPage);
                    }
                    else
                        alertSmallBox(response.data.message, error);
                });
            });
        };

        $scope.resetImgInput = function () {
            $("#select-file-image-cover").val("");
            for (instance in CKEDITOR.instances) {
                CKEDITOR.instances[instance].setData("");
            }
        }
        $scope.canceldataContribute = function () {
            $scope.dataContribute = {};
            $scope.resetImgInput();
        }
    });
</script>