<%--
  Created by IntelliJ IDEA.
  User: Huyen
  Date: 10/12/2018
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="right_col" role="main" ng-controller="mgrNewsController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="min-width: 50%; font-size: 18px;">Quản lý tin tức
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
                                    <a type="submit" class="btn btn-success" href="/admin/tin-tuc/them-moi">Thêm mới</a>
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
                                            <th class="time-item text-center">Tiêu đề</th>
                                            <th class="time-item text-center">Tin nổi bật</th>
                                            <th class="time-item text-center">Góc từ thiện</th>
                                            <th class="time-item text-center">Tin từ hội lao</th>
                                            <th class="time-item text-center">Ngày tạo</th>
                                            <th class="time-item text-center">Tiện ích</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr class="table-tr-th">
                                            <td class="time-item text-center"></td>
                                            <td class="time-item text-center">
                                                <input type="text" class="form-control"
                                                       placeholder="Nhập tên tiêu đề để tìm kiếm"
                                                       ng-model="title" ng-enter="loadPage(1)">
                                            </td>
                                            <td class="time-item text-center">
                                                <div class="item-control">
                                                    <select name="" id="select-type"
                                                            class="select-type form-control"
                                                            ng-model="isHotNews" ng-change="loadPage(1)">
                                                        <option value="">Tất cả</option>
                                                        <option ng-value="0">Tin thường</option>
                                                        <option ng-value="1">Tin nổi bật</option>
                                                    </select>
                                                </div>
                                            </td>
                                            <td class="time-item text-center">
                                                <select name="" id="select-type2"
                                                        class="select-type form-control"
                                                        ng-model="charity" ng-change="loadPage(1)">
                                                    <option value="">Tất cả</option>
                                                    <option value="1">Từ thiện</option>
                                                    <option value="0">Không từ thiện</option>
                                                </select>
                                            </td>
                                            <td class="time-item text-center"></td>
                                            <td class="time-item text-center"></td>
                                            <td class="time-item text-center"></td>
                                        </tr>
                                        <tr class="table-tr-th" ng-repeat="item in data">
                                            <td class="time-item text-center">{{$index + sttNews}}</td>
                                            <td class="time-item text-left">
                                                {{item.news.title}}
                                            </td>
                                            <td class="time-item text-center">
                                                <a ng-if="item.news.isHotNews">
                                                    <i style="color: #05733e;" class="fa fa-check-circle"></i>
                                                </a>
                                            </td>
                                            <td class="time-item text-center">
                                                <a ng-if="item.news.charity">
                                                    <i style="color: #05733e;" class="fa fa-check-circle"></i>
                                                </a>
                                            </td>
                                            <td class="time-item text-center">
                                                <div class="name-page" style="text-align: center">
                                                    <a ng-if="item.news.fromHoiLao==2">
                                                        <i style="color: #05733e;" class="fa fa-check-circle"></i>
                                                    </a>
                                                </div>
                                            </td>
                                            <td class="time-item text-center">
                                                {{item.news.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")}}
                                            </td>
                                            <td class="time-item text-center">
                                                <div class="btn-group">
                                                    <button data-toggle="dropdown" type="button"
                                                            class="btn btn-success dropdown-toggle btn-xs">
                                                        <span class="caret"></span>
                                                    </button>
                                                    <ul role="menu" class="dropdown-menu">
                                                        <li>
                                                            <a target="_blank" href="/tin-tuc/{{item.news.linkAlias}}">
                                                                <i class="fa fa-eye"></i>Xem chi tiết
                                                            </a>
                                                        </li>
                                                        <li ng-if="!item.news.isHotNews">
                                                            <a ng-click="setHotNews(item.news)">
                                                                <i class="fa fa-check-circle"></i>Chọn tin nổi bật
                                                            </a>
                                                        </li>
                                                        <li ng-if="item.news.isHotNews">
                                                            <a ng-click="setHotNews(item.news)">
                                                                <i class="fa fa-times-circle"></i>Hủy tin nổi bật
                                                            </a>
                                                        </li>
                                                        <li ng-if="!item.news.charity">
                                                            <a ng-click="cancelCharity(item.news)">
                                                                <i class="fa fa-check-circle"></i>Chọn tin từ thiện
                                                            </a>
                                                        </li>
                                                        <li ng-if="item.news.charity">
                                                            <a ng-click="cancelCharity(item.news)">
                                                                <i class="fa fa-times-circle"></i>Hủy tin từ thiện
                                                            </a>
                                                        </li>

                                                        <li>
                                                            <a data-toggle="modal" href="#popup-assign-to-menu"
                                                               ng-click="showPopupAssignToMenu(item.news)">
                                                                <i class="fa fa-thumb-tack fa-lg"></i>Phân loại menu
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a data-toggle="modal"
                                                               href="/admin/tin-tuc/sua-tin-tuc/{{item.news.id}}">
                                                                <i class="fa fa-pencil-square-o"></i>Sửa
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a data-toggle="modal"
                                                               ng-click="deleteNews(item.news)">
                                                                <i class="fa fa-trash"></i>Xóa
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a data-toggle="modal"
                                                               ng-click="openPopupWindow('https://www.facebook.com/sharer/sharer.php?u=', item.news)">
                                                                <i class="fa fa-facebook fa-lg"></i>Chia sẻ qua Facebook
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
                        <div class="modal fade popup-confirm popup-active" id="popup-assign-to-menu">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <div class="modal-header">
                                        <p class="modal-title" style="font-size: 20px">Phân loại menu tin tức </p>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-item">
                                            <span class="form-label">Menu</span>
                                            <div class="input-text selectpicker">
                                                <select class="form-control" name="menuAssign" id="menuAssign"
                                                        ng-model="menuAssign">
                                                    <option value="">--- Chọn menu ---</option>
                                                    <option ng-repeat="item in menuByGroup" value="{{item.id}}">
                                                        {{item.name}}
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-success confirm-active"
                                                ng-click="assignToMenu(menuAssign)">Có
                                        </button>
                                        <button type="button" class="btn btn-success" data-dismiss="modal">Không
                                        </button>
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
<%--<script>--%>
    <%--ngApp.controller('mgrNewsController', function ($scope, httpRequest, $http) {--%>
        <%--$scope.data = [];--%>
        <%--$scope.sttNews = 1;--%>
        <%--$scope.page = "";--%>
        <%--$scope.size = 10;--%>
        <%--$scope.content = "";--%>
        <%--$scope.isHotNews = "";--%>
        <%--$scope.menuId = "";--%>
        <%--$scope.fromHoiLao = "";--%>
        <%--$scope.charity = "";--%>
        <%--$scope.highlightNoti = "";--%>
        <%--$scope.belongDepartment = "";--%>
        <%--$scope.pageId = "";--%>
        <%--$scope.type = "";--%>
        <%--$scope.title = "";--%>
        <%--$scope.startDate = "";--%>
        <%--$scope.endDate = "";--%>

        <%--$scope.loadPage = function (page) {--%>
            <%--$scope.page = page;--%>
            <%--var url = "/mgrNews/newsSearch?"--%>
                <%--+ "page=" + $scope.page--%>
                <%--+ "&size=" + $scope.size--%>
                <%--+ "&content=" + $scope.content--%>
                <%--+ "&isHotNews=" + $scope.isHotNews--%>
                <%--+ "&menuId=" + $scope.menuId--%>
                <%--+ "&webType=" + webType--%>
                <%--+ "&fromHoiLao=" + $scope.fromHoiLao--%>
                <%--+ "&charity=" + $scope.charity--%>
                <%--+ "&highlightNoti=" + $scope.highlightNoti--%>
                <%--+ "&belongDepartment=" + $scope.belongDepartment--%>
                <%--+ "&pageId=" + $scope.pageId--%>
                <%--+ "&type=" + $scope.type--%>
                <%--+ "&title=" + $scope.title--%>
                <%--+ "&startDate=" + $scope.startDate--%>
                <%--+ "&endDate=" + $scope.endDate--%>
            <%--httpRequest.get(url--%>
                <%--, function (data) {--%>
                    <%--if (data.success) {--%>
                        <%--$scope.data = data.data.data;--%>
                        <%--$scope.totalPage = common.getTotalPage($scope.size, data.data.total);--%>
                        <%--$scope.sttNews = 1 + ($scope.page - 1) * $scope.size;--%>
                        <%--$scope.listPage = [];--%>
                        <%--for (var i = $scope.page - 5; i < $scope.page + 5; i++) {--%>
                            <%--if (i > 0 && i <= $scope.totalPage)--%>
                                <%--$scope.listPage.push(i);--%>
                        <%--}--%>
                        <%--window.history.replaceState({}, "", "/admin/tin-tuc?trang=" + $scope.page);--%>
                    <%--}--%>
                <%--}, function (data) {--%>
                <%--}, true);--%>
        <%--};--%>
        <%--$scope.loadPage(1);--%>
        <%--$scope.searchTitle = function () {--%>
            <%--$scope.loadPage(1);--%>
        <%--}--%>
        <%--$scope.deleteNews = function (item) {--%>
            <%--confirmDialog("Xác nhận", "Bạn có chắc chắn muốn xóa tin tức này?", function () {--%>
                <%--$http({--%>
                    <%--method: 'DELETE',--%>
                    <%--url: '/news/deleteNews/' + item.id,--%>
                <%--}).then(function successCallback(response) {--%>
                    <%--if (response.data.success) {--%>
                        <%--alertSmallBox(response.data.data, success);--%>
                        <%--$scope.loadPage(1);--%>
                    <%--}--%>
                    <%--else--%>
                        <%--alertSmallBox(response.data.message, error);--%>
                <%--});--%>
            <%--});--%>
        <%--};--%>
        <%--$scope.cancelCharity = function (item) {--%>
            <%--if (item.charity == 1) {--%>
                <%--var content = "Bạn có muốn hủy hiển thị tin tức này ở Góc từ thiện trên trang chủ?";--%>
                <%--var data = {charity: 0};--%>
                <%--var message = "Hủy tin ở Góc từ thiện thành công!";--%>
                <%--var error = "Hủy tin ở Góc từ thiện thất bại!"--%>
            <%--} else {--%>
                <%--content = "Bạn có chắc chắn muốn chọn tin tức hiển thị ở Góc từ thiện trên trang chủ không?";--%>
                <%--data = {charity: 1}--%>
                <%--message = "Chọn hiển thị tin tức ở Góc từ thiện thành công!";--%>
                <%--error = "Chọn hiển thị tin tức ở Góc từ thiện thất bại!"--%>
            <%--}--%>
            <%--confirmDialog("XÁC NHẬN", content, function () {--%>
                <%--httpRequest.post("/news/setCharity/" + item.id,--%>
                    <%--data,--%>
                    <%--function (data) {--%>
                        <%--if (data.success) {--%>
                            <%--alertSmallBox(message, "success");--%>
                            <%--$scope.loadPage(1);--%>
                        <%--} else {--%>
                            <%--alertSmallBox(error, error);--%>
                        <%--}--%>
                    <%--}, function (data) {--%>
                    <%--}, true);--%>
            <%--})--%>
        <%--};--%>
        <%--$scope.setHotNews = function (item) {--%>
            <%--if (item.isHotNews == 1) {--%>
                <%--var content = "Bạn có chắc chắn muốn hủy chọn tin nổi bật này này?";--%>
                <%--var data = {isHotNews: 0};--%>
                <%--var message = "Hủy tin nổi bật thành công!";--%>
                <%--var error = "Hủy tin nổi bật thất bại!"--%>
            <%--} else {--%>
                <%--content = "Bạn có chắc chắn muốn chọn tin tức này thành tin nổi bật?";--%>
                <%--data = {isHotNews: 1}--%>
                <%--message = "Chọn tin tức thành tin nổi bật thành công!";--%>
                <%--error = "Chọn tin thức thành tin nổi bật thất bại!"--%>
            <%--}--%>
            <%--confirmDialog("XÁC NHẬN", content, function () {--%>
                <%--httpRequest.post("/news/setHotNews/" + item.id,--%>
                    <%--data,--%>
                    <%--function (data) {--%>
                        <%--if (data.success) {--%>
                            <%--alertSmallBox(message, "success");--%>
                            <%--$scope.loadPage(1);--%>
                        <%--} else {--%>
                            <%--alertSmallBox(error, error);--%>
                        <%--}--%>
                    <%--}, function (data) {--%>
                    <%--}, true);--%>
            <%--})--%>
        <%--};--%>
        <%--$scope.group = 1;--%>
        <%--$scope.menuByGroup = [];--%>
        <%--$scope.menuId = "";--%>
        <%--$scope.getMenuByGroup1 = function () {--%>
            <%--httpRequest.get("/menu/getByGroup/" + $scope.group--%>
                <%--, function (data) {--%>
                    <%--if (data.success) {--%>
                        <%--$scope.menuByGroup = data.data.menus;--%>
                    <%--}--%>
                <%--}, function (data) {--%>
                <%--}, true);--%>
        <%--}--%>
        <%--$scope.dataNewsMenu = {};--%>
        <%--$scope.showPopupAssignToMenu = function (item) {--%>
            <%--$scope.getMenuByGroup1();--%>
            <%--httpRequest.get("/news/getDetail/" + item.id--%>
                <%--, function (data) {--%>
                    <%--if (data.success) {--%>
                        <%--$scope.dataNewsMenu = data.data.menu;--%>
                        <%--$scope.tempId = item.id;--%>
                        <%--if ($scope.dataNewsMenu == undefined) {--%>
                            <%--$scope.menuAssign = "";--%>
                        <%--} else {--%>
                            <%--$scope.menuAssign = $scope.dataNewsMenu.id;--%>
                        <%--}--%>
                    <%--}--%>
                <%--}, function (data) {--%>
                <%--}, true);--%>
        <%--}--%>
        <%--$scope.assignToMenu = function (menuAssign) {--%>
            <%--httpRequest.post("/news/assignToMenu/" + $scope.tempId,--%>
                <%--{menuId: $scope.menuAssign},--%>
                <%--function (data) {--%>
                    <%--if (data.success) {--%>
                        <%--alertSmallBox("Phân loại vào menu thành công!", "success");--%>
                        <%--$('#popup-assign-to-menu').modal('hide');--%>
                    <%--} else {--%>
                        <%--alertSmallBox("Phân loại menu không thành công", "error");--%>
                    <%--}--%>
                <%--}, function (data) {--%>
                <%--}, true);--%>
        <%--}--%>
        <%--$scope.openPopupWindow = function (url, item) {--%>
            <%--$scope.getHost = window.location.host;--%>
            <%--$scope.urlNews = $scope.getHost + '/tin-tuc/' + item.id;--%>
            <%--newwindow = window.open(url + $scope.urlNews, 'name', 'height=450,width=600,left=30, top=100');--%>
            <%--if (window.focus) {--%>
                <%--newwindow.focus()--%>
            <%--}--%>
            <%--return false;--%>
        <%--}--%>
        <%--$scope.goToAddNews = function () {--%>
            <%--setTimeout(function () {--%>
                <%--location.href = "/admin/quan-ly/tin-tuc/them-moi";--%>
                <%--location.reload();--%>
            <%--}, 1000)--%>
        <%--}--%>
    <%--});--%>
<%--</script>--%>