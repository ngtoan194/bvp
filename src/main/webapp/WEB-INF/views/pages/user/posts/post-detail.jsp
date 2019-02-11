<%--
  Created by IntelliJ IDEA.
  User: toan
  Date: 11/20/18
  Time: 10:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<script type="text/javascript" src="/js/jquery.magnific-popup.js"></script>--%>
<%--<link rel="stylesheet" type="text/css" href="/css/magnific-popup.css">--%>
<div class="main-page">
    <div class="detail-page">
        <div class="container">
            <div class="row">
                <jsp:include page="/WEB-INF/views/pages/user/posts/menu-left-post.jsp"/>
                <div class="col-md-9 col-sm-12" ng-controller="postdetailController">
                    <div class="dao-tao-content">
                        <h4 class="title-sub-page">Chi tiết câu hỏi</h4>
                        <!-- flash file -->
                        <!-- end flash file -->
                        <!-- .comment -->
                        <div class="comment question detail-question">
                            <div class="parent-comment question" ng-if="post.author.role == 1">
                                <div class="head-question">
                                    <a href="{{postAuthor.profileUrl()}}" class="img-user">
                                        <img ng-src="{{postAuthor.avatar()}}" alt=""></a>
                                    <div class="name-user">
                                        <span class="name"><a href="{{postAuthor.profileUrl()}}">{{postAuthor.fullName()}}</a></span>
                                        <p class="time-post">
                                            {{post.post.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")}}
                                        </p>
                                    </div>
                                    <p class="title-question">{{post.post.title}}</p>
                                </div>
                                <div class="action-comment dropdown" ng-if="allowActionThisPost()">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <i class="fa fa-sort-desc"></i>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li style="cursor: pointer;">
                                            <a ng-click="checkRoles()"><i class="fa fa-pencil-square-o"></i>Sửa</a>
                                        </li>
                                        <li style="cursor: pointer;">
                                            <a ng-click="deletePost()"><i class="fa fa-trash"></i>Xóa</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="comment-content">
                                    <p class="summary-comment" style="white-space: pre-line;"
                                       ng-bind-html="post.post.content"></p>
                                    <div class="image-content">
                                        <div class="col-md-12 col-sm-12 col-xs-12 tz-gallery">
                                            <div style="margin-bottom: 25px; text-align: center;" class="col-md-3 col-sm-6 col-xs-12"
                                                 ng-repeat="img in post.post.images">
                                                <a href="{{img.image.absoluteUrl()}}" style="cursor: pointer;">
                                                    <img style="height: 150px; object-fit: cover;" ng-src="{{img.image.absoluteUrl()}}" alt="">
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tag-comment-inner">
                                        <div class="ck" ng-show="post.department.name!=null">
                                            <strong class="khoa">Khoa:</strong>
                                            <a href="/chuyen-khoa/{{post.department.linkAlias}}" class="khoa-item">{{post.department.name}}</a>
                                        </div>
                                        <div class="key-word" ng-show="post.tags!=null &&post.tags.length>0">
                                            <strong class="khoa">Tags: </strong>
                                            <a ng-repeat="item2 in post.tags" href="/tu-khoa/{{item2.linkAlias}}"
                                               class="tag-item">{{item2.name}}</a>
                                        </div>
                                    </div>
                                    <div class="foot-comment">
                                        <a class="like-icon like-action fa fa-heart"
                                           style="cursor: {{${isLogin}?'pointer':'default'}};"
                                           ng-click="likePost()">
                                            <span class="number-like">{{post.post.likeCount}}</span>
                                        </a>
                                        <a class="comment-icon coment-action">
                                            <img src="/static/images/coment-icon.png" alt="">
                                            <span class="number-comment">{{post.post.commentCount}}</span>
                                        </a>
                                    </div>
                                    <a ng-click="followPost(post)" class="follow-btn" style="cursor: pointer;">
                                        {{post.isFollowed?"Bỏ theo dõi":"Theo dõi"}}</a>
                                </div>
                            </div>
                            <div class="comment question detail-question chi-tiet-bs" ng-if="post.author.role == 2">
                                <div class="parent-comment question">
                                    <div class="head-question">
                                        <div class="name-user">
                                            <span class="name">{{post.post.title}}</span>
                                            <p ng-if="${isUser} || !${isLogin}" class="time-post"
                                               style="font-size:17px;"> Đăng bởi
                                                <a href="/bac-si/{{post.author.id}}"><strong>{{postAuthor.fullName()}} </strong></a>
                                                {{post.post.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")}}
                                            </p>
                                            <p ng-if="${isDoctor} || ${isAdmin }" class="time-post"
                                               style="font-size:17px;"> Đăng bởi
                                                <a href="{{postAuthor.profileUrl()}}"><strong>{{postAuthor.fullName()}} </strong></a>
                                                {{post.post.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")}}
                                            </p>
                                        </div>
                                    </div>
                                    <div class="action-comment dropdown" ng-if="allowActionThisPost()">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                            <i class="fa fa-sort-desc"></i>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li style="cursor: pointer;">
                                                <a ng-click="checkRoles()"><i class="fa fa-pencil-square-o"></i>Sửa</a>
                                            </li>
                                            <li style="cursor: pointer;">
                                                <a ng-click="deletePost()"><i class="fa fa-trash"></i>Xóa</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="comment-content">
                                        <div class="col-md-12 col-sm-12 col-xs-12 tz-gallery">
                                            <div style="margin-bottom: 25px; text-align: center;" class="col-md-3 col-sm-6 col-xs-12"
                                                 ng-repeat="img in post.post.images">
                                                <a href="{{img.image.absoluteUrl()}}" style="cursor: pointer;">
                                                    <img style="height: 150px; object-fit: cover;" ng-src="{{img.image.absoluteUrl()}}" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="tag-comment-inner" style="margin-bottom: 20px;">
                                            <div class="ck" ng-show="post.department.name!=null">
                                                <strong class="khoa">Khoa:</strong>
                                                <a href="/chuyen-khoa/{{post.department.linkAlias}}" class="khoa-item">{{post.department.name}}</a>
                                            </div>
                                            <div class="key-word" ng-show="post.tags!=null &&post.tags.length>0">
                                                <strong class="khoa">Tags: </strong>
                                                <a ng-repeat="item2 in post.tags" href="/tu-khoa/{{item2.linkAlias}}"
                                                   class="tag-item">{{item2.name}}</a>
                                            </div>
                                        </div>
                                        <p class="summary-comment" style="white-space: pre-line;"
                                           ng-bind-html="post.post.content"></p>
                                        <div class="foot-comment" style="margin-top: 20px;">
                                            <a class="like-icon like-action fa fa-heart"
                                               style="cursor: {{${isLogin}?'pointer':'default'}};"
                                               ng-click="likePost()">
                                                <span class="number-like">{{post.likeCount}}</span>
                                            </a>
                                            <a class="comment-icon coment-action">
                                                <img src="/static/images/coment-icon.png" alt="">
                                                <span class="number-comment">{{post.commentCount}}</span>
                                            </a>
                                            <a ng-click="followPost(post)" class="follow-btn" style="cursor: pointer;">
                                                {{post.isFollowed?"Bỏ theo dõi":"Theo dõi"}}</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <ul class="list-awnser" ng-show="checkShowListComment()">
                                <li class="parent-comment" ng-repeat="item in comments"
                                <%--ng-init="item.commentEdit=JSON.parse(JSON.stringify(item.comment))"--%>
                                >
                                    <article class="sub-inner">
                                        <a href="{{commentAuthor.profileUrl(item)}}" class="img-user">
                                            <img ng-src="{{commentAuthor.avatar(item)}}" alt="">
                                        </a>
                                        <div class="comment-content">
                                            <div class="name-user">
                                                <span class="name"><a href="{{commentAuthor.profileUrl(item)}}">{{commentAuthor.fullName(item)}}<a></a></span>
                                                <p class="time-post" ng-if="item.author.role == 1">
                                                    {{
                                                    item.comment.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")
                                                    }}
                                                </p>
                                                <p class="time-post" ng-if="item.author.role == 2">
                                                    {{getPosition(item.author, item.department)}}</p>
                                            </div>
                                            <div class="action-comment dropdown" ng-if="allowActionThisComment(item)">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                                    <i class="fa fa-sort-desc"></i></a>
                                                <ul class="dropdown-menu">
                                                    <li>
                                                        <a style="cursor: pointer;"
                                                           ng-click="showLayoutUpdateComment(item)">
                                                            <i class="fa fa-pencil-square-o"></i>Sửa
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a style="cursor: pointer;" ng-click="deleteComment(item)">
                                                            <i class="fa fa-times"></i>Xóa

                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <p class="summary-comment" style="white-space: pre-line;">
                                                <span ng-init="expand=false; minLength=250"
                                                      ng-bind-html="item.comment.content | limitTo:(expand?10000:minLength)">
                                                </span>
                                                <a style="cursor: pointer;" ng-click="expand=!expand">
                                                    {{
                                                    expand?"Thu gọn":
                                                    item.comment.content.length>minLength?"...Xem thêm":""
                                                    }}
                                                </a>
                                            </p>
                                            <img ng-src="{{item.comment.images.absoluteUrl()}}">
                                            <div class="foot-comment">
                                                <a class="like-icon like-action fa fa-heart"
                                                   style="cursor: {{${isLogin}?'pointer':'default'}}"
                                                   ng-click="likeComment(item)">
                                                    <span class="number-like">{{item.likeCount}}</span>
                                                </a>
                                                <%--<a style="cursor: pointer;" class="comment-icon coment-action"--%>
                                                <%--ng-click="showSubComment(item)">--%>
                                                <%--<img src="/static/images/coment-icon.png" alt="">--%>
                                                <%--<span class="number-comment">{{item.subCommentCount}}</span>--%>
                                                <%--</a>--%>
                                                <span class="time-post" ng-if="item.author.role == 2">
                                                    {{item.comment.createdDate.toDateObject('-').format("HH:mm dd-MM-yyyy")}}
                                                </span>
                                            </div>
                                        </div>
                                        <div class="comment-form col-md-offset-2" ng-if="item.showUpdateComment">
                                            <div class="input-item">
                                                <div ng-repeat="itemImage in fileMgr.listFiles[item.comment.id+'update']"
                                                     href="{{itemImage.imageUrl.imageUrl()}}"
                                                     style="position: relative; width: 100px; height: 100px; margin: 3px; display: inline-block; float: left">
                                                    <label ng-click="fileMgr.remove(item.comment.id+'update', itemImage)"
                                                           style="position: absolute; left: 5px; top: 5px; cursor: pointer">
                                                        <i class="fa fa-times-circle"></i>
                                                    </label>
                                                    <img src="/static/images/loading/loading2.gif"
                                                         style="width: 40px;height: 40px;position: absolute;top: 30px;left: 30px;"
                                                         ng-if="itemImage.uploading"/>
                                                    <img alt="image"
                                                         onerror="ImgError(this);"
                                                         style="width: 100px; height: 100px; object-fit: cover;"
                                                         ng-src="{{itemImage.imageUrl.absoluteUrl()}}"/>
                                                </div>
                                                <textarea rows="10" class="form-control"
                                                          ng-value="item.comment.content"
                                                          ng-model="item.commentEdit.content"
                                                          placeholder="Nhập nội dung bình luận"></textarea>
                                            </div>
                                            <div class="submit-comment foot-coment">
                                                <span class="attach-image">
                                                    <input type="file" accept="image/*" style="display: none;"
                                                           class="attach-btn"
                                                           file-input-id="{{item.comment.id+'update'}}"
                                                           ng-file-change="fileMgr.selectFile">
                                                    <a style="cursor: pointer;"
                                                       ng-click="fileMgr.chooseFile(item.comment.id+'update')">
                                                    <i class="fa fa-camera"></i></a>
                                                </span>
                                                <button class="btn btn-submit"
                                                        ng-click="item.showUpdateComment=false">
                                                    Hủy
                                                </button>
                                                <button class="btn btn-submit" style="margin-right: 5px;"
                                                        ng-click=" updateComment(item); item.showUpdateComment=!item.showUpdateComment">
                                                    Lưu
                                                </button>
                                            </div>
                                        </div>
                                    </article>
                                    <ul ng-show="item.showCmtSub">
                                        <li class="sub-comment" ng-repeat="item2 in item.subComments">
                                            <article class="sub-inner">
                                                <a href="{{commentAuthor.profileUrl(item2)}}" class="img-user">
                                                    <img ng-src="{{commentAuthor.avatar(item2)}}" alt="">
                                                </a>
                                                <div class="comment-content">
                                                    <div class="name-user">
                                                        <span class="name">{{commentAuthor.fullName(item2)}}</span>
                                                        <p class="time-post">
                                                            {{
                                                            item2.subComment.createdDate.toDateObject('-').format("HH:mm
                                                            dd-MM-yyyy")
                                                            }}
                                                        </p>
                                                    </div>
                                                    <div class="action-comment dropdown"
                                                         ng-if="allowActionThisComment(item2)">
                                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                                            <i class="fa fa-sort-desc"></i>
                                                        </a>
                                                        <ul class="dropdown-menu">
                                                            <li><a style="cursor: pointer;"
                                                                   ng-click="showLayoutUpdateSubComment(item2)">
                                                                <i class="fa fa-pencil-square-o"></i>Sửa</a>
                                                            </li>
                                                            <li><a style="cursor: pointer;"
                                                                   ng-click="deleteSubComment(item2,item)"><i
                                                                    class="fa fa-times"></i>Xóa</a></li>
                                                        </ul>
                                                    </div>
                                                    <p class="summary-comment" style="white-space: pre-line;"
                                                       ng-if="item2.subComment.content.trim()!=''">
                                                        <span ng-init="item2.expand=false; item2.minLength=250"
                                                              ng-bind-html="item2.subComment.content | limitTo:(item2.expand?10000:item2.minLength)">
                                                        </span>
                                                        <a ng-click="item2.expand=!item2.expand">
                                                            {{
                                                            item2.expand?"Thu gọn":
                                                            item2.content.length>item2.minLength?"...Xem thêm":""
                                                            }}
                                                        </a>
                                                    </p>
                                                    <img ng-repeat="item3 in item2.subComment.imageUrls"
                                                         ng-src="{{item3.absoluteUrl()}}">
                                                    <div class="foot-comment">
                                                        <a style="cursor: {{${isLogin}?'pointer':'default'}}"
                                                           class="like-icon like-action fa fa-heart"
                                                           ng-click="likeSubComment(item2)">
                                                            <span class="number-like">{{item2.likeCount}}</span></a>
                                                    </div>
                                                </div>
                                                <div class="row" style="margin-top: 15px;">
                                                    <p style="text-align: justify; color: #333333; word-wrap: break-word; word-break: break-word"
                                                       class="comment-content">
                                                        <span ng-show="!item2.showUpdateSubComment"
                                                              style="margin-left: 15px; white-space: pre-line;"
                                                              ng-bind-html="item2.Comment.Content">
                                                        </span>
                                                    <div class="comment-form col-md-offset-2"
                                                         ng-show="item2.showUpdateSubComment">
                                                        <div class="input-item">
                                                            <div>
                                                                <div ng-repeat="itemImage in fileMgr.listFiles[item2.subComment.id+'update']"
                                                                     href="{{itemImage.imageUrl.imageUrl()}}"
                                                                     style="position: relative; width: 100px; height: 100px; margin: 3px; display: inline-block; float: left;">
                                                                    <label ng-click="fileMgr.remove(item2.subComment.id+'update', itemImage)"
                                                                           style="position: absolute; left: 5px; top: 5px; cursor: pointer;">
                                                                        <i class="fa fa-times-circle"></i>
                                                                    </label>
                                                                    <img src="/static/images/loading/loading.gif"
                                                                         style="width: 40px; height: 40px; position: absolute; top: 30px; left: 30px;"
                                                                         ng-if="itemImage.uploading"/>
                                                                    <img alt="image" onerror="ImgError(this);"
                                                                         style="width: 100px; height: 100px; object-fit: cover;"
                                                                         ng-src="{{itemImage.imageUrl.absoluteUrl()}}"/>
                                                                </div>
                                                            </div>
                                                            <textarea rows="10" class="form-control"
                                                                      ng-model="item2.commentEdit.content"
                                                                      ng-value="item2.subComment.content"
                                                                      placeholder="Nhập nội dung bình luận">
                                                                </textarea>
                                                        </div>
                                                        <div class="submit-comment foot-coment">
                                                                <span class="attach-image">
                                                                    <input type="file" accept="image/*"
                                                                           style="display: none;" class="attach-btn"
                                                                           file-input-id="{{item.comment.id+'update'}}"
                                                                           ng-file-change="fileMgr.selectFile">
                                                                    <a style="cursor: pointer;"
                                                                       ng-click="fileMgr.chooseFile(item.comment.id+'update')">
                                                                        <i class="fa fa-camera"></i></a>
                                                                </span>
                                                            <button class="btn btn-submit"
                                                                    ng-click="item2.showUpdateSubComment=!item2.showUpdateSubComment">
                                                                Hủy
                                                            </button>
                                                            <button class="btn btn-submit" style="margin-right: 5px;"
                                                                    ng-click="updateSubComment(item2,item); item2.showUpdateSubComment=!item2.showUpdateSubComment">
                                                                Lưu
                                                            </button>
                                                        </div>
                                                    </div>
                                                    </p>
                                                </div>
                                            </article>
                                        </li>
                                        <div class="comment-form col-md-offset-2" ng-if="${isLogin}  && !${isAdmin}">
                                            <div class="input-item">
                                                <div>
                                                    <div ng-repeat="itemImage in fileMgr.listFiles[item.comment.id]"
                                                         href="{{itemImage.imageUrl.imageUrl()}}"
                                                         style="position: relative; width: 100px; height: 100px; margin: 3px; display: inline-block; float: left;">
                                                        <label ng-click="fileMgr.remove(item.comment.id, itemImage)"
                                                               style="position: absolute; left: 5px; top: 5px; cursor: pointer;">
                                                            <i class="fa fa-times-circle"></i>
                                                        </label>
                                                        <img src="/static/images/loading/loading.gif"
                                                             style="width: 40px; height: 40px; position: absolute; top: 30px; left: 30px;"
                                                             ng-if="itemImage.uploading"/>
                                                        <img alt="image" onerror="ImgError(this);"
                                                             style="width: 100px; height: 100px; object-fit: cover;"
                                                             ng-src="{{itemImage.imageUrl.absoluteUrl()}}"/>
                                                    </div>
                                                </div>
                                                <textarea rows="10" class="form-control"
                                                          ng-model="item.commentTemp.content"
                                                          placeholder="Nhập nội dung bình luận"></textarea>
                                            </div>
                                            <div class="submit-comment foot-coment">
                                            <span class="attach-image">
                                                <input type="file" accept="image/*" class="attach-btn"
                                                       style="display: none;"
                                                       file-input-id="{{item.comment.id}}"
                                                       ng-file-change="fileMgr.selectFile">
                                                <a style="cursor: pointer;"
                                                   ng-click="fileMgr.chooseFile(item.comment.id)"><i
                                                        class="fa fa-camera"></i></a>
                                            </span>
                                                <button class="btn btn-submit" ng-click="createSubComment(item)">Gửi
                                                </button>
                                            </div>
                                        </div>
                                        <!-- /.comment-form -->
                                    </ul>
                                </li>
                            </ul>
                            <!-- .comment-form -->
                            <div class="comment-form" ng-if="${isLogin}  && !${isAdmin}">
                                <div class="input-item">
                                    <div>
                                        <div ng-repeat="itemImage in fileMgr.listFiles[postId]"
                                             href="{{itemImage.imageUrl.imageUrl()}}"
                                             style="position: relative; width: 100px; height: 100px; margin: 3px; display: inline-block; float: left;">
                                            <label ng-click="fileMgr.remove(postId, itemImage)"
                                                   style="position: absolute; left: 5px; top: 5px; cursor: pointer;">
                                                <i class="fa fa-times-circle"></i>
                                            </label>
                                            <img src="/static/images/loading/loading2.gif"
                                                 style="width: 40px; height: 40px; position: absolute; top: 30px; left: 30px;"
                                                 ng-if="itemImage.uploading"/>
                                            <img alt="image" onerror="ImgError(this);"
                                                 style="width: 100px; height: 100px; object-fit: cover;"
                                                 ng-src="{{itemImage.imageUrl.absoluteUrl()}}"/>
                                        </div>
                                    </div>
                                    <textarea rows="10" class="form-control" ng-model="dataComment.content"
                                              placeholder="Nhập nội dung bình luận"></textarea>
                                </div>
                                <div class="submit-comment foot-coment">
                                        <span class="attach-image">
                                            <input type="file" accept="image/*" style="display: none;"
                                                   class="attach-btn"
                                                   file-input-id="{{postId}}"
                                                   ng-file-change="fileMgr.selectFile">
                                            <a style="cursor: pointer;"
                                               ng-click="fileMgr.chooseFile(postId)">
                                                <i class="fa fa-camera"></i></a>
                                        </span>
                                    <button class="btn btn-submit" ng-click="createComment()">Gửi</button>
                                </div>
                            </div>
                        </div><!-- /.comment-form -->
                    </div><!-- /.comment -->
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    ngApp.controller('postdetailController', function ($scope, $http, fileManager) {
        $("#moi-nhat").removeClass("active");
        $scope.post = ${dataPostDetail};
        if($scope.post.post && $scope.post.post.images) {
            $scope.post.post.images = JSON.parse($scope.post.post.images)
        }
        $scope.runBaguetteBox = function () {
            setTimeout(function () {
                baguetteBox.run('.tz-gallery');
            }, 500)
        }
        $scope.runBaguetteBox();
        $scope.comments = [];
        $scope.subComments = [];
        $scope.dataComment = {};
        $scope.postId = $scope.post.post.id;
        $scope.fileMgr = {
            listFiles: [],
            chooseFile: function (id) {
                $("[file-input-id='" + id + "']").trigger("click");
            },
            selectFile: function () {
                var selector = $(event.target);
                var id = selector.attr("file-input-id");
                if (!$scope.fileMgr.listFiles[id]) {
                    $scope.fileMgr.listFiles[id] = [];
                }
                if ($scope.fileMgr.listFiles[id].length >= 1) {
                    alertSmallBox("Chỉ được chọn một ảnh trong mỗi bình luận!", error);
                    return;
                }
                for (var i = 0; i < selector[0].files.length; i++) {
                    var filePath = URL.createObjectURL(selector[0].files[i]);
                    var fileId = filePath.substring(filePath.length - 5, filePath.length);

                    $scope.fileMgr.listFiles[id].push({
                        id: fileId,
                        uploading: true,
                        imageUrl: filePath,
                        thumbnailUrl: filePath
                    })

                    fileManager.upload(selector[0].files[i], function (data) {
                        if (data.success) {
                            var imageUrl = data.data.images[0].image;
                            var thumbnailUrl = data.data.images[0].thumbnail;
                            $scope.fileMgr.uploadSuccess(id, fileId, imageUrl, thumbnailUrl);
                        } else {
                            $scope.fileMgr.remove(id, fileId);
                        }
                    }, function (data) {
                        $scope.fileMgr.remove(id, fileId);
                    });
                }
            },
            remove: function (id, item) {
                for (var i = 0; i < $scope.fileMgr.listFiles[id].length; i++) {
                    if ($scope.fileMgr.listFiles[id][i].id == item.id) {
                        $scope.fileMgr.listFiles[id].splice(i, 1);
                        break;
                    }
                }
            },
            uploadSuccess: function (id, fileId, imageUrl, thumbnailUrl) {
                for (var i = 0; i < $scope.fileMgr.listFiles[id].length; i++) {
                    if ($scope.fileMgr.listFiles[id][i].id == fileId) {
                        $scope.fileMgr.listFiles[id][i].imageUrl = imageUrl;
                        $scope.fileMgr.listFiles[id][i].thumbnailUrl = thumbnailUrl;
                        $scope.fileMgr.listFiles[id][i].uploading = false;
                        $scope.$apply();
                        break;
                    }
                }
            },
        }
        $scope.showLoading = function () {
            $("body").addClass("loading");
        }
        $scope.hideLoading = function () {
            $("body").removeClass("loading");
        }
        $scope.loadListComment = function (postId) {
            $http({
                method: 'GET',
                url: '/comment/search?page=1&size=10&postId=' + postId
            }).then(function successCallback(response) {
                if (response.data.success) {
                    $scope.comments = response.data.data.data;
//                    if ($scope.comments.length > 0) {
//                        var item = $scope.comments[0];
//                        if (item.comment.isSolution == 1) {
//                            $scope.currentSolution = item;
//                        }
//                    }
                }
            });
        }
        $scope.loadListComment($scope.postId);
        $scope.createComment = function () {
            var listImages = [];

            if ($scope.fileMgr.listFiles[$scope.postId]) {
                for (var i = 0; i < $scope.fileMgr.listFiles[$scope.postId].length; i++) {
                    if ($scope.fileMgr.listFiles[$scope.postId][i].uploading) {
                        alertSmallBox("Một số ảnh vấn đang được tải lên, vui lòng chờ");
                        return;
                    }
                    listImages.push($scope.fileMgr.listFiles[$scope.postId][i].imageUrl);
                }
            }
            $scope.dataComment.images = listImages.toString();
            if (!$scope.dataComment.content) {
                alertSmallBox("Vui lòng nhập nội dung bình luận")
                return;
            }
            if ($scope.dataComment.content && $scope.dataComment.content.length >= 2000) {
                alertSmallBox("Bình luận không được quá 2000 kí tự")
                return;
            }
            $scope.showLoading();
            $http({
                method: 'Post',
                url: '/comment/create',
                data: {
                    postId: $scope.postId,
                    comment: $scope.dataComment
                }
            }).then(function successCallback(response) {
                $scope.hideLoading();
                if (response.data.success) {
                    alertSmallBox("Gửi bình luận thành công!", success);
                    $scope.post.commentCount++;
                    if ($scope.post.commentCount < 0)
                        $scope.post.commentCount = 0;
                    ;
                    response.data.data.subCommentCount = 0;
                    $scope.dataComment = {};
                    $scope.loadListComment($scope.postId);
                    $scope.fileMgr.listFiles[$scope.postId] = [];
                }
            }, function () {
                $scope.hideLoading();
            });
        }
        $scope.deleteComment = function (item) {
            confirmDialog("Xác nhận!", "Bạn có chắc chắn muốn xóa bình luận này?", function () {
                $http({
                    method: 'DELETE',
                    url: '/comment/delete/' + item.comment.id,
                }).then(function successCallback(response) {
                    if (response.data.success) {
                        $scope.post.commentCount--;
                        if ($scope.post.commentCount < 0)
                            $scope.post.commentCount = 0;
                        var index = $scope.comments.indexOf(item);
                        if (index != -1) {
                            $scope.comments.splice(index, 1);
                        }
                    } else {
//                        alertSmallBox(response.data.message, error);
                    }
                });
            });
        }
        $scope.likePost = function () {
            if (!${isLogin}) {
                return;
            }
            $scope.post.isLiked = $scope.post.isLiked == 1 ? 0 : 1;
            if ($scope.post.isLiked == 1) {
                $scope.post.post.likeCount++;
            } else {
                if ($scope.post.post.likeCount <= 0)
                    $scope.post.post.likeCount = 0;
                else
                    $scope.post.post.likeCount--;
            }
            $http({
                method: 'Post',
                url: '/post/like/' + $scope.postId,
                data: {isLiked: $scope.post.isLiked}
            }).then(function successCallback(response) {

            });
        }
        $scope.followPost = function () {
            if (${isLogin}) {
                $scope.post.isFollowed = $scope.post.isFollowed ? 0 : 1;
                $http({
                    method: 'Post',
                    url: '/post/follow/' + $scope.postId,
                    data: {isFollowed: $scope.post.isFollowed}
                }).then(function successCallback(response) {

                });
            } else {
                location.href = '/dang-nhap?returnUrl=' + location.pathname
            }
        }
        $scope.commentAuthor = {
            avatar: function (item) {
                if (!item.author)
                    return "/static/images/Profile1.png";
                if ($scope.isAuthorPost() && item.author.thumbnail) {
                    return item.author.thumbnail.absoluteUrl()
                }
                if (item.author && item.author.id != $scope.post.author.id)
                    return item.author.thumbnail.absoluteUrl('/static/images/Profile1.png');

                if ($scope.post.post.isPrivate)
                    return "/static/images/Profile1.png";

                return '/static/images/Profile1.png';
            },
            fullName: function (item) {
                if (!item.author)
                    return "Ẩn danh";
                if ($scope.isAuthorPost()) {
                    return item.author.name;
                }
                if (item.author && item.author.id != $scope.post.author.id)
                    return item.author.name;

                if ($scope.post.post.isPrivate)
                    return "Ẩn danh";

                return item.author.name;
            },
            profileUrl: function (item) {
                if (!item.author)
                    return "javascript:void(0)";
                if ($scope.isAuthorPost())
                    return "/tai-khoan/" + item.author.id;
                if (item.author && item.author.id != $scope.post.author.id && item.author.role == 2) {
                    return "/bac-si/" + item.author.id;
                } else if (item.author && item.author.id != $scope.post.author.id)
                    return "/tai-khoan/" + item.author.id;

                if ($scope.post.post.isPrivate)
                    return "javascript:void(0)";
                return "/tai-khoan/" + item.author.id;
            }
        }
        $scope.showLayoutUpdateComment = function (item) {
            item.commentEdit = JSON.parse(JSON.stringify(item.comment));
            $scope.fileMgr.listFiles[item.comment.id + "update"] = [];
            if (item.comment.images) {
                $scope.fileMgr.listFiles[item.comment.id + "update"].push({
                    id: guid(),
                    uploading: false,
                    imageUrl: item.comment.images,
                    thumbnailUrl: item.comment.images
                });
            }
            item.showUpdateComment = true;
        }
        $scope.updateComment = function (item) {
            var listImages = [];

            if ($scope.fileMgr.listFiles[item.comment.id + "update"]) {
                for (var i = 0; i < $scope.fileMgr.listFiles[item.comment.id + "update"].length; i++) {
                    if ($scope.fileMgr.listFiles[item.comment.id + "update"][i].uploading) {
                        alertSmallBox("Một số ảnh vấn đang được tải lên, vui lòng chờ");
                        return;
                    }
                    listImages.push($scope.fileMgr.listFiles[item.comment.id + "update"][i].imageUrl);
                }
            }

            item.commentEdit.images = listImages.toString();
            item.commentEdit.id = item.comment.id;
            if (!item.commentEdit.content) {
                alertSmallBox("Vui lòng nhập nội dung bình luận")
                return;
            }
            if (item.commentEdit.content && item.commentEdit.content.length >= 2000) {
                alertSmallBox("Bình luận không được quá 2000 kí tự")
                return;
            }
            $scope.showLoading();
            $http({
                method: 'Post',
                url: '/comment/update/' + item.comment.id,
                data: {
                    comment: item.commentEdit
                }
            }).then(function successCallback(response) {
                $scope.hideLoading();
                if (response.data.success) {
                    item.showUpdateComment = false;
                    item.comment = item.commentEdit;
                    item.commentEdit = "{}";
                } else {
//                    alertSmallBox(response.data.message, error);
                }
            }, function () {
                $scope.hideLoading();
            });
        }
//        $scope.loadListSubComment = function (comment) {
//            $http({
//                method: 'GET',
//                url: '/service/post/getListSubComment/' + comment.comment.id
//            }).then(function successCallback(response) {
//                if (response.data.success) {
//                    comment.subComments = response.data.data;
//                    comment.isLoadingSubcomment = false;
//                }
//            });
//        }
        $scope.isAuthorPost = function () {
            if (!${isLogin})
                return false;
            return $scope.post.author.id == '${userId}';
        }
        $scope.postAuthor = {
            avatar: function () {
                if ($scope.isAuthorPost() && $scope.post.author.thumbnail)
                    return $scope.post.author.thumbnail.absoluteUrl()
                if ($scope.post.post.isPrivate)
                    return "/static/images/Profile1.png";
                return '/static/images/Profile1.png';
            },
            fullName: function () {
                if ($scope.isAuthorPost())
                    return $scope.post.author.name;
                if ($scope.post.post.isPrivate)
                    return "Ẩn danh";
                return $scope.post.author.name;
            },
            profileUrl: function () {
                if ($scope.isAuthorPost())
                    return "/tai-khoan/" + $scope.post.author.id;
                if ($scope.post.post.isPrivate)
                    return "javascript:void(0)";
                return "/tai-khoan/" + $scope.post.author.id;
            }
        }

        $scope.allowActionThisPost = function () {
            $scope.adminRole = '${adminRole}';
            if (!${isLogin})
                return false;
            if ('${userId}' == $scope.post.author.id)
                return true;
            if (($scope.adminRole & 4) == 4 &&${isAdmin})
                return true;
            return false;
        }
        $scope.allowActionThisComment = function (item) {
            if (!${isLogin})
                return false;
            if (item.author == null)
                return false;
//            if (item.comment.isSolution == 1)
//                return false;
            if ('${userId}' == item.author.id)
                return true;

            if (${isAdmin})
                return true;
            return false;
        }
        $scope.allowActionThisSubComment = function (item) {
            if (!${isLogin})
                return false;
            if ('${userId}' == item.author.id)
                return true;
            if (${isAdmin})
                return true;
            return false;
        }
        $scope.showLayoutUpdateSubComment = function (item2) {
            item2.commentEdit = JSON.parse(JSON.stringify(item2.subComment));
            $scope.fileMgr.listFiles[item2.subComment.id + "update"] = [];
            if (item2.subComment.imageUrls) {
                for (var i = 0; i < item2.subComment.imageUrls.length; i++) {
                    $scope.fileMgr.listFiles[item2.subComment.id + "update"].push({
                        id: guid(),
                        uploading: false,
                        imageUrl: item2.subComment.imageUrls[i],
                        thumbnailUrl: item2.subComment.thumbnailImageUrls[i]
                    });
                }
            }
            item2.showUpdateSubComment = true;
        }

        $scope.showSubComment = function (comment) {
            if (!comment.subComments)
                comment.subComments = [];
            if (comment.subComments && comment.subComments.length == comment.subCommentCount) {
                comment.isLoadingSubcomment = true;
                $scope.loadListSubComment(comment);
            }
            comment.showCmtSub = ((comment.subComments.length > 0 || ${isLogin} || comment.subComments.length != comment.subCommentCount) ? (!comment.showCmtSub) : (comment.showCmtSub));

        }
        $scope.checkShowListComment = function () {
            return $scope.comments.length > 0;
        }
        $scope.likeComment = function (item) {
            if (!${isLogin}) {
                return;
            }

            item.isLiked = item.isLiked == 1 ? 0 : 1;
            if (item.isLiked == 1) {
                item.likeCount++;
            } else {
                if (item.likeCount <= 0)
                    item.likeCount = 0;
                else
                    item.likeCount--;
            }
            $http({
                method: 'Post',
                url: '/service/post/likeComment/' + item.comment.id
            }).then(function successCallback(response) {

            });
        }
        $scope.likeSubComment = function (item2) {
            if (!${isLogin}) {
                return;
            }

            item2.isLiked = item2.isLiked == 1 ? 0 : 1;
            if (item2.isLiked == 1) {
                item2.likeCount++;
            } else {
                if (item2.likeCount <= 0)
                    item2.likeCount = 0;
                else
                    item2.likeCount--;
            }
            $http({
                method: 'Post',
                url: '/service/post/likeSubComment/' + item2.subComment.id
            }).then(function successCallback(response) {

            });
        }

        $scope.createSubComment = function (item) {
            if (!item.commentTemp)
                item.commentTemp = {};

            item.commentTemp.imageUrls = [];
            item.commentTemp.thumbnailImageUrls = [];

            if ($scope.fileMgr.listFiles[item.comment.id]) {
                for (var i = 0; i < $scope.fileMgr.listFiles[item.comment.id].length; i++) {
                    if ($scope.fileMgr.listFiles[item.comment.id][i].uploading) {
                        alertSmallBox("Một số ảnh vấn đang được tải lên, vui lòng chờ");
                        return;
                    }
                    item.commentTemp.imageUrls.push($scope.fileMgr.listFiles[item.comment.id][i].imageUrl);
                    item.commentTemp.thumbnailImageUrls.push($scope.fileMgr.listFiles[item.comment.id][i].thumbnailUrl);
                }
            }
            if (item.commentTemp.imageUrls.length == 0 && !item.commentTemp.content) {
                alertSmallBox("Vui lòng nhập nội dung bình luận")
                return;
            }
            if (item.commentTemp.content && item.commentTemp.content.length >= 2000) {
                alertSmallBox("Bình luận không được quá 2000 kí tự")
                return;
            }

            $scope.showLoading();

            $http({
                method: 'Post',
                url: '/service/post/createSubComment',
                data: {
                    commentId: item.comment.id,
                    subComment: item.commentTemp
                }
            }).then(function successCallback(response) {
                $scope.hideLoading();
                if (response.data.success) {
                    item.subCommentCount++;
                    if (item.subCommentCount < 0)
                        item.subCommentCount = 0;
                    item.commentTemp = {};
                    item.subComments.push(response.data.data);
                    $scope.fileMgr.listFiles[item.comment.id] = [];
                }
            }, function () {
                $scope.hideLoading();
            });
        }
        $scope.deletePost = function () {
            debugger
            if ($scope.post.author.role == 1)
                $scope.titleComfirm = "câu hỏi";
            if ($scope.post.author.role == 2)
                $scope.titleComfirm = "bài viết";
            confirmDialog("Xác nhận", "Bạn có chắc chắn muốn xóa " + $scope.titleComfirm + " này?", function () {
                $http({
                    method: 'DELETE',
                    url: '/post/delete/' + $scope.postId
                }).then(function successCallback(response) {
                    if (response.data.success) {
                        alertSmallBox("Xóa " + $scope.titleComfirm + " thành công", success);
                        setTimeout(function () {
                            location.href = '/tu-van-online/cau-hoi-cua-toi';
                        }, 1000);
                    } else {
                        alertSmallBox(response.data.message, error);
                    }
                });
            });
        }
        $scope.deleteSubComment = function (item2, item) {
            confirmDialog("Xác nhận!", "Bạn có chắc chắn muốn xóa bình luận này?", function () {
                $http({
                    method: 'DELETE',
                    url: '/service/post/deleteSubComment/' + item2.subComment.id
                }).then(function successCallback(response) {
                    if (response.data.success) {
                        alertSmallBox(response.data.data, success);
                        item.subCommentCount--;
                        if (item.subCommentCount < 0)
                            item.subCommentCount = 0;
                        var index = item.subComments.indexOf(item2);
                        if (index != -1)
                            item.subComments.splice(index, 1);
                    }
                    else
                        alertSmallBox(response.data.message, error);
                });
            });
        }
        $scope.updateSubComment = function (item2, item) {
            item2.commentEdit.imageUrls = [];
            item2.commentEdit.thumbnailImageUrls = [];

            if ($scope.fileMgr.listFiles[item2.subComment.id + "update"]) {
                for (var i = 0; i < $scope.fileMgr.listFiles[item2.subComment.id + "update"].length; i++) {
                    if ($scope.fileMgr.listFiles[item2.subComment.id + "update"][i].uploading) {
                        alertSmallBox("Một số ảnh vấn đang được tải lên, vui lòng chờ");
                        return;
                    }
                    item2.commentEdit.imageUrls.push($scope.fileMgr.listFiles[item2.subComment.id + "update"][i].imageUrl);
                    item2.commentEdit.thumbnailImageUrls.push($scope.fileMgr.listFiles[item2.subComment.id + "update"][i].thumbnailUrl);
                }
            }

            item2.commentEdit.Id = item2.subComment.id;
            item2.commentEdit.CreatedDate = item2.subComment.createdDate;
            item2.commentEdit.UpdatedDate = new Date().getTime();
            if (item2.commentEdit.imageUrls.length == 0 && !item2.commentEdit.content) {
                alertSmallBox("Vui lòng nhập nội dung bình luận")
                return;
            }
            if (item2.commentEdit.content && item2.commentEdit.content.length >= 2000) {

                alertSmallBox("Bình luận không được quá 2000 kí tự")
                return;
            }

            $scope.showLoading();
            $http({
                method: 'Post',
                url: '/service/post/updateSubComment/' + item2.subComment.id,
                data: {
                    subComment: item2.commentEdit
                }
            }).then(function successCallback(response) {
                $scope.hideLoading();
                if (response.data.success) {
                    item2.showUpdateSubComment = false;
                    alertSmallBox(response.data.data, success);
                    item2.subComment = item2.commentEdit;
                    item2.commentEdit = "{}";
                } else {
                    alertSmallBox(response.data.message, error);
                }
            }, function () {
                $scope.hideLoading();
            });
        }
        $scope.markAsSolutionExecute = function (item) {
            $http({
                method: 'Post',
                url: '/service/post/acceptAsSolution/' + item.comment.id
            }).then(function successCallback(response) {

            });
        }
        $scope.markAsSolution = function (item) {
            if (!$scope.isAuthorPost())
                return;
            if ($scope.currentSolution) {
                if (item != $scope.currentSolution) {
                    confirmDialog("Xác nhận!", "Bạn chỉ được chọn duy nhất một giải pháp.\nBạn có muốn chọn lại không?", function () {
                        item.comment.isSolution = 1;
                        $scope.currentSolution.comment.isSolution = 0;
                        $scope.currentSolution = item;
                        $scope.markAsSolutionExecute(item);
                    });
                } else {
                    confirmDialog("Xác nhận!", "Bạn có muốn bỏ chọn câu trả lời này làm giải pháp?", function () {
                        $scope.currentSolution.comment.isSolution = 0;
                        $scope.currentSolution = null;
                        $scope.markAsSolutionExecute(item);
                    });
                }
            } else {
                confirmDialog("Xác nhận!", "Bạn muốn chọn câu trả lời này là giải pháp?", function () {
                    $scope.currentSolution = item;
                    item.comment.isSolution = 1;
                    $scope.markAsSolutionExecute(item);
                });
            }
        }
        $scope.checkRoles = function () {
            if ($scope.post.firstDoctorCommentedDocTime) {
                alertSmallBox("Bạn không thể chỉnh sửa câu hỏi khi Bác sĩ đã trả lời");
                return;
            }
            if ($scope.post.author.role == 1) {
                location.href = '/sua-cau-hoi/' + $scope.post.post.linkAlias
            } else if ($scope.post.author.role == 2) {
                location.href = '/sua-bai-viet/' + $scope.post.post.linkAlias
            }
        }
        $scope.getPosition = function (user, department) {
            return getPositionDoctor(user, department)
        }
    });
</script>
<script>
    jQuery(document).ready(function () {
        $("#menu-online").addClass("current_page_item")
    });
</script>
