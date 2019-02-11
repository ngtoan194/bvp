<%--
  Created by IntelliJ IDEA.
  User: Huyen
  Date: 10/24/2018
  Time: 3:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .btn-primary.active, .btn-primary:active, .open > .dropdown-toggle.btn-primary {
        color: #fff;
        background-color: #099853;
        border-color: #099853;
    }
</style>
<div class="right_col" role="main" ng-controller="mgrPageController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="min-width: 50%; font-size: 18px;">Danh sách Page</h2>
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
                                                ng-init="dataSearch.size ='10'"  ng-model="dataSearch.size"
                                                class="form-control input-sm" ng-change="loadPage(1)">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                    </label>
                                </div>
                            </div>
                            <div class="btn-group show-dropdown show-addd pull-right" style="margin-bottom: 10px">
                                <a class="btn btn-primary btn-add dropdown-toggle" data-toggle="dropdown"
                                   aria-haspopup="true" aria-expanded="false">Thêm mới
                                    <span style="margin-left: 5px;" class="fa fa-caret-down"></span>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li>
                                        <a class="dropdown-item" data-toggle="modal" ng-click="showPopupPage()">
                                            File</a>
                                    </li>
                                    <li>
                                        <a href="/admin/quan-ly/them-loai-tin-tuc">
                                            Tin tức</a>
                                    </li>
                                    <li>
                                        <a href="/admin/quan-ly/them-khoa-phong">Khoa phòng</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="row">
                            <div>
                                <div class="well padding-10">
                                    <table class="table table-striped table-bordered dataTable no-footer">
                                        <thead>
                                        <tr class="table-tr-th">
                                            <th style="width: 5%; text-align: center">STT</th>
                                            <th style="width: 15%; text-align: center">Tên</th>
                                            <th style="width: 25%; text-align: center">Liên kết</th>
                                            <th style="width: 15%; text-align: center">File</th>
                                            <th style="width: 15%; text-align: center">Template</th>
                                            <th style="width: 15%; text-align: center">Ngày tạo</th>
                                            <th style="width: 10%; text-align: center">Tiện ích</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td></td>
                                            <td class="center">
                                                <input type="text" style="width: 100%; padding: 5px;"
                                                       class="form-control"
                                                       placeholder="Nhập tên page để tìm kiếm"
                                                       ng-model="dataSearch.name" ng-enter="loadPage(1)">
                                            </td>
                                            <td class="center"></td>
                                            <td class="center"></td>
                                            <td class="center">
                                                <div class="time-item text-center">
                                                    <div class="item-control">
                                                        <select name="" id="select-type"
                                                                class="select-type form-control"
                                                                ng-model="dataSearch.type" ng-change="loadPage(1)">
                                                            <option value="">Tất cả</option>
                                                            <option ng-value="1">Tin tức</option>
                                                            <option ng-value="2">Khoa/Phòng</option>
                                                            <option ng-value="3">Loại file</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="center"></td>
                                            <td class="center"></td>
                                        </tr>
                                        <tr class="table-tr-th" ng-repeat="item in data" ng-if="item!=null">
                                            <td class="time-item text-center">
                                                {{$index + stt}}
                                            </td>
                                            <td class="time-item text-center" style="min-width: 80px;">
                                                {{item.page.name}}
                                            </td>
                                            <td class="time-item text-center" style="min-width: 80px;">
                                                <a ng-if="item.page.type==1" href="/page/{{item.page.linkAlias}}"
                                                   target="_blank">
                                                    {{href}}/page/{{item.page.linkAlias}}
                                                </a>
                                                <a ng-if="item.page.type==2" target="_blank"
                                                   href="/khoa-phong/gioi-thieu/{{item.page.linkAlias}}">
                                                    {{href}}/khoa-phong/gioi-thieu/{{item.page.linkAlias}}
                                                </a>
                                                <a ng-if="item.page.type==3" target="_blank"
                                                   href="/page-file/{{item.page.linkAlias}}">
                                                    {{href}}/page-file/{{item.page.linkAlias}}
                                                </a>
                                            </td>
                                            <td class="time-item text-center" style="min-width: 80px;">
                                                <a ng-if="item.page.file" target="_blank"
                                                   href="{{item.page.file.absoluteUrlFile()}}">File</a>
                                            </td>
                                            <td class="time-item text-center" style="min-width: 80px;">
                                                <div class="time-item text-center">
                                                    <p>
                                                        {{
                                                        item.page.type==1?"Loại tin tức":
                                                        item.page.type==2?"Khoa phòng":
                                                        item.page.type==3?"Loại file":""
                                                        }}
                                                    </p>
                                                </div>
                                            </td>
                                            <td class="time-item text-center" style="min-width: 80px;">
                                                {{item.page.createdDate.toDateObject('-').format("HH:mm, dd-MM-yyyy")}}
                                            </td>
                                            <td class="time-item text-center">
                                                <div class="btn-group">
                                                    <button data-toggle="dropdown" type="button"
                                                            class="btn btn-success dropdown-toggle btn-xs">
                                                        <span class="caret"></span>
                                                    </button>
                                                    <ul role="menu" class="dropdown-menu">
                                                        <li ng-if="item.page.type==2">
                                                            <a href="/admin/page/hoat-dong?pageId={{item.page.id}}">
                                                                <i class="fa fa-newspaper-o"></i>Hoạt động
                                                            </a>
                                                        </li>
                                                        <li ng-if="item.page.type==2">
                                                            <a href="/admin/page/album?pageId={{item.page.id}}">
                                                                <i class="fa fa-picture-o"></i>Thư viện ảnh
                                                            </a>
                                                        </li>
                                                        <li ng-if="item.page.type==1">
                                                            <a target="_blank" href="/page/{{item.page.linkAlias}}">
                                                                <i class="fa fa-eye"></i>Xem chi tiết
                                                            </a>
                                                        </li>
                                                        <li ng-if="item.page.type==2">
                                                            <a target="_blank"
                                                               href="/khoa-phong/gioi-thieu/{{item.page.linkAlias}}">
                                                                <i class="fa fa-eye"></i>Xem chi tiết
                                                            </a>
                                                        </li>
                                                        <li ng-if="item.page.type==3">
                                                            <a target="_blank"
                                                               href="/page-file/{{item.page.linkAlias}}">
                                                                <i class="fa fa-eye"></i>Xem chi tiết
                                                            </a>
                                                        </li>
                                                        <li ng-if="item.page.type==1">
                                                            <a href="/admin/quan-ly/sua-page-tin-tuc/{{item.page.id}}">
                                                                <i class="fa fa-pencil-square-o"></i>Sửa
                                                            </a>
                                                        </li>
                                                        <li ng-if="item.page.type==2">
                                                            <a href="/admin/quan-ly/sua-khoa-phong/{{item.page.id}}">
                                                                <i class="fa fa-pencil-square-o"></i>Sửa
                                                            </a>
                                                        </li>
                                                        <li ng-if="item.page.type==3">
                                                            <a ng-click="showdataUpdate(item.page)">
                                                                <i class="fa fa-pencil-square-o"></i>Sửa
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a data-toggle="modal"
                                                               ng-click="delete(item.page)">
                                                                <i class="fa fa-times"></i>Xóa
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr ng-if="data.length == 0">
                                            <td colspan="7">
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
                                    <div class="paging_simple_numbers" id="datatable_paginate"
                                         ng-if="data.length>0">
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
                        <div class="modal fade bs-example-modal-lg" id="modal-page" tabindex="-1"
                             role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">
                                            <span aria-hidden="true" ng-click="closedPopupPage()">×</span>
                                        </button>
                                        <h2 class="modal-title" style="font-size: 28px">
                                            {{dataPage.id?"Cập nhật":"Thêm mới"}}
                                        </h2>
                                    </div>
                                    <form id="form-page" novalidate="novalidate" class="smart-form"
                                          ng-validate="validationPage">
                                        <div class="modal-body">
                                            <div class="col-md-6">
                                                <div class="form-item" style="margin-top: 15px;">
                                                    <div class="input-inner">
                                                        <span class="form-label">Tên</span>
                                                        <div class="input-text">
                                                            <input class="form-control" name="name"
                                                                   placeholder="Nhập tên page..." type="text"
                                                                   ng-model="dataPage.name">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-item">
                                                    <div class="input-inner">
                                                        <span class="form-label">Tiêu đề </span>
                                                        <div class="input-text">
                                                            <input class="form-control" name="title"
                                                                   placeholder="Nhập tiêu đề page..." type="text"
                                                                   ng-model="dataPage.title">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-item">
                                                    <div class="form-item">
                                                        <div class="input-inner">
                                                            <div class="form-label" style="margin-top: 10px;">Chọn
                                                                file
                                                            </div>
                                                            <div class="input input-file" style="margin-top: 10px;">
                                                                <div class="button" style="margin-top: 5px;">
                                                                    <input type="file" id="select-file"
                                                                           name="file"
                                                                           ng-file-change="filePage.selectFile"
                                                                           file-input-id="{{dataPage.id}}"
                                                                           ng-model="dataPage.file">Chọn
                                                                </div>
                                                                <input type="text"
                                                                       style="padding-right: 80px !important;"
                                                                       class="form-control" id="text-file-name"
                                                                       placeholder="Chọn file" readonly
                                                                       ng-model="dataPage.file"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <p ng-if="uploadingFile" style="line-height: 3;">
                                                        Đang tải file... Vui lòng chờ!!
                                                        <img style="height: 30px;"
                                                             src="/static/images/loading/loading2.gif">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn btn-success" ng-if="!dataPage.id && !uploadingFile"
                                                    ng-click="create()">Thêm
                                            </button>
                                            <button class="btn btn-success" ng-if="dataPage.id && !uploadingFile"
                                                    ng-click="update()">Cập nhật
                                            </button>
                                            <button class="btn btn-success"
                                                    ng-click="closedPopupPage()">Hủy
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