<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 11/01/18
  Time: 8:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- page content -->
<div class="right_col" role="main" ng-controller="mgrOnlineExchangeQuestionController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="min-width: 50%; font-size: 18px;">
                            <small>
                                <a href="/admin/giao-luu-truc-tuyen">Quản lý giao lưu trực tuyến / </a>
                            </small>
                            Quản lý câu hỏi giao lưu trực tuyến
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
                            <div class="col-md-12">
                                <table class="table table-striped table-bordered dataTable no-footer">
                                    <thead>
                                    <tr class="table-tr-th">
                                        <th class="text-center">STT</th>
                                        <th class="text-center">Tên người hỏi</th>
                                        <th class="text-center">Email</th>
                                        <th class="text-center">Nội dung câu hỏi</th>
                                        <th class="text-center">Bác sĩ</th>
                                        <th class="text-center">Câu trả lời</th>
                                        <th class="text-center">Trạng thái</th>
                                        <th class="text-center">Tiện ích</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="table-tr-th">
                                        <td></td>
                                        <td>
                                            <input type="text" class="form-control"
                                                   placeholder="Nhập tên người hỏi để tìm kiếm"
                                                   ng-model="dataSearch.name" ng-enter="loadPage(1)">
                                        </td>
                                        <td>
                                            <input type="text" class="form-control"
                                                   placeholder="Nhập email để tìm kiếm"
                                                   ng-model="dataSearch.email" ng-enter="loadPage(1)">
                                        </td>
                                        <td>
                                            <input type="text" class="form-control"
                                                   placeholder="Nhập nội dung để tìm kiếm"
                                                   ng-model="dataSearch.content" ng-enter="loadPage(1)">
                                        </td>
                                        <td>
                                            <select class="select-type form-control"
                                                    ng-model="dataSearch.doctorId" ng-change="loadPage(1)">
                                                <option value="">Tất cả</option>
                                                <option ng-repeat="item in doctors"
                                                        value="{{item.id}}">{{item.name}}
                                                </option>
                                            </select>
                                        </td>
                                        <td></td>
                                        <td>
                                            <select class="select-type form-control"
                                                    ng-model="dataSearch.approval"
                                                    ng-change="loadPage(1)">
                                                <option value="">Tất cả</option>
                                                <option value="1">Đã duyệt</option>
                                                <option value="0">Chưa duyệt</option>
                                            </select>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr class="table-tr-th" ng-repeat="item in data">
                                        <td class="time-item text-center">{{$index + stt}}</td>
                                        <td class="time-item text-center">
                                            {{checkFullname(item)}}
                                        </td>
                                        <td class="time-item text-center">
                                            {{checkEmail(item)}}
                                        </td>
                                        <td class="time-item text-center">
                                            <div style="width: 210px; word-break: break-word;">
                                                <p ng-bind-html="item.onlineExchangeQuestion.content"></p>
                                            </div>
                                        </td>
                                        <td class="time-item text-center">
                                            {{item.doctor.name}}
                                        </td>
                                        <td class="time-item text-center">
                                            <div style="width: 210px; word-break: break-word;">
                                                <p ng-bind-html="item.onlineExchangeQuestion.answer"></p>
                                            </div>
                                        </td>
                                        <td class="time-item text-center">
                                            <a ng-if="item.onlineExchangeQuestion.approval">
                                                <i style="color: #05733e;" class="fa fa-check-circle"></i></a>
                                        </td>
                                        <td class="time-item text-center">
                                            <div class="btn-group">
                                                <button data-toggle="dropdown" type="button"
                                                        class="btn btn-success dropdown-toggle btn-xs">
                                                    <span class="caret"></span>
                                                </button>
                                                <ul role="menu" class="dropdown-menu">
                                                    <li ng-if="!item.onlineExchangeQuestion.approval">
                                                        <a ng-click="approval(item.onlineExchangeQuestion)">
                                                            <i class="fa fa-check-circle"></i>Duyệt
                                                        </a>
                                                    </li>
                                                    <li ng-if="item.onlineExchangeQuestion.approval">
                                                        <a ng-click="approval(item.onlineExchangeQuestion)">
                                                            <i class="fa fa-times-circle"></i>Hủy duyệt
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a ng-click="showdataUpdate(item)">
                                                            <i class="fa fa-edit"></i>Sửa</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr ng-if="data.length == 0">
                                        <td colspan="8">
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
        <div class="modal fade bs-example-modal-lg" id="modal-online-exchange-question" tabindex="-1"
             role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" style="width: 600px; margin: 150px">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span
                                aria-hidden="true" ng-click="closedPopupOnlineExchangeQuestion()">×</span>
                        </button>
                        <h3 class="modal-title">Cập nhật</h3>
                    </div>
                    <form id="form-online-exchange-question" novalidate="novalidate"
                          class="smart-form" ng-validate="validationOnlineExchangeQuestion">
                        <div class="modal-body">
                            <div class="form-item">
                                <div class="input-inner">
                                    <span class="form-label">Nội dung câu hỏi</span>
                                    <div class="text-area">
                                        <textarea class="form-control" type="text"
                                                  ng-model="dataOnlineExchangeQuestion.content"
                                                  name="content" id="content"
                                                  rows="3"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="form-item">
                                <div class="input-inner">
                                    <span class="form-label">Danh sách bác sĩ</span>
                                    <div class="input-text">
                                        <select class="form-control"
                                                ng-model="dataDoctor.doctorId"
                                                id="doctorId" name="doctorId">
                                            <option value="">--- Chọn ---</option>
                                            <option ng-repeat="item in doctors"
                                                    value="{{item.id}}">{{item.name}}
                                            </option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-item">
                                <div class="input-inner">
                                    <span class="form-label">Nội dung câu trả lời</span>
                                    <div class="text-area">
                                        <textarea class="form-control" type="text"
                                                  ng-model="dataOnlineExchangeQuestion.answer"
                                                  name="answer" id="answer"
                                                  rows="3"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary"
                                    ng-click="update()">Cập nhật
                            </button>
                            <button type="button" class="btn btn-default" data-dismiss="modal"
                                    ng-click="closedPopupOnlineExchangeQuestion()">
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
