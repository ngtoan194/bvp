<%--
  Created by IntelliJ IDEA.
  User: Huyen
  Date: 10/12/2018
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="right_col" role="main" ng-controller="adminNewsHoiLaoController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="min-width: 50%; font-size: 18px;">Danh sách tin tức từ hội Lao
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
                        </div>
                        <div class="row">
                            <div>
                                <div class="well padding-10">
                                    <table class="table table-striped table-bordered dataTable no-footer">
                                        <thead>
                                        <tr class="table-tr-th">
                                            <th class="text-center">STT</th>
                                            <th class="text-center">Tiêu đề</th>
                                            <th class="text-center">Trạng thái</th>
                                            <th class="text-center">Tiện ích</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr class="table-tr-th" ng-repeat="item in data">
                                            <td class="text-center">{{$index + sttNewsHoiLao}}</td>
                                            <td>
                                                <div class="time-item text-center">
                                                    <div class="name-page" style="text-align: left">{{item.news.title}}</div>
                                                </div>
                                            </td>
                                            <td class="time-item text-center">
                                                <span ng-if="item.news.fromHoiLao == 1">
                                                    <span class="label label-default"
                                                          style="background-color: #089250de; margin-right: 5px">
                                                        Xác nhận
                                                    </span>
                                                    <span class="label label-default"
                                                          style="background-color: #089250de; margin-right: 5px">
                                                        Hủy xác nhận
                                                    </span>
                                                </span>
                                                <span ng-if="item.news.fromHoiLao == 2" class="label label-default"
                                                      style="background-color: #089250de;">Hủy xác nhận
                                                </span>
                                            </td>
                                            <td class="time-item text-center">
                                                <div class="btn-group">
                                                    <button data-toggle="dropdown" type="button"
                                                            class="btn btn-success dropdown-toggle btn-xs">
                                                        <span class="caret"></span>
                                                    </button>
                                                    <ul role="menu" class="dropdown-menu">
                                                        <li ng-if="item.news.fromHoiLao == 1" >
                                                            <a target="_blank" ng-click="rejectMoveToBvp(item.news)">
                                                                <i class="glyphicon glyphicon-ban-circle" style="margin-right: 10px"></i>Hủy xác nhận
                                                            </a>
                                                        </li>
                                                        <li ng-if="item.news.fromHoiLao == 1" >
                                                            <a target="_blank" ng-click="acceptMoveToBvp(item.news)">
                                                                <i class="glyphicon glyphicon-ok-sign" style="margin-right: 10px"></i>Xác nhận
                                                            </a>
                                                        </li>
                                                        <li ng-if="item.news.fromHoiLao == 2" >
                                                            <a target="_blank" ng-click="rejectMoveToBvp(item.news)">
                                                                <i class="glyphicon glyphicon-remove-sign" style="margin-right: 10px"></i>Hủy xác nhận
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
                                         ng-if="data.length>0">
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('adminNewsHoiLaoController', function ($scope, httpRequest, $http) {
        $scope.data = [];
        $scope.stt = 1;
        $scope.size = 10;
        $scope.content = "";
        $scope.isHotNews = "";
        $scope.menuIdSearch = "";
        $scope.fromHoiLao = 3;
        $scope.charity = "";
        $scope.highlightNoti = "";
        $scope.belongDepartment = "";
        $scope.pageId = "";
        $scope.type = "";
        $scope.title ="";
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
            var url = "/mgrNews/newsSearch?"
                + "page=" + $scope.page
                + "&size=" + $scope.size
                + "&content=" + $scope.content
                + "&isHotNews=" + $scope.isHotNews
                + "&menuId=" + $scope.menuIdSearch
                + "&webType=2"
                + "&fromHoiLao=" + $scope.fromHoiLao
                + "&charity=" + $scope.charity
                + "&highlightNoti=" + $scope.highlightNoti
                + "&belongDepartment=" + $scope.belongDepartment
                + "&pageId=" + $scope.pageId
                + "&type=" + $scope.type
                + "&title=" + $scope.title
                + "&startDate=" + $scope.startDate
                + "&endDate=" + $scope.endDate
            httpRequest.get(url
                , function (data) {
                    if (data.success) {
                        $scope.data = data.data.data;
                        $scope.totalPage = common.getTotalPage($scope.size, data.data.total);
                        $scope.sttNewsHoiLao = 1 + ($scope.page - 1) * $scope.size;
                        $scope.listPage = [];
                        for (var i = $scope.page - 5; i < $scope.page + 5; i++) {
                            if (i > 0 && i <= $scope.totalPage)
                                $scope.listPage.push(i);
                        }
                        window.history.replaceState({}, "", "/admin/tin-tuc-hoi-lao?trang=" + $scope.page);
                    }
                }, function (data) {
                }, true);
        };
        $scope.loadPage(urlPage);
        $scope.group = 1;
        $scope.menuByGroup = [];
        $scope.menuId = "";
        $scope.dataNewsMenu = {};
        $scope.acceptMoveToBvp = function (item) {
            debugger
            confirmDialog("Xác nhận", "Bạn có chắc chắn muốn xác nhận tin tức từ Hội lao?", function () {
                $http({
                    method: 'POST',
                    url: '/news/acceptMoveToBvp/' + item.id,
                }).then(function successCallback(response) {
                    if (response.data.success) {
                        alertSmallBox(response.data.data, success);
                        $scope.loadPage(urlPage);
                    }
                    else
                        alertSmallBox(response.data.message, error);
                });
            });
        }
        $scope.rejectMoveToBvp = function (item) {
            debugger
            confirmDialog("Xác nhận", "Bạn có chắc chắn muốn hủy tin tức từ Hội lao?", function () {
                $http({
                    method: 'POST',
                    url: '/news/rejectMoveToBvp/' + item.id,
                }).then(function successCallback(response) {
                    if (response.data.success) {
                        alertSmallBox(response.data.data, success);
                        $scope.loadPage(urlPage);
                    }
                    else
                        alertSmallBox(response.data.message, error);
                });
            });
        }
    });
</script>