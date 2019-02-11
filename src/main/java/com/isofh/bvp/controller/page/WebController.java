package com.isofh.bvp.controller.page;


import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.*;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.utils.ConvertUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

@Controller
public class WebController extends BaseController {

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public String homePage(ModelMap model) {
        model.addAttribute("pageTitle", "Trang chủ");
        return "home";
    }

    /**
     * @return Login page
     */
    @RequestMapping(value = {"/dang-nhap"}, method = RequestMethod.GET)
    public String loginPage(ModelMap model) {
        model.addAttribute("pageTitle", "Đăng nhập");
        return "login";
    }

    @RequestMapping(value = {"/dang-ky"}, method = RequestMethod.GET)
    public String registerPage(ModelMap model) {
        model.addAttribute("pageTitle", "Đăng ký");
        return "register";
    }

    /**
     * @return User page
     */
    @RequestMapping(value = {"/tai-khoan/{id}"}, method = RequestMethod.GET)
    public String getUserInfo(ModelMap model, @PathVariable String id) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new UserInfo().getUserByID(id);
        JsonObject objResult = new JsonObject();
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject dataUserInfo = data.getData();
            JsonObject temp = ConvertUtils.toJsonObject(dataUserInfo.get("user"));
            JsonObject tempDepartment = ConvertUtils.toJsonObject(dataUserInfo.get("department"));
            objResult.addProperty("success", true);
            objResult.add("data", temp);
            model.addAttribute("dataDepartment", new Gson().toJson(tempDepartment));
            model.addAttribute("dataUserInfo", new Gson().toJson(temp));
            JsonObject temp2 = ConvertUtils.toJsonObject(dataUserInfo.get("user"));
            model.addAttribute("pageTitle", "Tài khoản " + ConvertUtils.toString(temp2.get("nickname")));
            model.addAttribute("isMyProfile", id.equals(UserInfo.getCurrentUserId()));
            return "user-info";
        } else {
            return "page404";
        }
    }

    @RequestMapping(value = {"/bac-si/{userId1}"}, method = RequestMethod.GET)
    public String getDoctorInfo(ModelMap model, @PathVariable String userId1) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new UserInfo().getUserByID(userId1);
        JsonObject objResult = new JsonObject();
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject dataUserInfo = data.getData();
            JsonObject temp = ConvertUtils.toJsonObject(dataUserInfo.get("user"));
            JsonObject tempDepartment = ConvertUtils.toJsonObject(dataUserInfo.get("department"));
            objResult.addProperty("success", true);
            objResult.add("data", temp);
            model.addAttribute("dataDepartment", new Gson().toJson(tempDepartment));
            model.addAttribute("dataUserInfo", new Gson().toJson(temp));
            JsonObject temp2 = ConvertUtils.toJsonObject(dataUserInfo.get("user"));
            model.addAttribute("pageTitle", "Thông tin bác sĩ");
            model.addAttribute("isMyProfile", userId1.equals(UserInfo.getCurrentUserId()));
            return "doctor-info";
        } else {
            return "page404";
        }
    }

    @RequestMapping(value = {"/quen-mat-khau"}, method = RequestMethod.GET)
    public String forgotPassword(ModelMap model) {
        model.addAttribute("pageTitle", "Quên mật khẩu");
        return "forgot-password";
    }

    /**
     * @param model
     * @param tokenId
     * @return Doi mat khau khi quen
     * @throws SocketTimeoutException
     * @throws UnknownHostException
     */
    @RequestMapping(value = "/activate/recovery/{tokenId}", method = RequestMethod.GET)
    public String updatePassword(ModelMap model, @PathVariable String tokenId) throws SocketTimeoutException, UnknownHostException {
        model.addAttribute("pageTitle", "Đổi mật khẩu");
        ServiceReturnEntity<JsonObject> data = new UserInfo().getTokenPasswordInfo(tokenId);
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject temp = data.getData();
            JsonObject user = ConvertUtils.toJsonObject(temp.get("user"));
            String token = ConvertUtils.toString(temp.get("token"));
            model.addAttribute("user", user);
            model.addAttribute("token", token);
            return "recovery-pasword";
        } else {
            return "page404";
        }
    }

    /**
     * @return Error page
     */
    @RequestMapping(value = {"/404"}, method = RequestMethod.GET)
    public String page404(ModelMap model) {
        model.addAttribute("pageTitle", "Tài nguyên không tồn tài");
        return "page404";
    }

    @RequestMapping(value = "/updating-page", method = RequestMethod.GET)
    public String updatingPage(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Nội dung đang được cập nhật");
        return "updating-page";
    }

    /**
     * @param model
     * @return khoa hoc
     */
    @RequestMapping(value = {"/khoa-hoc"}, method = RequestMethod.GET)
    public String course(ModelMap model) {
        model.addAttribute("pageTitle", "KHÓA HỌC TRỰC TUYẾN");
        return "course";
    }

    /**
     * @param model
     * @param linkAlias lien ket de tim den giao luu truc tuyen
     * @return chi tiet giao luu truc tuyen
     * @throws UnknownHostException
     * @throws SocketTimeoutException
     */
    @RequestMapping(value = {"/giao-luu-truc-tuyen/{linkAlias:.+}"}, method = RequestMethod.GET)
    public String exchangePage(ModelMap model, @PathVariable String linkAlias) throws UnknownHostException, SocketTimeoutException {
        ServiceReturnEntity<JsonObject> data = new OnlineExchangeInfo().getByAlias(linkAlias);
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject onlineExchange = ConvertUtils.toJsonObject(data.getData().get("onlineExchange"));
            JsonArray doctors = ConvertUtils.toJsonArray(data.getData().get("doctors"));
            model.addAttribute("onlineExchange", onlineExchange);
            model.addAttribute("doctors", doctors);
            model.addAttribute("pageTitle", ConvertUtils.toString(onlineExchange.get("topic")));
            return "online-exchange";
        } else {
            return "page404";
        }
    }

    /**
     * @return thu vien anh
     */
    @RequestMapping(value = {"/thu-vien-anh"}, method = RequestMethod.GET)
    public String albumPage(ModelMap model) {
        model.addAttribute("pageTitle", "Thư viện ảnh");
        return "album";
    }

    @RequestMapping(value = {"/thu-vien-anh/{alias:.+}"}, method = RequestMethod.GET)
    public String albumDetailPage(ModelMap model, @PathVariable String alias) throws UnknownHostException, SocketTimeoutException {
        ServiceReturnEntity<JsonObject> data = new AlbumInfo().getByAlias(alias);
        JsonObject objResult = new JsonObject();
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject dataAlbumDetail = data.getData();
            JsonObject temp = ConvertUtils.toJsonObject(dataAlbumDetail.get("album"));
            objResult.addProperty("success", true);
            objResult.add("data", temp);
            model.addAttribute("dataAlbumDetail", new Gson().toJson(temp));
            model.addAttribute("pageTitle", "Thư viện ảnh " + ConvertUtils.toString(temp.get("name")));
            return "album-detail";
        } else {
            return "album";
        }
    }

    /**
     * @return Van ban/Tai lieu
     */
    @RequestMapping(value = "/van-ban/van-ban-quy-pham-phap-luat", method = RequestMethod.GET)
    public String vanbanquyphamphapluat(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Văn bản quy phạm pháp luật");
        return "text";
    }

    @RequestMapping(value = "/van-ban/van-ban-quy-pham-phap-luat/hien-phap", method = RequestMethod.GET)
    public String hienphap(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Hiến pháp");
        return "text";
    }

    @RequestMapping(value = "/van-ban/van-ban-quy-pham-phap-luat/sac-lenh-sac-luat", method = RequestMethod.GET)
    public String saclenhsachluat(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Sắc lệnh - Sắc luật");
        return "text";
    }

    @RequestMapping(value = "/van-ban/van-ban-quy-pham-phap-luat/luat-phap-lenh", method = RequestMethod.GET)
    public String luatphaplenh(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Luật - Pháp lệnh");
        return "text";
    }

    @RequestMapping(value = "/van-ban/van-ban-quy-pham-phap-luat/nghi-dinh", method = RequestMethod.GET)
    public String nghidinh(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Nghị định");
        return "text";
    }

    @RequestMapping(value = "/van-ban/van-ban-quy-pham-phap-luat/quyet-dinh", method = RequestMethod.GET)
    public String quyetdinh(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Quyết định");
        return "text";
    }

    @RequestMapping(value = "/van-ban/van-ban-quy-pham-phap-luat/thong-tu", method = RequestMethod.GET)
    public String thongtu(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Thông tư");
        return "text";
    }

    @RequestMapping(value = "/van-ban/van-ban-noi-bo", method = RequestMethod.GET)
    public String vanbannoibo(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Văn bản nội bộ");
        return "text";
    }

    @RequestMapping(value = "/van-ban/van-ban-noi-bo/quyet-dinh", method = RequestMethod.GET)
    public String quyetdinh2(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Quyết dịnh");
        return "text";
    }

    @RequestMapping(value = "/van-ban/van-ban-noi-bo/thong-bao", method = RequestMethod.GET)
    public String thongbao(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Thông báo");
        return "text";
    }

    @RequestMapping(value = "/van-ban/van-ban-noi-bo/ke-hoach", method = RequestMethod.GET)
    public String kehoach(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Kế hoạch");
        return "text";
    }

    @RequestMapping(value = "/van-ban/van-ban-noi-bo/bao-cao", method = RequestMethod.GET)
    public String baocao(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Báo cáo");
        return "text";
    }

    @RequestMapping(value = "/van-ban/van-ban-noi-bo/cong-van", method = RequestMethod.GET)
    public String congvan(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Công văn");
        return "text";
    }

    @RequestMapping(value = "/van-ban/van-ban-noi-bo/cac-van-ban-khac", method = RequestMethod.GET)
    public String cacvanbankhac(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Các văn bản khác");
        return "text";
    }

    @RequestMapping(value = "/tai-lieu", method = RequestMethod.GET)
    public String pageDocument(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Tài liệu");
        return "document";
    }

    @RequestMapping(value = "/tai-lieu/tai-lieu-chuyen-nganh", method = RequestMethod.GET)
    public String tailieuchuyennganh(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Tài liệu chuyên ngành");
        return "document";
    }


    @RequestMapping(value = "/tai-lieu/nghien-cuu-khoa-hoc", method = RequestMethod.GET)
    public String nghiencuukhoahoc(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Nghiên cứu khoa học");
        return "document";
    }

    @RequestMapping(value = "/tai-lieu/nghien-cuu-khoa-hoc/khoa-hoc", method = RequestMethod.GET)
    public String khoahoc(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Tài liệu - Nghiên cứu khoa học - Khoa học");
        return "document";
    }

    @RequestMapping(value = "/tai-lieu/nghien-cuu-khoa-hoc/nghien-cuu-benh-li", method = RequestMethod.GET)
    public String nghiencuubenhli(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Tài liệu - Nghiên cứu khoa học - Nghiên cứu bệnh lí");
        return "document";
    }

    @RequestMapping(value = "/tai-lieu/tap-chi-lao-va-benh-phoi", method = RequestMethod.GET)
    public String tapchilaovabenhphoi(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Tạp chí lao và bệnh phổi");
        return "document";
    }

    @RequestMapping(value = "/tai-lieu/tap-chi-lao-va-benh-phoi/benh-lao-tre-em-va-cach-phong-tranh", method = RequestMethod.GET)
    public String benhlaophongtranh(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Nghiên cứu khoa học - Bệnh lao trẻ em và cách phòng tránh");
        return "document";
    }

    @RequestMapping(value = "/tai-lieu/tap-chi-lao-va-benh-phoi/benh-lao-khang-thuoc", method = RequestMethod.GET)
    public String benhlaokhangthuoc(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Nghiên cứu khoa học - Bệnh lao kháng thuốc");
        return "document";
    }

    @RequestMapping(value = "/tai-lieu/{linkAlias:.+}", method = RequestMethod.GET)
    public String pageDocumentDetail(@PathVariable String linkAlias, ModelMap modelMap) throws UnknownHostException, SocketTimeoutException {
        ServiceReturnEntity<JsonObject> data = new DocumentInfo().getByAlias(linkAlias);
        JsonObject objResult = new JsonObject();
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject document = ConvertUtils.toJsonObject(data.getData().get("document"));
            JsonObject menu = ConvertUtils.toJsonObject(data.getData().get("menu"));
            objResult.addProperty("success", true);
            objResult.add("data", document);
            modelMap.addAttribute("dataDocument", new Gson().toJson(document));
            modelMap.addAttribute("dataMenu", new Gson().toJson(menu));
            modelMap.addAttribute("pageTitle", ConvertUtils.toString(document.get("name")));
            return "document-detail";
        }
        return "page404";
    }

    /**
     * @param linkAlias link page
     * @return page
     * @throws SocketTimeoutException
     * @throws UnknownHostException
     */
    @RequestMapping(value = {"/page/{linkAlias:.+}", "/page-file/{linkAlias:.+}"}, method = RequestMethod.GET)
    public String getDetailPage(@PathVariable String linkAlias,
                                ModelMap model) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new PageInfo().getByAlias(linkAlias);
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject dataPage = ConvertUtils.toJsonObject(data.getData().get("page"));
            model.addAttribute("dataPage", dataPage);
            if (dataPage.get("type").getAsInt() == 1) {
                model.addAttribute("pageTitle", "Page - " + ConvertUtils.toString(dataPage.get("name")));
            } else if (dataPage.get("type").getAsInt() == 2) {
                model.addAttribute("pageTitle", "Khoa phòng " + ConvertUtils.toString(dataPage.get("name")));
            } else if (dataPage.get("type").getAsInt() == 3) {
                model.addAttribute("pageTitle", "Page - file " + ConvertUtils.toString(dataPage.get("name")));
            }
            return "page-detail";
        }
        return "page404";
    }

    /**
     * @return tag page
     */
    @RequestMapping(value = "/tu-khoa", method = RequestMethod.GET)
    public String tagPage(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "Từ khóa");
        return "tags";
    }

    /**
     * @return video page
     */
    @RequestMapping(value = {"/video"}, method = RequestMethod.GET)
    public String videoPage(ModelMap model) {
        model.addAttribute("pageTitle", "Video");
        return "video";
    }

    @RequestMapping(value = {"/video/{linkAlias:.+}"}, method = RequestMethod.GET)
    public String getDetailPage2(@PathVariable String linkAlias,
                                 ModelMap model) throws SocketTimeoutException, UnknownHostException {
        ServiceReturnEntity<JsonObject> data = new VideoInfo().getByAlias(linkAlias);
        if (data.getCode() == 0 && data.getData() != null) {
            JsonObject dataVideo = ConvertUtils.toJsonObject(data.getData().get("video"));
            model.addAttribute("dataVideo", dataVideo);
            model.addAttribute("pageTitle", ConvertUtils.toString(dataVideo.get("name")));
            return "video-detail";
        }
        return "page404";
    }

    /**
     *
     * @return trang lien he
     */
    @RequestMapping(value = {"/lien-he"},method = RequestMethod.GET)
    public String lienHe( ModelMap model){
        model.addAttribute("pageTitle", "Liên hệ");
        return "lien-he";
    }
}
