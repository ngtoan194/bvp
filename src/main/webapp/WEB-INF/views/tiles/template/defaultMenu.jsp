<%--
  Created by IntelliJ IDEA.
  User: Nguyen Toan
  Date: 1/23/2018
  Time: 11:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .before-init-menu {
        max-height: 60px !important;
        overflow: hidden
    }
</style>
<div class="menu-main text-uppercase notranslate" ng-controller="menuController">
    <div class="container">
        <nav class="awemenu-nav awemenu-business business-top before-init-menu">
            <div class="awemenu-container">
                <ul class="awemenu">
                    <li class="awemenu-item" id="menu-home" ng-repeat="item in menu | orderBy:'menu.index'"
                        ng-repeat-done="initMenu()">
                        <a href="{{item.menu.href}}" title="{{item.menu.name | translate}}">
                            {{item.menu.name | translate}}
                        </a>
                        <ul class="awemenu-submenu awemenu-megamenu" ng-if="item.menu && item.menus.length>0">
                            <li>
                                <div class="awemenu-inner">
                                    <div class="megamenu-item" ng-repeat="item2 in item.menus  | orderBy:'menu.index'">
                                        <div class="title-megamenu">
                                            <a href="{{checkHref(item2, item)}}" class="submenu2-title"
                                               title="{{item2.menu.name | translate}}">
                                                {{item2.menu.name | translate}}
                                            </a>
                                        </div>
                                        <ul class="list-unstyled">
                                            <li ng-repeat="item3 in item2.menus  | orderBy:'index'">
                                                <a href="{{hrefSubmenu(item3, item2, item)}}"
                                                   title="{{item3.name | translate}}">
                                                    {{item3.name | translate}}
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>
<script>
    ngApp.controller('menuController', function ($scope, httpRequest) {
        $scope.initMenu1 = function () {
            if ($('.business-top').length) {
                $('.business-top').aweMenu({
                    trigger: 'hover',
                    showArrow: true,
                    hoverTime: 0,
                    sticky: false,
                    responsiveWidth: 1200,
                    customMenuBar: '<i class="fa fa-bars"></i>',
                    mobileType: 'outleft',
                    mobileTrigger: 'toggle',
                    customCloseButton: '<i class="fa fa-close"></i>',
                    defaultDesktopAnimation: 'fadeup',
                });
            }
            if ($(window).width() > 1200) {

                $('.awemenu-item ').each(function () {
                    var container = $(this).find('.awemenu-megamenu');
                    var container_width = container.width() - 40;
                    var item_count = $(this).find('.megamenu-item').size();


                    var width_item = container.width() / item_count;

                    var data_value = 25 * item_count + '%';
                    /*var data_width_container = container.data('width'); //getter
                    container.data('width',data_value + '%'); //setter*/
                    var num = +container.attr("data-width");
                    num = data_value;
                    container.attr('data-width', num);

                    if (item_count >= 5) {
                        $(this).find('.megamenu-item').css("min-width", '265px');
                    } else {
                        $(this).find('.megamenu-item').css("width", width_item);
                    }
                    console.log(width_item);
                });

            }
        }
        $scope.initMenu = function () {
            setTimeout(function () {
                $scope.initMenu1();
                $(".awemenu-nav.before-init-menu").removeClass("before-init-menu");
            }, 800);
        }
        $scope.menu = [];
        $scope.dataSearch = {
            isActive: 1,
            webType: 1,
        }
        $scope._role = '${role}';
        $scope.dataSearch.role = 1;
        if ($scope._role == 1)
            $scope.dataSearch.role = 1;
        if ($scope._role == 2)
            $scope.dataSearch.role = 2;
        if ($scope._role == 4)
            $scope.dataSearch.role = 4;
        if (($scope._role & 4) == 4)
            $scope.dataSearch.role = 4;
        $scope.adminRole = '${adminRole}';
        $scope.loadAllMenu = function () {
            var url = "/menu/get-all?"
                + "role=" + $scope.dataSearch.role
                + "&isActive=" + $scope.dataSearch.isActive
                + "&webType=" + $scope.dataSearch.webType
            httpRequest.get(url
                , function (data) {
                    if (data.success) {
                        $scope.menu = data.data.menus;
                    }
                }, function (data) {
                });
        }
        $scope.loadAllMenu();
        $scope.checkHref = function (item2, item) {
            var url = "";
            if (item2 && item2.menu && item2.menu.href == "" && item2.menu.length > 0) {
                url = "#";
            } else if (item2 && item2.menu && item2.menu.href) {
                url = item2.menu.href;
                if (url.indexOf("?") == -1) {
                    url = url + "?menuId=" + item2.menu.id + "&menu=" + item.menu.name + "&menuName=" + item2.menu.name;
                } else {
                    url = url + "&menuId=" + item2.menu.id + "&menu=" + item.menu.name + "&menuName=" + item2.menu.name;
                }
            } else if (item2.menu && !item2.menu.href) {
                url = "/updating-page";
            } else if (!item2.menu) {
                url = "";
            }
            return url;
        }

        $scope.hrefSubmenu = function (item3, item2, item) {
            var url = "";
            if (item3 && item3.href) {
                url = item3.href;
                if (url.indexOf("?") == -1) {
                    url = url + "?menuId=" + item3.id + "&menu=" + item.menu.name + "&menu2=" + item2.menu.name + "&menuName=" + item3.name;
                } else {
                    url = url + "&menuId=" + item3.id + "&menu=" + item.menu.name + "&menu2=" + item2.menu.name + "&menuName=" + item3.name;
                }
            } else if (item3 && item3.href == "" || !item3.href) {
                url = "/updating-page";
            } else if (item3 == undefined || !item3) {
                url = "";
            }
            return url;
        }
    });
</script>