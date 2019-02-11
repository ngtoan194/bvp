<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 11/15/18
  Time: 10:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-page" ng-controller="pageAlbumDetailController">
    <div class="album-page">
        <div class="image-album-list popupgallery">
            <div class="container">
                <div class="title-page ">
                    <h2 class="color-black"><span class="color-green">ALBUM ẢNH: </span>{{albumDetail.name}}</h2>
                    <p>Ngày đăng: {{albumDetail.createdDate.toDateObject('-').format("HH:mm, dd-MM-yyyy")}}</p>
                    <p>Số lượng: {{listImages.length}} ảnh</p>
                </div>
                <div class="row">
                    <div class="tz-gallery">
                        <div style="margin-bottom: 25px; text-align: center;" class="col-md-3 col-sm-6 col-xs-12"
                             ng-repeat="img in listImages | limitTo:numLimit">
                            <a href="{{img.absoluteUrl()}}" style="cursor: pointer;">
                                <img style="height: 150px; object-fit: cover;" ng-src="{{img.absoluteUrl()}}" alt="">
                            </a>
                        </div>
                    </div>
                </div>
                <div class="action" ng-hide="albumDetail.images.length <= numLimit">
                    <a ng-click="readMore()" class="btn btn-primary btn-more-image">Xem thêm</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('pageAlbumDetailController', function ($scope) {
        $scope.listImages = [];
        $scope.albumDetail = ${dataAlbumDetail};
        if ($scope.albumDetail.images) {
            var dataImages = JSON.parse($scope.albumDetail.images);
            var images = $scope.albumDetail.images.split(",");
            for (var i = 0; i < dataImages.length; i++) {
                $scope.listImages.push(dataImages[i])
            }
        }
        $scope.numLimit = 12;
        $scope.readMore = function () {
            $scope.numLimit = $scope.numLimit + 12;
        }
        $scope.runBaguetteBox = function () {
            setTimeout(function () {
                baguetteBox.run('.tz-gallery');
            }, 500)
        }
        $scope.runBaguetteBox();
        $scope.initImg = function () {
            if ($('.popupgallery').length) {
                $('.quick-view').magnificPopup({
                    type: 'image',
                    closeOnContentClick: true,
                    image: {
                        verticalFit: true
                    },
                    gallery: {
                        // options for gallery
                        enabled: true
                    }
                });
            }
        }
    });
</script>
<script>
    jQuery(document).ready(function () {
        $("#menu-album").addClass("awemenu-active-trail")
    });
</script>
