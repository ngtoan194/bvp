<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/17/18
  Time: 8:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<div class="main-page acount-page form-dat-kham" ng-controller="userInfoController" id="user-info">
    <div class="container">
        <form id="form-my-profile" novalidate="novalidate" ng-validate="validationUpdateUser">
            <div class="input-item info-personal">
                <label class="label">Thông tin cá nhân</label>
                <div class="edit-info">
                    <div class="immages-avartar">
                        <div class="prev-image">
                            <img ng-if="!user.originImage"
                                 id="images" class="preview-img" alt="your image" onerror="ImgError(this);"
                                 ng-click="${isMyProfile?'showPopupChangeAvatar()':''}"
                                 style="cursor: ${isMyProfile?'pointer':''};" src="/static/images/Profile1.png">
                            <img ng-if="user.originImage"
                                 id="images" class="preview-img" alt="your image" onerror="ImgError(this);"
                                 ng-click="${isMyProfile?'showPopupChangeAvatar()':''}"
                                 style="cursor: ${isMyProfile?'pointer':''};"
                                 ng-src="{{user.thumbnail.absoluteUrl('/static/images/Profile1.png')}}">
                        </div>
                    </div>
                    <a class="btn-primary icon edit-mail btn"
                       ng-if="isMyProfile && ${socialType} == 0"
                       ng-click="showPopupChangeEmail()">
                        <i class="fa fa-envelope"></i>Đổi email
                    </a>
                    <a class="btn-primary icon edit-password btn"
                       ng-if="isMyProfile && ${socialType} == 0"
                       ng-click="showPopupChangePassword()">
                        <i class="fa fa-key"></i>Đổi mật khẩu
                    </a>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <div class="input-item">
                        <label class="label">Email</label>
                        <div class="input-text">
                            <i class="fa fa-envelope icon"></i>
                            <input type="text" name="email" placeholder="Nhập email"
                                   ng-model="user.email" disabled
                                   class="form-control" value="cấp cứu">
                        </div>
                    </div>
                    <div class="input-item">
                        <label class="label">Họ tên</label>
                        <div class="input-text">
                            <i class="fa fa-user icon"></i>
                            <input type="text" name="fullname" placeholder="Nhập họ và tên" ng-model="user.name" id="fullname"
                                   class="form-control" ${isDoctor?'disabled':''} ${isMyProfile?'':'readonly'}>
                        </div>
                    </div>
                    <div class="input-item" ng-if="user.role==2">
                        <label class="label">Chuyên khoa</label>
                        <div class="input-text">
                            <i class="fa fa-gavel icon"></i>
                            <input type="text" name="department" placeholder="Chuyên khoa"
                                   ng-model="dataDepartment.name"
                                   disabled class="form-control">
                        </div>
                    </div>
                    <div class="input-item" ng-if="user.role==2">
                        <label class="label">Chức danh</label>
                        <div class="input-text">
                            <i class="fa fa-gavel icon"></i>
                            <input type="text" name="jobTitle" disabled class="form-control" id="jobTitle"
                                   placeholder="Chức danh" ng-value="getPosition(user,dataDepartment)">
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-12" ng-hide="user.role==1">
                    <div class="input-item">
                        <label class="label">Giới tính</label>
                        <div class="input-text">
                            <select name="gender" class="form-control"
                                    ng-model="user.gender" ${isMyProfile?'':'disabled'}>
                                <option ng-value="0">Nữ</option>
                                <option ng-value="1">Nam</option>
                            </select>
                        </div>
                    </div>
                    <div class="input-item">
                        <label class="label">Ngày sinh</label>
                        <div class="input-text">
                            <div class="input-group" id="dob-time-picker">
                                <input type="text" name="dob" placeholder="Nhập ngày sinh"
                                       ng-model="user.birthday" ${isMyProfile?'':'readonly'} ${isMyProfile?'':'disabled'}
                                       class="form-control" id="dob" placeholder="Chọn ngày sinh"/>
                                <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                            </div>
                            <script type="text/javascript">
                                setTimeout(function () {
                                    $('#dob-time-picker').datetimepicker({
                                        format: 'DD-MM-YYYY',
                                        allowInputToggle: true
                                    });
                                }, 1000)
                            </script>
                        </div>
                    </div>
                    <div class="input-item" ng-if="!${isLogin} || user.role != 4">
                        <label class="label">Địa chỉ</label>
                        <div class="input-text">
                            <i class="fa fa-map-marker icon"></i>
                            <input type="text" name="address" placeholder="Nhập địa chỉ" id="address"
                                   ng-model="user.address" ${isMyProfile?'':'readonly'} ${isMyProfile?'':'disabled'}
                                   class="form-control">
                        </div>
                    </div>
                    <div class="input-item" ng-if="user.role != 4">
                        <label class="label">Số điện thoại</label>
                        <div class="input-text">
                            <i class="fa fa-phone icon"></i>
                            <input type="text" name="phone" placeholder="Nhập số điện thoại" id="phone"
                                   ng-model="user.phone" ${isMyProfile?'':'readonly'} ${isMyProfile?'':'disabled'}
                                   class="form-control">
                        </div>
                    </div>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12" ng-if="user.role==2 ">
                    <div class="input-item">
                        <label class="label">Giới thiệu</label>
                        <div class="input-text">
                            <i style="height: 40px;" class="fa fa-info icon"></i>
                            <textarea style="width: 100%" id="noteValue" rows="5"
                                      ng-model="user.introduction" ${isMyProfile?'':'readonly'}></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div class="action" ng-if="isMyProfile">
                <a class="btn-update btn-primary btn" ng-click="updateProfile()" id="btnUpdate">Cập nhật</a>
            </div>
        </form>
    </div>

    <div class="modal fade in" id="modal-change-email" tabindex="-1" role="dialog" style="display: none;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" ng-click="closedPopupChangeEmail()" class="close" data-dismiss="modal">×
                    </button>
                    <h4 class="modal-title"> Đổi email</h4>
                </div>
                <form id="form-change-email" class="smart-form" novalidate="novalidate"
                      style="padding-left: 10px; padding-right: 10px;" ng-validate="validationEmail">
                    <fieldset>
                        <section>
                            <label class="form-label" style="margin-bottom: 10px">Email mới</label>
                            <label class="input">
                                <input type="email" name="new_email" ng-model="newEmail" placeholder="Nhập email mới"
                                       id="new_email" autofocus>
                            </label>
                        </section>
                    </fieldset>
                    <fieldset>
                        <section>
                            <label class="form-label" style="margin-bottom: 10px">Password</label>
                            <label class="input">
                                <input type="password" name="password" ng-model="password" placeholder="Nhập mật khẩu"
                                       id="password">
                            </label>
                        </section>
                    </fieldset>
                    <footer>
                        <button type="button" class="btn btn-success" style="background-color: #058f52;" id="btnUpdate5"
                                ng-click="updateEmail()">
                            Cập nhật
                        </button>
                        <button type="button" class="btn btn-success" style="background-color: #058f52;"
                                ng-click="closedPopupChangeEmail()">
                            Hủy
                        </button>
                    </footer>
                </form>
            </div>
        </div>
    </div>
    <div class="modal fade in" id="modal-change-password" tabindex="-1" role="dialog"
         style="display: none; padding-left: 17px;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" ng-click="closedPopupChangePassword()" class="close" data-dismiss="modal">×
                    </button>
                    <h4 class="modal-title"> Đổi mật khẩu</h4>
                </div>
                <form id="form-change-password" class="smart-form" novalidate="novalidate"
                      style="padding-left: 10px; padding-right: 10px;" ng-validate="validationPassword">
                    <fieldset>
                        <section>
                            <label class="form-label" style="margin-bottom: 10px">Mật khẩu cũ</label>
                            <label class="input">
                                <input type="password" name="old_password" placeholder="Mật khẩu cũ"
                                       ng-model="oldPassword" id="old_password" autofocus>
                            </label>
                        </section>
                        <section>
                            <label class="form-label" style="margin-bottom: 10px; margin-top: 10px">Mật khẩu mới</label>
                            <label class="input">
                                <input type="password" name="new_password" placeholder="Mật khẩu mới"
                                       ng-model="newPassword" id="new_password">
                            </label>
                        </section>
                        <section>
                            <label class="form-label" style="margin-bottom: 10px; margin-top: 10px">Xác nhận mật khẩu
                                mới</label>
                            <label class="input">
                                <input type="password" name="confirm_new_password" placeholder="Xác nhận mật khẩu mới"
                                       id="confirm_new_password">
                            </label>
                        </section>

                    </fieldset>
                    <footer>
                        <button type="button" class="btn btn-success" style="background-color: #058f52;" id="btnUpdate6"
                                ng-click="changePassword()">
                            Cập nhật
                        </button>
                        <button type="button" class="btn btn-success" style="background-color: #058f52;"
                                ng-click="closedPopupChangePassword()">
                            Hủy
                        </button>
                    </footer>
                </form>
            </div>
        </div>
    </div>
    <div class="modal fade in" id="modal-change-avatar" data-backdrop="static" tabindex="-1" role="dialog"
         style="display: none; padding-left: 19px;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" ng-click="closedPopupChangeAvatar()" class="close" data-dismiss="modal">×
                    </button>
                    <h4 class="modal-title"> Cập nhật ảnh đại diện</h4>
                </div>
                <form id="form-select-avatar" novalidate="novalidate" class="smart-form no-padding">
                    <fieldset style="max-height:450px; overflow-y:auto">
                        <section class="col col-sm-12 col-lg-12 col-md-12 col-xs-12  no-padding">
                            <label class="input input-file" style="margin-top: 10px; ">
                                <div class="button" style="margin-top: 1px;">
                                    <input type="file" id="select-file-image" accept="image/x-png,image/gif,image/jpeg"
                                           name="file" ng-file-change="imgAvatar.changeFile"
                                           file-input-id="{{user.id}}">Chọn
                                </div>
                                <input type="text" style="padding-right: 80px !important;" id="text-file-image-name"
                                       placeholder="Chọn file ảnh" readonly="">
                            </label>
                            <img style="max-width: 100%; margin-top: 10px; display: none; visibility: hidden; width: 551px; height: 413px;"
                                 id="img-temp-avatar"
                                 ng-src="{{user.thumbnail.absoluteUrl('/static/images/Profile1.png')}}">
                            <%--<img ng-if="uploading"--%>
                            <%--src="/static/images/loading/loading2.gif"--%>
                            <%--style="width: 69px; position: absolute; top: 65%; left: 44%;"/>--%>
                        </section>
                    </fieldset>
                    <footer>
                        <label class="btn btn-success" style="background-color: #058f52;"
                               ng-click="uploadAvatarAndUpdateProfile()" data-createnew="True"
                               data-image="new-new-ads" data-id="">
                            <span>Cập nhật</span>
                        </label>
                        <label class="btn btn-success" style="background-color: #058f52;"
                               ng-click="closedPopupChangeAvatar()" data-createnew="True"
                               data-image="new-new-ads" data-id="">
                            <span>Hủy</span>
                        </label>
                    </footer>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    ngApp.controller('userInfoController', function ($scope, httpRequest, fileManager) {
        $("#new_email, #password").keyup(function(event) {
            if (event.keyCode === 13) {
                $("#btnUpdate5").click();
            }
        });
        $("#old_password, #confirm_new_password").keyup(function(event) {
            if (event.keyCode === 13) {
                $("#btnUpdate6").click();
            }
        });
        $("#fullname, #jobTitle, #address, #phone").keyup(function(event) {
            if (event.keyCode === 13) {
                $("#btnUpdate").click();
            }
        });
        $scope.isMyProfile = ${isMyProfile};
        $scope.user = ${dataUserInfo};
        $scope.dataDepartment = ${dataDepartment};
        $scope.newEmail = "";
        $scope.oldPassword = "";
        $scope.newPassword = "";
        debugger
        if ($scope.user.dob) {
            $scope.user.birthday = $scope.user.dob.toDateObject('-').format("dd-MM-yyyy");
        }
//        setTimeout(function () {
//            if ($scope.user.gender == 1) {
//                $("#rdGenderMale")[0].checked = true;
//            }
//            if ($scope.user.gender == 0) {
//                $("#rdGenderFemale")[0].checked = true;
//            }
//        }, 1000)
        $("#dob").checkDate({
            callback: function () {
            },
        });
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
            chooseFile: function (id) {
                $("[file-input-id='" + id + "']").trigger("click");
            },
            changeFile: function () {
                var selector = $(event.target);
                var fileName = selector[0].value.replace("C:\\fakepath\\", "").toLocaleLowerCase();
                if (common.endWith(fileName, ".jpg") ||
                    common.endWith(fileName, ".png") ||
                    common.endWith(fileName, ".gif")) {

                    if ($scope.imgAvatar.jcrop_api != undefined) {
                        $scope.imgAvatar.jcrop_api.destroy();
                    }
                    $(".jcrop-holder").remove();
                    $("#img-temp-avatar").remove();

                    var filePath = URL.createObjectURL(selector[0].files[0]);
                    $scope.user.thumbnail = filePath;
                    $scope.user.avatarUrl = filePath;

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
        $scope.uploadAvatarAndUpdateProfile = function () {
            var selector = $("[file-input-id='" + $scope.user.id + "']");
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
                            $scope.user.thumbnail = data.data.images[0].thumbnail;
                            $scope.user.avatar = data.data.images[0].image;
                            $scope.user.originImage = data.data.originImages[0].image;
                            $scope.closedPopupChangeAvatar();
                            $scope.updateProfile();

                        } else {
                            alertSmallBox("Cập nhật ảnh không thành công!")
                        }
                    },
                    error: function (data) {
                        $("body").removeClass("loading");
                    }
                });
            } else {
                $scope.updateProfile();
            }
        }
        $scope.updateProfile = function () {
            if ($("#form-my-profile").valid()) {
                if ($("#dob").parent().data('DateTimePicker').date()) {
                    $scope.user.dob = $("#dob").parent().data('DateTimePicker').date()._d.format("yyyy-MM-dd");
                }
                httpRequest.post("/user/update/" + $scope.user.id
                    , {
                        user: {
                            avatar: $scope.user.avatar,
                            email: $scope.user.email,
                            name: $scope.user.name,
                            thumbnail: $scope.user.thumbnail,
                            originImage: $scope.user.originImage,
                            job: $scope.user.job,
                            address: $scope.user.address,
                            company: $scope.user.company,
                            gender: $scope.user.gender,
                            dob: $scope.user.dob,
                            phone: $scope.user.phone,
                            introduction: $scope.user.introduction
                        }
                    }
                    , function (data) {
                        if (data.success) {
                            alertSmallBox(data.data, success);
                        } else {
                            alertSmallBox(data.message, error);
                        }
                    }, function (data) {
                    }, true);
            }
        }
        $scope.updateEmail = function () {
            if ($("#form-change-email").valid()) {
                httpRequest.post("/user/update-email/" + $scope.user.id
                    , {email: $scope.newEmail, password: $scope.password, webType: 1}
                    , function (data) {
                        if (data.success) {
                            alertSmallBox(data.data, success);
                            $scope.closedPopupChangeEmail();
                            $scope.newEmail = "";
                            $scope.password = "";
                        } else {
                            alertSmallBox(data.message, error);
                        }
                    }, function (data) {
                    }, true);
            }
        }

        $scope.activeEmail = function (item) {
            debugger
            httpRequest.get("/user/confirm-email/" + item.token
                , function (data) {
                    if (data.success) {
                        var returnUrl = common.getQueryStringHref("returnUrl");
                        if (returnUrl) {
                            location.href = returnUrl;
                        } else {
                            location.href = "/";
                        }
                    } else {
                        alertSmallBox(data.message, error);
                    }
                }, function (data) {
                }, true);
        };

        $scope.changePassword = function () {
            if ($("#form-change-password").valid()) {
                httpRequest.post("/user/change-password/" + $scope.user.id
                    , {oldPassword: $scope.oldPassword, newPassword: $scope.newPassword}
                    , function (data) {
                        if (data.success) {
                            alertSmallBox(data.data, success);
                            $scope.closedPopupChangePassword();
                            $scope.oldPassword = "";
                            $scope.newPassword = "";
                            $('#confirm_new_password').val("");
                        } else {
                            alertSmallBox(data.message, error);
                            $scope.newPassword = "";
                            $('#confirm_new_password').val("");
                        }
                    }, function (data) {
                    }, true);
            }
        }
//        $.validator.addMethod("specialCharsEmail", function (email) {
//            var re = /^([a-zA-Z0-9]){4,}\@[a-zA-Z0-9][a-zA-Z0-9-]{1,61}[a-zA-Z0-9]\.[a-zA-Z]{2,}/g;
//            return re.test(email.toLowerCase());
//        }, "Vui lòng nhập đúng định dạng email!")
        $.validator.addMethod("isEmail", function (value, element) {
            if (value)
                return value.isEmail();
            return true;
        }, "Vui lòng nhập đúng định dạng email!")
        $.validator.addMethod("notEqualTo", function (value, element, param) {
            var notEqual = true;
            value = $.trim(value);
            for (i = 0; i < param.length; i++) {
                if (value == $.trim($(param[i]).val())) {
                    notEqual = false;
                }
            }
            return this.optional(element) || notEqual;
        }, "Mật khẩu cũ không được trùng với mật khẩu mới!")
        $scope.validationEmail = {
            rules: {
                new_email: {
                    required: true,
                    isEmail: true,
                    email: true
                },
                password: {
                    required: true
                }
            },
            messages: {
                new_email: {
                    required: "Vui lòng nhập nhập địa chỉ email mới!",
                    email: "Vui lòng nhập đúng định dạng email"
                },
                password: {
                    required: "Vui lòng nhập mật khẩu!"
                }
            }
        }
        $scope.validationPassword = {
            rules: {
                old_password: {
                    required: true,
                },
                new_password: {
                    required: true,
                    minlength: 6,
                    notEqualTo: ['#old_password']
                },
                confirm_new_password: {
                    required: true,
                    equalTo: "#new_password"
                }
            },
            messages: {
                old_password: {
                    required: "Vui lòng nhập mật khẩu hiện tại!",
                },
                new_password: {
                    required: "Vui lòng nhập mật khẩu mới!",
                    minlength: "Vui lòng nhập mật khẩu tối thiểu 6 ký tự!"
                },
                confirm_new_password: {
                    required: "Vui lòng nhập lại mật khẩu mới!",
                    equalTo: "Xác nhận mật khẩu không trùng khớp!"
                }
            }
        }
        $scope.validationUpdateUser = {
            rules: {
                fullname: {
                    required: true
                }
            },
            messages: {
                fullname: {
                    required: "Vui lòng nhập họ tên!"
                }
            }
        }
        $scope.showPopupChangeEmail = function () {
            $scope.newEmail = "";
            $scope.password = "";
            $('#modal-change-email').show('modal-dialog');
        }
        $scope.showPopupChangePassword = function () {
            $('#modal-change-password').show('modal-dialog');
        }
        $scope.showPopupChangeAvatar = function () {
            $('#modal-change-avatar').show('modal-dialog');
        }
        $scope.closedPopupChangeEmail = function () {
            $scope.newEmail = "";
            $scope.password = "";
            $('#modal-change-email').hide('modal-dialog');
            $("label.error").attr("style", "display:none;");

        }
        $scope.closedPopupChangePassword = function () {
            $scope.oldPassword = "";
            $scope.newPassword = "";
            $('#modal-change-password').hide('modal-dialog');
            $("label.error").attr("style", "display:none;");
        }
        $scope.closedPopupChangeAvatar = function () {
            $('#modal-change-avatar').hide('modal-dialog');
        }
    })
</script>
<style>
    .smart-form {
        margin: 0;
        outline: 0;
        color: #666;
        position: relative;
    }

    label.error {
        text-transform: none;
        color: red;
        font-size: 12px;
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
        background-color: #058f52;
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

    .modal-content {
        margin-top: 122px;
    }
</style>