<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 11/14/18
  Time: 6:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.UUID" %>
<c:set var="idImg" value="${UUID.randomUUID()}"></c:set>
<!-- page content -->
<div class="right_col" role="main" ng-controller="mgrPageAlbumController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="min-width: 50%; font-size: 18px;">Quản lý thư viện ảnh
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
                                    <button type="submit" class="btn btn-success" ng-click="showPopupAlbum()">
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
                                        <th class="text-center">Tên album</th>
                                        <%--<th class="text-center">Số lượng ảnh</th>--%>
                                        <th class="text-center">Ảnh đại diện</th>
                                        <th class="text-center">Ngày tạo</th>
                                        <th class="text-center">Tiện ích</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="table-tr-th">
                                        <td></td>
                                        <td>
                                            <input type="text" class="form-control"
                                                   placeholder="Nhập tên album để tìm kiếm..."
                                                   ng-model="dataSearch.name" ng-enter="loadPage(1)">
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <%--<td></td>--%>
                                    </tr>
                                    <tr class="table-tr-th" ng-repeat="item in data">
                                        <td class="time-item text-center">{{$index + stt}}</td>
                                        <td class="time-item text-center">
                                            {{item.album.name}}
                                        </td>
                                        <%--<td class="time-item text-center">{{item.album.images.length}}</td>--%>
                                        <td class="time-item text-center">
                                            <img style="height: 80px;"
                                                 ng-src="{{item.album.imagePreview.absoluteUrl()}}">
                                        </td>
                                        <td class="time-item text-center">
                                            {{item.album.createdDate.toDateObject('-').format("HH:mm, dd-MM-yyyy")}}
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
                                                           href="/khoa-phong/album/chi-tiet/{{item.album.linkAlias}}">
                                                            <i class="fa fa-eye"></i>Xem chi tiết</a>
                                                    </li>
                                                    <li>
                                                        <a ng-click="showdataUpdate(item.album)">
                                                            <i class="fa fa-edit"></i>Sửa</a>
                                                    </li>
                                                    <li class="divider"></li>
                                                    <li>
                                                        <a ng-click="delete(item.album)">
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
                                <div class="dataTables_paginate paging_simple_numbers" id="datatable_paginate"
                                     ng-if="data.length>0">
                                    <ul class="pagination">
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
        <div class="modal fade bs-example-modal-lg" id="modal-album" tabindex="-1"
             role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content" style="width: 866px; margin: 115px">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span
                                aria-hidden="true" ng-click="closedPopupAlbum()">×</span>
                        </button>
                        <h3 class="modal-title">{{dataAlbum.id?"Cập nhật":"Thêm mới"}}</h3>
                    </div>
                    <form id="form-album" novalidate="novalidate"
                          class="smart-form" ng-validate="validationAlbum">
                        <div class="modal-body">
                            <div class="col-md-5">
                                <div class="form-item">
                                    <div class="input-inner">
                                        <span class="form-label">Tên album</span>
                                        <div class="input-text">
                                            <input type="text" class="form-control" name="name"
                                                   placeholder="Nhập tên album..."
                                                   ng-model="dataAlbum.name">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-item" id="select-file">
                                    <div class="form-label" style="margin-top: 10px;">
                                        <span class="form-label">Ảnh đại diện</span>
                                    </div>
                                    <div class="input input-file" style="margin-top: 10px;">
                                        <div class="button"
                                             style="margin-top: 5px;">
                                            <input type="file"
                                                   id="select-file-image" name="file1"
                                                   accept="image/x-png,image/gif,image/jpeg"
                                                   ng-file-change="fileMgr.selectImgPreview"
                                                   file-input-id="{{dataAlbum.id}}"
                                                   ng-model="dataAlbum.imagePreview">Chọn
                                        </div>
                                        <input type="text" class="form-control"
                                               style="border-radius: 4px;"
                                               class="form-control" id="text-file-image-name"
                                               placeholder="Chọn file ảnh" readonly
                                               ng-model="dataAlbum.imagePreview"/>
                                    </div>
                                    <div style="width: 100%; height: auto; display: flex;align-items:center; justify-content:center;">
                                        <img style="max-width: 100%; margin-top: 10px;" ng-if="dataAlbum.imagePreview"
                                             id="img-temp-avatar"
                                             ng-src="{{dataAlbum.imagePreview.absoluteUrl()}}">
                                        <img ng-if="uploading"
                                             src="/static/images/loading/loading2.gif"
                                             style="width: 69px; position: absolute; top: 65%; left: 44%;"/>

                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7">
                                <div class="well padding-10" style="margin: 10px; overflow: hidden;">
                                    <div>
                                        <label class="label"
                                               style="margin-top: 10px;"><strong>Ảnh</strong>
                                        </label>
                                        <div>
                                            <div style="clear: both;">
                                                <div ng-repeat="itemImage in listImages"
                                                     data-lightbox="image-1"
                                                     href="{{itemImage.image.imageUrl()}}"
                                                     style="position: relative; width: 100px; height: 100px; margin: 3px; display: inline-block; float: left">
                                                    <label ng-click="fileMgr.remove(itemImage)"
                                                           style="position: absolute; left: 5px; top: 5px; cursor: pointer">
                                                        <i class="fa fa-times-circle"></i>
                                                    </label>
                                                    <img src="/static/images/loading/loading2.gif"
                                                         style="width: 40px;height: 40px;position: absolute;top: 30px;left: 30px;"
                                                         ng-if="itemImage.uploading"/>
                                                    <img alt="image" onerror="ImgError(this);"
                                                         style="width: 100px; height: 100px; object-fit: cover;"
                                                         ng-src="{{itemImage.image.absoluteUrl()}}"/>
                                                </div>
                                            </div>
                                            <div class="input-item" style="color: #0c4e2e; cursor: pointer;">
                                                <div class="multiple-file-upload"
                                                     ng-click="fileMgr.chooseFile('${idImg}')">
                                                    <label style="cursor: pointer;" class="files">
                                                        Thêm ảnh: <i class="fa fa-file-image-o"></i>
                                                    </label>
                                                </div>
                                                <input type="file" style="display: none"
                                                       multiple id="${idImg}" data-id="${idImg}"
                                                       name="file1" accept="image/*" class="choose-file"
                                                       data-bind-to="new-new-post"
                                                       ng-file-change="fileMgr.selectFile"
                                                       ng-model="fileImage"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-success" ng-if="!dataAlbum.id && !uploading"
                                    ng-click="create()">Thêm mới
                            </button>
                            <button type="button" class="btn btn-success" ng-if="dataAlbum.id && !uploading"
                                    ng-click="update()">Cập nhật
                            </button>
                            <button type="button" class="btn btn-success" data-dismiss="modal"
                                    ng-click="closedPopupAlbum()">
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