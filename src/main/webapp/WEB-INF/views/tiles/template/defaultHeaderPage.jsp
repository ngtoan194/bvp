<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 3/26/2018
  Time: 10:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .before-init-menu {
        max-height: 60px !important;
        overflow: hidden
    }
</style>
<header class="header header-khoa-phong" ng-controller="menuPageController">
    <div class="link-web">
        <div class="container  notranslate">
            <ul class="link-web-destop">
                <li>
                    <a href="http://test.bvptw.org:8180/" class="active">
                        <span class="icon-icon-squarreicon"></span>{{'bệnh viện phổi trung ương' | translate }}
                    </a>
                </li>
                <li>
                    <a href="http://test.hoilao.bvptw.org:8281/">
                        <span class="icon-icon-squarreicon"></span>{{'hội lao và bệnh phổi việt nam' | translate }}
                    </a>
                </li>
                <li>
                    <a href="http://test.chonglao.bvptw.org:8481/">
                        <span class="icon-icon-squarreicon"></span>{{'chương trình chống lao quốc gia' | translate }}
                    </a>
                </li>
            </ul>

            <div class="btn-group link-web-mobile">
                <button type="button" class="form-control btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <a href="http://test.bvptw.org:8180/">{{'bệnh viện phổi trung ương' | translate }}</a>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li>
                        <a href="http://test.hoilao.bvptw.org:8281/">
                            {{ 'hội lao và bệnh phổi việt nam' | translate }}
                        </a>
                    </li>
                    <li>
                        <a href="http://test.chonglao.bvptw.org:8481/">
                            {{'chương trình chống lao quốc gia' | translate }}
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="header-top">
        <div class="container">
            <div class="title-clinic" ng-click="goHomePage()" style="cursor: pointer;">
              <span class="background-title-clinnic">
                {{firstCharacter}}
              </span>
                <h2 class="vietnamese-title">{{pageDetail.name}}</h2>
                <p class="english-title">{{pageDetail.nameE}}</p>
            </div>
        </div>
    </div>
    <div class="menu-main text-uppercase">
        <div class="container">
            <nav class="awemenu-nav awemenu-business business-top before-init-menu">
                <div class="awemenu-container">
                    <ul class="awemenu">
                        <li class="awemenu-item" id="menu-introduce">
                            <a href="/khoa-phong/gioi-thieu/{{pageDetail.linkAlias}}">Giới thiệu</a>
                        </li>
                        <li class="awemenu-item" id="menu-leader">
                            <a href="/khoa-phong/lanh-dao/{{pageDetail.linkAlias}}">Lãnh Đạo</a>
                        </li>
                        <li class="awemenu-item" id="menu-news">
                            <a href="/khoa-phong/hoat-dong/{{pageDetail.linkAlias}}?pageId={{pageDetail.id}}">hoạt
                                động</a>
                        </li>
                        <li class="awemenu-item" id="menu-album">
                            <a href="/khoa-phong/album/{{pageDetail.linkAlias}}?pageId={{pageDetail.id}}">thư viện
                                ảnh</a>
                        </li>
                        <li class="awemenu-item" ng-if="${isAdmin}">
                            <a href="/admin/quan-ly/sua-khoa-phong/{{pageDetail.id}}">Quản lý</a>
                        </li>
                        <li class="awemenu-item" ng-if="pageDetail.adminIds == '${userId}'">
                            <a href="/khoa-phong/sua-khoa-phong/{{pageDetail.linkAlias}}?pageId={{pageDetail.id}}">Quản lý</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</header>
<script>
    ngApp.controller('menuPageController', function ($scope, httpRequest, $sce) {
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
        $scope.initMenu();
        $scope.goHomePage = function () {
            location.href = '/khoa-phong/gioi-thieu/' + $scope.pageDetail.linkAlias;
        }
    });
</script>