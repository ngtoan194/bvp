<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/22/18
  Time: 4:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- page content -->
<div class="right_col" role="main" ng-controller="mgrDictionaryController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="min-width: 50%; font-size: 18px;">Quản lý từ điển
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

                            </div>
                            <div class="col-sm-6">

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="well padding-10">
                                    <table class="table table-striped table-bordered dataTable no-footer">
                                        <thead>
                                        <tr class="table-tr-th">
                                            <th class="text-center">STT</th>
                                            <th class="text-center">Từ khóa</th>
                                            <th class="text-center">Loại</th>
                                            <th class="text-center">Tiếng Việt</th>
                                            <th class="text-center">Tiếng Anh</th>
                                            <th class="text-center">Tiện ích</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr class="table-tr-th">
                                            <td></td>
                                            <td>
                                                <div class="time-item">
                                                    <input type="text" class="form-control"
                                                           placeholder="Nhập từ khóa tìm kiếm"
                                                           ng-model="search.searchKey" ng-enter="loadPage()">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="time-item">
                                                    <select class="select-type form-control"
                                                            ng-model="search.searchType">
                                                        <option value="">Tất cả</option>
                                                        <option value="1">Menu</option>
                                                        <option value="2">Bác sĩ</option>
                                                        <option value="3">Chức vụ</option>
                                                        <option value="4">Khác</option>
                                                    </select>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="time-item">
                                                    <input type="text" class="form-control"
                                                           placeholder="Nhập từ tiếng việt tìm kiếm"
                                                           ng-model="search.searchVi">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="time-item">
                                                    <input type="text" class="form-control"
                                                           placeholder="Nhập từ tiếng anh tìm kiếm"
                                                           ng-model="search.searchEn">
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr class="table-tr-th" ng-repeat="item in data | filterDic:search">
                                            <td class="time-item text-center">{{$index + 1}}</td>
                                            <td class="time-item text-left">
                                                {{item.key}}
                                            </td>
                                            <td class="time-item text-center">
                                                {{
                                                item.isMenu?"Menu":
                                                item.isDoctor?"Bác sĩ":
                                                item.isPosition?"Chức vụ":""
                                                }}
                                            </td>
                                            <td class="time-item text-center">
                                                {{item.vi}}
                                            </td>
                                            <td class="time-item text-center">
                                                {{item.en}}
                                            </td>
                                            <td class="time-item text-center">
                                                <div class="btn-group">
                                                    <button data-toggle="dropdown" type="button"
                                                            class="btn btn-success dropdown-toggle btn-xs">
                                                        <span class="caret"></span>
                                                    </button>
                                                    <ul role="menu" class="dropdown-menu">
                                                        <li>
                                                            <a ng-click="showdataUpdate(item, $index)">
                                                                <i class="fa fa-edit"></i>Sửa
                                                            </a>
                                                        </li>
                                                        <li class="divider"></li>
                                                        <li>
                                                            <a ng-click="removeKey(item)">
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade bs-example-modal-lg" id="modal-update-key" tabindex="-1"
             role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" style="width: 600px; margin: 150px">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span
                                aria-hidden="true" ng-click="closedPopupTag()">×</span>
                        </button>
                        <h3 class="modal-title">Cập nhật từ điển</h3>
                    </div>
                    <form id="form-tag" novalidate="novalidate"
                          class="smart-form" ng-validate="validationTag">
                        <div class="modal-body">
                            <div class="form-item">
                                <div class="input-inner">
                                    <span class="form-label">Từ khóa</span>
                                    <div class="input-text">
                                        <input type="text" class="form-control" ng-disabled="item!=undefined"
                                               placeholder="Nhập cụm từ cần dịch..."
                                               ng-model="dic.key">
                                    </div>
                                </div>
                            </div>
                            <div class="form-item">
                                <div class="input-inner">
                                    <span class="form-label">Tiếng việt</span>
                                    <div class="input-text">
                                        <input type="text" class="form-control" name="name"
                                               placeholder="Nhập nội dung tiếng việt..."
                                               ng-model="dic.vi">
                                    </div>
                                </div>
                            </div>
                            <div class="form-item">
                                <div class="input-inner">
                                    <span class="form-label">Tiếng anh</span>
                                    <div class="input-text">
                                        <input type="text" class="form-control" name="name"
                                               placeholder="Nhập nội dung tiếng anh..."
                                               ng-model="dic.en">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" ng-click="save()">Lưu</button>
                            <button type="button" class="btn btn-default" ng-click="clear()"> Làm lại</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->
