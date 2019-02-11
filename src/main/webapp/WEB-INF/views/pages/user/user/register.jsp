<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/12/18
  Time: 4:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<div class="wrapper login-form" ng-controller="registerController">
    <header class="header-login">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12">
                <a href="/" class="logo-login">
                    <img src="/static/images/logo_login.png" alt="">
                </a>
            </div>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="register">
                    <p>Bạn đã có tài khoản. <a href="/dang-nhap" class="register-link">Đăng nhập</a></p>
                </div>
            </div>
        </div>
    </header>

    <div class="main-page">
        <div class="detail-page">
            <div class="head-login">
                <h2 class="title-login">
                    <img src="/static/images/icon-login.png" alt=""> THAM GIA <strong>NGAY BÂY GIỜ !</strong>
                </h2>
            </div>
            <div class="login-main">
                <form action="#" id="form-register" novalidate="novalidate"
                      ng-validate="validationRegister">
                    <h4 class="title-form-login">Đăng ký</h4>
                    <div class="avatar-register">
                        <div class="immages-avartar">
                            <div class='prev-image'>
                                <img id='images' class='preview-img'
                                     ng-src="{{dataUser.thumbnail.absoluteUrl('/static/images/Profile1.png')}}"
                                     id="image-avatar"
                                     ng-click="showPopupChangeAvatar()"
                                     alt='your image'>
                            </div>

                        </div>
                        <span class="caption-image" style="cursor: pointer">
                            <a style="color: blue;" ng-click="showPopupChangeAvatar()">Chọn ảnh đại diện</a>
                        </span>
                    </div>

                    <%--<div class="input-item">--%>
                        <%--<div class="input-text">--%>
                            <%--<input type="text" ng-model="dataUser.name" placeholder="Nhập họ và tên..." name="name"--%>
                                   <%--minlength="6" maxlength="30" autofocus--%>
                                   <%--class="form-control">--%>
                        <%--</div>--%>
                    <%--</div>--%>
                    <div class="input-item">
                        <div class="input-text">
                            <input type="text" ng-model="dataUser.username" placeholder="Nhập tên đăng nhập..."
                                   name="username" minlength="6" maxlength="30" autofocus
                                   class="form-control">
                        </div>
                    </div>
                    <div class="input-item">
                        <div class="input-text">
                            <input type="text" ng-model="dataUser.email" placeholder="Nhập email..." name="email"
                                   class="form-control">
                        </div>
                    </div>
                    <div class="input-item">
                        <div class="input-text">
                            <input type="password" ng-model="dataUser.password" name="password"
                                   placeholder="Nhập mật khẩu..."
                                   id="txtPassword"
                                   minlength="6"
                                   class="form-control">
                        </div>
                    </div>
                    <div class="input-item">
                        <div class="input-text">
                            <input type="password" name="passwordConfirm" id="txtConfirmPassword"
                                   placeholder="Nhập lại mật khẩu..."
                                   class="form-control">
                        </div>
                    </div>
                    <div class="action">
                        <a class="btn-login btn-primary btn" ng-click="register()" id="btnResigter">Đăng ký</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="modal fade in" id="modal-change-avatar" data-backdrop="static" tabindex="-1" role="dialog"
         style="display: none; padding-left: 19px;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" ng-click="closedPopupChangeAvatar()" class="close"
                            data-dismiss="modal">×
                    </button>
                    <h4 class="modal-title">Chọn ảnh đại diện</h4>
                </div>
                <form id="form-select-avatar" novalidate="novalidate" class="smart-form no-padding">
                    <fieldset style="max-height:450px; overflow-y:auto; overflow-x: hidden">
                        <section class="col col-sm-12 col-lg-12 col-md-12 col-xs-12  no-padding">
                            <label class="input input-file" style="margin-top: 10px; ">
                                <div class="button" style="margin-top: 1px;">
                                    <input type="file" id="select-file-image"
                                           accept="image/x-png,image/gif,image/jpeg"
                                           name="file" ng-file-change="imgAvatar.selectFile"
                                           file-input-id="{{dataUser.id}}">Chọn
                                </div>
                                <input type="text" style="padding-right: 80px !important;" id="text-file-image-name"
                                       placeholder="Chọn file ảnh" readonly="">
                            </label>
                            <img style="max-width: 100%; margin-top: 10px; display: none; visibility: hidden; width: 551px; height: 413px;"
                                 id="img-temp-avatar"
                                 ng-src="{{dataUser.thumbnail.absoluteUrl()}}">
                        </section>
                    </fieldset>
                    <footer>
                        <label class="btn btn-default" ng-click="closedPopupChangeAvatar()"
                               data-createnew="True" data-image="new-new-ads" data-id="">
                            <span>Hủy</span>
                        </label>
                        <label class="btn btn-primary" ng-click="uploadAvatarAndRegister()"
                               data-createnew="True" data-image="new-new-ads" data-id="">
                            <span>Cập nhật</span>
                        </label>
                    </footer>
                </form>
            </div>
        </div>
    </div>

</div>
<script>
    ngApp.controller('registerController', function ($scope, httpRequest, fileManager) {
        $("#txtConfirmPassword").keyup(function(event) {
            if (event.keyCode === 13) {
                $("#btnResigter").click();
            }
        });
        $scope.device = {};
        $scope.dataUser = {};
        $scope.dataUser.thumbnail = "";
        $scope.dataUser.avatar = "";
        $scope.imgAvatar = {
            imageCropWidth: 0,
            imageCropHeight: 0,
            cropPointX: 0,
            cropPointY: 0,
            initCrop: function () {
                $('#img-temp-avatar').Jcrop({
                    onChange: $scope.imgAvatar.setCoordsAndImgSize,
                    aspectRatio: 1
                }, function () {
                    $scope.imgAvatar.inited = true;
                    $scope.imgAvatar.jcrop_api = this;
                    $scope.imgAvatar.jcrop_api.animateTo([100, 100, 400, 300]);
                });
            },
            setCoordsAndImgSize: function (e) {
                $scope.imgAvatar.imageCropWidth = e.w;
                $scope.imgAvatar.imageCropHeight = e.h;
                $scope.imgAvatar.cropPointX = e.x;
                $scope.imgAvatar.cropPointY = e.y;
            },
            chooseFile: function () {
                $("[file-input-id]").trigger("click");
            },
            selectFile: function () {
                var selector = $(event.target);

                if ($scope.imgAvatar.jcrop_api != undefined) {
                    $scope.imgAvatar.jcrop_api.destroy();
                }
                $(".jcrop-holder").remove();
                $("#img-temp-avatar").remove();

                var fileName = selector[0].value.replace("C:\\fakepath\\", "").toLocaleLowerCase();
                if (common.endWith(fileName, ".jpg") ||
                    common.endWith(fileName, ".png") ||
                    common.endWith(fileName, ".gif")) {
                    var filePath = URL.createObjectURL(selector[0].files[0]);
                    $scope.dataUser.thumbnail = filePath;
                    $scope.dataUser.avatar = filePath;

                    $("#form-select-avatar section")
                        .append($('<img style="max-width: 100%;  margin-top: 10px" id="img-temp-avatar">'));
                    $("#form-select-avatar #img-temp-avatar").attr("src", filePath);
                    $(".jcrop-holder img").attr("src", filePath);
                    $scope.imgAvatar.initCrop();
                } else {
                    alertSmallBox("Vui lòng chọn hình ảnh có định dạng png, jpg, gif")
                }
            }
        }
        $.validator.addMethod("requiredUserName", function (value, element) {
            if ((!value || value.trim() == ""))
                return false;
            return true;
        }, "Vui lòng nhập tên tài khoản!");
        $.validator.addMethod("isUserName", function (value, element) {
            var re = /^([a-zA-Z0-9_]){6,}$/g;
            return re.test(value.toLowerCase());
        }, "Tên tài khoản chỉ chứa các ký tự chữ, số và dấu _");
        $.validator.addMethod("isEmail", function (value, element) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/g;
            return re.test(value.toLowerCase());
        }, "Vui lòng nhập đúng định dạng email!")
        $scope.validationRegister = {
            rules: {
                name: {
                    required: true,
                },
                username: {
                    requiredUserName: true,
                    isUserName: true,
                },
                email: {
                    required: true,
                    isEmail: true,
                },
                password: {
                    required: true,
                },
                passwordConfirm: {
                    required: true,
                    equalTo: "#txtPassword"
                }
            },
            messages: {
                name: {
                    required: "Vui lòng nhập họ và tên!",
                },
                username: {
                    minlength: "Tên đăng nhập tối thiểu là 6 ký tự!",
                    maxlength: "Tên đăng nhập tối đa là 30 ký tự!"
                },
                email: {
                    required: "Vui lòng nhập địa chỉ email!",
                },
                password: {
                    required: "Vui lòng nhập mật khẩu!",
                    minlength: "Nhập mật khẩu tối thiểu 6 ký tự"
                },
                passwordConfirm: {
                    required: "Vui lòng nhập lại mật khẩu!",
                    equalTo: "Xác nhận mật khẩu không trùng khớp!"
                }
            }
        };
        $scope.uploadAvatarAndRegister = function () {
            var selector = $("[file-input-id]");
            if (selector[0].files.length > 0) {
                $("body").addClass("loading");

                var oMyForm = new FormData();
                oMyForm.append("file", selector[0].files[0]);
                oMyForm.append('cropPointX', $scope.imgAvatar.cropPointX);
                oMyForm.append('cropPointY', $scope.imgAvatar.cropPointY);
                oMyForm.append('imageCropWidth', $scope.imgAvatar.imageCropWidth);
                oMyForm.append('imageCropHeight', $scope.imgAvatar.imageCropHeight);
                oMyForm.append('orgWidth', $("#img-temp-avatar")[0].naturalWidth);
                oMyForm.append('orgHeight', $("#img-temp-avatar")[0].naturalHeight);
                oMyForm.append('clientWidth', $("#img-temp-avatar").width());
                oMyForm.append('clientHeight', $("#img-temp-avatar").height());
                oMyForm.append('uploadOriginImage', true);

                $.ajax({
                    dataType: 'json',
                    enctype: 'multipart/form-data',
                    type: 'POST',
                    url: "/user/upload-avatar",
                    data: oMyForm,
                    processData: false,  // tell jQuery not to process the data
                    contentType: false,  // tell jQuery not to set contentType
                    success: function (data) {
                        $("body").removeClass("loading");
                        if (data.success) {
                            $scope.dataUser.thumbnail = data.data.images[0].thumbnail;
                            $scope.dataUser.avatar = data.data.images[0].image;
                            $scope.dataUser.originImage = data.data.originImages[0].image;
                            $('#modal-change-avatar').hide('modal-dialog');
                            selector[0].value = null;
                            $scope.$apply();
                            $(".jcrop-holder").remove();
                            $("#img-temp-avatar").remove();
                        } else {
                            alertSmallBox("Upload ảnh không thành công!")
                        }
                    },
                    error: function (data) {
                        $("body").removeClass("loading");
                    }
                });
            } else {
                alertSmallBox("Vui lòng chọn ảnh cần cắt", "error");
            }
        };
        $scope.register = function () {
            if ($("#form-register").valid()) {
                httpRequest.post("/user/register"
                    , {
                        device: $scope.device
                        , user: $scope.dataUser
                    }
                    , function (data) {
                        if (data.success) {
                            alertSmallBox(data.data, success);
                            debugger;
                            setTimeout(function () {
                                location.href = "/";
                            }, 2000)
                        } else {
                            $scope.dataUser.password = "";
                            $("#txtConfirmPassword").val('');
                            alertSmallBox(data.message, error);
                        }
                    }, function (data) {
                    }, true);
            }
        }
        $scope.showPopupChangeAvatar = function () {
            $('#modal-change-avatar').show('modal-dialog');
            $(".jcrop-holder").remove();
            $("#img-temp-avatar").remove();
        };
        $scope.closedPopupChangeAvatar = function () {
            $scope.dataUser.thumbnailAvatarUrl = "";
            $scope.dataUser.avatarUrl = "";
            $scope.dataUser.originImage = "";
            $scope.dataUser.thumbnail = "";
            $scope.dataUser.avatar = "";
            $('#modal-change-avatar').hide('modal-dialog');
        };
    })
</script>
<style>
    .btn-primary {
        color: #fff;
        background-color: #0d8150;
        border-color: #0c6740;
    }

    .btn-primary:hover, .btn-primary:active, .btn-primary:focus {
        background: #0d8150;
    }

    .smart-form {
        margin: 0;
        outline: 0;
        color: #666;
        position: relative;
    }

    label.error {
        text-transform: none;
        color: red;
    }

    .input-text{
        text-align: left;
    }

    .smart-form .input {
        position: relative;
        display: block;
        font-weight: 400;
    }

    .smart-form .input-file .button {
        position: absolute;
        top: 4px;
        right: 4px;
        float: none;
        height: 22px;
        margin: 0;
        padding: 0 14px;
        font-size: 13px;
        line-height: 22px;
    }

    .smart-form .input-file .button input {
        position: absolute;
        top: 0;
        right: 0;
        padding: 0;
        font-size: 30px;
        cursor: pointer;
        opacity: 0;
    }

    .smart-form .button {
        background-color: #0d8150;
        opacity: .8;
    }

    .smart-form .input input, .smart-form .select select, .smart-form .textarea textarea {
        display: block;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        width: 100%;
        height: 32px;
        line-height: 32px;
        padding: 5px 10px;
        outline: 0;
        border-width: 1px;
        border-style: solid;
        border-radius: 0;
        background: #fff;
        font: 13px/16px 'Open Sans', Helvetica, Arial, sans-serif;
        color: #404040;
        appearance: normal;
        -moz-appearance: none;
        -webkit-appearance: none;
    }

    .smart-form .col {
        float: left;
        min-height: 1px;
        padding-right: 15px;
        padding-left: 15px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
    }

    .smart-form fieldset {
        display: block;
        padding: 25px 14px 5px;
        border: none;
        background: rgba(255, 255, 255, .9);
        position: relative;
    }

    .smart-form .button {
        float: right;
        height: 31px;
        overflow: hidden;
        margin: 10px 0 0 5px;
        padding: 0 25px;
        outline: 0;
        border: 0;
        font: 300 15px/31px 'Open Sans', Helvetica, Arial, sans-serif;
        text-decoration: none;
        color: #fff;
        cursor: pointer;
    }

    .smart-form section {
        margin-bottom: 15px;
        position: relative;
    }

    .smart-form footer .btn {
        float: right;
        margin: 10px 0 0 5px;
        padding: 0 22px;
        font: 300 15px/29px 'Open Sans', Helvetica, Arial, sans-serif;
        cursor: pointer;
    }

    .smart-form footer {
        min-height: 45px;
        display: block;
        padding: 7px 14px 15px;
        border-top: 1px solid rgba(0, 0, 0, .1);
        background: rgba(248, 248, 248, .9);
    }

    .smart-form .input input {
        border-color: #BDBDBD;
        transition: border-color .3s;
        -o-transition: border-color .3s;
        -ms-transition: border-color .3s;
        -moz-transition: border-color .3s;
        -webkit-transition: border-color .3s;
    }

    .smart-form *, .smart-form :after, .smart-form :before {
        margin: 0;
        padding: 0;
        box-sizing: content-box;
    }
</style>
