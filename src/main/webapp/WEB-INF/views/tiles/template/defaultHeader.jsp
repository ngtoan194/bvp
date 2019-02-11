<%--
  Created by IntelliJ IDEA.
  User: Nguyen Toan
  Date: 1/23/2018
  Time: 11:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<style>
    #google_translate_element, .goog-te-banner-frame.skiptranslate {
        display: none !important;
    }

    body {
        top: 0px !important;
        position: inherit !important;
    }


</style>
<header class="header">
    <div class="link-web">
        <div class="container notranslate">
            <ul class="link-web-destop">
                <li class="active">
                    <a href="http://123.24.206.9:8384/">
                        <span class="icon-icon-squarreicon"></span>{{'bệnh viện phổi trung ương' | translate }}
                    </a>
                </li>
                <li>
                    <a href="http://123.24.206.9:8884/">
                        <span class="icon-icon-squarreicon"></span>{{ 'hội lao và bệnh phổi việt nam' | translate }}
                    </a>
                </li>
                <li>
                    <a href="http://123.24.206.9:8484/">
                        <span class="icon-icon-squarreicon"></span>{{'chương trình chống lao quốc gia' | translate }}
                    </a>
                </li>
            </ul>

            <div class="btn-group link-web-mobile">
                <button type="button" class="form-control btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <a href="http://123.24.206.9:8384/">{{'bệnh viện phổi trung ương' | translate }}</a><span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li>
                        <a href="http://123.24.206.9:8884/">{{'hội lao và bệnh phổi việt nam' | translate }}</a>
                    </li>
                    <li>
                        <a href="http://123.24.206.9:8484/">{{'chương trình chống lao quốc gia' | translate }}</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="header-top" ng-controller="headerController">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <div class="header-logo">
                        <a href="/">
                            <img src="/static/images/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="header-contact">
                        <div class="language notranslate">
                            <a href="#" ng-repeat="item in langs"
                               class="link-language {{item.code==currentLang?'active':''}}"
                               ng-click="changeLang(item.code)">{{item.country}}</a>
                        </div>
                        <div class="hot-line">
                            Hotline: 0967 94 1616
                        </div>
                        <jsp:include page="/WEB-INF/views/pages/user/user/loginlogout.jsp"/>
                    </div>
                    <div class="header-search">
                        <div class="search-news">
                            <input type="text" class="form-control" placeholder="Tìm kiếm ">
                            <button><i class="fa fa-search"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/tiles/template/defaultMenu.jsp"/>
</header>
<script src="/static/js/angular/angular-translate.js" type="application/javascript"></script>
<script>
    ngApp.controller('headerController', ["$scope", function ($scope, httpRequest) {
        $scope.currentLang = GTranslateGetCurrentLang();
        $scope.$parent.changeLanguage($scope.currentLang);
        $scope.langs = [];
        $scope.langs.push({
            code: "vi",
            country: "VIE"
        })
        $scope.langs.push({
            code: "en",
            country: "ENG"
        })
        $scope.changeLang = function (lang) {
            $scope.currentLang = lang;
            doGTranslate('vi|' + lang);
            $scope.$parent.changeLanguage(lang);
        }

        $scope.urlHomeService = $scope.$parent.urlHomeServiceId;
        $scope.txtSearch = "";
        $scope.page = 1;
        $scope.size = 20;

        $scope.urlWeb = window.location.pathname;
        $scope.homeSearch = function () {
            if ($scope.urlWeb.startsWith("/tu-van-online")) {
                location.href = "/tu-van-online?q=" + $scope.txtSearch
            } else {
                location.href = "/tin-tuc?q=" + $scope.txtSearch;
            }

        };
        $scope.checkSearch = true;


    }]);
</script>
<div id="google_translate_element"></div>
<script type="text/javascript"
        src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<script type="text/javascript">
    function googleTranslateElementInit() {
        new google.translate.TranslateElement({pageLanguage: 'vi'}, 'google_translate_element');
    }
</script>


<script type="text/javascript">
    function GTranslateGetCurrentLang() {
        var keyValue = document['cookie'].match('(^|;) ?googtrans=([^;]*)(;|$)');
        return keyValue ? keyValue[2].split('/')[2] : "vi";
    }

    function GTranslateFireEvent(element, event) {
        try {
            if (document.createEventObject) {
                var evt = document.createEventObject();
                element.fireEvent('on' + event, evt)
            } else {
                var evt = document.createEvent('HTMLEvents');
                evt.initEvent(event, true, true);
                element.dispatchEvent(evt)
            }
        } catch (e) {
        }
    }

    function doGTranslate(lang_pair, tryagain) {
        if (lang_pair.value) lang_pair = lang_pair.value;
        if (lang_pair == '') return;
        var lang = lang_pair.split('|')[1];
        if (GTranslateGetCurrentLang() == null && lang == lang_pair.split('|')[0]) return;
        var teCombo;
        var sel = document.getElementsByTagName('select');
        for (var i = 0; i < sel.length; i++)
            if (/goog-te-combo/.test(sel[i].className)) {
                teCombo = sel[i];
                break;
            }
        if (document.getElementById('google_translate_element') == null || document.getElementById('google_translate_element').innerHTML.length == 0 || teCombo.length == 0 || teCombo.innerHTML.length == 0) {
            if (!tryagain)
                setTimeout(function () {
                    doGTranslate(lang_pair, true)
                }, 1000)
        } else {
            teCombo.value = lang;
            GTranslateFireEvent(teCombo, 'change');
            GTranslateFireEvent(teCombo, 'change')
        }
    }

    console.log(GTranslateGetCurrentLang());
</script>