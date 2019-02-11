<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-page">
    <div class="detail-page">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-12">
                    <div class="menu-left">
                        <jsp:include page="/WEB-INF/views/pages/user/news/list-hot-news.jsp"/>
                    </div>
                </div>
                <div class="col-md-9 col-sm-12">
                    <ul class="breadcrumb">
                        <li><a href="#">Giới thiệu</a></li>
                        <li><a href="/gioi-thieu-chung">Giới thiệu bệnh viện</a></li>
                        <li class="active"><a href="/lien-he">Liên hệ</a></li>
                    </ul>
                    <div class="content-detail">
                        <div class="title-page">
                            <h2 class="title-main">---LIÊN HỆ BỆNH VIỆN---</h2>
                            <div class="detail-inner">
                                <div id="google_map_53576f8a1181e" class="google_map fullwidth">
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14894.955288456822!2d105.8143116!3d21.0431339!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa889b563318408b2!2zQuG7h25oIHZp4buHbiBQaOG7lWkgVHJ1bmcgxrDGoW5n!5e0!3m2!1svi!2s!4v1511250201722" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
                                </div>
                                <h2 style="padding-top: 10px;">THÔNG TIN LIÊN HỆ</h2>
                                <h3 style="text-align: left;margin-left: 18px;font-size: 22px;">BỆNH VIỆN PHỔI TRUNG ƯƠNG</h3>
                                <p style="padding-left: 20px;">
                                    Địa chỉ: 463 Hoàng Hoa Thám - Ba Đình - Hà Nội<br>
                                    Điện thoại: 024.38326249<br>
                                    <%--Fax: 024.38326249<br>--%>
                                    Email: bvptw@bvptw.org<br>
                                    Website: http://bvptw.org/<br>
                                   <span style="word-wrap:break-word;">Facebook: https://www.facebook.com/benhvienphoitrunguong/<br></span>
                                    Cám ơn Quý khách đã ghé thăm website Bệnh viện Phổi Trung ương.<br>
                                    Mọi thông tin phản hồi xin liên hệ với chúng tôi theo địa chỉ trên.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    jQuery(document).ready(function () {
        $("#menu-introduce").addClass("awemenu-active-trail")
    });
</script>