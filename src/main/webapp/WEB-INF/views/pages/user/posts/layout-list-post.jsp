<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 11/15/18
  Time: 4:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.UUID" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id" value="${UUID.randomUUID()}"></c:set>
<style>
    .doctor-post-admin .content-post-admin {
        margin: 20px 0;
    }

    .see-more {
        cursor: pointer;
        color: blue;
    }

    .comment-content a:hover {
        text-decoration: underline;
    }

    .doctor-post {
        border-bottom: 3px solid #6eb396;
    }

    .doctor-post .doctor-post-content p {
        margin-top: 15px;
    }
</style>
<div class="main-page" ng-controller="${id}">
    <div class="detail-page">
        <div class="container">
            <div class="row">
                <jsp:include page="/WEB-INF/views/pages/user/posts/menu-left-post.jsp"/>
                <div class="col-md-9 col-sm-12">
                    <div class="dao-tao-content ds-cau-hoi">
                        <h4 class="title-sub-page">{{subPage}}
                            <a ng-if="!${isAdmin}" href="/dat-cau-hoi"
                               class="btn btn-dat-cau-hoi">${isDoctor?"Tạo bài viết":"Đặt câu hỏi"}
                            </a>
                        </h4>
                        <!-- flash file -->
                        <!-- end flash file -->
                        <!-- .comment -->
                        <div class="comment question">
                            <ul>
                                <li ng-repeat-start="item in data" ng-if="item.author.role!=2">
                                    <div class="parent-comment">
                                        <div class="head-question">
                                            <a href="{{postAuthor.profileUrl(item)}}" class="img-user">
                                                <img ng-src="{{postAuthor.avatar(item)}}" alt=""></a>
                                            <div class="name-user">
                                                <span class="name"><a href="{{postAuthor.profileUrl(item)}}">{{postAuthor.fullName(item)}}</a></span>
                                                <p class="time-post">
                                                    {{
                                                    item.post.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")
                                                    }}
                                                </p>
                                            </div>
                                            <p class="title-question">
                                                <a href="/cau-hoi/{{item.post.linkAlias}}">{{item.post.title}}</a>
                                            </p>
                                        </div>
                                        <div class="comment-content">
                                            <p class="summary-comment" style="white-space: pre-line;"
                                               ng-init="item.expand=true;"
                                               ng-bind-html="seeMoreContent(250,item.post.content, item.expand)"></p>
                                            <a class="see-more" ng-if="item.post.content.length>250"
                                               ng-click="item.expand=!item.expand">
                                                {{item.expand?"Xem thêm":"Thu gọn"}}</a>
                                            <div class="foot-comment">
                                                <a href="/cau-hoi/{{item.post.linkAlias}}"
                                                   class="like-icon like-action fa fa-heart">
                                                    <span class="number-like">{{item.post.likeCount}}</span></a>
                                                <a href="/cau-hoi/{{item.post.linkAlias}}"
                                                   class="comment-icon coment-action">
                                                    <img src="/static/images/coment-icon.png" alt="">
                                                    <span class="number-comment">{{item.post.commentCount}}</span>
                                                </a>
                                            </div>
                                            <div class="tag-comment-inner">
                                                <div class="ck" ng-show="item.department.name!=null">
                                                    <strong class="khoa">Khoa:</strong>
                                                    <a href="/tu-van-online/chuyen-khoa/{{item.department.id}}"
                                                       class="khoa-item">{{item.department.name}}</a>
                                                </div>
                                                <div class="key-word" ng-show="item.tags!=null &&item.tags.length>0">
                                                    <strong class="khoa">Từ khóa: </strong>
                                                    <a ng-repeat="item2 in item.tags"
                                                       href="/tu-van-online/tu-khoa/{{item2.id}}" class="tag-item">{{item2.name}}</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="filler-group" ng-show="${isAdmin} && allowChange()"
                                             ng-init="initDepartment(item)">
                                            <div class="row">
                                                <div class="col-md-9 col-xs-12 col-sm-9">
                                                    <div class="input-text input-inline"
                                                         style="margin-left: 10px; margin-top: 5px;">
                                                        <select class="form-control selectpicker" ui-select2
                                                                style="width: 100%; height: 50px;"
                                                                ng-model="item.tempDepartment"
                                                                ng-change="changeCategory(item)">
                                                            <option disabled selected value="">Chọn chuyên khoa</option>
                                                            <option ng-repeat="cat in listDepartments"
                                                                    value="{{cat.department.id}}">
                                                                {{cat.department.name}}
                                                            </option>
                                                        </select>
                                                    </div>
                                                    <div class="input-text input-inline"
                                                         style="margin-left: 20px; margin-top: 4px;">
                                                        <select ui-select2 class="list-doctor" style="width: 100%;"
                                                                ng-init="item.tempAssignee = item.assignee.id;"
                                                                ng-model="item.tempAssignee"
                                                                data-placeholder="Chọn bác sĩ">
                                                            <option disabled selected value="">Chọn bác sĩ</option>
                                                            <option ng-repeat="doc in item.tempListDoctor"
                                                                    ng-value="doc.id">
                                                                {{doc.name}}
                                                                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                                                                Chưa trả lời:
                                                                {{doc.unAnsweredCount}}&nbsp&nbsp&nbsp&nbsp&nbsp
                                                                Đã trả lời: {{doc.answeredCount}}
                                                            </option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-3 col-xs-12 col-sm-3">
                                                    <a href="javascript:void(0);" ng-if="isClassify(item) == 1"
                                                       style="margin-right: 50px; white-space: nowrap; cursor: not-allowed;"
                                                       class="status-confirm">
                                                        <i class="fa fa-check-square-o"></i>Đã duyệt</a>
                                                    <a href="javascript:void(0);" ng-if="isClassify(item) == 0"
                                                       style="margin-right: 50px;     white-space: nowrap;"
                                                       ng-click="approvePost(item)" class="status-confirm">
                                                        <i class="fa fa-check-square-o"></i>Duyệt</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <ul ng-if="item.commentAuthor != null && item.comment != null">
                                        <li class="sub-comment">
                                            <article class="sub-inner">
                                                <a href="{{postAuthor.profileUrl(item)}}" class="img-user">
                                                    <img ng-src="{{item.commentAuthor.thumbnailAvatarUrl.absoluteUrl('/static/images/Profile1.png')}}"
                                                         alt="">
                                                </a>
                                                <div class="comment-content">
                                                    <div class="name-user">
                                                        <span class="name" ng-if="${isUser} || !${isLogin}">
                                                            <a href="/bac-si/{{item.commentAuthor.id}}">{{item.commentAuthor.name}}</a></span>
                                                        <span class="name" ng-if="${isDoctor} || ${isAdmin }">
                                                            <a href="/tai-khoan/{{item.commentAuthor.id}}">{{item.commentAuthor.name}}</a></span>
                                                        <p class="time-post">
                                                            {{getPosition(item.commentAuthor,item.department)}}
                                                        </p>
                                                    </div>
                                                    <p class="summary-comment" style="white-space: pre-line;"
                                                       ng-init="item.expandComment=true;"
                                                       ng-bind-html="seeMoreContent(250,item.comment.content, item.expandComment)"></p>
                                                    <a class="see-more" ng-if="item.comment.content.length>250"
                                                       ng-click="item.expandComment=!item.expandComment">
                                                        {{item.expandComment?"Xem thêm":"Thu gọn"}}</a>
                                                    <span class="time-post">
                                                        {{
                                                        item.comment.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")
                                                        }}
                                                    </span>
                                                    <%--<div class="foot-comment">--%>
                                                    <%--<a href="{{item.post.linkAlias}}"--%>
                                                    <%--class="like-icon like-action fa fa-heart">--%>
                                                    <%--<span class="number-like">{{item.comment.likeCount}}</span>--%>
                                                    <%--</a>--%>
                                                    <%--<a href="{{item.post.linkAlias}}"--%>
                                                    <%--class="comment-icon coment-action">--%>
                                                    <%--<img src="/static/images/coment-icon.png" alt="">--%>
                                                    <%--<span class="number-comment"></span>--%>
                                                    <%--</a>--%>
                                                    <%--</div>--%>
                                                </div>
                                            </article>
                                        </li>
                                    </ul>
                                </li>
                                <li ng-repeat-end ng-if="item.author.role==2">
                                    <div class="doctor-post">
                                        <div class="head-post-doctor">
                                            <a href="#" class="img-user">
                                                <img ng-src="{{postAuthor.avatar(item)}}" alt="">
                                            </a>
                                            <div class="right-info-post">
                                                <h4 class="title-post-doctor">
                                                    <a href="/bai-viet/{{item.post.linkAlias}}">{{item.post.title}}</a>
                                                </h4>
                                                <p ng-if="${isUser} || !${isLogin}">
                                                    <a href="/bac-si/{{item.author.id}}">
                                                        Đăng bởi :{{postAuthor.fullName(item)}} ,
                                                    </a>
                                                    <i>
                                                        {{
                                                        item.post.createdDate.toDateObject('-').format("HH:mm
                                                        dd-MM-yyyy")
                                                        }}
                                                    </i>
                                                </p>
                                                <p ng-if="${isDoctor} || ${isAdmin }">
                                                    <a href="/tai-khoan/{{item.author.id}}">
                                                        Đăng bởi :{{postAuthor.fullName(item)}} ,
                                                    </a>
                                                    <i>
                                                        {{
                                                        item.post.createdDate.toDateObject('-').format("HH:mm
                                                        dd-MM-yyyy")
                                                        }}
                                                    </i>
                                                </p>
                                            </div>

                                        </div>
                                        <div class="comment-content">
                                            <div class="doctor-post-content">
                                                <p class="surmary-post"
                                                   ng-bind-html="item.post.content"></p>
                                                <img ng-show="item.post.images"
                                                     ng-src="{{imagePost(item.post.images)}}" alt="">
                                                <a href="/bai-viet/{{item.post.linkAlias}}" class="more-link">
                                                    Đọc chi tiết
                                                </a>
                                            </div>
                                            <div class="foot-comment">
                                                <a href="/bai-viet/{{item.post.linkAlias}}"
                                                   class="like-icon like-action fa fa-heart">
                                                    <span class="number-like">{{item.post.likeCount}}</span>
                                                </a>
                                                <a href="/bai-viet/{{item.post.linkAlias}}"
                                                   class="comment-icon coment-action">
                                                    <img src="/static/images/coment-icon.png" alt="">
                                                    <span class="number-comment">{{item.post.commentCount}}</span>
                                                </a>
                                            </div>
                                            <div class="tag-comment-inner">
                                                <div class="ck" ng-show="item.department.name!=null">
                                                    <strong class="khoa">Khoa:</strong>
                                                    <a href="/tu-van-online/chuyen-khoa/{{item.department.id}}"
                                                       class="khoa-item">{{item.department.name}}</a>
                                                </div>
                                                <div class="key-word" ng-show="item.tags!=null &&item.tags.length>0">
                                                    <strong class="khoa">Từ khóa: </strong>
                                                    <a ng-repeat="item2 in item.tags"
                                                       href="/tu-van-online/tu-khoa/{{item2.id}}" class="tag-item">{{item2.name}}</a>
                                                </div>
                                            </div>
                                            <div class="filler-group" ng-if="${isAdmin}&&allowChange()"
                                                 style="cursor: pointer;">
                                                <a class="status-confirm"
                                                   ng-if="isClassifyDoctor(item) == 0"
                                                   ng-click="approvePostDoctor(item)">
                                                    <i class="fa fa-check-square-o"></i>Duyệt
                                                </a>
                                                <a class="status-confirm"
                                                   ng-if="isClassifyDoctor(item) == 1"
                                                   ng-click="approvePostDoctorCancel(item)">
                                                    <i class="fa fa-check-square-o"></i>Hủy duyệt
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div><!-- /.comment -->
                        <div class="action" style="text-align: center;" ng-show="loading==true">
                            <h4 class="title-sub-page">
                                <a ng-click="readMore()" style="width: 120px; margin-right: 47%;"
                                   class="btn btn-dat-cau-hoi">Đang tải</a>
                            </h4>
                        </div>
                        <div class="action" style="text-align: center;" ng-show="loading==false && !finish"
                             {{postAuthor.fullName(item)}}>
                            <h4 class="title-sub-page">
                                <a ng-click="readMore()" style="width: 120px; margin-right: 47%;"
                                   class="btn btn-dat-cau-hoi">Xem thêm</a>
                            </h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('${id}', function ($scope, $http, httpRequest) {
        $scope.adminRole = ${adminRole};
        $scope.allowChange = function () {
            if (($scope.adminRole & 4) == 4) {
                return true;
            } else {
                return false;
            }
        }
        $scope.subPage = $scope.$parent.titleSubPage;
        $scope.serviceUrl = $scope.$parent.serviceId;
        $scope.isActive = 1;
        $scope.listDepartments = [];
        $scope.listDoctor = [];
        $scope.loadDepartment = function () {
            $http({
                method: 'GET',
                url: "/department/get-list-doctor-department"
            }).then(function successCallback(response) {
                if (response.data.success) {
                    $scope.listDepartments = response.data.data;
                    for (var i = 0; i < $scope.listDepartments.length; i++) {
                        var id = $scope.listDepartments[i].department.id;
                        $scope.listDoctor[id] = $scope.listDepartments[i].doctors;
                    }
                }
            }, function errorCallback(response) {
            });
        }
        if ($scope.allowChange() &&${isAdmin}) {
            $scope.loadDepartment();
        }
        $scope.initDepartment = function (item) {
            if (!item.department) {
                item.tempDepartment = "";
                item.tempListDoctor = [];
            } else {
                item.tempDepartment = item.department.id.toString();
                item.tempListDoctor = $scope.listDoctor[item.department.id];
                if (!item.tempListDoctor)
                    item.tempListDoctor = [];
            }
        }
        $scope.changeCategory = function (item) {
            var newDepartmentId = item.tempDepartment;
            item.tempListDoctor = $scope.listDoctor[newDepartmentId];
        }
        $scope.isClassify = function (item) {
            if (item.post.isClassified && item.post.isClassified == 0 || item.department == undefined || item.assignee == undefined)
                return false;
            if (item.tempDepartment == item.department.id && item.tempAssignee == item.assignee.id)
                return true;
            return false;
        }
        $scope.isClassifyDoctor = function (item) {
            if (item.post.isPublished == 0)
                return false;
            if (item.post.isPublished == 1)
                return true;
            return false;
        }
        $scope.approvePost = function (item) {
            if (!item.tempAssignee) {
                alertSmallBox("Vui lòng chọn bác sĩ cần phê duyệt", error)
                return;
            }
            if (!item.tempDepartment) {
                alertSmallBox("Vui lòng chọn khoa cần phê duyệt", error)
                return;
            }
            if (item.post.isAssigned == 1) {
                if (item.assignee.id != item.tempAssignee) {
                    confirmDialog("XÁC NHẬN", "Bạn có muốn duyệt lại câu hỏi này?", function () {
                        item.department = {
                            id: item.tempDepartment
                        }
                        item.assignee = {
                            id: item.tempAssignee
                        }
                        item.post.isClassified = 1;
                        $http({
                            method: 'Post',
                            url: "/post/assign",
                            data: {
                                postId: item.post.id,
                                departmentId: item.tempDepartment,
                                doctorId: item.tempAssignee
                            }
                        }).then(function successCallback(response) {
                            if (response.data.success) {
                                alertSmallBox(response.data.data, success);
                                $scope.loadPage(1);
                            }
                            else {
                                alertSmallBox(response.data.message, error);
                            }
                        });
                    })
                }
            } else {
                item.department = {
                    id: item.tempDepartment
                }
                item.assignee = {
                    id: item.tempAssignee
                }
                item.post.isClassified = 1;
                $http({
                    method: 'post',
                    url: "/post/assign",
                    data: {
                        postId: item.post.id,
                        departmentId: item.tempDepartment,
                        doctorId: item.tempAssignee
                    }
                }).then(function successCallback(response) {
                    if (response.data.success) {
                        alertSmallBox(response.data.data, success);
                        $scope.loadPage(1);
                    }
                    else {
                        alertSmallBox(response.data.message, error);
                    }
                });
            }
        }
        $scope.approvePostDoctor = function (item) {
            confirmDialog("XÁC NHẬN", "Bạn có muốn duyệt bài viết này?", function () {
                $http({
                    method: 'Post',
                    url: "/service/post/approveDoctor",
                    data: {
                        postId: item.post.id,
                        isPublished: item.post.isPublished = 1,
                    }
                }).then(function successCallback(response) {
                    if (response.data.success) {
                        alertSmallBox(response.data.data, success);
                    }
                    else {
                        alertSmallBox(response.data.message, error);
                    }
                });
            })
        }
        $scope.approvePostDoctorCancel = function (item) {
            confirmDialog("XÁC NHẬN", "Bạn có muốn hủy duyệt bài viết này?", function () {
                $http({
                    method: 'Post',
                    url: "/service/post/approveDoctor",
                    data: {
                        postId: item.post.id,
                        isPublished: item.post.isPublished = 0,
                    }
                }).then(function successCallback(response) {
                    if (response.data.success) {
                        alertSmallBox(response.data.data, success);
                    }
                    else {
                        alertSmallBox(response.data.message, error);
                    }
                });
            })


        }
        $scope.seeMoreContent = function (minLength, content, status) {
            return seeMoreContent(minLength, content, status);
        }
        $scope.getPosition = function (user, department) {
            return getPositionDoctor(user, department)
        }
        $scope.loading = false;
        $scope.finish = false;
        $scope.page = 0;
        $scope.data = [];
        $scope.size = 10;
        $scope.searchPost = ${searchPost};
        $scope.readMore = function () {
            if ($scope.page == 0)
                $scope.data = [];

            $scope.loading = true;
            $scope.page++;
            if (location.pathname == "/tu-van-online/dang-theo-doi") {
                var urlApi = "/post/get-followed-by-user/" + $scope.searchPost.userId
                    + "?page=" + $scope.page
                    + "&size=" + $scope.size
            } else if (location.pathname.indexOf('/tu-van-online/tu-khoa') != -1) {
                var urlApi = "/post/get-by-tag/" + $scope.searchPost.tagId
                    + "?page=" + $scope.page
                    + "&size=" + $scope.size
            } else {
                urlApi = "/post/search"
                    + "?page=" + $scope.page
                    + "&size=" + $scope.size
                    + "&isAnswered=" + $scope.searchPost.isAnswered
                    + "&isAssigned=" + $scope.searchPost.isAssigned
                    + "&isPublished=" + $scope.searchPost.isPublished
                    + "&authorId=" + $scope.searchPost.authorId
                    + "&departmentId=" + $scope.searchPost.departmentId
                    + "&assigneeId=" + $scope.searchPost.assigneeId
                    + "&startTime=" + $scope.searchPost.startTime
                    + "&tagId=" + $scope.searchPost.tagId
            }
            $http({
                method: 'GET',
                url: urlApi
            }).then(function successCallback(response) {
                $scope.loading = false;
                if (response.data.success) {
                    if (response.data.data.length < $scope.size) {
                        $scope.finish = true;
                    }
                    $scope.data = $scope.data.concat(response.data.data.data);
                }
            }, function errorCallback(response) {
                $scope.loading = false;
            });
        };
        $scope.readMore();
        $scope.loadPage = function (page) {
            $scope.loading = true;
            $scope.page = page;
            $http({
                method: 'GET',
                url: "/post/search"
                + "?page=" + $scope.page
                + "&size=" + $scope.size
                + "&isAssigned=0"
            }).then(function successCallback(response) {
                $scope.loading = false;
                if (response.data.success) {
                    if (response.data.data.length < $scope.size) {
                        $scope.finish = true;
                    }
                    $scope.data = response.data.data.data;
                }
            }, function errorCallback(response) {
                $scope.loading = false;
            });
        };
        $scope.postAuthor = {
            isAuthorPost: function (item) {
                if (!${isLogin})
                    return false;
                if (!item.author) {
                    console.log(item);
                    return false;
                }
                return item.author.id == '${userId}';
            },
            avatar: function (item) {
                if (!item.author)
                    return "/static/images/Profile1.png";
                if (this.isAuthorPost(item) && item.author.thumbnail)
                    return item.author.thumbnail.absoluteUrl('/static/images/Profile1.png')
                if (item.post.isPrivate != 0)
                    return "/static/images/Profile1.png";
                if (item.author.thumbnail)
                    return item.author.thumbnail.absoluteUrl();
                return '/static/images/Profile1.png';
            },
            fullName: function (item) {
                if (!item.author)
                    return "Ẩn danh";
                if (this.isAuthorPost(item))
                    return item.author.name;
                if (item.post.isPrivate != 0)
                    return "Ẩn danh";
                return item.author.name;
            },
            profileUrl: function (item) {
                if (!item.author) {
                    return "javascript:void(0)";
                }
                if (this.isAuthorPost(item))
                    return "/tai-khoan/" + item.author.id;
                if (item.post.isPrivate != 0)
                    return "javascript:void(0)";
                return "/tai-khoan/" + item.author.id;
            }
        }
        $scope.imagePost = function (item) {
            var image = JSON.parse(item);
            return image[0].image.absoluteUrl();
        }
//        $scope.dataClassify = {};
//        httpRequest.get("/service/post/classifyCount", function (data) {
//            if (data.success) {
//                $scope.dataClassify = data.data;
//            }
//        }, function (data) {
//        });
//        $scope.hotestTags = [];
//        $http({
//            method: 'GET',
//            url: '/tag/search?page=1&size=10'
//        }).then(function successCallback(response) {
//            $scope.hotestTags = response.data.data.data;
//        }, function errorCallback(response) {
//        });
//        $scope.getListPost = function () {
//            if ($scope.value)
//                location.href = "/chuyen-khoa/" + $scope.value;
//        }
//        $http({
//            method: 'GET',
//            url: "/department/get-all"
//            + "?isActive=" + $scope.isActive
//        }).then(function successCallback(response) {
//            if (response.data.success) {
//                $scope.listCat = response.data.data;
//            }
//        }, function errorCallback(response) {
//        });
    });
</script>