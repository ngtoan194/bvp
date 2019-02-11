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
<div class="main-page" ng-controller="documenTextController">
    <div class="list-doccument ">
        <div class="album-list">
            <div class="container">
                <div class="title-page ">
                    <h2 class="color-black">Danh sách Văn bản</h2>
                </div>
                <div class="search-advanced">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="input-item">
                                <label class="label">Số kí hiệu</label>
                                <div class="input-text">
                                    <input type="text" name="code" ng-model="dataSearch.code" class="form-control"
                                           ng-enter="loadPage(1, menuId)">
                                </div>
                            </div>
                            <div class="input-item">
                                <label class="label">Tên văn bản</label>
                                <div class="input-text">
                                    <input type="text" name="name" ng-model="dataSearch.name" class="form-control"
                                           ng-enter="loadPage(1, menuId)">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="input-item">
                                <label class="label">Ngày ban hành</label>
                                <div class="input-text">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="effective-date-search"
                                               placeholder="Chọn ngày có hiệu lực (dd-mm-yyyy)"
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
                                               placeholder="Chọn ngày có hiệu lực (dd-mm-yyyy)"
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
                                <label class="label">Loại văn bản</label>
                                <div class="input-text">
                                    <select name="menuId" id="menuId" class="form-control"
                                            ng-model="menuSelect" ng-change="loadPage(1, menuSelect)">
                                        <option ng-value="menuId">-- Chọn --</option>
                                        <option ng-if="dataMenu.length<=0">Không có dữ liệu...</option>
                                        <option ng-repeat="item in dataMenu"
                                                value="{{item.menu.id}}">{{item.menu.name}}
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="input-item">
                                <label class="label">Cơ quan ban hành</label>
                                <div class="input-text">
                                    <input type="text" name="publishedOrg" ng-model="dataSearch.publishedOrg"
                                           class="form-control"
                                           ng-enter="loadPage(1, menuId)">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="action">
                        <a id="btn-kham-tai-vien" class="btn-search-advanced btn-primary btn"
                           ng-click="loadPage(1, menuId)">Tìm kiếm</a>
                    </div>
                </div>
                <div class="ds-inner-hv">
                    <div class="content-bt">
                        <table class="table table-hover table-content">
                            <thead>
                            <tr>
                                <th>STT</th>
                                <th>Số kí hiệu</th>
                                <th>Ngày ban hành</th>
                                <th class="text-center">Tên văn bản</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr ng-repeat="item in listDocument">
                                <td>{{$index + stt}}</td>
                                <td>{{item.document.code}}</td>
                                <td>{{item.document.publishedDate | date:'dd-MM-yyyy'}}</td>
                                <td><a href="/tai-lieu/{{item.document.linkAlias}}" class="name-text">{{item.document.name}}</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="pagination-page text-center" ng-show="loading==false && !finish">
                        <ul class="pagination">
                            <li ng-click="loadPage(1, menuId)" class="{{page==1?'disabled':''}}">
                                <a class="page-link"><i class="fa fa-angle-left" style="margin-top: 8px;"></i></a>
                            </li>
                            <li ng-repeat="itemPage in listPage" class="{{page==itemPage?'active':''}}"
                                ng-click="loadPage(itemPage, menuId)" style="cursor: pointer;">
                                <a class="page-link" style="{{page==itemPage?'color: white; background: #0d8150;':''}}">{{itemPage}}</a>
                            </li>
                            <li ng-click="loadPage(totalPage, menuId)" class="{{page==totalPage?'disabled':''}}">
                                <a class="page-link"><i class="fa fa-angle-right" style="margin-top: 8px;"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('documenTextController', function ($scope, httpRequest) {
        $scope.menuId = common.getQueryStringHref("menuId");
        if ($scope.menuId == null)
            $scope.menuId = "";
        $scope.menuName = common.getQueryStringHref("menuName");
        $scope.loading = false;
        $scope.finish = false;
        $scope.listDocument = [];
        $scope.stt = 1;
        $scope.dataSearch = {
            code: '',
            name: '',
            size: 10,
            publishedDate: '',
            effectiveDate: '',
            publishedOrg: '',
            type: '',
            webType: 1,
            menuId: $scope.menuId
        }
        $scope.dataDate = {
            publishedDate: '',
            effectiveDate: '',
        }
        var urlPage = common.getQueryStringHref("trang");
        if (urlPage) {
            if (urlPage % 1 === 0) {
                $scope.dataSearch.page = urlPage;
            } else {
                urlPage = 1;
            }
        } else {
            urlPage = 1;
        }
        $scope.loadPage = function (urlPage, menuId) {
            $scope.dataSearch.page = urlPage;
            $scope.dataSearch.menuId = menuId;
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
                        if (data.data.data.length < $scope.size) {
                            $scope.finish = true;
                        }
                        $scope.totalPage = common.getTotalPage($scope.dataSearch.size, data.data.total);
                        $scope.stt = 1 + ($scope.dataSearch.page - 1) * $scope.dataSearch.size;
                        $scope.listPage = [];
                        for (var i = $scope.dataSearch.page - 5; i < $scope.dataSearch.page + 5; i++) {
                            if (i > 0 && i <= $scope.totalPage)
                                $scope.listPage.push(i);
                        }
                        $scope.listDocument = [];
                        $scope.listDocument = $scope.listDocument.concat(data.data.data);
                        $scope.loading = false;
                        $scope.finish = false;
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
                }, true);
        };
        $scope.loadPage(urlPage, $scope.menuId);
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
            $scope.loadPage(1, $scope.menuId);
        }

        $scope.dataMenu = [];
        $scope.loadMenu = function (menuId) {
            httpRequest.get("/menu/getDetail?menuId=" + menuId
                , function (data) {
                    if (data.success) {
                        $scope.dataMenu = data.data.menus;
                    }
                }, function (data) {
                });
        }
        $scope.loadMenu($scope.menuId);
    });
</script>