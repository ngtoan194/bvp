<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/09/18
  Time: 1:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="right_col" role="main" ng-controller="mgrAddNewsController">
    <div class="">
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2 ng-if="dataNews.id == null">Thêm mới tin tức</h2>
                        <h2 ng-if="dataNews.id != null">Cập nhật tin tức</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                </ul>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <form class="form-horizontal form-label-left" id="add-news-form"
                              ng-validate="validationAddNews">
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       style="font-size: 16px; margin-top: 10px">Tiêu đề*</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" class="form-control" ng-model="dataNews.title" maxlength="150"
                                           id="txtTitle" name="title" style="margin-top: 15px;margin-bottom: 15px"
                                           placeholder="Nhập tiêu đề tối đa 150 ký tự ">
                                    <%--<i class="request-text">Nhập tối đa 150 ký tự</i>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       style="font-size: 16px; margin-top: 10px">Văn bản xem trước*</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <textarea ng-model="dataNews.contentPreview" class="form-control"
                                              name="contentpreview" id="txtContentPreview"
                                              cols="30" rows="5" maxlength="500"
                                              style="margin-top: 15px;margin-bottom: 15px"
                                              placeholder="Nhập nội dung văn bản xem trước"></textarea>
                                    <%--<i class="request-text">Nhập tối đa 500 ký tự</i>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       style="font-size: 16px; margin-top: -10px">Ảnh*</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="input-text">
                                        <span class="icon-input">
                                          <input type="file"
                                                 class="file-input btn-upload-pdf text-imge"
                                                 accept="image/x-png,image/gif,image/jpeg" name="file1"
                                                 ng-file-change="imgNews.selectFile"
                                                 file-input-id="{{dataNews.id}}"
                                                 ng-model="dataNews.imagePreview">
                                        </span>
                                    </div>
                                    <div class="change-image" style="margin-top: 15px">
                                        <div class="prev-image" ng-if="dataNews.imagePreview">
                                            <img id="images" class="preview-img"
                                                 style="max-height: 500px; max-width: 750px"
                                                 ng-src="{{dataNews.imagePreview.absoluteUrl()}}" alt=" your image">
                                            <img ng-if="uploadingImg"
                                                 src="/static/images/loading/loading2.gif"
                                                 style="width: 69px; position: absolute; top: 65%; left: 44%;"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group" style="margin-top: 25px" ng-if="dataNews.id == null">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       style="font-size: 16px; margin-top: -8px">Menu* <span
                                        class="required"></span>
                                </label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <select class="form-control" name="menuId" id="menuId"
                                            ng-model="dataMenu.id">
                                        <option disabled selected value="">--- Chọn menu ---</option>
                                        <option ng-repeat="item in menuByGroup" value="{{item.id}}">
                                            {{item.name}}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       style="font-size: 16px; margin-top: 16px">Tin nổi bật</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" id="checked-join" class="checkbox"
                                                   style="margin-top: 15px;margin-bottom: 15px"
                                                   ng-model="checkHotNews"
                                                   ng-click="checkIsHotNews(checkHotNews?true:false)">
                                            <p style="margin-top: 17px; font-size: 16px"> Chọn làm tin nổi bật</p>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       style="font-size: 16px; margin-top: 10px">Góc từ thiện</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" id="checked2-join" class="checkbox"
                                                   style="margin-top: 11px;margin-bottom: 15px"
                                                   ng-model="checkCharity"
                                                   ng-click="checkIsCharity(checkCharity?true:false)">
                                            <p style="margin-top: 13px; font-size: 16px"> Chọn vào góc từ thiện</p>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                       style="font-size: 16px; margin-top: 10px">Nội dung*</label>
                                <div class="col-md-9 col-sm-9 col-xs-12">
                                      <textarea ng-model="dataNews.content" class="form-control"
                                                name="content" id="content" ckeditor
                                                cols="30" rows="5"
                                                style="margin-top: 15px;margin-bottom: 15px"
                                                maxlength="30000"></textarea>
                                </div>
                            </div>
                            <div class="ln_solid"></div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" ng-click="addNews()"
                                        ng-if="!dataNews.id && !uploadingImg">Thêm mới
                                </button>
                                <button type="button" class="btn btn-success" ng-click="updateNews()"
                                        ng-if="dataNews.id && !uploadingImg">Cập nhật
                                </button>
                                <a class="btn btn-success" href="/admin/tin-tuc">
                                    Hủy
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
    ngApp.controller('mgrAddNewsController', function ($scope, httpRequest, fileManager) {
        if (${dataNews}) {
            $scope.dataNews = ${dataNews};
        } else {
            $scope.dataNews = {};
        }
        if (${dataMenu}) {
            $scope.dataMenu = ${dataMenu};
        } else {
            $scope.dataMenu = {};
        }
        if ($scope.dataNews.isHotNews) {
            if ($scope.dataNews.isHotNews == 1) {
                $scope.checkHotNews = true;
            } else if ($scope.dataNews.isHotNews == 0) {
                $scope.checkHotNews = false;
            }
        } else {
            $scope.checkHotNews = false;
        }
        $scope.checkIsHotNews = function (hotNews) {
            $scope.checkHotNews = hotNews;
        }

        if ($scope.dataNews.charity) {
            if ($scope.dataNews.charity == 1) {
                $scope.checkCharity = true;
            } else if ($scope.dataNews.charity == 0) {
                $scope.checkCharity = false;
            }
        } else {
            $scope.checkCharity = false;
        }
        $scope.checkIsCharity = function (charity) {
            $scope.checkCharity = charity;
        }
        $scope.menuByGroup = [];
        $scope.group = 1;
        $scope.loadMenuByGroup = function () {
            httpRequest.get("/menu/getByGroup/" + $scope.group
                , function (data) {
                    if (data.success) {
                        $scope.menuByGroup = data.data.menus;
                    }
                }, function (data) {
                }, true);
        }
        $scope.loadMenuByGroup();
        $.validator.addMethod("noFirstSpace", function (value, element) {
            return value && value[0] != ' ';
        }, "Vui lòng không để khoảng trống đầu dòng!");
        $scope.validationAddNews = {
            rules: {
                title: {
                    noFirstSpace: true,
                    required: true,
                    maxlength: 150
                },
                contentpreview: {
                    noFirstSpace: true,
                    required: true
                },
                menuId: {
                    required: true
                },
                content: {
                    required: true
                },
                file1: {
                    required: function () {
                        if (!$scope.dataNews.imagePreview) {
                            return true;
                        }
                        return false;
                    }
                }
            },
            messages: {
                title: {
                    required: "Vui lòng nhập tên tiêu đề!",
                    maxlength: "Nhập tối đa 150 kí tự"
                },
                contentpreview: {
                    required: "Vui lòng nhập nội dung xem trước"
                },
                menuId: {
                    required: "Vui lòng chọn menu!"
                },
                content: {
                    required: "Vui lòng nhập nội dung!"
                },
                file1: {
                    required: "Vui lòng chọn ảnh!"
                }
            }
        }
        $scope.imgNews = {
            chooseFile: function () {
                $("[file-input-id]").trigger("click");
            },
            selectFile: function () {
                var selector = $(event.target);
                var fileName = selector[0].value.replace("C:\\fakepath\\", "").toLocaleLowerCase();
                if (fileName.endsWith(".jpg") ||
                    fileName.endsWith(".png") ||
                    fileName.endsWith(".gif")) {
                    var filePath = URL.createObjectURL(selector[0].files[0]);
                    $scope.uploadingImg = true;
                    $scope.dataNews.imagePreview = filePath;
                    fileManager.upload(selector[0].files[0], function (data) {
                        $("body").removeClass("loading");
                        if (data.success) {
                            var imagePreview = data.data.images[0].image;
                            $scope.imagePreview = imagePreview;
                            $scope.dataNews.imagePreview = imagePreview;
                            $scope.uploadingImg = false;
                            $scope.$apply();
                        } else {
                            alertSmallBox("Thêm ảnh lỗi", error);
                        }
                    }, function (response) {
                        $("body").removeClass("loading");
                    });
                } else {
                    alertSmallBox("Vui lòng chọn hình ảnh có định dạng png, jpg, gif", error)
                }
            }

        };
        $.validator.addMethod("input_content", function (value, element) {
            return CKEditorSetup.GetData(element.id).trim() !== "";
        }, "Vui lòng nhập nội dung tin tức");
        $.validator.addMethod("selectCheck", function (value, element) {
            if ($(element).find("option").length > 1 && !value)
                return false;
            return true;
        }, "Vui lòng chọn menu cho tin tức!");

        $scope.addNews = function () {
            $scope.dataNews.isHotNews = $scope.checkHotNews ? 1 : 0;
            $scope.dataNews.charity = $scope.checkCharity ? 1 : 0;

            if (!$scope.dataNews.imagePreview) {
                alertSmallBox("Vui lòng chọn ảnh!", error);
                return;
            }
//            if (!$scope.dataNews.content) {
//                alertSmallBox("Vui lòng nhập nội dung!", error);
//                return;
//            }
            if (!$scope.dataNews.content) {
                $scope.dataNews.content = CKEditorSetup.GetData("content");
            }
            if ($("#add-news-form").valid()) {
                httpRequest.post("/news/createNews"
                    , {
                        news: {
                            id: $scope.dataNews.id,
                            createdDate: $scope.dataNews.createdDate,
                            title: $scope.dataNews.title,
                            content: $scope.dataNews.content,
                            imagePreview: $scope.dataNews.imagePreview,
                            contentPreview: $scope.dataNews.contentPreview,
                            isHotNews: $scope.dataNews.isHotNews,
                            charity: $scope.dataNews.charity,
                            type: 1,
                            belongDepartment: 0,
                            webType: webType,
                        },
                        menuId: $scope.dataMenu.id
                    }
                    , function (data) {
                        if (data.success) {
                            alertSmallBox(data.message, success);
                            setTimeout(function () {
                                location.href = '/admin/tin-tuc'
                            }, 2000);
                        } else {
                            alertSmallBox(data.message, error);
                        }
                    }, function (data) {
                    }, true);
            }
        };

        $scope.updateNews = function () {
            $scope.dataNews.isHotNews = $scope.checkHotNews ? 1 : 0;
            $scope.dataNews.charity = $scope.checkCharity ? 1 : 0;

            if (!$scope.dataNews.imagePreview) {
                alertSmallBox("Vui lòng chọn ảnh!", error);
                return;
            }
//            if (!$scope.dataNews.content) {
//                alertSmallBox("Vui lòng nhập nội dung!", error);
//                return;
//            }

            if (!$scope.dataNews.content) {
                $scope.dataNews.content = CKEditorSetup.GetData("content");
            }

            if ($("#add-news-form").valid()) {
                debugger
                $scope.dataNews.belongDepartment = 0,
                    httpRequest.post("/news/createNews"
                        , {
                            news: {
                                id: $scope.dataNews.id,
                                createdDate: $scope.dataNews.createdDate,
                                title: $scope.dataNews.title,
                                content: $scope.dataNews.content,
                                imagePreview: $scope.dataNews.imagePreview,
                                contentPreview: $scope.dataNews.contentPreview,
                                isHotNews: $scope.dataNews.isHotNews,
                                charity: $scope.dataNews.charity,
                                type: 1,
                                belongDepartment: 0,
                                webType: webType,
                            },
                            menuId: $scope.dataMenu.id
                        }
                        , function (data) {
                            if (data.success) {
                                alertSmallBox(data.message, success);
                                setTimeout(function () {
                                    location.href = '/admin/tin-tuc'
                                }, 2000);
                            } else {
                                alertSmallBox(data.message, error);
                            }
                        }, function (data) {
                        }, true);
            }
        };
    });
</script>
