<%--
  Created by IntelliJ IDEA.
  User: Huyen
  Date: 10/23/2018
  Time: 9:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="right_col" role="main" ng-controller="mgrSlideItemController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size: 18px;">Danh sách Slide Item
                        </h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-expanded="false">
                                    <i class="fa fa-wrench"></i>
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
                                    <label style="font-weight: normal; text-align: left; white-space: nowrap;">Hiện
                                        thị</label>
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
                                    <button type="submit" class="btn btn-success" ng-click="showPopupSlideItem()">Thêm
                                        mới
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-striped table-bordered dataTable no-footer">
                                    <thead>
                                    <tr class="table-tr-th">
                                        <th style="text-align: center; width: 7%">STT</th>
                                        <th style="text-align: center; width: 18%">Tên slide item</th>
                                        <th style="text-align: center; width: 40%">Hình ảnh</th>
                                        <th style="text-align: center; width: 25%">Liên kết</th>
                                        <th style="text-align: center; width: 10%">Tiện ích</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="table-tr-th" ng-repeat="item in slideItem">
                                        <td style="text-align: center" class="time-item text-center">
                                            {{$index + stt}}
                                        </td>
                                        <td class="time-item text-center">{{item.slideItem.name}}</td>
                                        <td style="text-align: center" class="time-item text-center">
                                            <img style="width: 320px; height: 120px; object-fit: cover !important; "
                                                 ng-src="{{item.slideItem.image.absoluteUrl()}}">
                                        </td>
                                        <td class="time-item text-center">{{item.slideItem.href}}</td>
                                        <td class="time-item text-center">
                                            <div class="btn-group">
                                                <button data-toggle="dropdown" type="button"
                                                        class="btn btn-success dropdown-toggle btn-xs">
                                                    <span class="caret"></span>
                                                </button>
                                                <ul role="menu" class="dropdown-menu">
                                                    <li>
                                                        <a data-toggle="modal" ng-click="showdataUpdate(item)">
                                                            <i class="fa fa-pencil-square-o"></i>Sửa
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a data-toggle="modal"
                                                           ng-click="deleteSlideItem(item)">
                                                            <i class="fa fa-times"></i>Xóa
                                                        </a>
                                                    </li>
                                                </ul>
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
                                     ng-if="slideItem.length>0">
                                    <ul class="pagination pull-right">
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
                    <div class="modal fade popup-edit" id="popup-add-slideItem">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" ng-click="closedSlide()">
                                        &times;
                                    </button>
                                    <h2 ng-if="dataSlideItem.id==null">Thêm mới slide item</h2>
                                    <h2 ng-if="dataSlideItem.id!=null">Cập nhật slide item</h2>
                                </div>
                                <form id="form-slide-item" novalidate="novalidate" class="smart-form"
                                      ng-validate="validationSlideItem">
                                    <div class="modal-body" style="padding: 30px;">
                                        <div class="row">
                                            <div class="form-item">
                                                <span class="form-label">Tên slide* :</span>
                                                <div class="input-text">
                                                    <input class="form-control" id="nameSlideItem" name="nameSlideItem"
                                                           placeholder="Nhập tên slide" type="text"
                                                           ng-model="dataSlideItem.name">
                                                </div>
                                            </div>
                                            <div class="form-item">
                                                <span class="form-label">Liên kết Slide: </span>
                                                <div class="input-text">
                                                    <input class="form-control" id="hrefSlideItem" name="hrefSlideItem"
                                                           placeholder="Nhập liên kết slide item" type="text"
                                                           ng-model="dataSlideItem.href">
                                                </div>
                                            </div>
                                            <div class="input-inner">
                                                <div class="form-label" style="margin-top: 10px;">Ảnh*
                                                </div>
                                                <div class="input input-file" style="margin-top: 10px;">
                                                    <div class="button"
                                                         style="margin-top: 5px; margin-right: 20px;">
                                                        <input type="file" id="select-file-image-cover"
                                                               name="file1"
                                                               accept="image/x-png,image/gif,image/jpeg"
                                                               ng-file-change="imageUrl.selectFile"
                                                               file-input-id="{{slideItem.id}}"
                                                               ng-model="dataSlideItem.image">Chọn
                                                    </div>
                                                    <input type="text" style="padding-right: 80px !important;"
                                                           class="form-control" id="text-file-name"
                                                           placeholder="Chọn file ảnh" readonly
                                                           ng-model="dataSlideItem.image"/>
                                                </div>
                                                <div style="width: 100%; height: auto; display: flex;align-items:center; justify-content:center;">
                                                    <img style="max-width: 100%; max-height:229px; margin-top: 10px;"
                                                         ng-if="dataSlideItem.image"
                                                         id="img-cover"
                                                         ng-src="{{dataSlideItem.image.absoluteUrl()}}">
                                                    <img ng-if="uploading"
                                                         src="/static/images/loading/loading2.gif"
                                                         style="width: 69px; position: absolute; top: 65%; left: 44%;"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <footer style="margin-top: 15px">
                                            <button class="btn btn-success" ng-if="dataSlideItem.id==null && !uploading"
                                                    ng-click="createSlideItem()">Thêm
                                            </button>
                                            <button class="btn btn-success" ng-if="dataSlideItem.id!=null && !uploading"
                                                    ng-click="updateSlideItem(dataSlideItem)">Cập nhật
                                            </button>
                                            <button class="btn btn-success"
                                                    ng-click="closedSlide()">Hủy
                                            </button>
                                        </footer>
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