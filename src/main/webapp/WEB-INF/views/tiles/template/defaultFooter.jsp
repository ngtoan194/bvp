<%--
  Created by IntelliJ IDEA.
  User: Nguyen Toan
  Date: 1/23/2018
  Time: 11:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="footer">
    <div class="scrollup" ><img src="/static/images/scroll-up-btn.png" alt=""></div>
    <div class="footer-top">
        <div class="container">
            <jsp:include page="/WEB-INF/views/pages/user/home/online-counter.jsp"/>
            <div class="footer-link">
                <div class="link-footer footer-contact">
                    <div class="footer-title notranslate">{{'Bệnh viện phổi trung ương'|translate}}</div>
                    <div class="row">
                        <div class="col-md-7 col-sm-6">
                            <a href="/lien-he" style="margin-left: -4px; float:left"><img src="/static/images/address-icon.png" alt=""></a>
                            <p class="pl-20">
                                <a href="/lien-he">Cổng số 1: Số 463 Hoàng Hoa Thám - Ba Đình - Hà Nội</a>
                            </p>
                            <p class="pl-20">
                                <a href="/lien-he">Cổng số 2: Số 2A phố Đội Nhân - Ba Đình - Hà Nội</a>
                            </p>
                        </div>
                        <div class="col-md-5 col-sm-6">
                            <p><img src="/static/images/phone-icon.png" alt=""><a href="tel:02438326249">
                                Điện thoại: 024.38326249</a></p>
                            <p><img src="/static/images/mail-icon.png" alt=""><a href="mailto:bvptw@gmail.com">
                                Email: bvptw@gmail.com</a></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-social d-block">
                <a target="_blank" href="https://www.facebook.com/benhvienphoitrunguong/" class="icon-social">
                    <i class="fa fa-facebook icon"></i></a>
                <a href="#" class="icon-social"><i class="fa fa-google-plus-official"></i></a>
                <a target="_blank" href="https://www.youtube.com/channel/UCY4hewvqcQNzE-WkHvYqIfQ"
                   class="icon-social"><i class="fa fa-youtube-play"></i></a>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <p class=" notranslate">{{'Bản quyền thuộc về bệnh viện phổi trung ương'|translate}}</p>
            <p>Một sản phẩm của isofh</p>
        </div>
    </div>
</footer>