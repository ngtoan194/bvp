<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/31/18
  Time: 9:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- page content -->
<div class="right_col" role="main" ng-controller="mgrCourseItemController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="min-width: 50%; font-size: 18px;">
                            <small><a href="/admin/khoa-hoc">Quản lý khóa học / </a></small>
                            Quản lý bài học
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
                            <li>
                                <a class="close-link"><i class="fa fa-close"></i></a>
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
                                <%--<div id="datatable_filter" class="dataTables_filter">--%>
                                <%--<button type="submit" class="btn btn-success">Thêm mới</button>--%>
                                <%--</div>--%>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-9">
                                <div class="well padding-10">
                                    <table class="table table-striped table-bordered dataTable no-footer">
                                        <thead>
                                        <tr class="table-tr-th">
                                            <th class="text-center">STT</th>
                                            <th class="text-center">Tên bài học</th>
                                            <th class="text-center">File</th>
                                            <th class="text-center">Ngày tạo</th>
                                            <th class="text-center">Tiện ích</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr class="table-tr-th">
                                            <td></td>
                                            <td>
                                                <div class="time-item">
                                                    <input type="text" class="form-control"
                                                           placeholder="Nhập tên bài học để tìm kiếm"
                                                           ng-model="dataSearch.name" ng-enter="loadPage(1)">
                                                </div>
                                            </td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr class="table-tr-th" ng-repeat="item in data">
                                            <td class="time-item text-center">{{$index + stt}}</td>
                                            <td class="time-item text-center">
                                                {{item.courseItems.name}}
                                            </td>
                                            <td class="time-item text-center">
                                                <a target="_blank"
                                                   href="/khoa-hoc?courseId={{courseId}}&courseItemId={{item.courseItems.id}}">File</a>
                                            </td>
                                            <td class="time-item text-center">
                                                {{item.courseItems.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")}}
                                            </td>
                                            <td class="time-item text-center">
                                                <div class="btn-group">
                                                    <button data-toggle="dropdown" type="button"
                                                            class="btn btn-success dropdown-toggle btn-xs">
                                                        <span class="caret"></span>
                                                    </button>
                                                    <ul role="menu" class="dropdown-menu">
                                                        <li>
                                                            <a target="_blank" href="/khoa-hoc?courseId={{item.course.id}}&courseItemId={{item.courseItems.id}}">
                                                                <i class="fa fa-eye"></i>Xem chi tiết bài học
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a ng-click="showdataUpdate(item.courseItems)">
                                                                <i class="fa fa-edit"></i>Sửa
                                                            </a>
                                                        </li>
                                                        <li class="divider"></li>
                                                        <li>
                                                            <a ng-click="delete(item.courseItems)">
                                                                <i class="fa fa-times"></i>Xóa</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div class="row">
                                        <div class="col-sm-5"></div>
                                        <div class="col-sm-7">
                                            <div class="paging_simple_numbers"
                                                 id="datatable_paginate" ng-if="data.length>0">
                                                <ul class="pagination pull-right">
                                                    <li ng-click="loadPage(1)" style="cursor: pointer;"
                                                        class="paginate_button previous {{dataSearch.page==1?'disabled':''}}">
                                                        <a>Trang đầu</a>
                                                    </li>
                                                    <li ng-repeat="itemPage in listPage | limitTo : 10"
                                                        style="cursor: pointer;"
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
                            <div class="col-md-3">
                                <div class="well padding-10">
                                    <div style="border-bottom: 3px solid #dddddd; margin-bottom: 10px;">
                                        <h2 class="title-right-box ng-scope" ng-if="!dataCourseItem.id">
                                            Thêm mới bài học
                                        </h2>
                                        <h2 class="title-right-box ng-scope" ng-if="dataCourseItem.id">
                                            Cập nhật bài học
                                        </h2>
                                    </div>
                                    <form id="form-course-item" novalidate="novalidate" class="smart-form"
                                          ng-validate="validationCourseItem">
                                        <div>
                                            <div class="form-item">
                                                <div class="input-inner">
                                                    <span class="form-label">Tên bài học</span>
                                                    <div class="input-text">
                                                        <input type="text" class="form-control" name="name"
                                                               placeholder="Nhập tên khóa học..."
                                                               ng-model="dataCourseItem.name">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="input-inner">
                                                <span class="form-label" style="margin-top: 10px; font-weight: bold">File
                                                </span>
                                                <div class="input input-file" style="margin-top: 10px;">
                                                    <div class="button"
                                                         style="margin-top: 5px; margin-right: 20px;">
                                                        <input type="file" id="select-file"
                                                               name="file1"
                                                               ng-file-change="fileMgr.selectFile"
                                                               file-input-id="{{dataCourseItem.id}}"
                                                               ng-model="dataCourseItem.file">Chọn
                                                    </div>
                                                    <input type="text" style="padding-right: 80px !important;"
                                                           class="form-control" id="text-file"
                                                           placeholder="Chọn file" readonly
                                                           ng-model="dataCourseItem.file"/>
                                                </div>
                                                <p ng-if="uploading" style="line-height: 3;">
                                                    Đang tải file... Vui lòng chờ!!
                                                    <img style="height: 30px;" src="/static/images/loading/loading.gif">
                                                </p>
                                            </div>
                                        </div>
                                        <div style="text-align: right; margin-top: 25px;">
                                            <button type="button" class="btn btn-primary"
                                                    ng-if="!dataCourseItem.id && !uploading"
                                                    ng-click="create()">
                                                Thêm mới
                                            </button>
                                            <button type="button" class="btn btn-primary"
                                                    ng-if="dataCourseItem.id && !uploading"
                                                    ng-click="update(dataCourseItem)">
                                                Cập nhật
                                            </button>
                                            <button type="button" class="btn btn-default" ng-click="cancelData()">Hủy
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
<!-- /page content -->