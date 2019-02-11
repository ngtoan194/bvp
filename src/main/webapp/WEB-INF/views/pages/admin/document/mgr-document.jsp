<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 11/7/18
  Time: 10:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- page content -->
<div class="right_col" role="main" ng-controller="mgrDocumentController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="min-width: 50%; font-size: 18px;">Quản lý tài liệu
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
                                    <button type="submit" class="btn btn-success" ng-click="showPopupDocument()">
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
                                        <th class="text-center">Số ký hiệu</th>
                                        <th class="text-center">Tên tài liệu</th>
                                        <th class="text-center">Ngày ban hành</th>
                                        <th class="text-center">Ngày có hiệu lực</th>
                                        <th class="text-center">Cơ quan ban hành</th>
                                        <th class="text-center">Menu</th>
                                        <th class="text-center">Ảnh tài liệu</th>
                                        <th class="text-center">Tiện ích</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="table-tr-th">
                                        <td></td>
                                        <td>
                                            <input type="text" class="form-control"
                                                   placeholder="Nhập số ký hiệu tìm kiếm"
                                                   ng-model="dataSearch.code" ng-enter="loadPage(1)">
                                        </td>
                                        <td>
                                            <input type="text" class="form-control"
                                                   placeholder="Nhập tên tài liệu để tìm kiếm"
                                                   ng-model="dataSearch.name" ng-enter="loadPage(1)">
                                        </td>
                                        <td>
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="published-date-search"
                                                       placeholder="Chọn ngày ban hành (dd-MM-yyyy)"
                                                       ng-model="publishedDate"
                                                       ng-enter="searchDateTime()" ng-input-date="searchDateTime()">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                            <script>
                                                $('#published-date-search').datetimepicker({
                                                    format: 'DD-MM-YYYY',
                                                    allowInputToggle: true,
                                                    debug: true
                                                });
                                            </script>
                                        </td>
                                        <td>
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="effective-date-search"
                                                       placeholder="Chọn ngày có hiệu lực (dd-MM-yyyy)"
                                                       ng-model="effectiveDate"
                                                       ng-enter="searchDateTime()" ng-input-date="searchDateTime()">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>
                                            <script>
                                                $('#effective-date-search').datetimepicker({
                                                    format: 'DD-MM-YYYY',
                                                    allowInputToggle: true,
                                                    debug: true
                                                });
                                            </script>
                                        </td>
                                        <td>
                                            <input type="text" class="form-control"
                                                   placeholder="Nhập cơ quan ban hành để tìm kiếm"
                                                   ng-model="dataSearch.publishedOrg" ng-enter="loadPage(1)">
                                        </td>
                                        <td>
                                            <select class="form-control selectpicker" name="menuIdSeacrch"
                                                    id="menuIdSeacrch" ng-model="dataSearch.menuId"
                                                    ng-change="loadPage(1)">
                                                <option value="">Tất cả</option>
                                                <option ng-repeat="item in menuByGroup" value="{{item.id}}">
                                                    {{item.name}}
                                                </option>
                                            </select>
                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr class="table-tr-th" ng-repeat="item in data">
                                        <td class="time-item text-center">{{$index + stt}}</td>
                                        <td class="time-item text-center">
                                            {{item.document.code}}
                                        </td>
                                        <td class="time-item text-center">
                                            {{item.document.name}}
                                        </td>
                                        <td class="time-item text-center">
                                            {{item.document.publishedDate.toDateObject('-').format("dd-MM-yyyy")}}
                                        </td>
                                        <td class="time-item text-center">
                                            {{item.document.effectiveDate.toDateObject('-').format("dd-MM-yyyy")}}
                                        </td>
                                        <td class="time-item text-center">
                                            {{item.document.publishedOrg}}
                                        </td>
                                        <td class="time-item text-center">
                                            {{item.menuParent.name?item.menuParent.name+'/'+item.menu.name:item.menu.name}}
                                        </td>
                                        <td class="time-item text-center">
                                            <img style="width: 50px;"
                                                 ng-src="{{item.document.image.absoluteUrl()}}">
                                        </td>
                                        <td class="time-item text-center">
                                            <div class="btn-group">
                                                <button data-toggle="dropdown" type="button"
                                                        class="btn btn-success dropdown-toggle btn-xs">
                                                    <span class="caret"></span>
                                                </button>
                                                <ul role="menu" class="dropdown-menu">
                                                    <li>
                                                        <a target="_blank"
                                                           href="/tai-lieu/{{item.document.linkAlias}}">
                                                            <i class="fa fa-eye"></i>Xem chi tiết</a>
                                                    </li>
                                                    <li>
                                                        <a ng-click="showdataUpdate(item)">
                                                            <i class="fa fa-edit"></i>Sửa</a>
                                                    </li>
                                                    <li class="divider"></li>
                                                    <%--<li ng-if="!item.user.block">--%>
                                                    <%--<a ng-click="block(item.user)">--%>
                                                    <%--<i class="fa fa-lock"></i>Block--%>
                                                    <%--</a>--%>
                                                    <%--</li>--%>
                                                    <%--<li ng-if="item.user.block">--%>
                                                    <%--<a ng-click="block(item.user)">--%>
                                                    <%--<i class="fa fa-unlock"></i>Un-block--%>
                                                    <%--</a>--%>
                                                    <%--</li>--%>
                                                    <li>
                                                        <a ng-click="delete(item.document)">
                                                            <i class="fa fa-trash"></i>Xóa</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr ng-if="data.length == 0">
                                        <td colspan="9">
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
        <div class="modal fade bs-example-modal-lg" id="modal-document" tabindex="-1"
             role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" style="width: 866px; margin: 115px">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                            <span aria-hidden="true" ng-click="closedPopupDocument()">×</span>
                        </button>
                        <h3 class="modal-title">{{dataDocument.id?"Cập nhật":"Thêm mới"}}</h3>
                    </div>
                    <form id="form-document" novalidate="novalidate"
                          class="smart-form" ng-validate="validationDocument">
                        <div class="modal-body">
                            <div class="col-lg-6">
                                <div class="form-item">
                                    <div class="input-inner">
                                        <span class="form-label">Loại văn bản/tài liệu</span>
                                        <div class="input-text">
                                            <select class="select-type form-control"
                                                    name="type" id="type"
                                                    ng-model="dataDocument.type">
                                                <option value="">--- Chọn loại ---</option>
                                                <option ng-value="1">Tài liệu</option>
                                                <option ng-value="2">Văn bản</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-item" ng-if="dataDocument.type">
                                    <div class="input-inner">
                                        <span class="form-label">Số ký hiệu</span>
                                        <div class="input-text">
                                            <input type="text" class="form-control" name="code"
                                                   placeholder="Nhập số ký hiệu..."
                                                   ng-model="dataDocument.code">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-item" ng-if="dataDocument.type">
                                    <div class="input-inner">
                                        <span class="form-label">Tên tài liệu</span>
                                        <div class="input-text">
                                            <input type="text" class="form-control" name="name"
                                                   placeholder="Nhập tên tài liệu..."
                                                   ng-model="dataDocument.name">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-item" ng-if="dataDocument.type">
                                    <div class="input-inner">
                                        <span class="form-label">Cơ quan ban hành</span>
                                        <div class="input-text">
                                            <input type="text" class="form-control" name="publishedOrg"
                                                   placeholder="Nhập cơ quan ban hành..."
                                                   ng-model="dataDocument.publishedOrg">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-item" ng-if="dataDocument.type">
                                    <span class="form-label" style="margin-top: 10px;">
                                        File
                                    </span>
                                    <div class="input input-file" style="margin-top: 10px;">
                                        <div class="button" style="margin-top: 5px;">
                                            <input type="file" id="select-file"
                                                   name="file1"
                                                   ng-file-change="fileMgr.selectFile"
                                                   file-input-id="{{dataDocument.id}}"
                                                   ng-model="dataDocument.filePreview">Chọn
                                        </div>
                                        <input type="text" style="padding-right: 80px !important;"
                                               class="form-control" id="text-file"
                                               placeholder="Chọn file" readonly
                                               ng-model="dataDocument.filePreview"/>
                                    </div>

                                    </p>
                                </div>
                                <div class="form-item" id="select-file" ng-if="dataDocument.type == 1">
                                    <div class="form-label" style="margin-top: 10px;">
                                        <span class="form-label">Ảnh tài liệu</span>
                                    </div>
                                    <div class="input input-file" style="margin-top: 10px;">
                                        <div class="button"
                                             style="margin-top: 5px;">
                                            <input type="file" id="select-file-image"
                                                   name="file1"
                                                   accept="image/x-png,image/gif,image/jpeg"
                                                   ng-file-change="fileMgr.selectFileImg"
                                                   file-input-id="{{dataDocument.id}}"
                                                   ng-model="dataDocument.image">Chọn
                                        </div>
                                        <input type="text" style="padding-right: 80px !important;"
                                               class="form-control" id="text-file-image-name"
                                               placeholder="Chọn file ảnh" readonly
                                               ng-model="dataDocument.image"/>
                                    </div>
                                    <div style="width: 100%; height: auto; display: flex;align-items:center; justify-content:center;">
                                        <img style="max-width: 100%; margin-top: 10px;" ng-if="dataDocument.image"
                                             id="img-temp-avatar"
                                             ng-src="{{dataDocument.image.absoluteUrl()}}">

                                    </div>
                                </div>
                                <p ng-if="uploading" style="line-height: 3;">
                                    Đang tải file... Vui lòng chờ!!
                                    <img style="height: 30px;" src="/static/images/loading/loading2.gif">
                            </div>
                            <div class="col-lg-6">
                                <div class="form-item" ng-if="dataDocument.type">
                                    <div class="input-inner">
                                        <span class="form-label">Ngày ban hành</span>
                                        <div class="input-group" id="published-date-picker">
                                            <input type="text" class="form-control" name="publishedDate"
                                                   id="published-date"
                                                   placeholder="Chọn thời gian bắt đầu...(HH:mm dd-MM-yyyy)"
                                                   ng-model="dataDate.publishedDate">
                                            <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                        </div>
                                        <script type="text/javascript">
                                            $(function () {
                                                $('#published-date-picker').datetimepicker({
                                                    format: 'DD-MM-YYYY',
                                                    allowInputToggle: true
                                                });
                                            });
                                        </script>
                                    </div>
                                </div>
                                <div class="form-item" ng-if="dataDocument.type">
                                    <div class="input-inner">
                                        <span class="form-label">Ngày có hiệu lực</span>
                                        <div class="input-group" id="effective-date-picker">
                                            <input type="text" class="form-control" name="effectiveDate"
                                                   id="effective-date"
                                                   placeholder="Chọn thời gian kết thúc...(HH:mm dd-MM-yyyy)"
                                                   ng-model="dataDate.effectiveDate">
                                            <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                        </div>
                                        <script type="text/javascript">
                                            $(function () {
                                                $('#effective-date-picker').datetimepicker({
                                                    format: 'DD-MM-YYYY',
                                                    allowInputToggle: true
                                                });
                                            });
                                        </script>
                                    </div>
                                </div>
                                <div class="form-item" ng-if="dataDocument.type">
                                    <div class="input-inner">
                                        <span class="form-label">Menu</span>
                                        <div class="input-text">
                                            <select class="form-control selectpicker"
                                                    ng-model="dataMenuParent.id" id="dataMenuParent"
                                                    name="dataMenuParent" ng-change="loadSubmenu2(dataMenuParent.id)">
                                                <option value="">--- Chọn ---</option>
                                                <option ng-repeat="item in menuByGroup"
                                                        value="{{item.id}}">{{item.name}}
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-item" ng-if="dataSubmenu2.length>0">
                                    <div class="input-inner">
                                        <span class="form-label">Menu cấp 2</span>
                                        <div class="input-text">
                                            <select class="form-control selectpicker"
                                                    ng-model="dataMenu.id" id="dataMenu"
                                                    name="dataMenu">
                                                <option value="">--- Chọn ---</option>
                                                <option ng-repeat="item in dataSubmenu2"
                                                        value="{{item.menu.id}}">{{item.menu.name}}
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" ng-if="!dataDocument.id && !uploading"
                                    ng-click="create()">Thêm mới
                            </button>
                            <button type="button" class="btn btn-primary" ng-if="dataDocument.id && !uploading"
                                    ng-click="update()">Cập nhật
                            </button>
                            <button type="button" class="btn btn-default" data-dismiss="modal"
                                    ng-click="closedPopupDocument()">
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
