<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 11/15/18
  Time: 10:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    input.remove-videodetector {
        display: none;
    }
</style>
<div class="main-page" ng-controller="pageIntroduceController">
    <div class="clinic">
        <div class="banner-clinnic" style="background-image: url({{pageDetail.bannerImage.absoluteUrl()}});"></div>
        <div class="leader">
            <div class="info-common">
                <div class="container">
                    <h4 class="title-left"
                        style="background: linear-gradient(55deg, {{pageDetail.color2}}, {{pageDetail.color3}}); border-left: 3px solid {{pageDetail.color3}};color: {{pageDetail.color}};">
                        Thông tin
                    </h4>
                    <div class="info-common-item">
                        <div ng-repeat="item in commonInfo">
                            <h4 class="info-common-title" style="color: {{pageDetail.reward}};">
                                {{item.header.name}}
                            </h4>
                            <div class="header-content">
                                <p ng-bind-html="asHtml(item.header.content)"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('pageIntroduceController', function ($scope, httpRequest, $sce) {
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

        $scope.asHtml = function (html) {
            var div = $("<div>");
            div.append(html);
            var iframe = div.find("iframe");
            if (iframe) {
                iframe.attr("allowfullscreen", "allowfullscreen");
                iframe.attr("mozallowfullscreen", "mozallowfullscreen");
                iframe.attr("msallowfullscreen", "msallowfullscreen");
                iframe.attr("oallowfullscreen", "oallowfullscreen");
                iframe.attr("webkitallowfullscreen", "webkitallowfullscreen");
                iframe.attr("width", 420);
                iframe.attr("height", 315);
            }
            return $sce.trustAsHtml(div.html());
        }

    });
</script>
<script>
    jQuery(document).ready(function () {
        $("#menu-introduce").addClass("awemenu-active-trail")
    });
</script>

