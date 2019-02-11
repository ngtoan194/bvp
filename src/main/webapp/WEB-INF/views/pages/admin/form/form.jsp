<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/09/18
  Time: 1:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Form Elements</h3>
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
        <!-- ckEditor -->
        <div class="x_panel" style="">
            <div class="x_title">
                <h2>ckEditor
                    <small></small>
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
                <div class="container">
                    <div class="row">
                        <div class="form-item">
                            <div class="input-inner">
                                <span class="form-label">Tên menu</span>
                                <div class="input-text">
                                    <textarea ng-model="dataTest.content" class="form-control"
                                              name="content" id="content" ckeditor
                                              cols="30" rows="5" maxlength="500"
                                              style="margin-top: 15px;margin-bottom: 15px"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
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
                                            <div class="input-inner">
                                                <div class="form-label" style="margin-top: 10px;">Chọn file
                                                </div>
                                                <div class="input input-file" style="margin-top: 10px;">
                                                    <div class="button"
                                                         style="margin-top: 5px; margin-right: 20px;">
                                                        <input type="file" id="select-file"
                                                               name="file1"
                                                               ng-file-change="fileMgr.selectFile"
                                                               file-input-id="{{dataTest.id}}"
                                                               ng-model="dataTest.file">Chọn
                                                    </div>
                                                    <input type="text" style="padding-right: 80px !important;"
                                                           class="form-control" id="text-file-name"
                                                           placeholder="Chọn file" readonly
                                                           ng-model="dataTest.file"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                            </button>
                                            <button type="button" class="btn btn-primary">Save changes</button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /form datetimepicker -->
    <!-- form datetimepicker -->
    <div class="x_panel" style="">
        <div class="x_title">
            <h2>Date Pickers
                <small> Available with multiple designs</small>
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

            <div class="container">
                <div class="row">

                    <div class='col-sm-4'>
                        Basic Example
                        <div class="form-group">
                            <div class='input-group date' id='myDatepicker'>
                                <input type='text' class="form-control"/>
                                <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                            </div>
                            <script>
                                setTimeout(function () {
                                    $('#myDatepicker').datetimepicker();
                                }, 1500)
                            </script>
                        </div>
                    </div>

                    <div class='col-sm-4'>
                        Only Date Picker
                        <div class="form-group">
                            <div class='input-group date' id='myDatepicker2'>
                                <input type='text' class="form-control"/>
                                <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                            </div>
                            <script>
                                setTimeout(function () {
                                    $('#myDatepicker2').datetimepicker({
                                        format: 'DD.MM.YYYY'
                                    });
                                }, 1500)
                            </script>
                        </div>
                    </div>

                    <div class='col-sm-4'>
                        Only Time Picker
                        <small>For 24H format use format: 'HH:mm'</small>
                        <div class="form-group">
                            <div class='input-group date' id='myDatepicker3'>
                                <input type='text' class="form-control"/>
                                <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                            </div>
                            <script>
                                setTimeout(function () {
                                    $('#myDatepicker3').datetimepicker({
                                        format: 'hh:mm A'
                                    });
                                }, 1500)
                            </script>
                        </div>
                    </div>

                    <div class='col-sm-4'>
                        Using ReadOnly
                        <div class="form-group">
                            <div class='input-group date' id='myDatepicker4'>
                                <input type='text' class="form-control" readonly="readonly"/>
                                <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                <script>
                                    setTimeout(function () {
                                        $('#myDatepicker4').datetimepicker({
                                            ignoreReadonly: true,
                                            allowInputToggle: true
                                        });
                                    }, 1500)
                                </script>
                            </div>
                        </div>
                    </div>

                    <div class='col-sm-4'>
                        Linked Picker Parent
                        <div class="form-group">
                            <div class='input-group date' id='datetimepicker6'>
                                <input type='text' class="form-control"/>
                                <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                            </div>
                            <script>
                                setTimeout(function () {
                                    $('#datetimepicker6').datetimepicker();
                                }, 1500)
                            </script>
                        </div>
                    </div>
                    <div class='col-sm-4'>
                        Linked Picker Children
                        <div class="form-group">
                            <div class='input-group date' id='datetimepicker7'>
                                <input type='text' class="form-control"/>
                                <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                            </div>
                            <script>
                                setTimeout(function () {
                                    $('#datetimepicker7').datetimepicker({
                                        useCurrent: false
                                    });
                                }, 1500)
                            </script>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- /form datetimepicker -->
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Form Basic Elements
                        <small>different form elements</small>
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
                    <br/>
                    <form class="form-horizontal form-label-left">

                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Default Input</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <input type="text" class="form-control" placeholder="Default Input">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Disabled Input </label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <input type="text" class="form-control" disabled="disabled"
                                       placeholder="Disabled Input">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Read-Only Input</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <input type="text" class="form-control" readonly="readonly"
                                       placeholder="Read-Only Input">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Date Of Birth <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <textarea class="form-control" rows="3" placeholder="Date Of Birth"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Password</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <input type="password" class="form-control" value="passwordonetwo">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">AutoComplete</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <input type="text" name="country" id="autocomplete-custom-append"
                                       class="form-control col-md-10"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Select</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <select class="form-control">
                                    <option>Choose option</option>
                                    <option>Option one</option>
                                    <option>Option two</option>
                                    <option>Option three</option>
                                    <option>Option four</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Custom</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <select class="select2_single form-control" tabindex="-1">
                                    <option></option>
                                    <option value="AK">Alaska</option>
                                    <option value="HI">Hawaii</option>
                                    <option value="CA">California</option>
                                    <option value="NV">Nevada</option>
                                    <option value="OR">Oregon</option>
                                    <option value="WA">Washington</option>
                                    <option value="AZ">Arizona</option>
                                    <option value="CO">Colorado</option>
                                    <option value="ID">Idaho</option>
                                    <option value="MT">Montana</option>
                                    <option value="NE">Nebraska</option>
                                    <option value="NM">New Mexico</option>
                                    <option value="ND">North Dakota</option>
                                    <option value="UT">Utah</option>
                                    <option value="WY">Wyoming</option>
                                    <option value="AR">Arkansas</option>
                                    <option value="IL">Illinois</option>
                                    <option value="IA">Iowa</option>
                                    <option value="KS">Kansas</option>
                                    <option value="KY">Kentucky</option>
                                    <option value="LA">Louisiana</option>
                                    <option value="MN">Minnesota</option>
                                    <option value="MS">Mississippi</option>
                                    <option value="MO">Missouri</option>
                                    <option value="OK">Oklahoma</option>
                                    <option value="SD">South Dakota</option>
                                    <option value="TX">Texas</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Grouped</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <select class="select2_group form-control">
                                    <optgroup label="Alaskan/Hawaiian Time Zone">
                                        <option value="AK">Alaska</option>
                                        <option value="HI">Hawaii</option>
                                    </optgroup>
                                    <optgroup label="Pacific Time Zone">
                                        <option value="CA">California</option>
                                        <option value="NV">Nevada</option>
                                        <option value="OR">Oregon</option>
                                        <option value="WA">Washington</option>
                                    </optgroup>
                                    <optgroup label="Mountain Time Zone">
                                        <option value="AZ">Arizona</option>
                                        <option value="CO">Colorado</option>
                                        <option value="ID">Idaho</option>
                                        <option value="MT">Montana</option>
                                        <option value="NE">Nebraska</option>
                                        <option value="NM">New Mexico</option>
                                        <option value="ND">North Dakota</option>
                                        <option value="UT">Utah</option>
                                        <option value="WY">Wyoming</option>
                                    </optgroup>
                                    <optgroup label="Central Time Zone">
                                        <option value="AL">Alabama</option>
                                        <option value="AR">Arkansas</option>
                                        <option value="IL">Illinois</option>
                                        <option value="IA">Iowa</option>
                                        <option value="KS">Kansas</option>
                                        <option value="KY">Kentucky</option>
                                        <option value="LA">Louisiana</option>
                                        <option value="MN">Minnesota</option>
                                        <option value="MS">Mississippi</option>
                                        <option value="MO">Missouri</option>
                                        <option value="OK">Oklahoma</option>
                                        <option value="SD">South Dakota</option>
                                        <option value="TX">Texas</option>
                                        <option value="TN">Tennessee</option>
                                        <option value="WI">Wisconsin</option>
                                    </optgroup>
                                    <optgroup label="Eastern Time Zone">
                                        <option value="CT">Connecticut</option>
                                        <option value="DE">Delaware</option>
                                        <option value="FL">Florida</option>
                                        <option value="GA">Georgia</option>
                                        <option value="IN">Indiana</option>
                                        <option value="ME">Maine</option>
                                        <option value="MD">Maryland</option>
                                        <option value="MA">Massachusetts</option>
                                        <option value="MI">Michigan</option>
                                        <option value="NH">New Hampshire</option>
                                        <option value="NJ">New Jersey</option>
                                        <option value="NY">New York</option>
                                        <option value="NC">North Carolina</option>
                                        <option value="OH">Ohio</option>
                                        <option value="PA">Pennsylvania</option>
                                        <option value="RI">Rhode Island</option>
                                        <option value="SC">South Carolina</option>
                                        <option value="VT">Vermont</option>
                                        <option value="VA">Virginia</option>
                                        <option value="WV">West Virginia</option>
                                    </optgroup>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Multiple</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <select class="select2_multiple form-control" multiple="multiple">
                                    <option>Choose option</option>
                                    <option>Option one</option>
                                    <option>Option two</option>
                                    <option>Option three</option>
                                    <option>Option four</option>
                                    <option>Option five</option>
                                    <option>Option six</option>
                                </select>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Input Tags</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <input id="tags_1" type="text" class="tags form-control"
                                       value="social, adverts, sales"/>
                                <div id="suggestions-container"
                                     style="position: relative; float: left; width: 250px; margin: 10px;"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 col-sm-3 col-xs-12 control-label">Checkboxes and radios
                                <br>
                                <small class="text-navy">Normal Bootstrap elements</small>
                            </label>

                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value=""> Option one. select more than one options
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" value=""> Option two. select more than one options
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" checked="" value="option1" id="optionsRadios1"
                                               name="optionsRadios"> Option one. only select one option
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" value="option2" id="optionsRadios2"
                                               name="optionsRadios"> Option two. only select one option
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 col-sm-3 col-xs-12 control-label">Checkboxes and radios
                                <br>
                                <small class="text-navy">Normal Bootstrap elements</small>
                            </label>

                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" class="flat" checked="checked"> Checked
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" class="flat"> Unchecked
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" class="flat" disabled="disabled"> Disabled
                                    </label>
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" class="flat" disabled="disabled" checked="checked">
                                        Disabled & checked
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" class="flat" checked name="iCheck"> Checked
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" class="flat" name="iCheck"> Unchecked
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" class="flat" name="iCheck" disabled="disabled"> Disabled
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" class="flat" name="iCheck3" disabled="disabled" checked>
                                        Disabled & Checked
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12">Switch</label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <div class="">
                                    <label>
                                        <input type="checkbox" class="js-switch" checked/> Checked
                                    </label>
                                </div>
                                <div class="">
                                    <label>
                                        <input type="checkbox" class="js-switch"/> Unchecked
                                    </label>
                                </div>
                                <div class="">
                                    <label>
                                        <input type="checkbox" class="js-switch" disabled="disabled"/> Disabled
                                    </label>
                                </div>
                                <div class="">
                                    <label>
                                        <input type="checkbox" class="js-switch" disabled="disabled"
                                               checked="checked"/> Disabled Checked
                                    </label>
                                </div>
                            </div>
                        </div>


                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                                <button type="button" class="btn btn-primary">Cancel</button>
                                <button type="reset" class="btn btn-primary">Reset</button>
                                <button type="submit" class="btn btn-success">Submit</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>