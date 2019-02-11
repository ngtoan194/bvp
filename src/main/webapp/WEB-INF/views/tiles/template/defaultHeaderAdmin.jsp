<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/09/18
  Time: 9:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-3 left_col" style="background: #05733e;">
    <div class="left_col scroll-view" style="background: #05733e;">
        <div class="navbar nav_title" style="border: 0; background: #05733e;">
            <a href="/" class="site_title">
                <%--<i class="fa fa-paw"></i>--%>
                <img style="width: 35px; margin-bottom: 5px;" src="/static/images/icon-lungs.png">
                <span>Bệnh viện Phổi!</span>
            </a>
        </div>

        <div class="clearfix"></div>

        <!-- menu profile quick info -->
        <div class="profile clearfix" style="background: #05733e;">
            <div class="profile_pic">
                <img ng-src="{{adminAvatarUrl}}" alt="..." class="img-circle profile_img">
            </div>
            <div class="profile_info">
                <span>Welcome,</span>
                <h2>${userFullName}</h2>
            </div>
        </div>
        <!-- /menu profile quick info -->

        <br/>

        <!-- sidebar menu -->
        <jsp:include page="/WEB-INF/views/tiles/template/defaultMenuAdmin.jsp"/>
        <!-- /sidebar menu -->

        <!-- /menu footer buttons -->
        <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="FullScreen" id="menu_toggle2">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
            </a>
        </div>
        <!-- /menu footer buttons -->
    </div>
</div>

<!-- top navigation -->
<div class="top_nav">
    <div class="nav_menu">
        <nav>
            <div class="nav toggle">
                <a id="menu_toggle" style="color: #05733e;"><i class="fa fa-bars"></i></a>
            </div>

            <ul class="nav navbar-nav navbar-right">
                <li class="">
                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown"
                       aria-expanded="false">
                        <img ng-src="{{adminAvatarUrl}}" alt="">${userFullName}
                        <span class=" fa fa-angle-down"></span>
                    </a>
                    <ul class="dropdown-menu dropdown-usermenu pull-right">
                        <li><a href="/tai-khoan/${userId}"> Profile</a></li>
                        <li>
                            <a href="javascript:;">
                                <span class="badge bg-red pull-right">50%</span>
                                <span>Settings</span>
                            </a>
                        </li>
                        <li><a href="javascript:;">Help</a></li>
                        <li><a href="/logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                    </ul>
                </li>

                <li role="presentation" class="dropdown">
                    <a style="height: 57px; width: 57px; padding: 20px;" href="javascript:;"
                       class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-envelope-o"></i>
                        <span class="badge bg-green"></span>
                        <%--<span class="badge bg-green">0</span>--%>
                    </a>
                    <%--<ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">--%>
                    <%--<li>--%>
                    <%--<a>--%>
                    <%--<span class="image"><img src="/static/images/img.jpg" alt="Profile Image" /></span>--%>
                    <%--<span>--%>
                    <%--<span>John Smith</span>--%>
                    <%--<span class="time">3 mins ago</span>--%>
                    <%--</span>--%>
                    <%--<span class="message">--%>
                    <%--Film festivals used to be do-or-die moments for movie makers. They were where...--%>
                    <%--</span>--%>
                    <%--</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<a>--%>
                    <%--<span class="image"><img src="/static/images/img.jpg" alt="Profile Image" /></span>--%>
                    <%--<span>--%>
                    <%--<span>John Smith</span>--%>
                    <%--<span class="time">3 mins ago</span>--%>
                    <%--</span>--%>
                    <%--<span class="message">--%>
                    <%--Film festivals used to be do-or-die moments for movie makers. They were where...--%>
                    <%--</span>--%>
                    <%--</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<a>--%>
                    <%--<span class="image"><img src="/static/images/img.jpg" alt="Profile Image" /></span>--%>
                    <%--<span>--%>
                    <%--<span>John Smith</span>--%>
                    <%--<span class="time">3 mins ago</span>--%>
                    <%--</span>--%>
                    <%--<span class="message">--%>
                    <%--Film festivals used to be do-or-die moments for movie makers. They were where...--%>
                    <%--</span>--%>
                    <%--</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<a>--%>
                    <%--<span class="image"><img src="/static/images/img.jpg" alt="Profile Image" /></span>--%>
                    <%--<span>--%>
                    <%--<span>John Smith</span>--%>
                    <%--<span class="time">3 mins ago</span>--%>
                    <%--</span>--%>
                    <%--<span class="message">--%>
                    <%--Film festivals used to be do-or-die moments for movie makers. They were where...--%>
                    <%--</span>--%>
                    <%--</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<div class="text-center">--%>
                    <%--<a>--%>
                    <%--<strong>See All Alerts</strong>--%>
                    <%--<i class="fa fa-angle-right"></i>--%>
                    <%--</a>--%>
                    <%--</div>--%>
                    <%--</li>--%>
                    <%--</ul>--%>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- /top navigation -->