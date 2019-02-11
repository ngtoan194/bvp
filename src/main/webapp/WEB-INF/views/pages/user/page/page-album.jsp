<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 11/15/18
  Time: 10:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-page" ng-controller="albumController">
    <div class="album-page">
        <div class="album-list">
            <div class="container">
                <div class="title-page ">
                    <h2 class="color-black">Thư viện Ảnh</h2>
                </div>
                <div class="album-inner">
                    <div class="head-album">

                        <div class="row">
                            <div class="col-md-8 col-sm-8 col-xs-12">
                                <%--<h2 class="title-sub-page">Các hình ảnh của Bệnh viện phổi trung ương</h2>--%>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <div class="sort">
                                    <label class="sort-label">Hiển thị theo :</label>
                                    <div class="input-text">
                                        <select ng-init="sortTime = false" ng-model="sortTime" class="form-control">
                                            <option ng-value="false">Thời gian gần nhất</option>
                                            <option ng-value="true">Thời gian cũ nhất</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4 col-sm-6 col-xs-12" ng-repeat="item in listAlbumPage | orderBy: 'createdDate':sortTime">
                            <div class="album-item">
                                <div class="album-image">
                                    <a href="/khoa-phong/album/chi-tiet/{{item.album.linkAlias}}?pageId={{pageId}}">
                                        <img style="object-fit: cover;" ng-src="{{item.album.imagePreview.absoluteUrl()}}" alt="">
                                    </a>
                                    <%--<div class="over-lay"></div>--%>
                                </div>
                                <div class="album-content">
                                    <span class="number-images">Số lượng:  {{checkTotalImages(item.album.images)}} ảnh</span>
                                    <p class="album-notice">Album</p>
                                    <a href="/khoa-phong/album/chi-tiet/{{item.album.linkAlias}}?pageId={{pageId}}" class="view-album">
                                        <img src="/images/quickview.png" alt="">
                                    </a>
                                    <h4 class="title-album">

                                        <a href="/khoa-phong/album/chi-tiet/{{item.album.linkAlias}}?pageId={{pageId}}">{{item.album.name}}</a>
                                    </h4>
                                    <span class="date-time-album">
                                        {{item.album.createdDate.toDateObject('-').format("HH:mm, dd-MM-yyyy")}}
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="action" ng-show="loading==true">
                        <a ng-click="readMore()" class="btn btn-primary btn-more-image">Đang tải</a>
                    </div>
                    <div class="action" ng-show="loading==false && !finish">
                        <a ng-click="readMore()" class="btn btn-primary btn-more-image">Xem thêm</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('albumController', function ($scope, httpRequest) {
        $scope.pageId = common.getQueryStringHref("pageId");
        $scope.loading = false;
        $scope.finish = false;
        $scope.listAlbumPage = [];
        $scope.page = 0;
        $scope.size = 6;
        $scope.belongDepartment = 1;
        $scope.sortTime = false;
        $scope.readMore = function () {
            $scope.loading = true;
            $scope.page++;
            httpRequest.get("/album/search?"
                + "page=" + $scope.page
                + "&size=" + $scope.size
                + "&belongDepartment=" + $scope.belongDepartment
                + "&pageId=" + $scope.pageId
                , function (data) {
                    if (data.success) {
                        if (data.data.data.length < $scope.size) {
                            $scope.finish = true;
                        }
                        $scope.listAlbumPage = $scope.listAlbumPage.concat(data.data.data);
                        $scope.loading = false;
                    }
                }, function (data) {
                    $scope.loading = false;
                });
        }
        $scope.readMore();
        $scope.checkTotalImages = function (item) {
            if (item) {
                var dataImages = item.split(",");
                return dataImages.length
            } else {
                return '0';
            }
        }
    });
</script>

<script>
    jQuery(document).ready(function () {
        $("#menu-album").addClass("awemenu-active-trail")
    });
</script>