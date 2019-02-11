<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/12/18
  Time: 2:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- page content -->
<div class="right_col" role="main" ng-controller="mgrDoctorController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="min-width: 50%; font-size: 18px;">Quản lý tài khoản bác sĩ
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
                                    <button type="submit" class="btn btn-success" ng-click="showAddAccount()">Thêm mới
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
                                        <th class="text-center">Ảnh</th>
                                        <th class="text-center">Tên tài khoản</th>
                                        <th class="text-center">Họ tên</th>
                                        <th class="text-center">Chức danh</th>
                                        <th class="text-center">Khoa</th>
                                        <th class="text-center">Email</th>
                                        <th class="text-center">Nổi bật</th>
                                        <th class="text-center">Trạng thái</th>
                                        <th class="text-center">Tiện ích</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="table-tr-th">
                                        <td></td>
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
                                            <select class="select-type form-control"
                                                    ng-model="dataSearch.colIndex"
                                                    ng-change="loadPage(1)">
                                                <option value="">Tất cả</option>
                                                <option ng-repeat="item in listPosition"
                                                        value="{{item.position.value}}">{{item.position.name}}
                                                </option>
                                            </select>
                                        </td>
                                        <td>
                                            <select ui-select2 class="select-type form-control"
                                                    ng-model="dataSearch.departmentId"
                                                    ng-change="loadPage(1)">
                                                <option value="">Tất cả</option>
                                                <option ng-repeat="item in listDepartment"
                                                        value="{{item.department.id}}">{{item.department.name}}
                                                </option>
                                            </select>
                                        </td>
                                        <td>
                                            <input type="text" class="form-control"
                                                   placeholder="Nhập email để tìm kiếm"
                                                   ng-model="dataSearch.email" ng-enter="loadPage(1)">
                                        </td>
                                        <td>
                                            <select class="select-type form-control"
                                                    ng-model="dataSearch.isHighlight"
                                                    ng-change="loadPage(1)">
                                                <option value="">Tất cả</option>
                                                <option value="0">Thường</option>
                                                <option value="1">Nổi bật</option>
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
                                    </tr>
                                    <tr class="table-tr-th" ng-repeat="item in doctor">
                                        <td class="time-item text-center">{{$index + stt}}</td>
                                        <td class="time-item text-center">
                                            <img ng-if="item.user.gender==0 && item.user.thumbnail"
                                                 ng-src="{{item.user.thumbnail.absoluteUrl()}}"
                                                 onerror="ImgError(this);"
                                                 style="width: 50px; height: 50px; object-fit: cover"/>
                                            <img ng-if="item.user.gender==0 && !item.user.thumbnail"
                                                 src="/static/images/avatarDoctorFemale.png"
                                                 onerror="ImgError(this);"
                                                 style="width: 50px; height: 50px; object-fit: cover"/>
                                            <img ng-if="item.user.gender==1 && item.user.thumbnail"
                                                 ng-src="{{item.user.thumbnail.absoluteUrl()}}"
                                                 onerror="ImgError(this);"
                                                 style="width: 50px; height: 50px; object-fit: cover"/>
                                            <img ng-if="item.user.gender==1 && !item.user.thumbnail"
                                                 src="/static/images/avatarDoctorMale.png"
                                                 onerror="ImgError(this);"
                                                 style="width: 50px; height: 50px; object-fit: cover"/>
                                        </td>
                                        <td class="time-item text-center">
                                            {{item.user.username}}
                                        </td>
                                        <td class="time-item text-center">
                                            {{item.user.name}}
                                        </td>
                                        <td class="time-item text-center">
                                            {{item.user.index==0?"Trưởng khoa":item.user.index==1?"Phó khoa":"Bác sĩ"}}
                                        </td>
                                        <td class="time-item text-center">
                                            {{item.department?item.department.name:""}}
                                        </td>
                                        <td class="time-item text-center">
                                            {{item.user.email}}
                                        </td>
                                        <td class="time-item text-center">
                                            <a ng-if="item.user.isHighlight">
                                                <i style="color: #05733e;" class="fa fa-check-circle"></i></a>
                                        </td>
                                        <td class="time-item text-center">
                                            <a ng-if="item.user.block == 0">
                                                <i style="color: #05733e;" class="fa fa-check-circle"></i></a>
                                            <a ng-if="item.user.block == 1">
                                                <i style="color: #db4437;" class="fa fa-lock"></i></a>
                                        </td>
                                        <td class="time-item text-center">
                                            <div class="btn-group">
                                                <button data-toggle="dropdown" type="button"
                                                        class="btn btn-success dropdown-toggle btn-xs">
                                                    <span class="caret"></span>
                                                </button>
                                                <ul role="menu" class="dropdown-menu">
                                                    <li>
                                                        <a target="_blank" ng-click="showDataUpdate(item)">
                                                            <i class="fa fa-edit"></i>Sửa</a>
                                                    </li>
                                                    <li>
                                                        <a target="_blank" href="/tai-khoan/{{item.user.id}}">
                                                            <i class="fa fa-eye"></i>Xem thông tin</a>
                                                    </li>
                                                    <li>
                                                        <a ng-click="resetPassword(item.user)">
                                                            <i class="fa fa-refresh"></i>Đặt lại mật khẩu</a>
                                                    </li>
                                                    <li ng-if="!item.user.isHighlight">
                                                        <a ng-click="setHightlight(item.user)">
                                                            <i class="fa fa-check"></i>Chọn nổi bật
                                                        </a>
                                                    </li>
                                                    <li ng-if="item.user.isHighlight">
                                                        <a ng-click="setHightlight(item.user)">
                                                            <i class="fa fa-times"></i>Hủy nổi bật
                                                        </a>
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
                                     ng-if="doctor.length>0">
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
        <div class="modal fade bs-example-modal-lg" id="modal-doctor" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span
                                aria-hidden="true" ng-click="closedPopupDoctor()">×</span>
                        </button>
                        <h3 class="modal-title" ng-if="!dataDoctor.id">Thêm mới bác sĩ</h3>
                        <h3 class="modal-title" ng-if="dataDoctor.id">Cập nhật bác sĩ</h3>
                    </div>
                    <form id="form-doctor" novalidate="novalidate"
                          class="smart-form" ng-validate="validationDoctor">
                        <div class="modal-body">
                            <div class="col-md-7">
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <div class="form-item">
                                            <div class="input-inner">
                                                <span class="form-label">Tên tài khoản</span>
                                                <div class="input-text">
                                                    <input type="text" class="form-control" name="username"
                                                           id="username"
                                                           placeholder="Nhập tên tài khoản..."
                                                           ng-model="dataDoctor.username">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-item">
                                            <div class="input-inner">
                                                <span class="form-label">Tên bác sĩ</span>
                                                <div class="input-text">
                                                    <input type="text" class="form-control" name="name"
                                                           placeholder="Nhập tên bác sĩ..."
                                                           ng-model="dataDoctor.name">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <div class="form-item">
                                            <div class="input-inner">
                                                <span class="form-label">Email</span>
                                                <div class="input-text">
                                                    <input type="text" class="form-control" name="email"
                                                           placeholder="Nhập email..."
                                                           ng-model="dataDoctor.email">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-item">
                                            <div class="input-inner">
                                                <span class="form-label">Giới tính</span>
                                                <div class="input-text">
                                                    <select id="gender" name="gender"
                                                            class="select-type form-control"
                                                            ng-model="dataDoctor.gender">
                                                        <option value="">--- Chọn ---</option>
                                                        <option value="0">Nữ</option>
                                                        <option value="1">Nam</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <div class="form-item">
                                            <div class="input-inner">
                                                <span class="form-label">Chuyên khoa</span>
                                                <div class="input-text">
                                                    <select style="width: 100%;"
                                                            name="departmentId" id="departmentId"
                                                            class="select-type form-control"
                                                            ng-model="dataDepartment.id" ng-select>
                                                        <option value="">--- Chọn ---</option>
                                                        <option ng-repeat="item in listDepartment"
                                                                value="{{item.department.id}}">
                                                            {{item.department.name}}
                                                        </option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-item">
                                            <div class="input-inner">
                                                <span class="form-label">Chức vụ</span>
                                                <div class="input-text">
                                                    <select id="colIndex" name="colIndex" style="width: 100%;"
                                                            class="select-type form-control"
                                                            ng-model="dataDoctor.index">
                                                        <option value="">--- Chọn ---</option>
                                                        <option ng-repeat="item in listPosition"
                                                                value="{{item.position.value}}">
                                                            {{item.position.name}}
                                                        </option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-item">
                                        <span class="form-label">Hiển thị trang chủ</span>
                                        <div class="checkbox-style">
                                            <i ng-click="checkIsShowHome(true)" style="cursor: pointer"
                                               ng-if="!checkShowHome" class="fa fa-square-o  fa-lg"></i>
                                            <i ng-click="checkIsShowHome(false)" style="cursor: pointer"
                                               ng-if="checkShowHome" class="fa fa-check-square-o fa-lg"></i>
                                            <span class="label-form">Chọn hiển thị trang chủ</span>
                                        </div>
                                    </div>
                                    <div class="form-item">
                                        <div class="input-inner">
                                            <span class="form-label">Giới thiệu</span>
                                            <div class="input-text">
                                                <textarea style="width: 100%;" id="noteValue" name="introduction"
                                                          rows="5" ng-model="dataDoctor.introduction"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="well padding-10">
                                    <div class="input-inner" id="select-file">
                                        <div class="form-label" style="margin-top: 10px;">
                                            <span class="form-label">Ảnh bác sĩ</span>
                                        </div>
                                        <div class="input input-file" style="margin-top: 10px;">
                                            <div class="button"
                                                 style="margin-top: 5px; margin-right: 20px;">
                                                <input type="file" id="select-file-image"
                                                       name="file1"
                                                       accept="image/x-png,image/gif,image/jpeg"
                                                       ng-file-change="fileMgr.changeFile"
                                                       file-input-id="{{dataDoctor.id}}"
                                                       ng-model="dataDoctor.image">Chọn
                                            </div>
                                            <input type="text" style="padding-right: 80px !important;"
                                                   class="form-control" id="text-file-image-name"
                                                   placeholder="Chọn ảnh bác sĩ" readonly
                                                   ng-model="dataDoctor.image"/>
                                        </div>
                                        <div style="width: 100%; height: auto; display: flex;align-items:center; justify-content:center;">
                                            <img style="max-width: 100%; margin-top: 10px; display: none; visibility: hidden;"
                                                 ng-if="dataDoctor.originImage"
                                                 id="img-temp-avatar"
                                                 ng-src="{{dataDoctor.originImage.absoluteUrl('/static/images/Profile1.png')}}">

                                            <img ng-if="dataDoctor.originImage && dataDoctor.originImage.indexOf('blob')!=0"
                                                 style="max-width: 100%; margin-top: 10px;"
                                                 ng-src="{{dataDoctor.originImage.absoluteUrl('/static/images/Profile1.png')}}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" ng-click="createDoctor()"
                                    ng-if="!dataDoctor.id">Thêm mới
                            </button>
                            <button type="button" class="btn btn-primary" ng-click="updateDoctor(dataDoctor)"
                                    ng-if="dataDoctor.id">Cập nhật
                            </button>
                            <button type="button" class="btn btn-default" data-dismiss="modal"
                                    ng-click="closedPopupDoctor()">
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
<script src="/static/js/image-crop/jquery.Jcrop.js"></script>
<link href="/static/js/image-crop/jquery.Jcrop.min.css" type="text/css" media="screen" rel="stylesheet"/>
