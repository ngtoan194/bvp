<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/12/18
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="other-login">
    <p class="title-other-login">Hoặc đăng nhập bằng</p>
    <div class="link-other-login">
        <a href="javascript:void(0)" class="icon-other facebook" id="btnLoginFb"><i class="fa fa-facebook"></i>facebook</a>
        <a href="javascript:void(0)" class="icon-other mail" id="btnLoginGoogle"><i class="fa fa-envelope-o"></i>Gmail</a>
    </div>
</div>

<script src="https://apis.google.com/js/client:platform.js?onload=start" async defer>
</script>
<script>
    function start() {
        gapi.load('auth2', function () {
            auth2 = gapi.auth2.init({
                client_id: '612436577188-ng179ll9htkl0agf9tbivdm02u37vori.apps.googleusercontent.com',
                // Scopes to request in addition to 'profile' and 'email'
                //scope: 'additional_scope'
            });
        });
    }
</script>
<script>
    $(document).ready(function () {
        $('#btnLoginGoogle').click(function () {
            // signInCallback defined in step 6.
            auth2.grantOfflineAccess().then(signInCallback);
        });

        $('#btnLoginFb').click(function () {
            var returnUrl = common.getQueryStringHref("returnUrl");
            location.href = "/user/login/fb?returnUrl=" + returnUrl;
        });
    })
</script>

<script>
    function apiClientLoaded() {
        gapi.client.plus.people.get({userId: 'me'}).execute(handleEmailResponse);
    }

    function handleEmailResponse(resp) {
        if (resp) {
            var _email = "";
            var email = resp.emails;
            if (email.length > 0)
                _email = email[0].value;
            AJAXFunction.CallAjax("POST", "/user/login", "gg", {
                displayName: resp.displayName,
                id: resp.id,
                email: _email
            }, function (data) {
                if (data.success) {
                    alertSmallBox("Đăng nhập thành công", "success");
                    var returnUrl = common.getQueryStringHref("returnUrl");
                    if (returnUrl)
                        location.href = returnUrl;
                    else
                        location.href = "/";
                }
                else {
                    alertSmallBox(data.message, "error");
                }
            });
        } else {
            alertSmallBox("Đăng nhập tài khoản google không thành công", "error");
        }
    }

    function signInCallback(authResult) {
        if (authResult['code']) {
            gapi.client.load('plus', 'v1', apiClientLoaded);
        } else {
            alertSmallBox("Đăng nhập tài khoản google không thành công", "error");
        }
    }
</script>