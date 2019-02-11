<%--
  Created by IntelliJ IDEA.
  User: LAN
  Date: 10/31/18
  Time: 2:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    button.owl-next {
        background-color: Transparent;
        background-repeat: no-repeat;
        border: none;
        cursor: pointer;
        overflow: hidden;
    }

    button.owl-prev {
        background-color: Transparent;
        background-repeat: no-repeat;
        border: none;
        cursor: pointer;
        overflow: hidden;
    }
</style>
<div class="main-page" ng-controller="courseController">
    <div class="detail-page">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-12">
                    <div class="menu-left">
                        <div class="inner-content-left">
                            <div class="post-newest">
                                <h4 class="title-left">Khóa học khác</h4>
                                <div class="newest-item" ng-repeat="n in [] | range:(course.length>=3?3:course.length)">
                                    <a href="javascript:void(0);" class="newest-item-image">
                                        <img ng-src="{{course[$index].course.thumbnail.absoluteUrl()}}" alt=""></a>
                                    <p class="newest-title"><a href="/khoa-hoc?courseId={{course[$index].course.id}}">{{course[$index].course.name}}</a>
                                    </p>
                                </div>
                                <div class="news-action text-center" ng-if="course.length>1">
                                    <button class="btn btn-submit btn-creat" ng-click="showAll()">Xem tất cả</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 col-sm-12" ng-if="isShowAll==0">
                    <div class="dao-tao-content ">
                        <div>
                            <h4 class="title-sub-page">{{currentCourse.course.name}}</h4>
                            <h4 class="title-leson">{{currentCourseItem.name}}</h4>
                            <div class="flash-course" style="height: 525px;width: 85%;margin-top: 20px"
                                 ng-bind-html="embedFlash" ng-if="currentCourse.courseItems.length!=0">
                            </div>
                            <h4 ng-if="currentCourse.courseItems.length==0">Chưa cập nhật bài học cho khóa học này!</h4>
                        </div>
                    </div>
                    <div class="comment" ng-if="currentCourse.courseItems.length!=0">
                        <div class="continue-lesson" ng-if="currentCourse.courseItems.length>=2">
                            <h4 class="title-sub-page">Bài học tiếp theo</h4>
                            <div class="continue-lesson-inner">
                                <div class="lesson-slider owl-carousel">
                                    <a ng-repeat="item in currentCourse.courseItems | orderBy:'+name'"
                                       ng-repeat-done="initCourseItem()"
                                       ng-click="selectCourseItem(item)" href="javascript:void(0);"
                                       class="lesson-item"
                                       style="background-image: url({{currentCourse.course.thumbnail.absoluteUrl()}}); min-height: 127px;">
                                        <span href="#" class="title-lesson">{{item.name}}</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="head-comment">
                            <h4 class="title-sub-page mt30">Bình luận bài học</h4>
                        </div>
                        <div id="get-post-loading" style="width: 100%;" ng-show="loading==true">
                            <div style="margin: 0 auto; text-align:center;">
                                <img src="/static/images/loading/loading2.gif" style="width: 80px;">
                                <p style="font-weight:bold;">Đang tải</p>
                            </div>
                        </div>
                        <div class="ds-cau-hoi giao-luu-tt" ng-show="loading==false">
                            <div class="comment question">
                                <ul>
                                    <li ng-repeat="item in commentCourseItem">
                                        <div class="parent-comment">
                                            <a href="#" class="img-user">
                                                <img ng-if="item.author.originImage" alt=""
                                                     ng-src="{{item.author.originImage.absoluteUrl('/static/images/Profile1.png')}}">
                                                <img ng-if="!item.author.originImage" alt=""
                                                     src="/static/images/Profile1.png">
                                            </a>
                                            <div class="comment-content">
                                                <div class="name-user">
                                                    <span class="name">{{item.author.name}}</span>
                                                    <p class="job-user">
                                                        {{
                                                        item.courseItemComment.createdDate.toDateObject('-').format("HH:mm, dd-MM-yyyy")
                                                        }}
                                                    </p>
                                                </div>
                                                <div class="action-comment dropdown"
                                                     style="height: 20px;border-radius: 3px"
                                                     ng-if="allowActionThisComment(item)">
                                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                                                            class="fa fa-sort-desc"></i></a>
                                                    <ul class="dropdown-menu">
                                                        <li><a href="javascript:void(0)"
                                                               ng-click="showUpdateComment(item)"
                                                               class="addcomment-btn">
                                                            <i class="fa fa-pencil-square-o"></i>Sửa</a></li>
                                                        <li><a href="javascript:void(0)"
                                                               ng-click="deleteCommentCourseItem(item)">
                                                            <i class="fa fa-times"></i><span>Xóa</span></a></li>
                                                    </ul>
                                                </div>
                                                <p class="summary-comment">
                                                    {{item.courseItemComment.content}}</p>
                                                <div class="comment-form" ng-if="isUpdate==item.courseItemComment.id">
                                                    <form id="form-edit-comment" novalidate="novalidate"
                                                          ng-validate="validationOptions">
                                                        <label class="label"></label>
                                                        <div class="input-item">{{updateCommentItem}}
                                                            <textarea class="form-control" name="editComment"
                                                                      ng-model="editComment.content" rows="5"
                                                                      placeholder="Ý kiến của bạn..."></textarea>
                                                        </div>
                                                        <div class="submit-comment foot-coment">
                                                            <button class="btn btn-submit"
                                                                    ng-click="updateCommentCourseItem(item)">
                                                                Cập nhật
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="comment-form" ng-if="!${isAdmin}">
                            <form id="form-add-comment" novalidate="novalidate" ng-validate="validationOptions">
                                <h4 class="title-sub-page mt30">Ý kiến của bạn </h4>
                                <label class="label"></label>
                                <label ng-if="!${isLogin}">Vui lòng đăng nhập để bình luận bài học!</label>
                                <p class="input-item" ng-if="${isLogin}">
                                    <textarea class="form-control" name="commentCourse" id="commentValue"
                                              ng-model="courseItemComment.content" rows="5"
                                              placeholder="Ý kiến của bạn..."></textarea>
                                </p>
                                <p class="submit-comment" ng-if="${isLogin}">
                                    <button class="btn btn-submit" ng-click="createCommentCourseItem()">Gửi bình luận
                                    </button>
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 col-sm-12" ng-if="isShowAll==1">
                    <div class="content-detail ds-bs" style="height: 885px;">
                        <div class="head-ds-bs">
                            <div class="row">
                                <div class="col-md-6 cpl-sm-6">
                                    <h4 class="title-sub-page">THÔNG TIN KHÓA HỌC</h4>
                                </div>
                            </div>
                        </div>
                        <div class="list-docctor-detail">
                            <div class="row">
                                <div class="col-md-4 col-sm-4" ng-repeat="item in course">
                                    <div class="doctor-item">
                                        <div class="image-doctor">
                                            <a href="/khoa-hoc?courseId={{item.course.id}}">
                                                <img ng-src="{{item.course.thumbnail.absoluteUrl()}}" alt="" height="180px;">
                                            </a>
                                        </div>
                                        <div class="doctor-surmary">
                                            <p class="name-doctor"><a href="/khoa-hoc?courseId={{item.course.id}}">{{item.course.name}}</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('courseController', function ($sce, $scope, $http, httpRequest, $filter) {
        $scope.courseId = common.getQueryStringHref("courseId");
        $scope.courseItemId = common.getQueryStringHref("courseItemId");
        $scope.deleted = 0;
        $scope.page = "";
        $scope.size = "";
        $scope.isUpdate = 0;
        $scope.loading = false;
        $scope.isShowAll = 0;
        $scope.courseItemComment = {};
        $scope.loadPage = function () {
            httpRequest.get("/course/search?"
                + "page=" + $scope.page
                + "&size=" + $scope.size
                , function (data) {
                    if (data.success) {
                        $scope.course = data.data.data;
                        if ($scope.courseId) {
                            $scope.course.forEach(function (item) {
                                if (item.course.id == $scope.courseId) {
                                    $scope.getListCourseItem(item);
                                    return;
                                }
                            })
                            if (!$scope.currentCourse) {
                                $scope.getListCourseItem($scope.course[0]);
                            }
                        }
                        else {
                            $scope.getListCourseItem($scope.course[0]);
                        }
                    }
                }, function (data) {
                }, false);
        };
        $scope.loadPage();
        $scope.loadFlash = function (url) {
            if (url) {
                $scope.embedFlash = $sce.trustAsHtml("<embed src='" + url.absoluteUrlFile() + "' bgcolor='#05733e' type='application/x-shockwave-flash' allowscriptaccess='none' height='100%' width='100%'></embed>");
            } else {
                $scope.embedFlash = "";
            }
        };
        $scope.showAll = function () {
            $scope.isShowAll = 1;
        }
        $scope.loadListComment = function (item) {
            $scope.loading = true;
            httpRequest.get("/course-item-comment/search?"
                + "courseItemId=" + item.id
                , function (data) {
                    if (data.success) {
                        $scope.commentCourseItem = data.data.data;
                    }
                    $scope.loading = false;
                }, function (data) {
                }, false);

        };
        $scope.selectCourseItem = function (item) {
            $scope.commentCourseItem = [];
            $scope.currentCourseItem = item;
            if (item && item.files)
                $scope.loadFlash(item.files);
            else
                $scope.loadFlash();
            if (item)
                window.history.replaceState({}, "", "/khoa-hoc?courseId=" + $scope.currentCourse.course.id + "&courseItemId=" + $scope.currentCourseItem.id);
            $scope.loadListComment(item);
        };
        $scope.getListCourseItem = function (item) {
            $scope.currentCourse = item;
            var array = item.courseItems.sort(function (a, b) {
                return (a.name > b.name) ? 1 : 0
            });
            if (item.courseItems && item.courseItems.length > 0)
                if ($scope.courseItemId) {
                    array.forEach(function (item2) {
                        if (item2.id == $scope.courseItemId) {
                            $scope.selectCourseItem(item2);
                            return;
                        }
                    });
                    if (!$scope.currentCourseItem) {
                        $scope.selectCourseItem(array[0]);
                    }
                } else {
                    $scope.selectCourseItem(array[0]);
                }
            else {
                $scope.selectCourseItem();
            }
        };
        $scope.initCourseItem = function () {
            setTimeout(function () {
                $('.lesson-slider').owlCarousel({
                    loop: true,
                    margin: 60,
                    nav: true,
                    navText: ["<img src='/static/images/prev-slider-lesson.png'>", "<img src='/static/images/next-slider-lesson.png'>"],
                    responsive: {
                        0: {
                            items: 1
                        },
                        600: {
                            items: 2
                        },
                        1000: {
                            items: 3
                        },
                        1200: {
                            items: 3
                        }
                    }
                });
                $('.continue-lesson  .lesson-item').click(function (e) {
                    e.preventDefault();
                    $('.continue-lesson  .lesson-item').removeClass('active');
                    $(this).addClass('active');
                });
            }, 1000);
        };
        $scope.createCommentCourseItem = function () {
            if ($("#form-add-comment").valid()) {
                httpRequest.post("/course-item-comment/create"
                    , {courseItemComment: $scope.courseItemComment, courseItemId: $scope.currentCourseItem.id}
                    , function (data) {
                        if (data.success) {
                            $scope.loadListComment($scope.currentCourseItem);
//                            alertSmallBox(data.data, success);
                            $scope.courseItemComment.content = "";
                        } else {
//                            alertSmallBox(data.message, error);
                        }
                    }, function () {
                    }, true);
            }
        };
        $scope.deleteCommentCourseItem = function (item) {
            httpRequest.delete("/course-item-comment/delete/" + item.courseItemComment.id
                , function (data) {
                    if (data.success) {
//                        alertSmallBox(data.data, success);
                        $scope.loadListComment($scope.currentCourseItem);
                    } else {
//                        alertSmallBox(data.message, error);
                        $scope.loadListComment($scope.currentCourseItem);
                    }
                }, function () {
                }, true);
        };
        $scope.showUpdateComment = function (item) {
            $scope.editComment = common.clone(item.courseItemComment);
            $scope.isUpdate = item.courseItemComment.id;
        };
        $scope.updateCommentCourseItem = function (item) {
            if ($("#form-edit-comment").valid()) {
                httpRequest.post("/course-item-comment/update/" + item.courseItemComment.id
                    , {courseItemComment: $scope.editComment}
                    , function (data) {
                        if (data.success) {
//                            alertSmallBox(data.data, success);
                            item.courseItemComment = $scope.editComment;
                            $scope.isUpdate = 0;
                        } else {
//                            alertSmallBox(data.message, error);
                        }
                    }, function () {
                    }, true);
            }
        };
        $scope.allowActionThisComment = function (item) {
            if (!${isLogin})
                return false;
            if (item.author == null)
                return false;
            if ('${userId}' == item.author.id)
                return true;
            if (${isAdmin})
                return true;
            return false;
        };

        $.validator.addMethod("isComment", function (value, element) {
            return value.trim() != "";
        }, "*Vui lòng nhập bình luận của bạn!");
        $scope.validationOptions = {
            rules: {
                commentCourse: {
                    isComment: true
                },
                editComment: {
                    isComment: true
                }

            },
            errorPlacement: function (error, element) {
                error.css("margin-left", "10px").css("margin-bottom", "0px").css("color", "#f00").css("padding-bottom", "10px").css("font-size", "14px");
                console.log(element);
                element.parent().parent().find("label").append(error);

            },
            messages: {}
        };
    });
</script>
