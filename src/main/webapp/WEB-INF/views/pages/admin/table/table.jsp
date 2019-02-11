<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/09/18
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Users
                    <small>Some examples to get you started</small>
                </h3>
            </div>

            <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for...">
                        <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                    </div>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h4>Labels and badges</h4>
                    </div>
                    <div class="x_content">
                        <span class="label label-default">Default</span>
                        <span class="label label-primary">Primary</span>
                        <span class="label label-success">Success</span>
                        <span class="label label-info">Info</span>
                        <span class="label label-warning">Warning</span>
                        <span class="label label-danger">Danger</span>
                        <span class="badge bg-green">42</span>
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2><i class="fa fa-square-o"></i> Modals</h2>
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
                        <!-- modals -->
                        <!-- Large modal -->
                        <button type="button" ng-click="showLargeModal()" class="btn btn-primary" data-toggle="modal">
                            Large modal
                        </button>
                        <div class="modal fade bs-example-modal-lg" id="bs-example-modal-lg" tabindex="-1" role="dialog"
                             aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span
                                                aria-hidden="true">×</span>
                                        </button>
                                        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                                    </div>
                                    <div class="modal-body">
                                        <h4>Text in a modal</h4>
                                        <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus
                                            sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                        <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna,
                                            vel
                                            scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla
                                            non
                                            metus auctor fringilla.</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                        </button>
                                        <button type="button" class="btn btn-primary">Save changes</button>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Small modal -->
                        <button type="button" ng-click="showSmallModal()" class="btn btn-primary" data-toggle="modal">
                            Small modal
                        </button>
                        <div class="modal fade bs-example-modal-sm" id="bs-example-modal-sm" tabindex="-1" role="dialog"
                             aria-hidden="true">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-label="Close"><span
                                                aria-hidden="true">×</span>
                                        </button>
                                        <h4 class="modal-title" id="myModalLabel2">Modal title</h4>
                                    </div>
                                    <div class="modal-body">
                                        <h4>Text in a modal</h4>
                                        <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus
                                            sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                        <p>Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna,
                                            vel
                                            scelerisque nisl consectetur et. Donec sed odio dui. Donec ullamcorper nulla
                                            non
                                            metus auctor fringilla.</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                        </button>
                                        <button type="button" class="btn btn-primary">Save changes</button>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Large modal add -->
                        <button type="button" ng-click="showLargeModalAdd()" class="btn btn-primary"
                                data-toggle="modal">
                            Large modal add
                        </button>
                        <div class="modal fade bs-example-modal-lg" id="bs-example-modal-lg-add" tabindex="-1"
                             role="dialog" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"><span
                                                aria-hidden="true">×</span>
                                        </button>
                                        <h3 class="modal-title">Thêm mới</h3>
                                    </div>
                                    <div class="modal-body">
                                        <div class="col-md-6">
                                            <div class="well padding-10">
                                                <div class="form-item">
                                                    <div class="input-inner">
                                                        <span class="form-label">Họ và tên *</span>
                                                        <div class="input-text">
                                                            <input type="text" class="form-control" name="name"
                                                                   placeholder="Nhập họ và tên..."
                                                                   ng-model="dataStaff.name">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-item">
                                                    <div class="input-inner">
                                                        <span class="form-label">Ngày sinh</span>
                                                        <div class="input-group date-bn">
                                                            <input type="text" class="form-control" name="dob" id="dob"
                                                                   placeholder="Chọn ngày sinh (dd-MM-yyyy)"
                                                                   ng-model="dataDate.dob">
                                                            <span class="input-group-addon">
                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-item">
                                                    <div class="input-inner">
                                                        <span class="form-label">Email</span>
                                                        <div class="input-text">
                                                            <input type="text" class="form-control" name="email"
                                                                   placeholder="Nhập email..."
                                                                   ng-model="dataStaff.email">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-item">
                                                    <div class="input-inner">
                                                        <span class="form-label">Số điện thoại</span>
                                                        <div class="input-text">
                                                            <input type="text" class="form-control" name="phone"
                                                                   placeholder="Nhập số điện thoại..."
                                                                   ng-model="dataStaff.phone">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-item">
                                                    <div class="input-inner">
                                                        <span class="form-label">Địa chỉ</span>
                                                        <div class="input-text">
                                                            <input type="text" class="form-control" name="address"
                                                                   placeholder="Nhập địa chỉ..."
                                                                   ng-model="dataStaff.address">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-item">
                                                    <div class="input-inner">
                                                        <span class="form-label">Vị trí *</span>
                                                        <div class="input-text">
                                                            <select id="position" name="position"
                                                                    class="select-type form-control"
                                                                    ng-model="dataStaff.position">
                                                                <option value="">--- Chọn ---</option>
                                                                <option value="1">DEV</option>
                                                                <option value="2">Tester</option>
                                                                <option value="3">Chuyên viên</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-item">
                                                    <div class="input-inner">
                                                        <span class="form-label">Bắt đầu làm việc</span>
                                                        <div class="input-group date-bn">
                                                            <input type="text" class="form-control" name="startDate"
                                                                   id="start-date"
                                                                   placeholder="Chọn thời gian bắt đầu làm việc (dd-MM-yyyy)"
                                                                   ng-model="dataDate.startDate">
                                                            <span class="input-group-addon">
                                                            <span class="glyphicon glyphicon-calendar"></span>
                                                        </span>
                                                            <script type="text/javascript">
                                                                setTimeout(function () {
                                                                    $(function () {
                                                                        $('#start-date').datetimepicker({
                                                                            format: 'DD-MM-YYYY',
                                                                            allowInputToggle: true
                                                                        });
                                                                    });
                                                                }, 1500)
                                                            </script>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-item" ng-if="dataStaff.id">
                                                    <div class="input-inner">
                                                        <span class="form-label">Ngày nghỉ việc</span>
                                                        <div class="input-group date-bn" id="end-date-time-picker">
                                                            <input type="text" class="form-control" name="endDate"
                                                                   id="end-date"
                                                                   placeholder="Chọn thời gian nghỉ việc (dd-MM-yyyy)"
                                                                   ng-model="dataDate.endDate">
                                                            <span class="input-group-addon">
                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                            </span>
                                                        </div>
                                                        <script type="text/javascript">
                                                            setTimeout(function () {
                                                                $(function () {
                                                                    $('#end-date-time-picker').datetimepicker({
                                                                        format: 'DD-MM-YYYY',
                                                                        allowInputToggle: true
                                                                    });
                                                                });
                                                            }, 1500)
                                                        </script>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="well padding-10">
                                                <div class="form-item">
                                                    <div class="form-item">
                                                        <div class="input-inner">
                                                            <span class="form-label">Tên tài khoản *</span>
                                                            <div class="input-text">
                                                                <input type="text" class="form-control" name="username"
                                                                       id="username"
                                                                       placeholder="Nhập tên tài khoản..."
                                                                       ng-model="dataStaff.username">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-item">
                                                        <div class="input-inner">
                                                            <span class="form-label">Mã nhân viên</span>
                                                            <div class="input-text">
                                                                <input type="text" class="form-control" name="code"
                                                                       placeholder="Nhập mã nhân viên..."
                                                                       ng-model="dataStaff.code">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-item">
                                                        <div class="input-inner">
                                                            <span class="form-label">Phòng ban</span>
                                                            <div class="input-text">
                                                                <select style="width: 100%" ui-select2
                                                                        class="form-control" ng-model="dataStaff.mot">
                                                                    <option value="">--- Chọn phòng ban ---</option>
                                                                    <option value="1">DEV</option>
                                                                    <option value="2">Tester</option>
                                                                    <option value="3">Chuyên viên</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-item">
                                                        <div class="input-inner">
                                                            <span class="form-label">Phòng ban</span>
                                                            <div class="input-text">
                                                                <select style="width: 100%" ng-select
                                                                        class="form-control" ng-model="dataStaff.hai">
                                                                    <option value="">--- Chọn phòng ban ---</option>
                                                                    <option value="1">DEV</option>
                                                                    <option value="2">Tester</option>
                                                                    <option value="3">Chuyên viên</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-item">
                                                        <div class="input-inner">
                                                            <span class="form-label">Phòng ban</span>
                                                            <div class="input-text">
                                                                <select style="width: 100%" ui-select2 multiple
                                                                        class="form-control" ng-model="dataStaff.ba">
                                                                    <option value="1">DEV</option>
                                                                    <option value="2">Tester</option>
                                                                    <option value="3">Chuyên viên</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-item">
                                                        <div class="input-inner">
                                                            <span class="form-label">Phòng ban</span>
                                                            <div class="input-text">
                                                                <select style="width: 100%" ng-select multiple
                                                                        class="form-control" ng-model="dataStaff.bon">
                                                                    <option value="1">DEV</option>
                                                                    <option value="2">Tester</option>
                                                                    <option value="3">Chuyên viên</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-item">
                                                        <span class="form-label">Leader</span>
                                                        <div class="checkbox-style">
                                                            <input type="checkbox" id="checked-join" class="flat"
                                                                   ng-model="checkLeader"
                                                                   ng-click="checkIsLeader(checkLeader?true:false)">
                                                            <label for="checked-join" class="after-checkbox"></label>
                                                            <span class="label-form">chọn là leader</span>
                                                        </div>
                                                    </div>
                                                    <div class="input-inner">
                                                        <div class="form-label" style="margin-top: 10px;">Ảnh nhân viên
                                                        </div>
                                                        <div class="input input-file" style="margin-top: 10px;">
                                                            <div class="button"
                                                                 style="margin-top: 5px; margin-right: 20px;">
                                                                <input type="file" id="select-file-image-cover"
                                                                       name="file1"
                                                                       accept="image/x-png,image/gif,image/jpeg"
                                                                       ng-file-change="fileMgr.selectImage"
                                                                       file-input-id="{{dataStaff.id}}"
                                                                       ng-model="dataStaff.image">Chọn
                                                            </div>
                                                            <input type="text" style="padding-right: 80px !important;"
                                                                   class="form-control" id="text-file-name"
                                                                   placeholder="Chọn ảnh nhân viên" readonly
                                                                   ng-model="dataStaff.image"/>
                                                        </div>
                                                        <div style="width: 100%; height: auto; display: flex;align-items:center; justify-content:center;">
                                                            <img style="max-width: 100%; max-height:229px; margin-top: 10px;"
                                                                 ng-if="dataStaff.image"
                                                                 id="img-cover"
                                                                 ng-src="{{dataStaff.image.absoluteUrl()}}">
                                                            <img ng-if="uploading"
                                                                 src="/static/images/loading/loading2.gif"
                                                                 style="width: 69px; position: absolute; top: 65%; left: 44%;"/>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary">Save changes</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                        </button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- /modals -->

                        <button type="button" ng-click="showConfirmDialog()" class="btn btn-primary"
                                data-toggle="modal">
                            Confirm Dialog
                        </button>
                        <button type="button" ng-click="showAlertSuccess()" class="btn btn-primary"
                                data-toggle="modal">
                            Alert Success
                        </button>
                        <button type="button" ng-click="showAlertError()" class="btn btn-primary"
                                data-toggle="modal">
                            Alert Error
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 style="font-size: 18px;">Default Example
                            <small>Users</small>
                        </h2>
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
                            <div class="col-sm-6">
                                <div class="dataTables_length" id="datatable_length" style="width: 40%; float: left;">
                                    <label style="font-weight: normal; text-align: left; white-space: nowrap;">Show</label>
                                    <label>
                                        <select name="datatable_length" aria-controls="datatable"
                                                class="form-control input-sm">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                    </label>
                                    <label style="font-weight: normal; text-align: left; white-space: nowrap;">
                                        entries</label>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div id="datatable_filter" class="dataTables_filter">
                                    <button type="submit" class="btn btn-success">Thêm mới</button>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table table-striped table-bordered dataTable no-footer">
                                    <thead>
                                    <tr class="table-tr-th">
                                        <th>Name</th>
                                        <th>Position</th>
                                        <th>Office</th>
                                        <th>Age</th>
                                        <th>Start date</th>
                                        <th>Salary</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr class="table-tr-th">
                                        <td>Tiger Nixon</td>
                                        <td>System Architect</td>
                                        <td>Edinburgh</td>
                                        <td>61</td>
                                        <td>2011/04/25</td>
                                        <td>$320,800</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Garrett Winters</td>
                                        <td>Accountant</td>
                                        <td>Tokyo</td>
                                        <td>63</td>
                                        <td>2011/07/25</td>
                                        <td>$170,750</td>
                                    </tr>
                                    <tr>
                                        <td>Ashton Cox</td>
                                        <td>Junior Technical Author</td>
                                        <td>San Francisco</td>
                                        <td>66</td>
                                        <td>2009/01/12</td>
                                        <td>$86,000</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Cedric Kelly</td>
                                        <td>Senior Javascript Developer</td>
                                        <td>Edinburgh</td>
                                        <td>22</td>
                                        <td>2012/03/29</td>
                                        <td>$433,060</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Airi Satou</td>
                                        <td>Accountant</td>
                                        <td>Tokyo</td>
                                        <td>33</td>
                                        <td>2008/11/28</td>
                                        <td>$162,700</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Brielle Williamson</td>
                                        <td>Integration Specialist</td>
                                        <td>New York</td>
                                        <td>61</td>
                                        <td>2012/12/02</td>
                                        <td>$372,000</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Herrod Chandler</td>
                                        <td>Sales Assistant</td>
                                        <td>San Francisco</td>
                                        <td>59</td>
                                        <td>2012/08/06</td>
                                        <td>$137,500</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Rhona Davidson</td>
                                        <td>Integration Specialist</td>
                                        <td>Tokyo</td>
                                        <td>55</td>
                                        <td>2010/10/14</td>
                                        <td>$327,900</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Colleen Hurst</td>
                                        <td>Javascript Developer</td>
                                        <td>San Francisco</td>
                                        <td>39</td>
                                        <td>2009/09/15</td>
                                        <td>$205,500</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Sonya Frost</td>
                                        <td>Software Engineer</td>
                                        <td>Edinburgh</td>
                                        <td>23</td>
                                        <td>2008/12/13</td>
                                        <td>$103,600</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Jena Gaines</td>
                                        <td>Office Manager</td>
                                        <td>London</td>
                                        <td>30</td>
                                        <td>2008/12/19</td>
                                        <td>$90,560</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Quinn Flynn</td>
                                        <td>Support Lead</td>
                                        <td>Edinburgh</td>
                                        <td>22</td>
                                        <td>2013/03/03</td>
                                        <td>$342,000</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Charde Marshall</td>
                                        <td>Regional Director</td>
                                        <td>San Francisco</td>
                                        <td>36</td>
                                        <td>2008/10/16</td>
                                        <td>$470,600</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Haley Kennedy</td>
                                        <td>Senior Marketing Designer</td>
                                        <td>London</td>
                                        <td>43</td>
                                        <td>2012/12/18</td>
                                        <td>$313,500</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Tatyana Fitzpatrick</td>
                                        <td>Regional Director</td>
                                        <td>London</td>
                                        <td>19</td>
                                        <td>2010/03/17</td>
                                        <td>$385,750</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Michael Silva</td>
                                        <td>Marketing Designer</td>
                                        <td>London</td>
                                        <td>66</td>
                                        <td>2012/11/27</td>
                                        <td>$198,500</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Paul Byrd</td>
                                        <td>Chief Financial Officer (CFO)</td>
                                        <td>New York</td>
                                        <td>64</td>
                                        <td>2010/06/09</td>
                                        <td>$725,000</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Gloria Little</td>
                                        <td>Systems Administrator</td>
                                        <td>New York</td>
                                        <td>59</td>
                                        <td>2009/04/10</td>
                                        <td>$237,500</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Bradley Greer</td>
                                        <td>Software Engineer</td>
                                        <td>London</td>
                                        <td>41</td>
                                        <td>2012/10/13</td>
                                        <td>$132,000</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Dai Rios</td>
                                        <td>Personnel Lead</td>
                                        <td>Edinburgh</td>
                                        <td>35</td>
                                        <td>2012/09/26</td>
                                        <td>$217,500</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Jenette Caldwell</td>
                                        <td>Development Lead</td>
                                        <td>New York</td>
                                        <td>30</td>
                                        <td>2011/09/03</td>
                                        <td>$345,000</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Yuri Berry</td>
                                        <td>Chief Marketing Officer (CMO)</td>
                                        <td>New York</td>
                                        <td>40</td>
                                        <td>2009/06/25</td>
                                        <td>$675,000</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Caesar Vance</td>
                                        <td>Pre-Sales Support</td>
                                        <td>New York</td>
                                        <td>21</td>
                                        <td>2011/12/12</td>
                                        <td>$106,450</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Doris Wilder</td>
                                        <td>Sales Assistant</td>
                                        <td>Sidney</td>
                                        <td>23</td>
                                        <td>2010/09/20</td>
                                        <td>$85,600</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Angelica Ramos</td>
                                        <td>Chief Executive Officer (CEO)</td>
                                        <td>London</td>
                                        <td>47</td>
                                        <td>2009/10/09</td>
                                        <td>$1,200,000</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Gavin Joyce</td>
                                        <td>Developer</td>
                                        <td>Edinburgh</td>
                                        <td>42</td>
                                        <td>2010/12/22</td>
                                        <td>$92,575</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Jennifer Chang</td>
                                        <td>Regional Director</td>
                                        <td>Singapore</td>
                                        <td>28</td>
                                        <td>2010/11/14</td>
                                        <td>$357,650</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Brenden Wagner</td>
                                        <td>Software Engineer</td>
                                        <td>San Francisco</td>
                                        <td>28</td>
                                        <td>2011/06/07</td>
                                        <td>$206,850</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Fiona Green</td>
                                        <td>Chief Operating Officer (COO)</td>
                                        <td>San Francisco</td>
                                        <td>48</td>
                                        <td>2010/03/11</td>
                                        <td>$850,000</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Shou Itou</td>
                                        <td>Regional Marketing</td>
                                        <td>Tokyo</td>
                                        <td>20</td>
                                        <td>2011/08/14</td>
                                        <td>$163,000</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Michelle House</td>
                                        <td>Integration Specialist</td>
                                        <td>Sidney</td>
                                        <td>37</td>
                                        <td>2011/06/02</td>
                                        <td>$95,400</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Suki Burks</td>
                                        <td>Developer</td>
                                        <td>London</td>
                                        <td>53</td>
                                        <td>2009/10/22</td>
                                        <td>$114,500</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Prescott Bartlett</td>
                                        <td>Technical Author</td>
                                        <td>London</td>
                                        <td>27</td>
                                        <td>2011/05/07</td>
                                        <td>$145,000</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Gavin Cortez</td>
                                        <td>Team Leader</td>
                                        <td>San Francisco</td>
                                        <td>22</td>
                                        <td>2008/10/26</td>
                                        <td>$235,500</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Martena Mccray</td>
                                        <td>Post-Sales support</td>
                                        <td>Edinburgh</td>
                                        <td>46</td>
                                        <td>2011/03/09</td>
                                        <td>$324,050</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Unity Butler</td>
                                        <td>Marketing Designer</td>
                                        <td>San Francisco</td>
                                        <td>47</td>
                                        <td>2009/12/09</td>
                                        <td>$85,675</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Howard Hatfield</td>
                                        <td>Office Manager</td>
                                        <td>San Francisco</td>
                                        <td>51</td>
                                        <td>2008/12/16</td>
                                        <td>$164,500</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Hope Fuentes</td>
                                        <td>Secretary</td>
                                        <td>San Francisco</td>
                                        <td>41</td>
                                        <td>2010/02/12</td>
                                        <td>$109,850</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Vivian Harrell</td>
                                        <td>Financial Controller</td>
                                        <td>San Francisco</td>
                                        <td>62</td>
                                        <td>2009/02/14</td>
                                        <td>$452,500</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Timothy Mooney</td>
                                        <td>Office Manager</td>
                                        <td>London</td>
                                        <td>37</td>
                                        <td>2008/12/11</td>
                                        <td>$136,200</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Jackson Bradshaw</td>
                                        <td>Director</td>
                                        <td>New York</td>
                                        <td>65</td>
                                        <td>2008/09/26</td>
                                        <td>$645,750</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Olivia Liang</td>
                                        <td>Support Engineer</td>
                                        <td>Singapore</td>
                                        <td>64</td>
                                        <td>2011/02/03</td>
                                        <td>$234,500</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Bruno Nash</td>
                                        <td>Software Engineer</td>
                                        <td>London</td>
                                        <td>38</td>
                                        <td>2011/05/03</td>
                                        <td>$163,500</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Sakura Yamamoto</td>
                                        <td>Support Engineer</td>
                                        <td>Tokyo</td>
                                        <td>37</td>
                                        <td>2009/08/19</td>
                                        <td>$139,575</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Thor Walton</td>
                                        <td>Developer</td>
                                        <td>New York</td>
                                        <td>61</td>
                                        <td>2013/08/11</td>
                                        <td>$98,540</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Finn Camacho</td>
                                        <td>Support Engineer</td>
                                        <td>San Francisco</td>
                                        <td>47</td>
                                        <td>2009/07/07</td>
                                        <td>$87,500</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Serge Baldwin</td>
                                        <td>Data Coordinator</td>
                                        <td>Singapore</td>
                                        <td>64</td>
                                        <td>2012/04/09</td>
                                        <td>$138,575</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Zenaida Frank</td>
                                        <td>Software Engineer</td>
                                        <td>New York</td>
                                        <td>63</td>
                                        <td>2010/01/04</td>
                                        <td>$125,250</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Zorita Serrano</td>
                                        <td>Software Engineer</td>
                                        <td>San Francisco</td>
                                        <td>56</td>
                                        <td>2012/06/01</td>
                                        <td>$115,000</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Jennifer Acosta</td>
                                        <td>Junior Javascript Developer</td>
                                        <td>Edinburgh</td>
                                        <td>43</td>
                                        <td>2013/02/01</td>
                                        <td>$75,650</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Cara Stevens</td>
                                        <td>Sales Assistant</td>
                                        <td>New York</td>
                                        <td>46</td>
                                        <td>2011/12/06</td>
                                        <td>$145,600</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Hermione Butler</td>
                                        <td>Regional Director</td>
                                        <td>London</td>
                                        <td>47</td>
                                        <td>2011/03/21</td>
                                        <td>$356,250</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Lael Greer</td>
                                        <td>Systems Administrator</td>
                                        <td>London</td>
                                        <td>21</td>
                                        <td>2009/02/27</td>
                                        <td>$103,500</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Jonas Alexander</td>
                                        <td>Developer</td>
                                        <td>San Francisco</td>
                                        <td>30</td>
                                        <td>2010/07/14</td>
                                        <td>$86,500</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Shad Decker</td>

                                        <td>Regional Director</td>
                                        <td>Edinburgh</td>
                                        <td>51</td>
                                        <td>2008/11/13</td>
                                        <td>$183,000</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Michael Bruce</td>
                                        <td>Javascript Developer</td>
                                        <td>Singapore</td>
                                        <td>29</td>
                                        <td>2011/06/27</td>
                                        <td>$183,000</td>
                                    </tr>
                                    <tr class="table-tr-th">
                                        <td>Donna Snider</td>
                                        <td>Customer Support</td>
                                        <td>New York</td>
                                        <td>27</td>
                                        <td>2011/01/25</td>
                                        <td>$112,000</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">
                                <div class="dataTables_info" id="datatable_info" role="status" aria-live="polite">
                                    Showing 1 to 10 of 57 entries
                                </div>
                            </div>
                            <div class="col-sm-7">
                                <div class="dataTables_paginate paging_simple_numbers" id="datatable_paginate">
                                    <ul class="pagination">
                                        <li class="paginate_button previous disabled" id="datatable_previous">
                                            <a href="#" aria-controls="datatable" data-dt-idx="0"
                                               tabindex="0">Previous</a>
                                        </li>
                                        <li class="paginate_button active">
                                            <a href="#" aria-controls="datatable"
                                               data-dt-idx="1" tabindex="0">1</a>
                                        </li>
                                        <li class="paginate_button ">
                                            <a href="#" aria-controls="datatable"
                                               data-dt-idx="2" tabindex="0">2</a>
                                        </li>
                                        <li class="paginate_button ">
                                            <a href="#" aria-controls="datatable"
                                               data-dt-idx="3" tabindex="0">3</a>
                                        </li>
                                        <li class="paginate_button ">
                                            <a href="#" aria-controls="datatable"
                                               data-dt-idx="4" tabindex="0">4</a>
                                        </li>
                                        <li class="paginate_button ">
                                            <a href="#" aria-controls="datatable"
                                               data-dt-idx="5" tabindex="0">5</a>
                                        </li>
                                        <li class="paginate_button ">
                                            <a href="#" aria-controls="datatable"
                                               data-dt-idx="6" tabindex="0">6</a>
                                        </li>
                                        <li class="paginate_button next" id="datatable_next">
                                            <a href="#" aria-controls="datatable" data-dt-idx="7"
                                               tabindex="0">Next</a>
                                        </li>
                                    </ul>
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