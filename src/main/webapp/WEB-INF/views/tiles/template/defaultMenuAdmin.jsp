<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/09/18
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- sidebar menu -->
<div id="sidebar-menu" class="main_menu_side hidden-print main_menu" style="background: #05733e;"
     ng-controller="menuAdminController">
    <div class="menu_section" ng-if="isAdmin">
        <%--<h3>General</h3>--%>
        <ul class="nav side-menu">
            <li ng-if="checkRole(8)">
                <a href="/admin/quan-ly-menu"><i class="fa fa-bars"></i>
                    Menu
                </a>
            </li>
            <li ng-if="checkRole(8)">
                <a><i class="fa fa-sliders"></i> Slide <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="/admin/slide-item">Slide item</a></li>
                    <li><a href="/admin/slide"> Slide</a></li>
                    <li><a href="/admin/slide-place"> Slide place</a></li>
                </ul>
            </li>
            <li ng-if="checkRole(1)">
                <a><i class="fa fa-users"></i> Tài khoản <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="/admin/nguoi-dung">Người dùng</a></li>
                    <li><a href="/admin/bac-si">Bác sĩ</a></li>
                    <li><a href="/admin/chuc-vu">Chức vụ</a></li>
                    <li ng-if="isSuperAdmin"><a href="/admin/quan-ly/admin">Admin</a></li>
                </ul>
            </li>
            <li ng-if="checkRole(4)">
                <a href="/admin/tu-khoa"><i class="fa fa-tags"></i>
                    Từ khóa
                </a>
            </li>
            <li ng-if="checkRole(2)">
                <a><i class="fa fa-newspaper-o"></i> Tin tức <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                    <li><a href="/admin/tin-tuc">Quản lý tin tức</a></li>
                    <li><a href="/admin/tin-tuc-hoi-lao"> Danh sách tin hội Lao</a></li>
                </ul>
            </li>
            <li ng-if="checkRole(8)">
                <a href="/admin/page"><i class="fa fa-file-text-o"></i>
                    Page
                </a>
            </li>
            <li ng-if="checkRole(128)">
                <a href="/admin/thu-vien-anh"><i class="fa fa-picture-o"></i>
                    Thư viện ảnh
                </a>
            </li>
            <li ng-if="checkRole(128)">
                <a href="/admin/tai-lieu"><i class="fa fa-book"></i>
                    Tài liệu
                </a>
            </li>
            <li ng-if="checkRole(2)">
                <a href="/admin/goc-tri-an"><i class="fa fa-user"></i>
                    Góc tri ân
                </a>
            </li>
            <li ng-if="checkRole(64)">
                <a href="/admin/khoa-hoc"><i class="fa fa-book"></i>
                    Khóa học
                </a>
            </li>
            <li ng-if="checkRole(128)">
                <a href="/admin/video"><i class="fa fa-youtube"></i>
                    Video
                </a>
            </li>
            <li ng-if="checkRole(256)">
                <a href="/admin/giao-luu-truc-tuyen"><i class="fa fa-comments"></i>
                    Giao lưu trực tuyến
                </a>
            </li>
            <li ng-if="checkRole(512)">
                <a><i class="fa fa-home"></i>
                    Quản lý trang chủ <span class="fa fa-chevron-down"></span>
                </a>
                <ul class="nav child_menu">
                    <li><a href="/admin/web-link">Web link</a></li>
                    <li><a href="/admin/dich-vu-tai-benh-vien">Dịch vụ tại bệnh viện</a></li>
                </ul>
            </li>
            <%--<li><a><i class="fa fa-edit"></i> Mẫu <span class="fa fa-chevron-down"></span></a>--%>
            <%--<ul class="nav child_menu">--%>
            <%--<li><a href="/admin/form">Form</a></li>--%>
            <%--<li><a href="/admin/table">Tables</a></li>--%>
            <%--</ul>--%>
            <%--</li>--%>
        </ul>
    </div>
    <div class="menu_section" ng-if="isAdmin">
        <h3>Tiện ích</h3>
        <ul class="nav side-menu">
            <li><a href="/admin/dich-song-ngu"><i class="fa fa-globe"></i> Dịch song ngữ</a></li>
        </ul>
    </div>

</div>
<!-- /sidebar menu -->
<script>
    ngApp.controller('menuAdminController', function ($scope, $http, $sce, fileManager) {
        $scope.isAdmin = ${isAdmin};
        $scope.role = ${role};
        $scope.adminRole = ${adminRole};
        $scope.isSuperAdmin = false;
        if ($scope.role == 156) {
            $scope.isSuperAdmin = true;
        }
        $scope.roleAdminBvp = [
            {role: 1, name: "Tài khoản"},
            {role: 2, name: "Tin tức, Góc tri ân"},
            {role: 4, name: "Tư vấn online, Từ khóa"},
            {role: 8, name: "Menu. Slide, Page"},
            {role: 16, name: "Quảng cáo"},
            {role: 32, name: "Đặt khám,Xét Nghiệm",},
            {role: 64, name: "Tài liệu, Khóa học"},
            {role: 128, name: "Thư viện Ảnh, Video"},
            {role: 256, name: "Giao lưu trực tuyến"},
            {role: 512, name: "Trang chủ"},
        ];
        $scope.checkRole = function (roleMenu) {
            if (($scope.adminRole & roleMenu) == roleMenu) {
                return true;
            } else {
                return false;
            }
        }
    });
</script>