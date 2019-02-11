<%--
  Created by IntelliJ IDEA.
  User: Huyen
  Date: 10/25/2018
  Time: 8:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">
    .fixed-bar.fixed {
        position: fixed;
        top: 0;
        z-index: 999;
        width: 380px;
    }

    .btn-toan {
        padding: 6px;
    }

    span.select2-selection.select2-selection--single {
        border-radius: 4px;
    }

    .input-file .button {
        width: 100%;
        padding: 7px;
        border-radius: 4px;
        color: #949494;
        font-weight: normal;
        border: 1px solid #cecece;
        background-color: #fff;
        min-width: 110px;
        position: inherit;
        /*top: 0;*/
        /*right: 0;*/
        height: 34px;
    }
</style>
<script type="text/javascript">
    function scroll_header() {
        $(window).scroll(function () {
            $('.fixed-bar').each(function () {
                var scrollTop_item = $(window).scrollTop(),
                    vh = $(window).height(),
                    $scroll = $(this),
                    scrollEasing = $scroll.data('easing'),
                    $scrollInner = $scroll.find('fixed-bar'),
                    scrollEasing = $scroll.data('css'),
                    scrollOffsetTop = $scroll.offset().top
                if (scrollTop_item > 170) {
                    $scroll.addClass('fixed' + ' ' + 'bg-white' + ' ' + 'animated' + ' ' + 'fadeInDown');
                    // $('.element-item').addClass('animated fadeInDown');
                } else {
                    $scroll.removeClass('fixed' + ' ' + 'bg-white' + ' ' + 'animated' + ' ' + 'fadeInDown');
                }
            });
        });
    }

    scroll_header();
</script>
<div class="right_col" role="main" ng-controller="mgrAddPageController" id="mgrAddPageController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="min-width: 50%; font-size: 18px;">Thêm mới Khoa, Phòng</h2>
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
                        <form class="smart-form" id="form-page" ng-validate="validationPage">
                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                <div class="well padding-10" style="margin: 10px; ">
                                    <div class="form-item">
                                        <div class="input-inner">
                                            <label class="form-label">
                                                Tên khoa phòng tiếng việt
                                            </label>
                                            <div class="input-text">
                                                <input class="form-control"
                                                       name="name" type="text"
                                                       placeholder="Nhập tên khoa phòng tiếng việt"
                                                       ng-model="dataPage.name">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-item">
                                        <div class="input-inner">
                                            <label class="form-label">
                                                Tên khoa phòng tiếng anh
                                            </label>
                                            <div class="input-text">
                                                <input class="form-control"
                                                       name="nameE" type="text"
                                                       placeholder="Nhập tên khoa phòng tiếng anh"
                                                       ng-model="dataPage.nameE">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-item">
                                        <div class="input-inner">
                                            <label class="form-label">
                                                Màu chữ
                                            </label>
                                            <div class="input-text">
                                                <input class="form-control"
                                                       name="colorHeader" type="color"
                                                       ng-model="dataPage.color">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-item">
                                        <div class="input-inner">
                                            <label class="form-label">
                                                Màu nền nhạt
                                            </label>
                                            <div class="input-text">
                                                <input class="form-control"
                                                       name="colorFirstHeader" type="color"
                                                       ng-model="dataPage.color2">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-item">
                                        <div class="input-inner">
                                            <label class="form-label">
                                                Màu nền đậm
                                            </label>
                                            <div class="input-text">
                                                <input class="form-control"
                                                       name="colorLastHeader" type="color"
                                                       ng-model="dataPage.color3">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-item">
                                        <div class="input-inner">
                                            <label class="form-label">
                                                Ảnh banner
                                            </label>
                                            <div class="input input-file">
                                                <div class="button">
                                                    <input style="top: auto; right: auto;"
                                                           type="file" id="select-file-image-cover2"
                                                           name="file1"
                                                           accept="image/x-png,image/gif,image/jpeg"
                                                           ng-file-change="fileMgr.selectBannerImg"
                                                           file-input-id="{{dataPage.id}}"
                                                           ng-model="dataPage.bannerImage">Chọn
                                                    <img src="/static/images/icon-camera.png" height="15"
                                                         style="margin-right: 10px; float: right;" alt="">
                                                </div>
                                            </div>
                                            <label ng-click="removeBannerPage(dataPage)"
                                                   ng-if="dataPage.bannerImage"
                                                   style="position: absolute; cursor: pointer; margin-top: 11px; right: 50px;">
                                                <img src="/static/images/delete-icons8.png" style="width: 20px;">
                                            </label>
                                            <img style="width: 100%; object-fit: cover;"
                                                 ng-if="dataPage.bannerImage"
                                                 id="img-cover"
                                                 ng-src="{{dataPage.bannerImage.absoluteUrl()}}">
                                            <img ng-if="uploadingBannerImg"
                                                 src="/static/images/loading/loading2.gif"
                                                 style="width: 69px; position: absolute; top: 65%; left: 44%;"/>
                                        </div>
                                    </div>
                                    <div class="form-item" ng-if="dataPage.id">
                                        <div class="input-inner">
                                            <span class="form-label">Quyền chỉnh sửa</span>
                                            <div class="input-text">
                                                <select class="select-type form-control"
                                                        name="adminIds" id="adminIds"
                                                        ng-select ng-model="dataPage.adminIds">
                                                    <option value="">--- Chọn người dùng ---</option>
                                                    <option ng-repeat="item in dataUser" value="{{item.id}}">
                                                        {{item.name}}
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                                <div class="well padding-10" style="margin: 10px;">
                                    <div>
                                        <label class="control-label" style="margin-top: 10px; font-size: 18px;">
                                            <strong>LÃNH ĐẠO QUA CÁC THỜI KỲ</strong>
                                        </label>
                                        <div style="overflow-x: auto;">
                                            <label class="control-label"
                                                   style="margin-top: 10px; margin-left: 10px">
                                                <strong>- Trưởng khoa</strong>
                                            </label>
                                            <table id="table-list-mgr1" style="border-radius: 4px"
                                                   class="table table-striped table-bordered dataTable no-footer">
                                                <thead>
                                                <tr class="table-tr-th">
                                                    <th class="text-center" style="width: 110px;">Vị trí</th>
                                                    <th class="text-center" style="width: 169px;">Học hàm học vị</th>
                                                    <th class="text-center">Tên</th>
                                                    <th class="text-center" style="width: 100px;">Thêm/Sửa/Xóa</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr class="table-tr-th"
                                                    ng-repeat="item in listOldDirectors | orderBy:'oldDirectors.location'">
                                                    <td class="text-center">
                                                        {{item.oldDirectors.location}}
                                                    </td>
                                                    <td class="text-center">
                                                        {{item.oldDirectors.mos}}
                                                    </td>
                                                    <td class="text-center">
                                                        {{item.oldDirectors.name}}
                                                    </td>
                                                    <td class="text-center" style="width: 80px;">
                                                        <a class="btn btn-xs btn-default btn-toan"
                                                           ng-click="showdataUpdateOldDirectors(item.oldDirectors)">
                                                            <i class="fa fa-edit fa-lg"></i>
                                                        </a>
                                                        <a class="btn btn-xs btn-default btn-toan"
                                                           rel="tooltip" data-index="1"
                                                           data-placement="left"
                                                           data-original-title="Nhấn để xóa trưởng khoa này"
                                                           data-id="{{item.id}}"
                                                           ng-click="deleteOldDirectors(item.oldDirectors)">
                                                            <i class="fa fa-trash fa-lg"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr class="table-tr-th">
                                                    <td class="text-center">
                                                        <input class="form-control" type="number"
                                                               placeholder="Nhập vị trí..."
                                                               ng-model="dataOldDirectors.location">
                                                    </td>
                                                    <td class="text-center">
                                                        <input class="form-control" type="text"
                                                               placeholder="Nhập học hàm học vị..."
                                                               ng-model="dataOldDirectors.mos">
                                                    </td>
                                                    <td class="text-center">
                                                        <input class="form-control" type="text"
                                                               placeholder="Nhập tên trưởng khoa qua các thời kỳ"
                                                               ng-model="dataOldDirectors.name">
                                                    </td>
                                                    <td class="text-center">
                                                        <a class="btn btn-xs btn-default btn-toan"
                                                           ng-if="!dataOldDirectors.id"
                                                           ng-click="addOldDirectors()">
                                                            <i class="fa fa-plus fa-lg"></i>
                                                        </a>
                                                        <a class="btn btn-xs btn-default btn-toan"
                                                           ng-if="dataOldDirectors.id"
                                                           ng-click="saveOldDirectors(dataOldDirectors.id, dataOldDirectors)">
                                                            <i class="fa fa-save fa-lg"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div style="overflow-x: auto;">
                                            <label class="control-label"
                                                   style="margin-top: 10px; margin-left: 10px">
                                                <strong>- Phó khoa</strong>
                                            </label>
                                            <table id="table-list-mgr2" style="border-radius: 4px"
                                                   class="table table-striped table-bordered dataTable no-footer">
                                                <thead>
                                                <tr class="table-tr-th">
                                                    <th class="text-center" style="width: 110px;">Vị trí</th>
                                                    <th class="text-center" style="width: 169px;">Học hàm học vị</th>
                                                    <th class="text-center">Tên</th>
                                                    <th class="text-center" style="width: 100px;">Thêm/Sửa/Xóa</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr class="table-tr-th"
                                                    ng-repeat="item in listOldDeputyDirectors | orderBy:'oldDeputyDirectors.location'"
                                                    ng-if="item!=null">
                                                    <td class="text-center">
                                                        {{item.oldDeputyDirectors.location}}
                                                    </td>
                                                    <td class="text-center">
                                                        {{item.oldDeputyDirectors.mos}}
                                                    </td>
                                                    <td class="text-center">
                                                        {{item.oldDeputyDirectors.name}}
                                                    </td>
                                                    <td class="text-center" style="width: 80px;">
                                                        <a class="btn btn-xs btn-default btn-toan"
                                                           ng-click="showdataUpdateOldDeputyDirectors(item.oldDeputyDirectors)">
                                                            <i class="fa fa-edit fa-lg"></i>
                                                        </a>
                                                        <a class="btn btn-xs btn-default btn-toan"
                                                           ng-click="deleteOldDeputyDirectors(item.oldDeputyDirectors)">
                                                            <i class="fa fa-trash fa-lg"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr class="table-tr-th">
                                                    <td class="text-center">
                                                        <input class="form-control" type="number"
                                                               placeholder="Nhập vị trí..."
                                                               ng-model="dataOldDeputyDirectors.location">
                                                    </td>
                                                    <td class="text-center">
                                                        <input class="form-control" type="text"
                                                               placeholder="Nhập học hàm học vị..."
                                                               ng-model="dataOldDeputyDirectors.mos">
                                                    </td>
                                                    <td class="text-center">
                                                        <input class="form-control" type="text"
                                                               placeholder="Nhập tên phó khoa qua các thời kỳ..."
                                                               ng-model="dataOldDeputyDirectors.name">
                                                    </td>
                                                    <td class="text-center">
                                                        <a class="btn btn-xs btn-default btn-toan"
                                                           ng-if="!dataOldDeputyDirectors.id"
                                                           ng-click="addOldDeputyDirectors()">
                                                            <i class="fa fa-plus fa-lg"></i>
                                                        </a>
                                                        <a class="btn btn-xs btn-default btn-toan"
                                                           ng-if="dataOldDeputyDirectors.id"
                                                           ng-click="saveOldDeputyDirectors(dataOldDeputyDirectors.id, dataOldDeputyDirectors)">
                                                            <i class="fa fa-save fa-lg"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div>
                                        <label class="control-label" style="margin-top: 10px;  font-size: 18px;">
                                            <strong>LÃNH ĐẠO HIỆN NAY</strong>
                                        </label>
                                        <div style="overflow-x: auto;">
                                            <label class="control-label"
                                                   style="margin-top: 10px; margin-left: 10px">
                                                <strong>- Trưởng khoa</strong>
                                            </label>
                                            <table id="table-list-mgr3" style="border-radius: 4px"
                                                   class="table table-striped table-bordered dataTable no-footer">
                                                <thead>
                                                <tr class="table-tr-th">
                                                    <th class="text-center">Chức vụ</th>
                                                    <th class="text-center">Học hàm học vị</th>
                                                    <th class="text-center">Tên</th>
                                                    <th class="text-center">Ảnh</th>
                                                    <th class="text-center">Thêm/Sửa/Xóa</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr class="table-tr-th" ng-repeat="item in listDirectors">
                                                    <td class="text-center">
                                                        {{item.directors.title}}
                                                    </td>
                                                    <td class="text-center">
                                                        {{item.directors.mos}}
                                                    </td>
                                                    <td class="text-center">
                                                        {{item.directors.name}}
                                                    </td>
                                                    <td class="text-center">
                                                        <img style="width: 50px;"
                                                             ng-src="{{item.directors.avatar.absoluteUrl()}}"/>
                                                    </td>
                                                    <td class="text-center">
                                                        <a class="btn btn-xs btn-default btn-toan"
                                                           ng-click="showdataUpdateDirectors(item.directors)">
                                                            <i class="fa fa-edit fa-lg"></i>
                                                        </a>
                                                        <a class="btn btn-xs btn-default btn-toan"
                                                           ng-click="deleteDirectors(item.directors)">
                                                            <i class="fa fa-trash fa-lg"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr class="table-tr-th">
                                                    <td class="text-center">
                                                        <input class="form-control" type="text"
                                                               placeholder="Nhập chức vụ..."
                                                               ng-model="dataDirectors.title">
                                                    </td>
                                                    <td class="text-center">
                                                        <input class="form-control" type="text"
                                                               placeholder="Nhập học hàm học vị..."
                                                               ng-model="dataDirectors.mos">
                                                    </td>
                                                    <td class="text-center">
                                                        <input class="form-control" type="text"
                                                               placeholder="Nhập tên..."
                                                               ng-model="dataDirectors.name">
                                                    </td>
                                                    <td class="input-inner">
                                                        <label class="input input-file" ng-if="!dataDirectors.avatar">
                                                            <div class="button">
                                                                <input class="form-control"
                                                                       type="file" id="select-file-image-cover3"
                                                                       accept="image/x-png,image/gif,image/jpeg"
                                                                       name="file1"
                                                                       ng-file-change="fileMgr.selectAvatarDirectors"
                                                                       file-input-id="{{dataDirectors.id}}"
                                                                       ng-model="dataDirectors.avatar"> Chọn
                                                                <img src="/static/images/icon-camera.png" height="15"
                                                                     style="margin-right: 10px; float: right;" alt="">
                                                            </div>
                                                        </label>
                                                        <label ng-click="removeThumbnailDirectors(dataPage)"
                                                               ng-if="dataDirectors.avatar"
                                                               style="position: absolute; cursor: pointer; margin-top: 3px; margin-left: 77px;">
                                                            <img src="/static/images/delete-icons8.png"
                                                                 style="width: 20px;">
                                                        </label>
                                                        <img style="width: 100px; object-fit: cover;"
                                                             ng-if="dataDirectors.avatar"
                                                             id="img-cover3"
                                                             ng-src="{{dataDirectors.avatar.absoluteUrl()}}">
                                                        <img ng-if="dataDirectors.uploadImg"
                                                             src="/static/images/loading/loading2.gif"
                                                             style="width: 69px; position: absolute"/>
                                                    </td>
                                                    <td class="text-center">
                                                        <a class="btn btn-xs btn-default btn-toan"
                                                           ng-if="!dataDirectors.id"
                                                           ng-click="addDirectors()">
                                                            <i class="fa fa-plus fa-lg"></i>
                                                        </a>
                                                        <a class="btn btn-xs btn-default btn-toan"
                                                           ng-if="dataDirectors.id"
                                                           ng-click="saveDirectors(dataDirectors.id, dataDirectors)">
                                                            <i class="fa fa-save fa-lg"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div style="overflow-x: auto;">
                                            <label class="control-label"
                                                   style="margin-top: 10px; margin-left: 10px">
                                                <strong>- Phó khoa</strong>
                                            </label>
                                            <table id="table-list-mgr4" style="border-radius: 4px"
                                                   class="table table-striped table-bordered dataTable no-footer">
                                                <thead>
                                                <tr class="table-tr-th">
                                                    <th class="text-center">Chức vụ</th>
                                                    <th class="text-center">Học hàm học vị</th>
                                                    <th class="text-center">Tên</th>
                                                    <th class="text-center">Ảnh</th>
                                                    <th class="text-center">Thêm/Sửa/Xóa</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr class="table-tr-th" ng-repeat="item in listDeputyDirectors">
                                                    <td class="text-center">
                                                        {{item.deputyDirectors.title}}
                                                    </td>
                                                    <td class="text-center">
                                                        {{item.deputyDirectors.mos}}
                                                    </td>
                                                    <td class="text-center">
                                                        {{item.deputyDirectors.name}}
                                                    </td>
                                                    <td class="text-center">
                                                        <img style="width: 50px;"
                                                             ng-src="{{item.deputyDirectors.avatar.absoluteUrl()}}"/>
                                                    </td>
                                                    <td class="text-center" style="width: 80px;">
                                                        <a class="btn btn-xs btn-default btn-toan"
                                                           ng-click="showdataUpdateDeputyDirectors(item.deputyDirectors)">
                                                            <i class="fa fa-edit fa-lg"></i>
                                                        </a>
                                                        <a class="btn btn-xs btn-default btn-toan"
                                                           ng-click="deleteDeputyDirectors(item.deputyDirectors)">
                                                            <i class="fa fa-trash fa-lg"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr class="table-tr-th">
                                                    <td class="text-center">
                                                        <input class="form-control" type="text"
                                                               placeholder="Nhập chức vụ..."
                                                               ng-model="dataDeputyDirectors.title">
                                                    </td>
                                                    <td class="text-center">
                                                        <input class="form-control" type="text"
                                                               placeholder="Nhập học hàm học vị..."
                                                               ng-model="dataDeputyDirectors.mos">
                                                    </td>
                                                    <td class="text-center">
                                                        <input class="form-control" type="text"
                                                               placeholder="Nhập tên..."
                                                               ng-model="dataDeputyDirectors.name">
                                                    </td>
                                                    <td class="text-center">
                                                        <label class="input input-file"
                                                               ng-if="!dataDeputyDirectors.avatar">
                                                            <div class="button">
                                                                <input class="form-control"
                                                                       type="file" id="select-file-image-cover4"
                                                                       accept="image/x-png,image/gif,image/jpeg"
                                                                       name="file1"
                                                                       ng-file-change="fileMgr.selectAvatarDeputyDirectors"
                                                                       file-input-id="{{dataDeputyDirectors.id}}"
                                                                       ng-model="dataDeputyDirectors.avatar">Chọn
                                                                <img src="/static/images/icon-camera.png" height="15"
                                                                     style="margin-right: 10px; float: right;" alt="">
                                                            </div>
                                                        </label>
                                                        <label ng-click="removeThumbnailDeputyDirectors(dataPage)"
                                                               ng-if="dataDeputyDirectors.avatar"
                                                               style="position: absolute; cursor: pointer; margin-top: 3px; margin-left: 77px;">
                                                            <img src="/static/images/delete-icons8.png"
                                                                 style="width: 20px;">
                                                        </label>
                                                        <img style="width: 100px; object-fit: cover;"
                                                             ng-if="dataDeputyDirectors.avatar"
                                                             id="img-cover4"
                                                             ng-src="{{dataDeputyDirectors.avatar.absoluteUrl()}}">
                                                        <img ng-if="dataDeputyDirectors.uploadImg"
                                                             src="/static/images/loading/loading2.gif"
                                                             style="width: 69px; position: absolute; top: 65%; left: 44%;"/>
                                                    </td>
                                                    <td class="text-center">
                                                        <a class="btn btn-xs btn-default btn-toan"
                                                           ng-if="!dataDeputyDirectors.id"
                                                           ng-click="addDeputyDirectors()">
                                                            <i class="fa fa-plus fa-lg"></i>
                                                        </a>
                                                        <a class="btn btn-xs btn-default btn-toan"
                                                           ng-if="dataDeputyDirectors.id"
                                                           ng-click="saveDeputyDirectors(dataDeputyDirectors.id, dataDeputyDirectors)">
                                                            <i class="fa fa-save fa-lg"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <div class="well padding-10" style="margin: 10px; ">
                                    <div>
                                        <label class="control-label" style="margin-top: 10px;  font-size: 18px;">
                                            <strong>GIỚI THIỆU</strong>
                                        </label>
                                        <table id="table-list-mgr5" style="border-radius: 4px"
                                               class="table table-striped table-bordered dataTable no-footer">
                                            <thead>
                                            <tr class="table-tr-th">
                                                <th class="text-center">Tiêu đề</th>
                                                <th class="text-center" style="width: 450px;">Nội dung</th>
                                                <th class="text-center">Thêm/Sửa/Xóa</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr class="table-tr-th" ng-repeat="item in listHeader">
                                                <td class="text-center">
                                                    {{item.header.name}}
                                                </td>
                                                <td class="text-justify">
                                                    <p ng-bind-html="item.header.content"></p>
                                                </td>
                                                <td class="text-center" style="width: 80px;">
                                                    <a class="btn btn-xs btn-default btn-toan"
                                                       ng-click="showdataUpdateHeader(item.header)">
                                                        <i class="fa fa-edit fa-lg"></i>
                                                    </a>
                                                    <a class="btn btn-xs btn-default btn-toan"
                                                       ng-click="deleteHeader(item.header)">
                                                        <i class="fa fa-trash fa-lg"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr class="table-tr-th">
                                                <td>
                                                    <input class="form-control" type="text"
                                                           placeholder="Nhập tiêu đề"
                                                           ng-model="dataHeader.name">
                                                </td>
                                                <td class="text-justify">
                                                    <textarea type="text"
                                                              ng-model="dataHeader.content"
                                                              name="content"
                                                              id="content" ckeditor
                                                              placeholder="Nhập nội dung"
                                                              rows="2">
                                                    </textarea>
                                                </td>
                                                <td style="text-align: center;">
                                                    <a class="btn btn-xs btn-default btn-toan"
                                                       ng-if="!dataHeader.id"
                                                       ng-click="addHeader()">
                                                        <i class="fa fa-plus fa-lg"></i>
                                                    </a>
                                                    <a class="btn btn-xs btn-default btn-toan"
                                                       ng-if="dataHeader.id"
                                                       ng-click="saveHeader(dataHeader.id, dataHeader)">
                                                        <i class="fa fa-save fa-lg"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12"></div>
                            <div class="col-lg-2 col-md-2 col-sm-12 col-xs-12">
                                <button ng-if="!dataPage.id" class="btn btn-success" ng-click="create()">
                                    Tạo mới
                                </button>
                                <button ng-if="dataPage.id" class="btn btn-success" ng-click="update()">
                                    Cập nhật
                                </button>
                                <a class="btn btn-success" href="/admin/page">Hủy</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('mgrAddPageController', function ($scope, $http, httpRequest, fileManager, $sce) {
        $scope.dataPage = ${dataPage};
        if ($scope.dataPage.oldDirectors) {
            $scope.listOldDirectors = JSON.parse($scope.dataPage.oldDirectors);
        }
        if ($scope.dataPage.oldDeputyDirectors) {
            $scope.listOldDeputyDirectors = JSON.parse($scope.dataPage.oldDeputyDirectors);
        }
        if ($scope.dataPage.directors) {
            $scope.listDirectors = JSON.parse($scope.dataPage.directors);
        }
        if ($scope.dataPage.deputyDirectors) {
            $scope.listDeputyDirectors = JSON.parse($scope.dataPage.deputyDirectors);
        }
        if ($scope.dataPage.commonInfo) {
            $scope.listHeader = JSON.parse($scope.dataPage.commonInfo);
//                for (instance in CKEDITOR.instances) {
//                    CKEDITOR.instances[instance].setData($scope.dataPage.contentHeader);
//                }
        }
        if ($scope.dataPage.adminIds) {
            $scope.dataPage.adminIds = JSON.parse($scope.dataPage.adminIds);
            setTimeout(function () {
                $scope.dataPage.adminIds = $scope.dataPage.adminIds[0];
            },1000)
        }
        $scope.dataUser = ${dataUser};
        $scope.fileMgr = {
            chooseFile: function () {
                $("[file-input-id]").trigger("click");
            },
            selectBannerImg: function () {
                var selector = $(event.target);
                var fileName = selector[0].value.replace("C:\\fakepath\\", "").toLocaleLowerCase();
                if (common.endWith(fileName, ".jpg") ||
                    common.endWith(fileName, ".png") ||
                    common.endWith(fileName, ".gif")) {
                    if (!$scope.dataPage) {
                        $scope.dataPage = {};
                    }
                    $scope.dataPage.bannerImage = URL.createObjectURL(selector[0].files[0]);
                    $scope.uploadingBannerImg = true;
                    fileManager.upload(selector[0].files[0], function (data) {
                        if (data.success) {
                            $scope.dataPage.bannerImage = data.data.images[0].image;
                            $scope.uploadingBannerImg = false;
                            $scope.$apply();
                        } else {
                            alertSmallBox("Thêm ảnh lỗi");
                        }
                    }, function (response) {
                    });
                } else {
                    $("#select-file-image-cover2").val("");
                    alertSmallBox("Vui lòng chọn hình ảnh có định dạng png, jpg, gif")
                }
            },
            selectAvatarDirectors: function () {
                var selector = $(event.target);
                var fileName = selector[0].value.replace("C:\\fakepath\\", "").toLocaleLowerCase();
                if (common.endWith(fileName, ".jpg") ||
                    common.endWith(fileName, ".png") ||
                    common.endWith(fileName, ".gif")) {
                    if (!$scope.dataDirectors) {
                        $scope.dataDirectors = {};
                    }
                    $scope.dataDirectors.avatar = URL.createObjectURL(selector[0].files[0]);
                    $scope.dataDirectors.uploadImg = true;
                    fileManager.upload(selector[0].files[0], function (data) {
                        if (data.success) {
                            $scope.dataDirectors.avatar = data.data.images[0].image;
                            $scope.dataDirectors.uploadImg = false;
                            $scope.$apply();
                        } else {
                            alertSmallBox("Thêm ảnh lỗi");
                        }
                    }, function (response) {
                    });
                } else {
                    $("#select-file-image-cover3").val("");
                    alertSmallBox("Vui lòng chọn hình ảnh có định dạng png, jpg, gif")
                }
            },
            selectAvatarDeputyDirectors: function () {
                var selector = $(event.target);
                var fileName = selector[0].value.replace("C:\\fakepath\\", "").toLocaleLowerCase();
                if (common.endWith(fileName, ".jpg") ||
                    common.endWith(fileName, ".png") ||
                    common.endWith(fileName, ".gif")) {
                    if (!$scope.dataDeputyDirectors) {
                        $scope.dataDeputyDirectors = {};
                    }
                    $scope.dataDeputyDirectors.avatar = URL.createObjectURL(selector[0].files[0]);
                    $scope.dataDeputyDirectors.uploadImg = true;
                    fileManager.upload(selector[0].files[0], function (data) {
                        if (data.success) {
                            $scope.dataDeputyDirectors.avatar = data.data.images[0].image;
                            $scope.dataDeputyDirectors.uploadImg = false;
                            $scope.$apply();
                        } else {
                            alertSmallBox("Thêm ảnh lỗi");
                        }
                    }, function (response) {
                    });
                } else {
                    $("#select-file-image-cover4").val("");
                    alertSmallBox("Vui lòng chọn hình ảnh có định dạng png, jpg, gif")
                }
            },
        }
        $scope.cancelData = function () {
            $scope.dataPage = {};
            $scope.resetImgInput();
        }
        $scope.resetImgInput = function () {
            $("#select-file-image-cover").val("");
            $("#select-file").val("");
            for (instance in CKEDITOR.instances) {
                CKEDITOR.instances[instance].setData("");
            }
        }
        $.validator.addMethod("requiredName", function (value, element) {
            if ((!value || value.trim() == ""))
                return false;
            return true;
        }, "Vui lòng nhập tên tiếng việt khoa phòng!");
        $.validator.addMethod("requiredNameE", function (value, element) {
            if ((!value || value.trim() == ""))
                return false;
            return true;
        }, "Vui lòng nhập tên tiếng anh khoa phòng!");
        $scope.validationPage = {
            rules: {
                name: {
                    requiredName: true,
                },
                nameE: {
                    requiredNameE: true,
                }
            },
        }
        $scope.addOldDirectors = function () {
            if (!$scope.dataOldDirectors) {
                $scope.dataOldDirectors = {};
            }
            if (!$scope.dataOldDirectors.location) {
                alertSmallBox("Vui lòng nhập vị trí trưởng khoa qua các thời kỳ!", error)
                return
            }
            if (!$scope.dataOldDirectors.mos) {
                alertSmallBox("Vui lòng nhập học hàm học vị trưởng khoa qua các thời kỳ!", error)
                return
            }
            if (!$scope.dataOldDirectors.name) {
                alertSmallBox("Vui lòng nhập tên trưởng khoa qua các thời kỳ!", error)
                return
            }

            if (!$scope.listOldDirectors) {
                $scope.listOldDirectors = [];
            }
            if ($scope.listOldDirectors.length == 0) {
                $scope.listOldDirectors.push({
                    oldDirectors: {
                        id: Math.random().toString(16).slice(2),
                        location: parseInt($scope.dataOldDirectors.location),
                        mos: $scope.dataOldDirectors.mos,
                        name: $scope.dataOldDirectors.name,
                    }
                })
                alertSmallBox("Thêm mới lãnh đạo qua các thời kỳ thành công!", success);
            } else {
                for (var i = 0; i < $scope.listOldDirectors.length; i++) {
                    if ($scope.listOldDirectors[i].oldDirectors.location == $scope.dataOldDirectors.location) {
                        alertSmallBox("Vị trị này đã có vui lòng chọn vị trí khác!", error)
                        return;
                    }
                }
                $scope.listOldDirectors.push({
                    oldDirectors: {
                        id: Math.random().toString(16).slice(2),
                        location: parseInt($scope.dataOldDirectors.location),
                        mos: $scope.dataOldDirectors.mos,
                        name: $scope.dataOldDirectors.name,
                    }
                })
                alertSmallBox("Thêm mới lãnh đạo qua các thời kỳ thành công!", success);
            }
            $scope.dataOldDirectors = {};

        }
        $scope.deleteOldDirectors = function (item) {
            confirmDialog("Xác nhận", "Bạn có chắc chắn muốn xóa lãnh đạo này?", function () {
                for (var i = 0; i < $scope.listOldDirectors.length; i++) {
                    if ($scope.listOldDirectors[i].oldDirectors.location === item.location) {
                        $scope.listOldDirectors.splice(i, 1);
                        alertSmallBox("Xóa lãnh đạo qua các thời kỳ thành công!", success);
                        $scope.$apply();
                        break;
                    }
                }
            })
        }
        $scope.showdataUpdateOldDirectors = function (item) {
            $scope.dataOldDirectors = JSON.parse(JSON.stringify(item));
        }
        $scope.saveOldDirectors = function (id, value) {
            if (!$scope.dataOldDirectors.location) {
                alertSmallBox("Vui lòng nhập vị trí trưởng khoa qua các thời kỳ!", error)
                return
            }
            if (!$scope.dataOldDirectors.mos) {
                alertSmallBox("Vui lòng nhập học hàm học vị trưởng khoa qua các thời kỳ!", error)
                return
            }
            if (!$scope.dataOldDirectors.name) {
                alertSmallBox("Vui lòng nhập tên trưởng khoa qua các thời kỳ!", error)
                return
            }

            for (var i = 0; i < $scope.listOldDirectors.length; i++) {
                if ($scope.listOldDirectors[i].oldDirectors.id == id) {
                    $scope.listOldDirectors[i].oldDirectors = value;
                    break; //Stop this loop, we found it!
                }
            }
            alertSmallBox("Cập nhật lãnh đạo qua các thời kỳ thành công!", success);
            $scope.dataOldDirectors = {};
        }

        $scope.addOldDeputyDirectors = function () {
            if (!$scope.dataOldDeputyDirectors) {
                $scope.dataOldDeputyDirectors = {};
            }
            if (!$scope.dataOldDeputyDirectors.location) {
                alertSmallBox("Vui lòng nhập vị trí phó khoa qua các thời kỳ!", error)
                return
            }
            if (!$scope.dataOldDeputyDirectors.mos) {
                alertSmallBox("Vui lòng nhập học hàm học vị phó khoa qua các thời kỳ!", error)
                return
            }
            if (!$scope.dataOldDeputyDirectors.name) {
                alertSmallBox("Vui lòng nhập tên phó khoa qua các thời kỳ!", error)
                return
            }
            if (!$scope.listOldDeputyDirectors) {
                $scope.listOldDeputyDirectors = [];
            }
            if ($scope.listOldDeputyDirectors.length == 0) {
                $scope.listOldDeputyDirectors.push({
                    oldDeputyDirectors: {
                        id: Math.random().toString(16).slice(2),
                        location: parseInt($scope.dataOldDeputyDirectors.location),
                        mos: $scope.dataOldDeputyDirectors.mos,
                        name: $scope.dataOldDeputyDirectors.name,
                    }
                })
                alertSmallBox("Thêm mới lãnh đạo qua các thời kỳ thành công!", success);
            } else {
                for (var i = 0; i < $scope.listOldDeputyDirectors.length; i++) {
                    if ($scope.listOldDeputyDirectors[i].oldDeputyDirectors.location == $scope.dataOldDeputyDirectors.location) {
                        alertSmallBox("Vị trị này đã có vui lòng chọn vị trí khác!", error)
                        return;
                    }
                }
                $scope.listOldDeputyDirectors.push({
                    oldDeputyDirectors: {
                        id: Math.random().toString(16).slice(2),
                        location: parseInt($scope.dataOldDeputyDirectors.location),
                        mos: $scope.dataOldDeputyDirectors.mos,
                        name: $scope.dataOldDeputyDirectors.name,
                    }
                })
                alertSmallBox("Thêm mới lãnh đạo qua các thời kỳ thành công!", success);
            }
            $scope.dataOldDeputyDirectors = {};
        }
        $scope.deleteOldDeputyDirectors = function (item) {
            confirmDialog("Xác nhận", "Bạn có chắc chắn muốn xóa lãnh đạo này?", function () {
                for (var i = 0; i < $scope.listOldDeputyDirectors.length; i++)
                    if ($scope.listOldDeputyDirectors[i].oldDeputyDirectors.location === item.location) {
                        $scope.listOldDeputyDirectors.splice(i, 1);
                        alertSmallBox("Xóa lãnh đạo qua các thời kỳ thành công!", success);
                        $scope.$apply();
                        break;
                    }
            })
        }
        $scope.showdataUpdateOldDeputyDirectors = function (item) {
            $scope.dataOldDeputyDirectors = JSON.parse(JSON.stringify(item));
        }
        $scope.saveOldDeputyDirectors = function (id, value) {
            if (!$scope.dataOldDeputyDirectors.location) {
                alertSmallBox("Vui lòng nhập vị trí phó khoa qua các thời kỳ!", error)
                return
            }
            if (!$scope.dataOldDeputyDirectors.mos) {
                alertSmallBox("Vui lòng nhập học hàm học vị phó khoa qua các thời kỳ!", error)
                return
            }
            if (!$scope.dataOldDeputyDirectors.name) {
                alertSmallBox("Vui lòng nhập tên phó khoa qua các thời kỳ!", error)
                return
            }

            for (var i = 0; i < $scope.listOldDeputyDirectors.length; i++) {
                if ($scope.listOldDeputyDirectors[i].oldDeputyDirectors.id == id) {
                    $scope.listOldDeputyDirectors[i].oldDeputyDirectors = value;
                    break; //Stop this loop, we found it!
                }
            }
            alertSmallBox("Cập nhật lãnh đạo qua các thời kỳ thành công!", success);
            $scope.dataOldDeputyDirectors = {};
        }

        $scope.addDirectors = function () {
            if (!$scope.listDirectors) {
                $scope.listDirectors = [];
            }
            if ($scope.listDirectors.length <= 0) {
                if (!$scope.dataDirectors) {
                    $scope.dataDirectors = {};
                }
                if (!$scope.dataDirectors.title) {
                    alertSmallBox("Vui lòng nhập chức vụ!", error)
                    return
                }
                if (!$scope.dataDirectors.mos) {
                    alertSmallBox("Vui lòng nhập học hàm học vị trưởng khoa hiện tại!", error)
                    return
                }
                if (!$scope.dataDirectors.name) {
                    alertSmallBox("Vui lòng nhập tên trưởng khoa hiện tại!", error)
                    return
                }
                if (!$scope.dataDirectors.avatar) {
                    alertSmallBox("Vui chọn ảnh trưởng khoa hiện tại!", error)
                    return
                }

                $scope.listDirectors.push({
                    directors: {
                        id: Math.random().toString(16).slice(2),
                        title: $scope.dataDirectors.title,
                        mos: $scope.dataDirectors.mos,
                        name: $scope.dataDirectors.name,
                        avatar: $scope.dataDirectors.avatar,
                    }
                })
                alertSmallBox("Thêm mới lãnh đạo hiện nay thành công!", success);
                $scope.dataDirectors = {};
            } else {
                alertSmallBox("Trưởng khoa chỉ có thể thêm được 1!", error);
            }
        }
        $scope.removeThumbnailDirectors = function () {
            delete $scope.dataDirectors.avatar;
            return
        }
        $scope.showdataUpdateDirectors = function (item) {
            $scope.dataDirectors = JSON.parse(JSON.stringify(item));
        }
        $scope.saveDirectors = function (id, value) {
            if (!$scope.dataDirectors.title) {
                alertSmallBox("Vui lòng nhập chức vụ!", error)
                return
            }
            if (!$scope.dataDirectors.mos) {
                alertSmallBox("Vui lòng nhập học hàm học vị trưởng khoa hiện tại!", error)
                return
            }
            if (!$scope.dataDirectors.name) {
                alertSmallBox("Vui lòng nhập tên trưởng khoa hiện tại!", error)
                return
            }
            if (!$scope.dataDirectors.avatar) {
                alertSmallBox("Vui chọn ảnh trưởng khoa hiện tại!", error)
                return
            }

            for (var i = 0; i < $scope.listDirectors.length; i++) {
                if ($scope.listDirectors[i].directors.id == id) {
                    $scope.listDirectors[i].directors = value;
                    break; //Stop this loop, we found it!
                }
            }
            alertSmallBox("Cập nhật lãnh đạo hiện nay thành công!", success);
            $scope.dataDirectors = {};
        }
        $scope.deleteDirectors = function (item) {
            confirmDialog("Xác nhận", "Bạn có chắc chắn muốn xóa lãnh đạo này?", function () {
                for (var i = 0; i < $scope.listDirectors.length; i++)
                    if ($scope.listDirectors[i].directors.name === item.name) {
                        $scope.listDirectors.splice(i, 1);
                        alertSmallBox("Xóa lãnh đạo hiện nay thành công!", success);
                        $scope.$apply();
                        break;
                    }
            })
        }

        $scope.addDeputyDirectors = function () {
            if (!$scope.listDeputyDirectors) {
                $scope.listDeputyDirectors = [];
            }
            if (!$scope.dataDeputyDirectors) {
                $scope.dataDeputyDirectors = {};
            }
            if (!$scope.dataDeputyDirectors.title) {
                alertSmallBox("Vui lòng nhập chức vụ!", error)
                return
            }
            if (!$scope.dataDeputyDirectors.mos) {
                alertSmallBox("Vui lòng nhập học hàm học vị phó khoa hiện tại!", error)
                return
            }
            if (!$scope.dataDeputyDirectors.name) {
                alertSmallBox("Vui lòng nhập tên phó khoa hiện tại!", error)
                return
            }
            if (!$scope.dataDeputyDirectors.avatar) {
                alertSmallBox("Vui chọn ảnh phó khoa hiện tại!", error)
                return
            }

            $scope.listDeputyDirectors.push({
                deputyDirectors: {
                    id: Math.random().toString(16).slice(2),
                    title: $scope.dataDeputyDirectors.title,
                    mos: $scope.dataDeputyDirectors.mos,
                    name: $scope.dataDeputyDirectors.name,
                    avatar: $scope.dataDeputyDirectors.avatar,
                }
            })
            alertSmallBox("Thêm mới lãnh đạo hiện nay thành công!", success);
            $scope.dataDeputyDirectors = {};
        }
        $scope.removeThumbnailDeputyDirectors = function () {
            delete $scope.dataDeputyDirectors.avatar;
            return
        }
        $scope.showdataUpdateDeputyDirectors = function (item) {
            $scope.dataDeputyDirectors = JSON.parse(JSON.stringify(item));
        }
        $scope.saveDeputyDirectors = function (id, value) {
            if (!$scope.dataDeputyDirectors.title) {
                alertSmallBox("Vui lòng nhập chức vụ!", error)
                return
            }
            if (!$scope.dataDeputyDirectors.mos) {
                alertSmallBox("Vui lòng nhập học hàm học vị phó khoa hiện tại!", error)
                return
            }
            if (!$scope.dataDeputyDirectors.name) {
                alertSmallBox("Vui lòng nhập tên phó khoa hiện tại!", error)
                return
            }
            if (!$scope.dataDeputyDirectors.avatar) {
                alertSmallBox("Vui chọn ảnh phó khoa hiện tại!", error)
                return
            }

            for (var i = 0; i < $scope.listDeputyDirectors.length; i++) {
                if ($scope.listDeputyDirectors[i].deputyDirectors.id == id) {
                    $scope.listDeputyDirectors[i].deputyDirectors = value;
                    break; //Stop this loop, we found it!
                }
            }
            alertSmallBox("Cập nhật lãnh đạo hiện nay thành công!", success);
            $scope.dataDeputyDirectors = {};
        }
        $scope.deleteDeputyDirectors = function (item) {
            confirmDialog("Xác nhận", "Bạn có chắc chắn muốn xóa lãnh đạo này?", function () {
                for (var i = 0; i < $scope.listDeputyDirectors.length; i++)
                    if ($scope.listDeputyDirectors[i].deputyDirectors.name === item.name) {
                        $scope.listDeputyDirectors.splice(i, 1);
                        alertSmallBox("Xóa lãnh đạo hiện nay thành công!", success);
                        $scope.$apply();
                        break;
                    }
            })
        }

        $scope.addHeader = function () {
            if (!$scope.dataHeader) {
                $scope.dataHeader = {};
            }
            if (!$scope.dataHeader.name) {
                alertSmallBox("Vui lòng nhập tiêu đề đầu mục!", error)
                return
            }
            if (!$scope.dataHeader.content) {
                alertSmallBox("Vui lòng nhập nội dung đầu mục!", error)
                return
            }
            if ($scope.listHeader == undefined) {
                $scope.listHeader = [];
            }
            $scope.listHeader.push({
                header: {
                    id: Math.random().toString(16).slice(2),
                    name: $scope.dataHeader.name,
                    content: $scope.dataHeader.content,
                }
            })
            alertSmallBox("Thêm mới nội dung giới thiệu thành công!", success);
            $scope.dataHeader = {};
            for (instance in CKEDITOR.instances) {
                CKEDITOR.instances[instance].setData("");
            }
        }
        $scope.deleteHeader = function (item) {
            confirmDialog("Xác nhận", "Bạn có chắc chắn muốn xóa nội dung giới thiệu này?", function () {
                for (var i = 0; i < $scope.listHeader.length; i++)
                    if ($scope.listHeader[i].header.name === item.name) {
                        $scope.listHeader.splice(i, 1);
                        alertSmallBox("Xóa nội dung giới thiệu thành công!", success);
                        $scope.$apply()
                        break;
                    }
            })
        }
        $scope.showdataUpdateHeader = function (item) {
            $scope.dataHeader = JSON.parse(JSON.stringify(item));
            for (instance in CKEDITOR.instances) {
                CKEDITOR.instances[instance].setData(item.content);
            }
        }
        $scope.saveHeader = function (id, value) {
            if (!$scope.dataHeader.name) {
                alertSmallBox("Vui lòng nhập tiêu đề đầu mục!", error)
                return
            }
            if (!$scope.dataHeader.name) {
                alertSmallBox("Vui lòng nhập nội dung đầu mục!", error)
                return
            }

            for (var i = 0; i < $scope.listHeader.length; i++) {
                if ($scope.listHeader[i].header.id == id) {
                    $scope.listHeader[i].header = value;
                    break; //Stop this loop, we found it!
                }
            }
            alertSmallBox("Cập nhật nội dung giới thiệu thành công!", success);
            $scope.dataHeader = {};
            for (instance in CKEDITOR.instances) {
                CKEDITOR.instances[instance].setData("");
            }
        }

        $scope.removeBannerPage = function () {
            delete $scope.dataPage.bannerImage;
            return;
        }
        $scope.create = function () {
            if (!$scope.listOldDirectors) {
                $scope.listOldDirectors = [];
            }
            if (!$scope.listOldDeputyDirectors) {
                $scope.listOldDeputyDirectors = [];
            }
            if (!$scope.listDirectors) {
                $scope.listDirectors = [];
            }
            if (!$scope.listDeputyDirectors) {
                $scope.listDeputyDirectors = [];
            }
            if (!$scope.listHeader) {
                $scope.listHeader = [];
            }
            $scope.dataPage.oldDirectors = JSON.stringify($scope.listOldDirectors, function (key, value) {
                if (key === "$$hashKey") {
                    return undefined;
                }
                return value;
            });
            $scope.dataPage.oldDeputyDirectors = JSON.stringify($scope.listOldDeputyDirectors, function (key, value) {
                if (key === "$$hashKey") {
                    return undefined;
                }
                return value;
            });
            $scope.dataPage.directors = JSON.stringify($scope.listDirectors, function (key, value) {
                if (key === "$$hashKey") {
                    return undefined;
                }
                return value;
            });
            $scope.dataPage.deputyDirectors = JSON.stringify($scope.listDeputyDirectors, function (key, value) {
                if (key === "$$hashKey") {
                    return undefined;
                }
                return value;
            });
            $scope.dataPage.commonInfo = JSON.stringify($scope.listHeader, function (key, value) {
                if (key === "$$hashKey") {
                    return undefined;
                }
                return value;
            });
            if ($scope.dataPage == undefined) {
                $scope.dataPage = {};
            }
            if (!$scope.dataPage.color) {
                $scope.dataPage.color = '#fff';
            }
            if (!$scope.dataPage.color2) {
                $scope.dataPage.color2 = '#47afe2';
            }
            if (!$scope.dataPage.color3) {
                $scope.dataPage.color3 = '#00468d';
            }
            $scope.dataPage.type = 2;
            $scope.dataPage.webType = webType;
            if ($("#form-page").valid()) {
                if (!$scope.dataPage.bannerImage) {
                    alertSmallBox("Vui lòng chọn ảnh banner!", error);
                    return;
                }
                if ($scope.listHeader.length == 0) {
                    alertSmallBox("Vui lòng thêm phần giới thiệu!", error);
                    return;
                }
                httpRequest.post("/page/create"
                    , {page: $scope.dataPage}
                    , function (data) {
                        if (data.success) {
                            alertSmallBox(data.data, success);
                            $scope.cancelData();
                            location.href = '/admin/page?trang=1'
                        } else {
                            $scope.cancelData();
                            alertSmallBox(data.message, error);
                        }
                    }, function (data) {
                    }, true);
            }
        }
        $scope.showdataUpdatePageDepartment2 = function (item) {
            $scope.dataPage = JSON.parse(JSON.stringify(item));
            $scope.listOldDirectors = JSON.parse(item.oldDirectors);
            $scope.listOldDeputyDirectors = JSON.parse(item.oldDeputyDirectors);
            $scope.listDirectors = JSON.parse(item.directors);
            $scope.listDeputyDirectors = JSON.parse(item.deputyDirectors);
            $scope.listHeader = JSON.parse(item.header);
            for (instance in CKEDITOR.instances) {
                CKEDITOR.instances[instance].setData(item.contentHeader);
            }
        }
        $scope.update = function () {
            if (!$scope.listOldDirectors) {
                $scope.listOldDirectors = [];
            }
            if (!$scope.listOldDeputyDirectors) {
                $scope.listOldDeputyDirectors = [];
            }
            if (!$scope.listDirectors) {
                $scope.listDirectors = [];
            }
            if (!$scope.listDeputyDirectors) {
                $scope.listDeputyDirectors = [];
            }
            if (!$scope.listHeader) {
                $scope.listHeader = [];
            }
            $scope.dataPage.oldDirectors = JSON.stringify($scope.listOldDirectors, function (key, value) {
                if (key === "$$hashKey") {
                    return undefined;
                }
                return value;
            });
            $scope.dataPage.oldDeputyDirectors = JSON.stringify($scope.listOldDeputyDirectors, function (key, value) {
                if (key === "$$hashKey") {
                    return undefined;
                }
                return value;
            });
            $scope.dataPage.directors = JSON.stringify($scope.listDirectors, function (key, value) {
                if (key === "$$hashKey") {
                    return undefined;
                }
                return value;
            });
            $scope.dataPage.deputyDirectors = JSON.stringify($scope.listDeputyDirectors, function (key, value) {
                if (key === "$$hashKey") {
                    return undefined;
                }
                return value;
            });
            $scope.dataPage.commonInfo = JSON.stringify($scope.listHeader, function (key, value) {
                if (key === "$$hashKey") {
                    return undefined;
                }
                return value;
            });
            if ($scope.dataPage == undefined) {
                $scope.dataPage = {};
            }
            if (!$scope.dataPage.color) {
                $scope.dataPage.color = '#fff';
            }
            if (!$scope.dataPage.color2) {
                $scope.dataPage.color2 = '#47afe2';
            }
            if (!$scope.dataPage.color3) {
                $scope.dataPage.color3 = '#00468d';
            }
            if ($("#form-page").valid()) {
                if (!$scope.dataPage.bannerImage) {
                    alertSmallBox("Vui lòng chọn ảnh banner!", error);
                    return;
                }
                if ($scope.listHeader.length == 0) {
                    alertSmallBox("Vui lòng thêm phần giới thiệu!", error);
                    return;
                }
//                if ($scope.dataPage.adminIds) {
//                    $scope.listAdminIds = [];
//                    $scope.listAdminIds.push($scope.dataPage.adminIds);
//                }
                httpRequest.post("/page/update/" + $scope.dataPage.id
                    , {page: $scope.dataPage}
                    , function (data) {
                        if (data.success) {
                            alertSmallBox(data.data, success);
                            location.href = '/admin/page?trang=1'
                            $scope.cancelData();
                        } else {
                            alertSmallBox(data.message, error);
                            $scope.cancelData();
                            location.href = '/admin/page?trang=1'
                        }
                    }, function (data) {
                    }, true);
            }
        }
    });
</script>