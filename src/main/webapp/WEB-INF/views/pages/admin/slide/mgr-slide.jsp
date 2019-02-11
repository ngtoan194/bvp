<%--
  Created by IntelliJ IDEA.
  User: Huyen
  Date: 10/23/2018
  Time: 10:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="right_col" role="main" ng-controller="mgrSlideController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size: 18px;">Danh sách Slide
                        </h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <%--<li><a href="#">Settings 1</a></li>--%>
                                    <%--<li><a href="#">Settings 2</a></li>--%>
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
                                    <label style="font-weight: normal; text-align: left; white-space: nowrap;">Hiện
                                        thị</label>
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
                                    <button type="submit" class="btn btn-success" ng-click="showSlide()">Thêm mới
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-striped table-bordered dataTable no-footer">
                                    <thead>
                                    <tr class="table-tr-th">
                                        <th style="width: 5%;" class="time-item text-center" v>STT</th>
                                        <th class="time-item text-center">ID</th>
                                        <th style="width: 10%;" class="time-item text-center">Tên slide</th>
                                        <th style="width: 10%;" class="time-item text-center">Thời gian chờ</th>
                                        <th style="width: 35%;" class="time-item text-center">Slide item</th>
                                        <th style="width: 10%;" class="time-item text-center">Kích hoạt</th>
                                        <th style="width: 15%;" class="time-item text-center">Tạo ngày</th>
                                        <th style="width: 10%;" class="time-item text-center">Tiện ích</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td><input type="text" style="width: 100%; padding: 5px;" class="form-control"
                                                   placeholder="Nhập tên slide để tìm kiếm"
                                                   ng-model="name" ng-enter="loadPage(1)"></td>
                                        <td class="center"></td>
                                        <td class="center"></td>
                                        <td class="center">
                                            <select ng-model="active" class="form-control"
                                                    ng-change="loadPage(1)" style="width:100%; height: 30px;">
                                                <option value="">Tất cả</option>
                                                <option ng-value="0">Chưa kích hoạt</option>
                                                <option ng-value="1">Kích hoạt</option>
                                            </select>
                                        </td>
                                        <td class="center"></td>
                                        <td class="center"></td>
                                    </tr>
                                    <tr class="table-tr-th" ng-repeat="item in slide">
                                        <td class="time-item text-center">
                                            {{$index + stt}}
                                        </td>
                                        <td class="time-item text-center">
                                            {{item.slide.id}}
                                        </td>
                                        <td class="time-item text-center" style="min-width: 80px;">
                                            {{item.slide.name}}
                                        </td>
                                        <td class="time-item text-center" style="min-width: 80px; text-align: center">
                                            {{item.slide.intervalTime/1000}} (giây)
                                        </td>
                                        <td class="time-item text-center" style="min-width: 80px;">
                                            <div class="time-item" style="list-style: none"
                                                 ng-repeat="item2 in item.slideItems">
                                                <li style="margin-top: 5px;" class="text-center">
                                                    <img ng-src="{{item2.image.absoluteUrl()}}"
                                                         style="width: 300px; height: 111px;margin-bottom: 0px">
                                                </li>
                                            </div>
                                        </td>

                                        <td class="time-item text-center" style="text-align: center;">
                                            <a ng-if="item.slide.active">
                                                <i style="color: #05733e;" class="fa fa-check-circle"></i>
                                            </a>
                                        </td>
                                        <td class="time-item text-center" style="min-width: 80px; text-align: center">
                                            {{item.slide.createdDate.toDateObject('-').format("dd-MM-yyyy")}}
                                        </td>
                                        <td class="time-item text-center">
                                            <div class="btn-group">
                                                <button data-toggle="dropdown" type="button"
                                                        class="btn btn-success dropdown-toggle btn-xs">
                                                    <span class="caret"></span>
                                                </button>
                                                <ul role="menu" class="dropdown-menu">
                                                    <li ng-if="!item.slide.active">
                                                        <a ng-click="activeSlide(item.slide)">
                                                            <i class="fa fa-check-circle"></i>Active
                                                        </a>
                                                    </li>
                                                    <li ng-if="item.slide.active">
                                                        <a ng-click="activeSlide(item.slide)">
                                                            <i class="fa fa-times-circle"></i>In-active
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a data-toggle="modal" ng-click="showdataUpdate(item)">
                                                            <i class="fa fa-pencil-square-o"></i>Sửa
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a data-toggle="modal"
                                                           ng-click="deleteSlide(item)">
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
                                <div class="paging_simple_numbers" id="datatable_paginate"
                                     ng-if="slide.length>0">
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
                    <div class="modal fade popup-edit" id="popup-add-slide">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" ng-click="closedSlide()">
                                        &times;
                                    </button>
                                    <h2 class="text-center" ng-if="dataSlide.id==null">Thêm mới slide</h2>
                                    <h2 class="text-center" ng-if="dataSlide.id!=null">Cập nhật slide</h2>
                                </div>
                                <form id="form-slide" novalidate="novalidate" class="smart-form"
                                      ng-validate="validationSlide">
                                    <div class="modal-body" style="padding: 30px;">
                                        <div class="row">
                                            <div class="form-item">
                                                <span class="form-label">Tên slide* :</span>
                                                <div class="input-text">
                                                    <input class="form-control" id="nameSlide" name="nameSlide"
                                                           placeholder="Nhập tên slide" type="text"
                                                           ng-model="dataSlide.name">
                                                </div>
                                            </div>
                                            <div class="form-item">
                                                <span class="form-label">Thời gian*: (giây)</span>
                                                <div class="input-text">
                                                    <input class="form-control" id="intervalTime"
                                                           name="intervalTime"
                                                           placeholder="Nhập thời gian chờ" type="text"
                                                           ng-model="dataSlide.intervalTime">
                                                </div>
                                            </div>
                                            <div class="form-item">
                                                <span class="form-label">Slide item*: </span>
                                                <div class="input-text">
                                                    <select style="width: 100%; height: 66px;" id="slideItemIds"
                                                            ng-select
                                                            multiple name="slideItemIds"
                                                            ng-model="slideItemIds" class="form-control">
                                                        <option ng-repeat="item in slideItem"
                                                                ng-value="item.slideItem.id">
                                                            {{item.slideItem.name}}
                                                        </option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-item">
                                                <div style="margin-top: 15px; margin-bottom: 15px">
                                                    <i ng-click="checkActiveSlide(true)" style="cursor: pointer"
                                                       ng-if="!checkActive" class="fa fa-square-o  fa-lg"></i>
                                                    <i ng-click="checkActiveSlide(false)" style="cursor: pointer"
                                                       ng-if="checkActive" class="fa fa-check-square-o fa-lg"></i>
                                                    Kích hoạt
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <footer>
                                            <button class="btn btn-success" ng-if="dataSlide.id==null"
                                                    ng-click="createSlide()">Thêm
                                            </button>
                                            <button class="btn btn-success" ng-if="dataSlide.id!=null"
                                                    ng-click="updateSlide(dataSlide)">Cập nhật
                                            </button>
                                            <button class="btn btn-success"
                                                    ng-click="closedSlide()">Hủy
                                            </button>
                                        </footer>
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
    ngApp.controller('adminSlideController', function ($scope, $http, httpRequest) {
        $scope.checkActive = true;
        $scope.checkActiveSlide = function (active) {
            $scope.checkActive = active;
        }
        $scope.slide = [];
        $scope.slideItem = [];
        $scope.dataSlide = {};
        $scope.slideItemIds = [];
        $scope.sttSlide = 1;
        $scope.query = "";
        $scope.active = "";
        $scope.size = 10;
        $scope.intervalTime = "";
        $scope.autoPlay = "";
        $scope.name = "";
        $scope.webType = 1;
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
            var url = "/slide/search?"
                + "page=" + $scope.page
                + "&size=" + $scope.size
                + "&name=" + $scope.name
                + "&active=" + $scope.active
                + "&intervalTime=" + $scope.intervalTime
                + "&autoPlay=" + $scope.autoPlay
                + "&webType=" + $scope.webType
            httpRequest.get(url
                , function (data) {
                    if (data.success) {
                        $scope.slide = data.data.data;
                        $scope.totalPage = common.getTotalPage($scope.size, data.data.total);
                        $scope.sttSlide = 1 + ($scope.page - 1) * $scope.size;
                        $scope.listPage = [];
                        for (var i = $scope.page - 5; i < $scope.page + 5; i++) {
                            if (i > 0 && i <= $scope.totalPage)
                                $scope.listPage.push(i);
                        }
                        window.history.replaceState({}, "", "/admin/slide?trang=" + $scope.page);
                    }
                }, function (data) {
                }, true);
        };
        $scope.loadPage(urlPage);
        httpRequest.get("/slide-item/search?"
            + "page=" + $scope.page
            + "&size=" + $scope.size
            + "&name=" + $scope.name
            + "&webType=" + $scope.webType
            , function (data) {
                if (data.success) {
                    $scope.slideItem = data.data.data;
                }
            }, function (data) {
            }, true);
        $.validator.addMethod("selectCheck", function (value, element) {
            if ($(element).find("option").length > 1 && !value)
                return false;
            return true;
        }, "Vui lòng chọn slide item!");
        $.validator.addMethod("noFirstSpace", function (value, element) {
            return value && value[0] != ' ';
        }, "Vui lòng không để khoảng trống đầu dòng!");
        $scope.validationSlide = {
            rules: {
                nameSlide: {
                    required: true,
                    noFirstSpace: true
                },
                intervalTime: {
                    required: true,
                    number: true,
                },
                slideItemIds: {
                    required: true,
                    selectCheck: true
                },
            },
            messages: {
                nameSlide: {
                    required: "Vui lòng nhập tên slide!",
                },
                intervalTime: {
                    required: "Vui lòng nhập thời gian chờ",
                    number: "Vui lòng nhập thời gian chờ bằng số",
                },
                slideItemIds: {
                    required: "Vui lòng chọn slide item!",
                }
            }
        }
        $scope.createSlide = function () {
            $scope.dataSlide.active = $scope.checkActive ? 1 : 0;
            if ($("#form-slide").valid()) {
                httpRequest.post("/slide/create"
                    , {
                        slide: {
                            name: $scope.dataSlide.name,
                            active: $scope.dataSlide.active,
                            intervalTime: $scope.dataSlide.intervalTime * 1000,
                            webType: webType,
                        }
                        , slideItemIds: $scope.slideItemIds
                    }
                    , function (data) {
                        if (data.success) {
                            alertSmallBox(data.data, success);
                            setTimeout(function () {
                                $scope.closedSlide();
                                $scope.loadPage(urlPage);
                            }, 1000)
                        } else {
                            alertSmallBox(data.message, error);
                        }
                    }, function (data) {
                    }, true);
            }
        }
        $scope.deleteSlide = function (item) {
            confirmDialog("Xác nhận", "Bạn có chắc chắn muốn xóa slide này?", function () {
                $http({
                    method: 'DELETE',
                    url: '/slide/delete/' + item.slide.id,
                }).then(function successCallback(response) {
                    if (response.data.success) {
                        alertSmallBox(response.data.data, success);
                        setTimeout(function () {
                            $scope.loadPage(urlPage);
                        }, 1000)
                    }
                    else
                        alertSmallBox(response.data.message, error);
                });
            });
        };

        $scope.showdataUpdate = function (item) {
            $scope.showSlide();
            $scope.dataSlide = JSON.parse(JSON.stringify(item.slide));
            if (item.slide.active == 1) {
                $scope.dataSlide.active = true;
            } else {
                $scope.dataSlide.active = false;
            }
            $scope.dataSlide.intervalTime = item.slide.intervalTime / 1000;
            for (var i = 0; i < item.slideItems.length; i++) {
                $scope.slideItemIds[i] = item.slideItems[i].id;
            }

        }
        $scope.updateSlide = function (dataSlide) {
            if ($("#form-slide").valid()) {
                $scope.dataSlide.active = $scope.checkActive ? 1 : 0;
                httpRequest.post("/slide/update/" + dataSlide.id
                    , {
                        slide: {
                            name: $scope.dataSlide.name,
                            active: $scope.dataSlide.active,
                            timeInterval: $scope.dataSlide.timeInterval * 1000,
                            webType: webType,
                        }, slideItemIds: $scope.slideItemIds
                    }
                    , function (data) {
                        if (data.success) {
                            alertSmallBox(data.data, success);
                            setTimeout(function () {
                                $scope.closedSlide();
                                $scope.loadPage(urlPage);
                            }, 1000)
                        } else {
                            alertSmallBox(data.message, error);
                        }
                    }, function (data) {
                    }, true);
            }
        }

        $scope.activeSlide = function (item) {
            debugger
            if (item.active == 1) {
                var content = "Bạn có chắc chắn muốn hủy kích hoạt slide này?";
                var data = {active: 0};
                var message = "Hủy kích hoạt thành công!";
                var error = "Hủy kích hoạt thất bại!"
            } else {
                content = "Bạn có chắc chắn muốn kích hoạt slide này?";
                data = {active: 1}
                message = "Kích hoạt slide thành công!";
                error = "Kích hoạt slide thất bại!"
            }
            confirmDialog("XÁC NHẬN", content, function () {
                httpRequest.post("/slide/active/" + item.id,
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
        $scope.canceldataSlide = function () {
            $scope.dataSlide = {};
            $scope.slideItemIds = [];
            $scope.checkActive = true;

        }
        $scope.showSlide = function () {
            $("#popup-add-slide").modal('show');
        }
        $scope.closedSlide = function () {
            $("#popup-add-slide").modal('hide');
            $("label.error").attr("style", "display:none;");
            $scope.canceldataSlide();
        }
    });
</script>