<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 11/03/18
  Time: 10:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- page content -->
<div class="right_col" role="main" ng-controller="mgrVideoController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="min-width: 50%; font-size: 18px;">Quản lý video
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
                                            <th class="text-center" style="width: 20%">Tên</th>
                                            <th class="text-center" style="width:30%;">Liên kết</th>
                                            <th class="text-center" style="width: 20%">Ảnh</th>
                                            <th class="text-center" style="width: 15%">Video nổi bật</th>
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
                                                           placeholder="Nhập tên khóa học để tìm kiếm"
                                                           ng-model="dataSearch.name" ng-enter="loadPage(1)">
                                                </div>
                                            </td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <div class="time-item">
                                                    <select class="form-control" ng-model="dataSearch.isHotVideo"
                                                            ng-change="loadPage(1)">
                                                        <option value="">Tất cả</option>
                                                        <option value="1">Nổi bật</option>
                                                        <option value="0">Thường</option>
                                                    </select>
                                                </div>
                                            </td>
                                            <td></td>
                                            <td></td>

                                        </tr>
                                        <tr class="table-tr-th" ng-repeat="item in data">
                                            <td class="time-item text-center">{{$index + stt}}</td>
                                            <td class="time-item text-center">
                                                {{item.video.name}}
                                            </td>
                                            <td class="time-item text-center" style="max-width: 120px">
                                                <a style="word-wrap: break-word" target="_blank" href="{{item.video.url}}">{{item.video.url}}</a>
                                            </td>
                                            <td class="time-item text-center">
                                                <img style="height: 80px; object-fit: cover;"
                                                     ng-src="{{item.video.thumbnail.absoluteUrl()}}">
                                            </td>
                                            <td class="time-item text-center">
                                                <a ng-if="item.video.isHotVideo">
                                                    <i style="color: #05733e;" class="fa fa-check-circle"></i></a>
                                            </td>
                                            <td class="time-item text-center">
                                                {{item.video.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")}}
                                            </td>
                                            <td class="time-item text-center">
                                                <div class="btn-group">
                                                    <button data-toggle="dropdown" type="button"
                                                            class="btn btn-success dropdown-toggle btn-xs">
                                                        <span class="caret"></span>
                                                    </button>
                                                    <ul role="menu" class="dropdown-menu">
                                                        <li>
                                                            <a target="_blank" href="/video/{{item.video.linkAlias}}">
                                                                <i class="fa fa-eye"></i>Xem chi tiết
                                                            </a>
                                                        </li>
                                                        <li ng-if="!item.video.isHotVideo">
                                                            <a ng-click="setActive(item.video)">
                                                                <i class="fa fa-check-circle"></i>Active
                                                            </a>
                                                        </li>
                                                        <li ng-if="item.video.isHotVideo">
                                                            <a ng-click="setActive(item.video)">
                                                                <i class="fa fa-times-circle"></i>In-active
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a ng-click="showdataUpdate(item.video)">
                                                                <i class="fa fa-edit"></i>Sửa
                                                            </a>
                                                        </li>
                                                        <li class="divider"></li>
                                                        <li>
                                                            <a ng-click="delete(item.video)">
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
                                        <h2 class="title-right-box ng-scope" ng-if="!dataVideo.id">
                                            Thêm mới video
                                        </h2>
                                        <h2 class="title-right-box ng-scope" ng-if="dataVideo.id">
                                            Cập nhật video
                                        </h2>
                                    </div>
                                    <form id="form-video" novalidate="novalidate" class="smart-form"
                                          ng-validate="validationVideo">
                                        <div>
                                            <div class="form-item">
                                                <div class="input-inner">
                                                    <span class="form-label">Tên video</span>
                                                    <div class="input-text">
                                                        <input type="text" class="form-control" name="name"
                                                               placeholder="Nhập tên video..."
                                                               ng-model="dataVideo.name">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-item">
                                                <div class="input-inner">
                                                    <span class="form-label">Liên kết</span>
                                                    <div class="input-text">
                                                        <input type="text" class="form-control" name="url"
                                                               placeholder="Nhập liên kêt video..."
                                                               ng-model="dataVideo.url">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="input-inner">
                                                <span class="form-label" style="margin-top: 10px; font-weight: bold">Ảnh xem trước
                                                </span>
                                                <div class="input input-file" style="margin-top: 10px;">
                                                    <div class="button"
                                                         style="margin-top: 5px; margin-right: 20px;">
                                                        <input type="file" id="select-file-image-cover"
                                                               name="file1"
                                                               accept="image/x-png,image/gif,image/jpeg"
                                                               ng-file-change="imageUrl.selectFile"
                                                               file-input-id="{{dataVideo.id}}"
                                                               ng-model="dataVideo.thumbnail">Chọn
                                                    </div>
                                                    <input type="text" style="padding-right: 80px !important;"
                                                           class="form-control" id="text-file-name"
                                                           placeholder="Chọn file ảnh" readonly
                                                           ng-model="dataVideo.thumbnail"/>
                                                </div>
                                                <div style="width: 100%; height: auto; display: flex;align-items:center; justify-content:center;">
                                                    <img style="max-width: 100%; max-height:229px; margin-top: 10px;"
                                                         ng-if="dataVideo.thumbnail"
                                                         id="img-cover"
                                                         ng-src="{{dataVideo.thumbnail.absoluteUrl()}}">
                                                    <img ng-if="uploading"
                                                         src="/static/images/loading/loading2.gif"
                                                         style="width: 69px; position: absolute; top: 65%; left: 44%;"/>
                                                </div>
                                            </div>
                                            <div class="form-item" style="margin-top: 15px;">
                                                <span class="form-label">Kích hoạt</span>
                                                <div class="checkbox-style">
                                                    <i ng-click="checkisHotVideo(true)" style="cursor: pointer"
                                                       ng-if="!checkHotVideo" class="fa fa-square-o  fa-lg"></i>
                                                    <i ng-click="checkisHotVideo(false)" style="cursor: pointer"
                                                       ng-if="checkHotVideo" class="fa fa-check-square-o fa-lg"></i>
                                                    <span class="label-form">Chọn là video nổi bật</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="text-align: right; margin-top: 25px;">
                                            <button type="button" class="btn btn-primary"
                                                    ng-if="!dataVideo.id && !uploading"
                                                    ng-click="create()">
                                                Thêm mới
                                            </button>
                                            <button type="button" class="btn btn-primary"
                                                    ng-if="dataVideo.id && !uploading"
                                                    ng-click="update()">
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