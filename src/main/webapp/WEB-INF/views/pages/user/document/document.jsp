<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 11/8/18
  Time: 7:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    a.btn.btn-primary.btn-more-image {
        border-radius: 30px;
        background-color: #dd1263;
        text-transform: uppercase;
        font-weight: bold;
        padding: 0 12px;
        height: 50px;
        line-height: 50px;
        width: 160px;
        border-color: transparent;
        margin-left: 45%;
    }
</style>
<div class="main-page" ng-controller="documentController">
    <div class="list-doccument ">

        <div class="album-list">

            <div class="container">
                <div class="title-page ">
                    <h2 class="color-black">Danh sách Tài liệu</h2>
                </div>
                <div class="search-advanced">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="input-item">
                                <label class="label">Số kí hiệu</label>
                                <div class="input-text">
                                    <input type="text" name="code" ng-model="dataSearch.code" class="form-control"
                                           ng-enter="readMore(0, menuId)">
                                </div>
                            </div>
                            <div class="input-item">
                                <label class="label">Tên văn bản</label>
                                <div class="input-text">
                                    <input type="text" name="name" ng-model="dataSearch.codename" class="form-control"
                                           ng-enter="readMore(0, menuId)">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="input-item">
                                <label class="label">Ngày ban hành</label>
                                <div class="input-text">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="effective-date-search"
                                               placeholder="Chọn ngày có hiệu lực (dd-MM-yyyy)"
                                               ng-model="effectiveDate"
                                               ng-enter="searchDateTime()" ng-input-date="searchDateTime()">
                                        <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                    </div>
                                    <script>
                                        $('#effective-date-search').datetimepicker({
                                            format: 'DD-MM-YYYY',
                                            allowInputToggle: true,
                                            debug: true
                                        });
                                    </script>
                                </div>
                            </div>
                            <div class="input-item">
                                <label class="label">Ngày Hiệu lực</label>
                                <div class="input-text">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="effective-date-search"
                                               placeholder="Chọn ngày có hiệu lực (dd-MM-yyyy)"
                                               ng-model="effectiveDate"
                                               ng-enter="searchDateTime()" ng-input-date="searchDateTime()">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                    <script>
                                        $('#effective-date-search').datetimepicker({
                                            format: 'DD-MM-YYYY',
                                            allowInputToggle: true,
                                            debug: true
                                        });
                                    </script>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="input-item">
                                <label class="label">Loại tài liệu</label>
                                <div class="input-text">
                                    <select name="menuId" id="menuId" class="form-control"
                                            ng-model="menuSelect" ng-change="readMore(0, menuSelect)">
                                        <option ng-value="menuId">-- Chọn --</option>
                                        <option ng-if="dataMenu.length<=0">Không có dữ liệu...</option>
                                        <option ng-repeat="menu in dataMenu"
                                                ng-value="menu.menu.uid">{{menu.menu.name}}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="input-item">
                                <label class="label">Cơ quan ban hành</label>
                                <div class="input-text">
                                    <input type="text" name="publishedOrg" ng-model="dataSearch.publishedOrg" class="form-control"
                                           ng-enter="readMore(0, menuId)">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="action">
                        <a id="btn-kham-tai-vien" class="btn-search-advanced btn-primary btn"
                           ng-click="readMore(0, menuId)">Tìm kiếm</a>
                    </div>
                </div>
                <div class="album-inner">
                    <div class="row">
                        <div class="col-md-4 col-sm-6 col-xs-12" ng-repeat="item in listDocument">
                            <div class="album-item">
                                <div class="album-image">
                                    <a href="/tai-lieu/{{item.document.linkAlias}}">
                                        <img ng-src="{{item.document.image.absoluteUrl()}}" alt="">
                                    </a>
                                    <div class="over-lay"></div>
                                </div>
                                <div class="album-content">
                                    <h4 class="title-album">
                                        <a href="/tai-lieu/{{item.document.linkAlias}}">{{item.document.name}}</a>
                                    </h4>
                                    <span class="date-time-album">
                                        {{item.document.createdDate.toDateObject('-').format("dd-MM-yyyy")}}
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="action" ng-show="loading==true">
                        <a ng-click="readMore(dataSearch.page, menuId)" class="btn btn-primary btn-more-image">Đang tải</a>
                    </div>
                    <div class="action" ng-show="loading==false && !finish">
                        <a ng-click="readMore(dataSearch.page, menuId)" class="btn btn-primary btn-more-image">Xem thêm</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('documentController', function ($scope, httpRequest) {
        $scope.menuId = common.getQueryStringHref("menuId");
        if ($scope.menuId == null)
            $scope.menuId = "";
        $scope.menuName = common.getQueryStringHref("menuName");

        $scope.loading = false;
        $scope.finish = false;
        $scope.listDocument = [];
        $scope.dataSearch = {
            page: 0,
            size: 6,
            code: '',
            name: '',
            publishedDate: '',
            effectiveDate: '',
            publishedOrg: '',
            type: 1,
            webType: 1,
            menuId: $scope.menuId
        }
        $scope.dataDate = {
            publishedDate: '',
            effectiveDate: '',
        }
        var page = common.getQueryStringHref("trang");
        if (page) {
            if (page % 1 === 0) {
                $scope.dataSearch.page = page;
            } else {
                page = 1;
            }
        } else {
            page = 1;
        }

        $scope.readMore = function (page, menuId) {
            $scope.loading = true;
            $scope.dataSearch.page = page;
            $scope.dataSearch.menuId = menuId;
            $scope.dataSearch.page++;
//            if ($scope.menuId) {
//                $scope.menuSelect = $scope.menuId;
//            }
            var url = "/document/search?"
                + "page=" + $scope.dataSearch.page
                + "&size=" + $scope.dataSearch.size
                + "&code=" + $scope.dataSearch.code
                + "&name=" + $scope.dataSearch.name
                + "&publishedDate=" + $scope.dataSearch.publishedDate
                + "&effectiveDate=" + $scope.dataSearch.effectiveDate
                + "&publishedOrg=" + $scope.dataSearch.publishedOrg
                + "&type=" + $scope.dataSearch.type
                + "&webType=" + $scope.dataSearch.webType
                + "&menuId=" + $scope.dataSearch.menuId

            httpRequest.get(url
                , function (data) {
                    if (data.success) {
                        if (data.data.data.length < $scope.dataSearch.size) {
                            $scope.finish = true;
                        }
                        if(data.data.data.length > 0){
                            $scope.listDocument = $scope.listDocument.concat(data.data.data);
                        } else {
                            $scope.listDocument = [];
                        }
                        $scope.loading = false;
                        if ($scope.menuId == null) {
                            $scope.menuId = "";
                        }
                        if ($scope.menuName == null) {
                            $scope.menuName = "";
                        }
                        $scope.pathname = window.location.pathname;
                        if ($scope.menuId == null || $scope.menuId == "") {
                            window.history.replaceState({}, "", $scope.pathname + "?menuId=" + $scope.menuId + "&menuName=" + $scope.menuName + "&trang=" + $scope.dataSearch.page);
                        }
                        if ($scope.menuId != null || $scope.menuId != "") {
                            window.history.replaceState({}, "", $scope.pathname + "?menuId=" + $scope.menuId + "&menuName=" + $scope.menuName + "&trang=" + $scope.dataSearch.page);
                        }
                    }
                }, function (data) {
                    $scope.loading = false;
                });
        }
        $scope.readMore(0, $scope.menuId);
        $scope.searchDateTime = function () {
            if ($("#published-date-search").val()) {
                $scope.dataSearch.publishedDate = $("#published-date-search").data('DateTimePicker').date()._d.format("yyyy-MM-dd");
            } else {
                $scope.dataSearch.publishedDate = "";
            }
            if ($("#effective-date-search").val()) {
                $scope.dataSearch.effectiveDate = $("#effective-date-search").data('DateTimePicker').date()._d.format("yyyy-MM-dd");
            } else {
                $scope.dataSearch.effectiveDate = "";
            }
            $scope.finish = false;
            $scope.readMore(0, $scope.menuId);
        }

        $scope.dataMenu = [];
        $scope.loadMenu = function (menuId) {
            httpRequest.get("/menu/getDetail?menuId=" + menuId
                , function (data) {
                    if (data.success) {
                        $scope.dataMenu = data.data.menus;
                    }
                }, function (data) {
                }, true);
        }
        $scope.loadMenu($scope.menuId);

    });
</script>
