<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 11/01/18
  Time: 8:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- page content -->
<div class="right_col" role="main" ng-controller="mgrOnlineExchangeController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="min-width: 50%; font-size: 18px;">Quản lý giao lưu trực tuyến
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
                                    <button type="submit" class="btn btn-success" ng-click="showPopupOnlineExchange()">
                                        Thêm mới
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
                                        <th class="text-center">Chủ đề giao lưu</th>
                                        <th class="text-center">Liên kết</th>
                                        <th class="text-center">Active</th>
                                        <th class="text-center">Ngày diễn ra</th>
                                        <th class="text-center">Tiện ích</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="table-tr-th">
                                        <td></td>
                                        <td>
                                            <input type="text" class="form-control"
                                                   placeholder="Nhập chủ đề để tìm kiếm"
                                                   ng-model="dataSearch.topic" ng-enter="loadPage(1)">
                                        </td>
                                        <td></td>
                                        <td>
                                            <select class="select-type form-control"
                                                    ng-model="dataSearch.active"
                                                    ng-change="loadPage(1)">
                                                <option value="">Tất cả</option>
                                                <option value="1">Active</option>
                                                <option value="0">In-active</option>
                                            </select>
                                        </td>
                                        <td>
                                            <div class="input-group" id="date-picker">
                                                <input type="text" class="form-control" name="startTime" id="date-search"
                                                       placeholder="Chọn thời gian... (dd-MM-yyyy)"
                                                       ng-model="startTimeSeach"
                                                       ng-enter="searchDateTime()" ng-input-date="searchDateTime()">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                            <script type="text/javascript">
                                                $(function () {
                                                    $('#date-picker').datetimepicker({
                                                        format: 'DD-MM-YYYY',
                                                        allowInputToggle: true
                                                    });
                                                });
                                            </script>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr class="table-tr-th" ng-repeat="item in data">
                                        <td class="time-item text-center">{{$index + stt}}</td>
                                        <td class="time-item text-center">
                                            {{item.onlineExchange.topic}}
                                        </td>
                                        <td class="time-item text-center">
                                            <a target="_blank"
                                               href="/giao-luu-truc-tuyen/{{item.onlineExchange.linkAlias}}">{{originHref}}/giao-luu-truc-tuyen/{{item.onlineExchange.linkAlias}}</a>
                                        </td>
                                        <td class="time-item text-center">
                                            <a ng-if="item.onlineExchange.active == 1">
                                                <i style="color: #05733e;" class="fa fa-check-circle"></i></a>
                                        </td>
                                        <td class="time-item text-center">
                                            {{item.onlineExchange.startTime.toDateObject('-').format("HH:mm, dd-MM-yyyy")}}
                                        </td>
                                        <td class="time-item text-center">
                                            <div class="btn-group">
                                                <button data-toggle="dropdown" type="button"
                                                        class="btn btn-success dropdown-toggle btn-xs">
                                                    <span class="caret"></span>
                                                </button>
                                                <ul role="menu" class="dropdown-menu">
                                                    <li>
                                                        <a href="/admin/giao-luu-truc-tuyen/danh-sach-cau-hoi?exchangeId={{item.onlineExchange.id}}">
                                                            <i class="fa fa-database"></i>Danh sách câu hỏi</a>
                                                    </li>
                                                    <li>
                                                        <a target="_blank"
                                                           href="/giao-luu-truc-tuyen/{{item.onlineExchange.linkAlias}}">
                                                            <i class="fa fa-eye"></i>Xem chủ đề</a>
                                                    </li>
                                                    <li ng-if="!item.onlineExchange.active">
                                                        <a ng-click="active(item.onlineExchange)">
                                                            <i class="fa fa-check-circle"></i>Active
                                                        </a>
                                                    </li>
                                                    <li ng-if="item.onlineExchange.active">
                                                        <a ng-click="active(item.onlineExchange)">
                                                            <i class="fa fa-times-circle"></i>In-active
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a ng-click="showdataUpdate(item)">
                                                            <i class="fa fa-edit"></i>Sửa</a>
                                                    </li>
                                                    <li class="divider"></li>
                                                    <li>
                                                        <a ng-click="delete(item.onlineExchange)">
                                                            <i class="fa fa-trash"></i>Xóa</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr ng-if="data.length == 0">
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
                </div>
            </div>
        </div>
        <div class="modal fade bs-example-modal-lg" id="modal-online-exchange" tabindex="-1"
             role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" style="width: 600px; margin: 150px">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span
                                aria-hidden="true" ng-click="closedPopupOnlineExchange()">×</span>
                        </button>
                        <h3 class="modal-title">{{dataOnlineExchange.id?"Cập nhật":"Thêm mới"}}</h3>
                    </div>
                    <form id="form-online-exchange" novalidate="novalidate"
                          class="smart-form" ng-validate="validationOnlineExchange">
                        <div class="modal-body">
                            <div class="form-item">
                                <div class="input-inner">
                                    <span class="form-label">Chủ đề giao lưu</span>
                                    <div class="input-text">
                                        <input type="text" class="form-control" name="topic"
                                               placeholder="Nhập chủ đề giao lưu..."
                                               ng-model="dataOnlineExchange.topic">
                                    </div>
                                </div>
                            </div>
                            <div class="form-item">
                                <div class="input-inner">
                                    <span class="form-label">Thời gian bắt đầu</span>
                                    <div class="input-group" id="start-time-picker">
                                        <input type="text" class="form-control" name="startTime" id="start-time"
                                               placeholder="Chọn thời gian bắt đầu...(HH:mm dd-MM-yyyy)"
                                               ng-model="dataDate.startTime">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                    <script type="text/javascript">
                                        $(function () {
                                            $('#start-time-picker').datetimepicker({
                                                format: 'HH:mm DD-MM-YYYY',
                                                allowInputToggle: true
                                            });
                                        });
                                    </script>
                                </div>
                            </div>
                            <div class="form-item">
                                <div class="input-inner">
                                    <span class="form-label">Thời gian kết thúc</span>
                                    <div class="input-group" id="end-time-picker">
                                        <input type="text" class="form-control" name="endTime" id="end-time"
                                               placeholder="Chọn thời gian kết thúc...(HH:mm dd-MM-yyyy)"
                                               ng-model="dataDate.endTime">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                    <script type="text/javascript">
                                        $(function () {
                                            $('#end-time-picker').datetimepicker({
                                                format: 'HH:mm DD-MM-YYYY',
                                                allowInputToggle: true
                                            });
                                        });
                                    </script>
                                </div>
                            </div>
                            <div class="form-item">
                                <div class="input-inner">
                                    <span class="form-label">Địa chỉ</span>
                                    <div class="input-text">
                                        <input type="text" class="form-control" name="location"
                                               placeholder="Nhập địa chỉ..."
                                               ng-model="dataOnlineExchange.location">
                                    </div>
                                </div>
                            </div>
                            <div class="form-item">
                                <div class="input-inner">
                                    <span class="form-label">Danh sách bác sĩ</span>
                                    <div class="input-text">
                                        <select style="width: 100%" ng-select
                                                ng-model="dataDoctor.doctorIds"
                                                id="doctorIds" name="doctorIds" multiple>
                                            <option ng-repeat="item in listDoctor"
                                                    value="{{item.user.id}}">{{item.user.name}}
                                            </option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" ng-if="!dataOnlineExchange.id"
                                    ng-click="create()">Thêm mới
                            </button>
                            <button type="button" class="btn btn-primary" ng-if="dataOnlineExchange.id"
                                    ng-click="update()">Cập nhật
                            </button>
                            <button type="button" class="btn btn-default" data-dismiss="modal"
                                    ng-click="closedPopupOnlineExchange()">
                                Đóng
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#doctorIds').change(function () {
            $(this).valid();
        });
    });
</script>
<!-- /page content -->
