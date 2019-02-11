<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/12/18
  Time: 2:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- page content -->
<div class="right_col" role="main" ng-controller="mgrUserController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="min-width: 50%; font-size: 18px;">Quản lý tài khoản người dùng
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
                                    <label style="font-weight: normal; text-align: left; white-space: nowrap;">Hiển
                                        thị</label>
                                    <label>
                                        <select name="datatable_length" aria-controls="datatable"
                                                ng-init="dataSearch.size ='10'" n ng-model="dataSearch.size"
                                                class="form-control input-sm" ng-change="loadPage(1)">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                    </label>
                                    <label style="font-weight: normal; text-align: left; white-space: nowrap;"></label>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div id="datatable_filter" class="dataTables_filter">
                                    <button type="submit" class="btn btn-success" ng-click="showPopupUser()">Thêm mới
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-striped table-bordered dataTable no-footer">
                                    <thead>
                                    <tr class="table-tr-th">
                                        <th class="text-center">STT</th>
                                        <th class="text-center">Tên tài khoản</th>
                                        <th class="text-center">Họ tên</th>
                                        <th class="text-center">Email</th>
                                        <th class="text-center">Loại tài khoản</th>
                                        <th class="text-center">Trạng thái</th>
                                        <th class="text-center">Ngày tạo</th>
                                        <th class="text-center">Tiện ích</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="table-tr-th">
                                        <td></td>
                                        <td>
                                            <input type="text" class="form-control"
                                                   placeholder="Nhập tên tài khoản để tìm kiếm"
                                                   ng-model="dataSearch.username" ng-enter="loadPage(1)">
                                        </td>
                                        <td>
                                            <input type="text" class="form-control"
                                                   placeholder="Nhập họ tên để tìm kiếm"
                                                   ng-model="dataSearch.name" ng-enter="loadPage(1)">
                                        </td>
                                        <td>
                                            <input type="text" class="form-control"
                                                   placeholder="Nhập email để tìm kiếm"
                                                   ng-model="dataSearch.email" ng-enter="loadPage(1)">
                                        </td>
                                        <td>
                                            <select class="select-type form-control"
                                                    ng-model="dataSearch.socialType"
                                                    ng-change="loadPage(1)">
                                                <option value="">Tất cả</option>
                                                <option value="0">User</option>
                                                <option value="1">Facebook</option>
                                                <option value="2">Google</option>
                                            </select>
                                        </td>
                                        <td>
                                            <select class="select-type form-control"
                                                    ng-model="dataSearch.block"
                                                    ng-change="loadPage(1)">
                                                <option value="">Tất cả</option>
                                                <option value="0">Đang hoạt động</option>
                                                <option value="1">Khóa</option>
                                            </select>
                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr class="table-tr-th" ng-repeat="item in user">
                                        <td class="time-item text-center">{{$index + stt}}</td>
                                        <td class="time-item text-center">
                                            {{item.user.username}}
                                        </td>
                                        <td class="time-item text-center">
                                            {{item.user.name}}
                                        </td>
                                        <td class="time-item text-center">
                                            {{item.user.email}}
                                        </td>
                                        <td class="time-item text-center">
                                            <span ng-if="item.user.socialType == 0" class="label label-default"
                                                  style="background-color: #089250de;">
                                                <i class="glyphicon glyphicon-user"></i> Người dùng
                                            </span>
                                            <span ng-if="item.user.socialType == 1" class="label label-primary"
                                                  style="background-color: #4267b2;">
                                                <i class="fa fa-facebook-square"></i> Facebook
                                            </span>
                                            <span ng-if="item.user.socialType == 2" class="label label-success"
                                                  style="background-color: #db4437;">
                                                <i class="fa fa-google-plus-square"></i> Google
                                            </span>
                                        </td>
                                        <td class="time-item text-center">
                                            <a ng-if="item.user.block == 0">
                                                <i style="color: #05733e;" class="fa fa-check-circle"></i></a>
                                            <a ng-if="item.user.block == 1">
                                                <i style="color: db4437;" class="fa fa-lock"></i></a>
                                        </td>
                                        <td class="time-item text-center">
                                            {{item.user.createdDate.toDateObject('-').format("HH:mm, dd-MM-yyyy")}}
                                        </td>
                                        <td class="time-item text-center">
                                            <div class="btn-group">
                                                <button data-toggle="dropdown" type="button"
                                                        class="btn btn-success dropdown-toggle btn-xs">
                                                    <span class="caret"></span>
                                                </button>
                                                <ul role="menu" class="dropdown-menu">
                                                    <li>
                                                        <a target="_blank" href="/tai-khoan/{{item.user.id}}">
                                                            <i class="fa fa-eye"></i>Xem thông tin</a>
                                                    </li>
                                                    <li>
                                                        <a ng-click="resetPassword(item.user)">
                                                            <i class="fa fa-refresh"></i>Đặt lại mật khẩu</a>
                                                    </li>
                                                    <li class="divider"></li>
                                                    <li ng-if="!item.user.block">
                                                        <a ng-click="block(item.user)">
                                                            <i class="fa fa-lock"></i>Khóa tài khoản
                                                        </a>
                                                    </li>
                                                    <li ng-if="item.user.block">
                                                        <a ng-click="block(item.user)">
                                                            <i class="fa fa-unlock"></i>Mở khóa tài khoản
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
                                     ng-if="user.length>0">
                                    <ul class="pagination pull-right">
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
        <div class="modal fade bs-example-modal-lg" id="modal-create-user" tabindex="-1"
             role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" style="width: 600px; margin: 150px">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span
                                aria-hidden="true" ng-click="closedPopupUser()">×</span>
                        </button>
                        <h3 class="modal-title">Thêm mới</h3>
                    </div>
                    <form id="form-user" novalidate="novalidate"
                          class="smart-form" ng-validate="validationUser">
                        <div class="modal-body">
                            <div class="form-item">
                                <div class="input-inner">
                                    <span class="form-label">Họ và tên *</span>
                                    <div class="input-text">
                                        <input type="text" class="form-control" name="name"
                                               placeholder="Nhập họ và tên..."
                                               ng-model="dataUser.name">
                                    </div>
                                </div>
                            </div>
                            <div class="form-item">
                                <div class="input-inner">
                                    <span class="form-label">Giới tính</span>
                                    <div class="input-text">
                                        <select id="position" name="position"
                                                class="select-type form-control"
                                                ng-model="dataUser.gender">
                                            <option value="">--- Chọn ---</option>
                                            <option value="0">Nữ</option>
                                            <option value="1">Nam</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" ng-click="createAccount()">Thêm mới</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal"
                                    ng-click="closedPopupUser()">
                                Đóng
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->
