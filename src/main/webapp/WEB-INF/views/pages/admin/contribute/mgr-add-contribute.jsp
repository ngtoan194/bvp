<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/4/2019
  Time: 7:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .tag [data-role=remove] {
        padding-top: 6px !important;
        height: 18px !important;
        width: 16px !important;
    }

    .smart-form .label.tag {
        display: inline-block !important;
        color: #FFF !important;
        max-width: 210px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .bootstrap-tagsinput {
        padding-right: 1px !important;
    }
</style>
<style>
    #table-list-mgr th {
        text-align: center;
        vertical-align: middle;
    }
</style>
<div class="right_col" role="main" ng-controller="mgrAddContributeController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2> {{dataContribute.id?"Cập nhật":"Thêm mới"}}</h2>
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
                        <form id="form-contribute" novalidate="novalidate" class="smart-form"
                              ng-validate="validationContribute">
                            <div class="modal-body">
                                <div class="col-md-6">
                                    <div class="well padding-10">
                                        <div class="form-item">
                                            <div class="input-inner">
                                                <span class="form-label">Người tri ân <a style="color: red">*</a></span>
                                                <div class="input-text">
                                                    <input class="form-control" id="txtUrl"
                                                           name="authorContribute"
                                                           placeholder="Nhập tên người tri ân" type="text"
                                                           ng-model="dataContribute.author">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-item">
                                            <div class="input-inner">
                                                            <span class="form-label">Tiêu đề tri ân<a
                                                                    style="color: red">*</a></span>
                                                <div class="input-text">
                                                    <input class="form-control" id="titleContribute"
                                                           name="titleContribute"
                                                           placeholder="Nhập tiêu đề tri ân" type="text"
                                                           ng-model="dataContribute.title">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-item">
                                            <div class="input-inner">
                                                            <span class="form-label"
                                                                  style="margin-top: 10px;">Ảnh<a
                                                                    style="color: red">*</a></span>
                                                <div class="input input-file" style="margin-top: 10px;">
                                                    <div class="button"
                                                         style="margin-top: 5px; margin-right: 20px;">
                                                        <input type="file" id="select-file-image-cover"
                                                               name="file1"
                                                               accept="image/x-png,image/gif,image/jpeg"
                                                               ng-file-change="imgContributeThumbnail.selectFile"
                                                               file-input-id="{{contribute.id}}"
                                                               ng-model="dataContribute.authorAvatar">Chọn
                                                    </div>
                                                    <input type="text"
                                                           style="padding-right: 80px !important;"
                                                           class="form-control" id="text-file-name"
                                                           placeholder="Chọn file ảnh" readonly
                                                           ng-model="dataContribute.authorAvatar"/>
                                                </div>
                                                <div style="width: 100%; height: auto; display: flex;align-items:center; justify-content:center;">
                                                    <img style="max-width: 100%; max-height:229px; margin-top: 10px;"
                                                         ng-if="dataContribute.authorAvatar"
                                                         id="img-cover"
                                                         ng-src="{{dataContribute.authorAvatar.absoluteUrl()}}">
                                                    <img ng-if="uploadingImg"
                                                         src="/static/images/loading/loading2.gif"
                                                         style="width: 69px; position: absolute; top: 65%; left: 44%;"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="well padding-10">
                                        <div class="form-item">
                                            <div class="form-item">
                                                <div class="input-inner">
                                                                <span style="margin-top: 10px;"><strong>Nội dung tri ân<a
                                                                        style="color: red">*</a></strong></span>
                                                    <div class="textarea">
                                                                <textarea type="text"
                                                                          ng-model="dataContribute.content"
                                                                          name="contentContribute"
                                                                          id="contentContribute"
                                                                          style="width: 100%"
                                                                          ckeditor></textarea>
                                                        <b class="tooltip tooltip-bottom-right">Nhập nội
                                                            dung tri ân</b>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-success"
                                        ng-if="!dataContribute.id && !uploadingImg"
                                        ng-click="createContribute()">Thêm mới
                                </button>
                                <button type="button" class="btn btn-success"
                                        ng-if="dataContribute.id && !uploadingImg"
                                        ng-click="updateContribute(dataContribute)">Cập nhật
                                </button>
                                <a type="button" class="btn btn-success" data-dismiss="modal"
                                        href="/admin/goc-tri-an">Hủy
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('mgrAddContributeController', function ($scope, $http, httpRequest, fileManager) {
        $scope.dataContribute = ${dataContribute};
debugger
        $scope.uploadingImg = false;
        $scope.imgContributeThumbnail = {
            chooseFile: function () {
                $("[file-input-id]").trigger("click");
            },
            selectFile: function () {
                var selector = $(event.target);
                var fileName = selector[0].value.replace("C:\\fakepath\\", "").toLocaleLowerCase();
                if (common.endWith(fileName, ".jpg") ||
                    common.endWith(fileName, ".png") ||
                    common.endWith(fileName, ".gif")) {
                    $scope.dataContribute.authorAvatar = URL.createObjectURL(selector[0].files[0]);
                    $scope.uploadingImg = true;
                    fileManager.upload(selector[0].files[0], function (data) {
                        if (data.success) {
                            $scope.dataContribute.authorAvatar = data.data.images[0].image;
                            $scope.uploadingImg = false;
                            $scope.$apply();
                        } else {
                            alertSmallBox("Thêm ảnh lỗi");
                        }
                    }, function (response) {
                    });
                } else {
                    $("#select-file-image-cover").val("");
                    alertSmallBox("Vui lòng chọn hình ảnh có định dạng png, jpg, gif")
                }
            }
        };
        $.validator.addMethod("noFirstSpace", function (value, element) {
            return value && value[0] != ' ';
        }, "Vui lòng không để khoảng trống đầu dòng!");
        $.validator.addMethod("isFullName", function (value, element) {
            return value.isFullName();
        }, "Tên người tri ân vui lòng không nhập ký tự đặc biệt hoặc số!");
        $scope.validationContribute = {
            ignore: [],
            rules: {
                authorContribute: {
                    required: true,
                    noFirstSpace: true,
                    isFullName: true
                },
                titleContribute: {
                    required: true,
                    maxlength: 1000,
                    noFirstSpace: true
                },
//                file1: {
//                    required: function () {
//                        if (!$scope.dataContribute.authorAvatar) {
//                            return true;
//                        }
//                        return false;
//                    }
//                }
            },
            messages: {
                authorContribute: {
                    required: "Vui lòng nhập tên người tạo tri ân!",
                },
                titleContribute: {
                    required: "Vui lòng nhập tiêu đề tri ân",
                    maxlength: "Vui lòng nhập ít hơn 1000 ký tự"
                },
//                file1: {
//                    required: "Vui lòng chọn ảnh!"
//                }
            }
        }
        $scope.createContribute = function () {
            if (!$scope.dataContribute.authorAvatar) {
                alertSmallBox("Vui lòng chọn ảnh!", error);
                return;
            }
            if (!$scope.dataContribute.content) {
                $scope.dataContribute.content = CKEditorSetup.GetData("contentContribute");
                alertSmallBox("Vui nhập nội dung!", error);
                return;
            }
            if ($("#form-contribute").valid()) {
                httpRequest.post("/contribute/createContribute"
                    , {contribute: $scope.dataContribute}
                    , function (data) {
                        if (data.success) {
                            alertSmallBox(data.data, success);
                            setTimeout(function () {
                                location.href = '/admin/goc-tri-an';
                            }, 1500)
                        } else {
                            alertSmallBox(data.message, error);
                        }
                    }, function (data) {
                    }, true);
            }
        }
        $scope.showdataUpdate = function (item) {
            $scope.dataContribute = JSON.parse(JSON.stringify(item));
            $scope.dataContribute.authorAvatar = item.authorAvatar.absoluteUrl();
            CKEditorSetup.SetData("contentContribute", $scope.dataContribute.content);
        }
        $scope.resetImgInput = function () {
            $("#select-file-image-cover").val("");
            for (instance in CKEDITOR.instances) {
                CKEDITOR.instances[instance].setData("");
            }
        }
        $scope.updateContribute = function (item) {
            if (!$scope.dataContribute.authorAvatar) {
                alertSmallBox("Vui lòng chọn ảnh!", error);
                return;
            }
            if (!$scope.dataContribute.content) {
                $scope.dataContribute.content = CKEditorSetup.GetData("content");
                alertSmallBox("Vui nhập nội dung!", error);
                return;
            }
            if ($("#form-contribute").valid()) {
                httpRequest.post("/contribute/updateContribute/" + item.id,
                    {contribute: $scope.dataContribute},
                    function (data) {
                        if (data.success) {
                            alertSmallBox(data.data, success);
                            setTimeout(function () {
                                location.href = '/admin/goc-tri-an';
                            }, 1500)
                        } else {
                            alertSmallBox(data.message, error);
                        }
                    }, function (data) {
                    }, true);
            }
        }
    });
</script>