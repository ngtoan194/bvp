<%--
  Created by IntelliJ IDEA.
  User: Nguyen Toan
  Date: 01/09/19
  Time: 03:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- page content -->
<div class="right_col" role="main" ng-controller="mgrPositionController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="min-width: 50%; font-size: 18px;">Quản lý chức vụ
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

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-8">
                                <div class="well padding-10">
                                    <table class="table table-striped table-bordered dataTable no-footer">
                                        <thead>
                                        <tr class="table-tr-th">
                                            <th class="text-center">STT</th>
                                            <th class="text-center">Tên chức vụ</th>
                                            <th class="text-center">Value</th>
                                            <th class="text-center">Tiện ích</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr class="table-tr-th">
                                            <td></td>
                                            <td>
                                                <div class="time-item">
                                                    <input type="text" class="form-control"
                                                           placeholder="Nhập từ khóa để tìm kiếm"
                                                           ng-model="dataSearch.name" ng-enter="loadPage(1)">
                                                </div>
                                            </td>
                                            <td></td>
                                            <td></td>

                                        </tr>
                                        <tr class="table-tr-th" ng-repeat="item in data">
                                            <td class="time-item text-center">{{$index + stt}}</td>
                                            <td class="time-item text-center">
                                                {{item.position.name}}
                                            </td>
                                            <td class="time-item text-center">
                                                {{item.position.value}}
                                            </td>
                                            <td class="time-item text-center">
                                                <div class="btn-group">
                                                    <button data-toggle="dropdown" type="button"
                                                            class="btn btn-success dropdown-toggle btn-xs">
                                                        <span class="caret"></span>
                                                    </button>
                                                    <ul role="menu" class="dropdown-menu">
                                                        <li>
                                                            <a ng-click="showdataUpdate(item.position)">
                                                                <i class="fa fa-edit"></i>Sửa
                                                            </a>
                                                        </li>
                                                        <li class="divider"></li>
                                                        <li>
                                                            <a ng-click="delete(item.position)">
                                                                <i class="fa fa-times"></i>Xóa</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div class="row">
                                        <div class="col-sm-5">
                                            <%--<div class="dataTables_info" id="datatable_info" role="status" aria-live="polite">--%>
                                            <%--Hiển thị từ 1 đến 10 tổng 57 entries--%>
                                            <%--</div>--%>
                                        </div>
                                        <div class="col-sm-7">
                                            <div class="paging_simple_numbers"
                                                 id="datatable_paginate" ng-if="tag.length>0">
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
                            <div class="col-md-4">
                                <div class="well padding-10">
                                    <div style="border-bottom: 3px solid #dddddd; margin-bottom: 10px;">
                                        <h2 class="title-right-box ng-scope">
                                            {{dataPosition.id?"Cập nhật":"Thêm mới"}}
                                        </h2>
                                    </div>
                                    <form id="form-position" novalidate="novalidate" class="smart-form"
                                          ng-validate="validationPostion">
                                        <div>
                                            <div class="form-item">
                                                <div class="input-inner">
                                                    <span class="form-label">Tên chức vụ</span>
                                                    <div class="input-text">
                                                        <input type="text" class="form-control"
                                                               name="name"
                                                               placeholder="Nhập tên chức vụ..."
                                                               ng-model="dataPosition.name">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-item">
                                                <div class="input-inner">
                                                    <span class="form-label">Value</span>
                                                    <div class="input-text">
                                                        <input type="text" class="form-control"
                                                               name="value"
                                                               placeholder="Nhập value..."
                                                               ng-model="dataPosition.value">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="text-align: right;">
                                            <button type="button" class="btn btn-primary" ng-if="!dataPosition.id"
                                                    ng-click="create()">
                                                Thêm mới
                                            </button>
                                            <button type="button" class="btn btn-primary" ng-if="dataPosition.id"
                                                    ng-click="create()">
                                                Cập nhật
                                            </button>
                                            <button type="button" class="btn btn-default" ng-click="cancelData()">
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
</div>
<!-- /page content -->