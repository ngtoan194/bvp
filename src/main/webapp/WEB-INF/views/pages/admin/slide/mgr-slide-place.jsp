<%--
  Created by IntelliJ IDEA.
  User: Huyen
  Date: 10/23/2018
  Time: 2:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="right_col" role="main" ng-controller="mgrSlidePlaceController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size: 18px;">Danh sách Slide Place</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Settings 1</a>
                                    </li>
                                    <li><a href="#">Settings 2</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-striped table-bordered dataTable no-footer">
                                    <thead>
                                    <tr class="table-tr-th">
                                        <th style="width: 7%; text-align: center">STT</th>
                                        <th style="width: 30%; text-align: center">Tên Slide Place</th>
                                        <th style="width: 50%; text-align: center">Slide</th>
                                        <th style="width: 13%; text-align: center">Tiện ích</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td></td>
                                        <td><input type="text" style="width: 100%; padding: 5px;" class="form-control"
                                                   placeholder="Nhập tên slide place để tìm kiếm"
                                                   ng-model="name" ng-enter="loadPage(1)">
                                        </td>
                                        <td class="center"></td>
                                        <td class="center"></td>
                                    </tr>
                                    <tr class="table-tr-th" ng-repeat="item in slidePlace">
                                        <td class="time-item text-center">{{$index+1}}</td>
                                        <td ng-value="name" class="time-item text-center">
                                            <div>
                                                {{item.slidePlace.name}}
                                            </div>
                                        </td>
                                        <td class="time-item text-center">
                                            <div style="width: 450px !important; text-align: center" ng-if="item.slide!=null">
                                                <div id="{{item.slidePlace.name}}" class="owl-carousel" ng-init="initSlider(item)">
                                                    <div class="slider-item" ng-repeat="item2 in item.slideItems">
                                                        <img ng-src="{{item2.image.absoluteUrl()}}" alt="Los Angeles"
                                                             style="width: 100%;">
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="time-item text-center">
                                            <div class="btn-group">
                                                <button data-toggle="dropdown" type="button"
                                                        class="btn btn-success dropdown-toggle btn-xs">
                                                    <span class="caret"></span>
                                                </button>
                                                <ul role="menu" class="dropdown-menu">
                                                    <li>
                                                        <a data-toggle="modal" ng-click="updateShow(item)">
                                                            <i class="fa fa-pencil-square-o"></i>Sửa
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
                    </div>
                    <div class="modal fade " id="modal-create-slide-place">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" ng-click="closedSlide()">&times;</button>
                                    <h3 class="title-tk text-center">Chỉnh sửa Slide Place</h3>
                                </div>
                                <form id="form-slidePlace" novalidate="novalidate" class="smart-form"
                                      ng-validate="validationSlidePlace">
                                    <div class="modal-body">
                                        <div class="form-item">
                                            <div class="form-group">
                                                <label style="margin-top: 25px">Slide* :</label>
                                                <div class="row">
                                                    <div class="col-md-9">
                                                        <select  ng-model="ids" name="slideshow" style="width: 568px;height: 35px" class="form-control">
                                                            <option ng-repeat="item in listSlide"  ng-value="{{item.slide.id}}" required                                                                >
                                                                {{item.slide.name}}
                                                            </option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-success"
                                                ng-click="updateSlidePlace(id1,ids)">Lưu
                                        </button>
                                        <button type="button" class="btn btn-success" data-dismiss="modal"
                                                ng-click="closedSlide()">Hủy
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