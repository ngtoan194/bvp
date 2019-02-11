<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 11/14/18
  Time: 6:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="right_col" role="main" ng-controller="mgrPageNewsController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="min-width: 50%; font-size: 18px;">Quản lý hoạt động khoa phòng
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
                                                ng-init="size ='10'" n ng-model="size"
                                                class="form-control input-sm" ng-change="loadPage(1)">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                    </label>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div id="datatable_filter" class="dataTables_filter">
                                    <a type="submit" ng-click="showPopupNews()" class="btn btn-success">Thêm mới</a>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div>
                                <div class="well padding-10">
                                    <table class="table table-striped table-bordered dataTable no-footer">
                                        <thead>
                                        <tr class="table-tr-th">
                                            <th style="text-align: center">STT</th>
                                            <th style="text-align: center">Tiêu đề</th>
                                            <th style="text-align: center">Tin nổi bật</th>
                                            <th style="text-align: center">Ngày tạo</th>
                                            <th style="text-align: center">Tiện ích</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr class="table-tr-th">
                                            <td></td>
                                            <td>
                                                <div class="time-item">
                                                    <input type="text" class="form-control"
                                                           placeholder="Nhập tên tiêu đề để tìm kiếm"
                                                           ng-model="dataSearch.title" ng-enter="loadPage(1)">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="time-item text-center">
                                                    <div class="item-control">
                                                        <select name="" id="select-type"
                                                                class="select-type form-control"
                                                                ng-model="dataSearch.isHotNews" ng-change="loadPage(1)">
                                                            <option value="">Tất cả</option>
                                                            <option ng-value="0">Tin thường</option>
                                                            <option ng-value="1">Tin nổi bật</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                        <tr class="table-tr-th" ng-repeat="item in data">
                                            <td class="text-center">{{$index + stt}}</td>
                                            <td class="text-center">
                                                {{item.news.title}}
                                            </td>
                                            <td class="text-center">
                                                <a ng-if="item.news.isHotNews">
                                                    <i style="color: #05733e;" class="fa fa-check-circle"></i>
                                                </a>
                                            </td>
                                            <td class="text-center">
                                                <p>
                                                    {{item.news.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")}}
                                                </p>
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
                                                               href="/khoa-phong/hoat-dong/chi-tiet/{{item.news.linkAlias}}">
                                                                <i class="fa fa-eye"></i>Xem chi tiết
                                                            </a>
                                                        </li>
                                                        <li ng-if="!item.news.isHotNews">
                                                            <a ng-click="setHotNews(item.news)">
                                                                <i class="fa fa-check-circle"></i>Chọn tin nổi bật
                                                            </a>
                                                        </li>
                                                        <li ng-if="item.news.isHotNews">
                                                            <a ng-click="setHotNews(item.news)">
                                                                <i class="fa fa-times-circle"></i>Hủy tin nổi bật
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a ng-click="showDataUpdate(item.news)">
                                                                <i class="fa fa-pencil-square-o"></i>Sửa
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a data-toggle="modal"
                                                               ng-click="delete(item.news)">
                                                                <i class="fa fa-times"></i>Xóa
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr ng-if="data.length == 0">
                                            <td colspan="5">
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
                                    <div class="dataTables_paginate paging_simple_numbers" id="datatable_paginate"
                                         ng-if="data.length>0">
                                        <ul class="pagination">
                                            <li ng-click="loadPage(1)" style="cursor: pointer;"
                                                class="paginate_button previous {{page==1?'disabled':''}}">
                                                <a>Trang đầu</a>
                                            </li>
                                            <li ng-repeat="itemPage in listPage | limitTo : 10" style="cursor: pointer;"
                                                class="paginate_button {{page==itemPage?'active':''}}"
                                                ng-click="loadPage(itemPage)">
                                                <a>{{itemPage}}</a>
                                            </li>
                                            <li ng-click="loadPage(totalPage)" style="cursor: pointer;"
                                                class="paginate_button next {{page==totalPage?'disabled':''}}">
                                                <a>Trang cuối</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade bs-example-modal-lg" id="modal-news" tabindex="-1"
                             role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">
                                            <span aria-hidden="true" ng-click="closedPopupNews()">×</span>
                                        </button>
                                        <h2 class="modal-title" style="font-size: 28px">
                                            {{dataNews.id?"Cập nhật":"Thêm mới"}}
                                        </h2>
                                    </div>
                                    <form id="form-news" novalidate="novalidate" class="smart-form"
                                          ng-validate="validationNews">
                                        <div class="modal-body">
                                            <div class="col-md-5">
                                                <div class="form-item">
                                                    <div class="input-inner">
                                                        <span class="form-label">Tiêu đề </span>
                                                        <div class="input-text">
                                                            <input class="form-control" name="title"
                                                                   placeholder="Nhập tiêu đề page..." type="text"
                                                                   ng-model="dataNews.title">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-item">
                                                    <div class="input-inner">
                                                        <span class="form-label">Nội dung xem trước </span>
                                                        <div class="text-area">
                                                             <textarea class="form-control" name="contentPreview"
                                                                       ng-model="dataNews.contentPreview" rows="5"
                                                                       placeholder="Nhập nội dung xem trước..."></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-item" style="margin-top: 15px;">
                                                    <span class="form-label">Tin nổi bật</span>
                                                    <div class="checkbox-style">
                                                        <a style="cursor: pointer"
                                                           ng-click="checkIsHotNews(checkHotNews?false:true)">
                                                            <i ng-if="!checkHotNews" class="fa fa-square-o fa-lg"></i>
                                                            <i ng-if="checkHotNews"
                                                               class="fa fa-check-square-o fa-lg"></i>
                                                        </a>
                                                        <span class="label-form">chọn là tin nổi bật</span>
                                                    </div>
                                                </div>
                                                <div class="form-item">
                                                    <div class="input-inner">
                                                        <span class="form-label" style="margin-top: 10px;">
                                                            Ảnh
                                                        </span>
                                                        <div class="input input-file" style="margin-top: 10px;">
                                                            <div class="button"
                                                                 style="margin-top: 5px;">
                                                                <input type="file" id="select-file-image-cover"
                                                                       name="image"
                                                                       accept="image/x-png,image/gif,image/jpeg"
                                                                       ng-file-change="fileMgr.selectFile"
                                                                       file-input-id="{{dataNews.id}}"
                                                                       ng-model="dataNews.imagePreview">Chọn
                                                            </div>
                                                            <input type="text" style="padding-right: 80px !important;"
                                                                   class="form-control" id="text-file-name-image-cover"
                                                                   placeholder="Chọn file ảnh" readonly
                                                                   ng-model="dataNews.imagePreview"/>
                                                        </div>
                                                        <div style="width: 100%; height: auto; display: flex;align-items:center; justify-content:center;">
                                                            <img style="max-width: 100%; max-height:229px; margin-top: 10px;"
                                                                 ng-if="dataNews.imagePreview"
                                                                 id="img-cover"
                                                                 ng-src="{{dataNews.imagePreview.absoluteUrl()}}">
                                                            <img ng-if="uploading"
                                                                 src="/static/images/loading/loading2.gif"
                                                                 style="width: 69px; position: absolute; top: 65%; left: 44%;"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-7">
                                                <div class="form-item">
                                                    <div class="form-item">
                                                        <div class="input-inner">
                                                            <span style="margin-top: 10px;"><strong>Nội dung </strong></span>
                                                            <div class="textarea">
                                                                <textarea type="text"
                                                                          ng-model="dataNews.content"
                                                                          name="content" id="content"
                                                                          ckeditor></textarea>
                                                                <b class="tooltip tooltip-bottom-right"></b>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button class="btn btn-success" ng-if="!dataNews.id && !uploading"
                                                    ng-click="create()">Thêm
                                            </button>
                                            <button class="btn btn-success" ng-if="dataNews.id && !uploading"
                                                    ng-click="update()">Cập nhật
                                            </button>
                                            <button class="btn btn-success"
                                                    ng-click="closedPopupNews()">Hủy
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