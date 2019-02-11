<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/11/18
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- page content -->
<div class="right_col" role="main" ng-controller="mgrMenuController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="min-width: 50%; font-size: 18px;">Quản lý menu cấp 1
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
                                <%--<div class="dataTables_length" id="datatable_length" style="width: 40%; float: left;">--%>
                                <%--<label style="font-weight: normal; text-align: left; white-space: nowrap;">Show</label>--%>
                                <%--<label>--%>
                                <%--<select name="datatable_length" aria-controls="datatable"--%>
                                <%--class="form-control input-sm">--%>
                                <%--<option value="10">10</option>--%>
                                <%--<option value="25">25</option>--%>
                                <%--<option value="50">50</option>--%>
                                <%--<option value="100">100</option>--%>
                                <%--</select>--%>
                                <%--</label>--%>
                                <%--<label style="font-weight: normal; text-align: left; white-space: nowrap;">--%>
                                <%--entries</label>--%>
                                <%--</div>--%>
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
                                            <th class="text-center">Tên Menu</th>
                                            <th class="text-center">Liên kết</th>
                                            <th class="text-center">Vị trí</th>
                                            <th class="text-center">Active</th>
                                            <th class="text-center">Sub menu</th>
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
                                                           placeholder="Nhập tên menu để tìm kiếm"
                                                           ng-model="dataSearch.name" ng-enter="loadPage()">
                                                </div>
                                            </td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <div class="time-item">
                                                    <select class="select-type form-control"
                                                            ng-model="dataSearch.isActive"
                                                            ng-change="loadPage()">
                                                        <option value="">-- Chọn --</option>
                                                        <option value="1">Active</option>
                                                        <option value="0">In-active</option>
                                                    </select>
                                                </div>
                                            </td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr class="table-tr-th" ng-repeat="item in menu | orderBy : 'menu.index'">
                                            <td class="time-item text-center">{{$index + stt}}</td>
                                            <td class="time-item text-center">
                                                <div class="name-menu">{{item.menu.name}}</div>
                                                <div class="active-menu" ng-if="item.menu.role">
                                                    kích hoạt với<br>
                                                    <strong>{{getRoleName(item.menu)}}</strong>
                                                </div>
                                            </td>
                                            <td class="time-item text-center">
                                                <a style="word-break: break-all;" target="_blank" href="{{item.menu.href}}"
                                                   class="link-menu">{{checkHrefMenu(item.menu)}}</a>
                                            </td>
                                            <td class="time-item text-center">
                                                {{item.menu.index}}
                                            </td>
                                            <td class="time-item text-center">
                                                <a ng-if="item.menu.isActive == 1">
                                                    <i style="color: #05733e;" class="fa fa-check-circle"></i></a>
                                            </td>
                                            <td class="time-item text-center">
                                                <div class="link-sub-menu">
                                                    <p style="text-align: left;" ng-repeat="item2 in item.menus | limitTo:3 | orderBy : 'menu.index'">
                                                        - {{item2.name}}<br>
                                                    </p>
                                                    <a target="_blank" ng-if="item.menus.length >=3"
                                                       href="/admin/quan-ly-menu2?menuId={{item.menu.id}}">
                                                        Xem thêm...
                                                    </a>
                                                </div>
                                            </td>
                                            <td class="time-item text-center">
                                                {{item.menu.createdDate.toDateObject('-').format("HH:mm, dd-MM-yyyy")}}
                                            </td>
                                            <td class="time-item text-center">
                                                <div class="btn-group" ng-if="item.menu.index != 1">
                                                    <button data-toggle="dropdown" type="button"
                                                            class="btn btn-success dropdown-toggle btn-xs">
                                                        <span class="caret"></span>
                                                    </button>
                                                    <ul role="menu" class="dropdown-menu">
                                                        <li>
                                                            <a target="_blank"
                                                               href="/admin/quan-ly-menu2?menuId={{item.menu.id}}">
                                                                <i class="fa fa-bars"></i>Menu cấp 2</a>
                                                        </li>
                                                        <li ng-if="!item.menu.isActive">
                                                            <a ng-click="setActive(item.menu)">
                                                                <i class="fa fa-check-circle"></i>Active
                                                            </a>
                                                        </li>
                                                        <li ng-if="item.menu.isActive">
                                                            <a ng-click="setActive(item.menu)">
                                                                <i class="fa fa-times-circle"></i>In-active
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a ng-click="showdataUpdate(item.menu)">
                                                                <i class="fa fa-edit"></i>Sửa
                                                            </a>
                                                        </li>
                                                        <li class="divider"></li>
                                                        <li>
                                                            <a ng-click="deleteMenu(item.menu)">
                                                                <i class="fa fa-times"></i>Xóa</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="well padding-10">
                                    <div style="border-bottom: 3px solid #dddddd; margin-bottom: 10px;">
                                        <h2 class="title-right-box">{{dataMenu.id?"Cập nhật":"Thêm mới"}}</h2>
                                    </div>
                                    <form id="form-menu" novalidate="novalidate" class="smart-form"
                                          ng-validate="validationMenu">
                                        <div>
                                            <div class="form-item">
                                                <div class="input-inner">
                                                    <span class="form-label">Vị trí</span>
                                                    <div class="input-text">
                                                        <input type="text" id="position" name="position" class="form-control"
                                                               placeholder="Nhập vi tri" maxlength="99"
                                                               ng-model="dataMenu.index">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-item">
                                                <div class="input-inner">
                                                    <span class="form-label">Tên menu</span>
                                                    <div class="input-text">
                                                        <input type="text" class="form-control" name="name"
                                                               placeholder="Nhập tên menu..."
                                                               ng-model="dataMenu.name">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-item">
                                                <div class="input-inner">
                                                    <span class="form-label">Liên kết</span>
                                                    <div class="input-text">
                                                        <input type="text" class="form-control" name="name"
                                                               placeholder="Nhập liên kết..."
                                                               ng-model="dataMenu.href">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-item">
                                                <div class="input-inner">
                                                    <span class="form-label">Hiển thị với</span>
                                                    <div class="input-text">
                                                        <select ng-select multiple id="menuRole" name="menuRole"
                                                                class="select-type form-control"
                                                                ng-model="menuRole.role">
                                                            <option ng-repeat="item in listRole" ng-value="item.id">
                                                                {{item.name}}
                                                            </option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-item">
                                                <span class="form-label">Kích hoạt</span>
                                                <div class="checkbox-style">
                                                    <i ng-click="checkActiveMenu(true)" style="cursor: pointer"
                                                       ng-if="!checkActive" class="fa fa-square-o  fa-lg"></i>
                                                    <i ng-click="checkActiveMenu(false)" style="cursor: pointer"
                                                       ng-if="checkActive" class="fa fa-check-square-o fa-lg"></i>
                                                    <span class="label-form">Chọn kích hoạt menu</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="text-align: right;">
                                            <button type="button" class="btn btn-success" ng-if="!dataMenu.id"
                                                    ng-click="createMenu()">
                                                Thêm mới
                                            </button>
                                            <button type="button" class="btn btn-success" ng-if="dataMenu.id"
                                                    ng-click="updateMenu(dataMenu)">
                                                Cập nhật
                                            </button>
                                            <button type="button" class="btn btn-success" ng-click="cancelData()">Hủy</button>
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