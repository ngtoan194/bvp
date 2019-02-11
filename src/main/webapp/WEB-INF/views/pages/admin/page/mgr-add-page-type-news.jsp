<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 11/19/18
  Time: 10:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="right_col" role="main" ng-controller="mgrAddPageTypeNewsController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2> {{dataPage.id?"Cập nhật":"Thêm mới"}}</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li>
                                <a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <%--<ul class="dropdown-menu" role="menu">--%>
                                <%--</ul>--%>
                            </li>
                            <li>
                                <a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <form class="smart-form" id="form-page"
                              ng-validate="validationPage">
                            <div class="col-md-5">
                                <div class="form-item">
                                    <div class="input-inner">
                                        <span class="form-label">Tên</span>
                                        <div class="input-text">
                                            <input class="form-control" name="name"
                                                   placeholder="Nhập tên page..." type="text"
                                                   ng-model="dataPage.name">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-item">
                                    <div class="input-inner">
                                        <span class="form-label">Tiêu đề </span>
                                        <div class="input-text">
                                            <input class="form-control" name="title"
                                                   placeholder="Nhập tiêu đề page..." type="text"
                                                   ng-model="dataPage.title">
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
                                                          ng-model="dataPage.content"
                                                          name="content" id="content"
                                                          ckeditor></textarea>
                                                <b class="tooltip tooltip-bottom-right"></b>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" ng-click="create()" ng-if="!dataPage.id">
                                    Thêm mới
                                </button>
                                <button type="button" class="btn btn-success" ng-click="update()" ng-if="dataPage.id">
                                    Cập nhật
                                </button>
                                <button type="button" class="btn btn-success" data-dismiss="modal"
                                        ng-click="back()">
                                    Hủy
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('mgrAddPageTypeNewsController', function ($scope, httpRequest) {
        $scope.dataPage = ${dataPage};
        $.validator.addMethod("requiredName", function (value, element) {
            if ((!value || value.trim() == ""))
                return false;
            return true;
        }, "Vui lòng nhập tên page!");
        $.validator.addMethod("requiredTitle", function (value, element) {
            if ((!value || value.trim() == ""))
                return false;
            return true;
        }, "Vui lòng nhập tiêu đều page!");
        $scope.validationPage = {
            rules: {
                name: {
                    requiredName: true,
                },
                title: {
                    requiredTitle: true,
                    maxlength: 1000,
                },
            },
            messages: {
                name: {
                    required: "Vui lòng nhập tên page!",
                },
                title: {
                    required: "Vui lòng nhập tiêu đề page",
                    maxlength: "Vui lòng nhập ít hơn 1000 ký tự",
                },
            },
            errorPlacement: function (error, element) {
                if (element.attr("id") === "contentPage") {
                    error.insertAfter($("#textarea").parent());
                } else {
                    error.insertAfter(element.parent());
                }
            },
        }
        $scope.create = function () {
            if ($("#form-page").valid()) {
                $scope.dataPage.type = 1;
                $scope.dataPage.webType = webType;
                httpRequest.post("/page/create"
                    , {page: $scope.dataPage}
                    , function (data) {
                        if (data.success) {
                            alertSmallBox(data.data, success);
                            $scope.back();
                        } else {
                            $scope.back();
                        }
                    }, function (data) {
                    }, true);
            }
        };
        $scope.update = function () {
            $scope.update = function () {
                if ($("#form-page").valid()) {
                    httpRequest.post("/page/update/" + $scope.dataPage.id,
                        {page: $scope.dataPage},
                        function (data) {
                            if (data.success) {
                                alertSmallBox(data.data, success);
                                $scope.back();
                            } else {
                                alertSmallBox(data.message, error);
                                $scope.back();
                            }
                        }, function (data) {
                        }, true);
                }
            }
        };
        $scope.back = function () {
            setTimeout(function () {
                location.href = '/admin/page';
            }, 1000)
        }
    });
</script>

