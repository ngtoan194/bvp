<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 11/8/18
  Time: 7:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-page" ng-controller="documentDetailController">
    <div class="detail-page">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-12">
                    <div class="menu-left">
                        <div class="inner-content-left" ng-if="documentDetail.type == 1">
                            <div class="post-newest">
                                <h4 class="title-left">Tài liệu liên quan</h4>
                                <div class="newest-item" ng-repeat="item in listDocument | limitTo : 3">
                                    <a href="/tai-lieu/{{item.document.linkAlias}}" class="newest-item-image">
                                        <img ng-src="{{item.document.image.absoluteUrl()}}" alt="">
                                    </a>
                                    <p class="newest-title">
                                        <a href="/tai-lieu/{{item.document.linkAlias}}">{{item.document.name}}</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="inner-content-left" ng-if="documentDetail.type == 2">
                            <h4 class="title-left">Văn bản liên quan</h4>
                            <ul class="menu-left-main">
                                <li ng-repeat="item in listDocument | limitTo : 3">
                                    <a href="/tai-lieu/{{item.document.linkAlias}}">{{item.document.name}}</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 col-sm-12">
                    <div class="content-detail">
                        <div class="title-page">
                            <h2 class="title-main">{{documentDetail.name}}</h2>
                        </div>
                        <div style="float: right; text-align: right;">
                            <h5 ng-if="documentDetail.code">Số ký hiệu: {{documentDetail.code}}</h5>
                            <h5>Ngày ban hành: {{documentDetail.publishedDate | date:'dd-MM-yyyy'}}</h5>
                        </div>
                        <div class="detail-text">
                            <div ng-bind-html="embedFlash"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('documentDetailController', function ($scope, $sce, httpRequest) {
        $scope.documentDetail =${dataDocument};
        $scope.dataMenu =${dataMenu};

//        var urlFilePreview = (server_url + "/api/document/download-view/" + $scope.documentDetail.id + "?type=0")
//        $scope.downloadType = 0;
//        $scope.filePreview = "/service/document/downloadView?uid=" + $scope.documentDetail.id + "&type=" + $scope.downloadType;
//        $scope.filePreview2 = server_url + "/api/document/download-view/" + $scope.documentDetail.id + "?type=0";

        $scope.loadFlash = function (url) {
            if (url) {
                $scope.embedFlash = $sce.trustAsHtml("<embed src='" + url.absoluteUrlFile2() + "' bgcolor='#05733e' type='application/pdf' allowscriptaccess='none' height='100%' width='100%'></embed>");
            } else {
                $scope.embedFlash = "";
            }
        };
        $scope.loadFlash($scope.documentDetail.filePreview.absoluteUrlFile());

        $scope.listDocument = [];
        $scope.readMore = function () {
            httpRequest.get("/document/search?page=1&size=4&type=" + $scope.documentDetail.type + "&webType=1"
                , function (data) {
                    if (data.success) {
                        $scope.listDocument = data.data.data;
                        for (var i = 0; i < $scope.listDocument.length; i++) {
                            if ($scope.listDocument[i].document.id === $scope.documentDetail.id) {
                                $scope.listDocument.splice(i, 1);
                                break;
                            }
                        }
                    }
                }, function (data) {
                });
        }
        $scope.readMore();

    });
</script>