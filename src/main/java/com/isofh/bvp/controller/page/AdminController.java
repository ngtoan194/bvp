package com.isofh.bvp.controller.page;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.isofh.bvp.controller.base.BaseController;
import com.isofh.bvp.dataaccess.ContributeInfo;
import com.isofh.bvp.dataaccess.PageInfo;
import com.isofh.bvp.dataaccess.UserInfo;
import com.isofh.bvp.models.ServiceReturnEntity;
import com.isofh.utils.ConvertUtils;
import com.isofh.utils.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.net.SocketTimeoutException;
import java.net.UnknownHostException;

@Controller
@RequestMapping(value = "/admin")
public class AdminController extends BaseController {

    @RequestMapping(value = {"/", ""})
    public String home(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "ADMIN - BỆNH VIỆN PHỔI");
        return "admin-home";
    }

    @RequestMapping(value = "/table", method = RequestMethod.GET)
    public String adminTable(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "ADMIN - BỆNH VIỆN PHỔI");
        return "admin-table";
    }

    @RequestMapping(value = "/form", method = RequestMethod.GET)
    public String adminForm(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "ADMIN - BỆNH VIỆN PHỔI");
        return "admin-form";
    }

    /**
     * @return Quản lý menu
     */
    @RequestMapping(value = "/quan-ly-menu", method = RequestMethod.GET)
    public String mgrMenu(ModelMap modelMap) {
        modelMap.addAttribute("pageTitle", "ADMIN - QUẢN LÝ MENU");
        return "admin-menu";
    }

    @RequestMapping(value = "/quan-ly-menu2", method = RequestMethod.GET)
    public String mgrSubMenu(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ MENU CẤP 2");
        return "admin-submenu";
    }

    @RequestMapping(value = "/quan-ly-menu3", method = RequestMethod.GET)
    public String mgrSubMenu2(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ MENU CẤP 3");
        return "admin-submenu2";
    }

    @RequestMapping(value = "/tin-tuc", method = RequestMethod.GET)
    public String mgrNews(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ TIN TỨC");
        return "admin-news";
    }

    @RequestMapping(value = "/tin-tuc-hoi-lao", method = RequestMethod.GET)
    public String mgrAddNews(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - DANH SÁCH TIN HỘI LAO");
        return "admin-news-hoi-lao";
    }

    /**
     * @return Quản lý tài khoản
     */
    @RequestMapping(value = "/nguoi-dung", method = RequestMethod.GET)
    public String mgrUser(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ TÀI KHOẢN NGƯỜI DÙNG");
        return "admin-user";
    }

    @RequestMapping(value = "/bac-si", method = RequestMethod.GET)
    public String mgrDoctor(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ TÀI KHOẢN BÁC SĨ");
        return "admin-doctor";
    }

    @RequestMapping(value = "/chuc-vu", method = RequestMethod.GET)
    public String mgrPosition(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ CHỨC VỤ");
        return "admin-position";
    }

    @RequestMapping(value = "/quan-ly/admin", method = RequestMethod.GET)
    public String mgrAdmin(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ TÀI KHOẢN ADMIN");
        return "admin-admin";
    }

    /**
     * @return Quản lý từ khóa
     */
    @RequestMapping(value = "/tu-khoa", method = RequestMethod.GET)
    public String mgrTag(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ TỪ KHÓA");
        return "admin-tag";
    }

    /**
     * @return Dịch song ngữ
     */
    @RequestMapping(value = "/dich-song-ngu")
    public String dictionary(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ DỊCH SONG NGỮ");
        return "admin-dictionary";
    }

    /**
     * @return Quản lý dịch vụ tại bênh viện
     */
    @RequestMapping(value = "/dich-vu-tai-benh-vien")
    public String mgrHospitalUtility(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ DỊCH VỤ BỆNH VIỆN");
        return "admin-hospital-utility";
    }

    /**
     * @return Quản lý slide, slide item, slide place
     */
    @RequestMapping(value = "/slide", method = RequestMethod.GET)
    public String adminMgrSlide(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ SLIDE");
        return "mgr-slide";
    }

    @RequestMapping(value = "/slide-item", method = RequestMethod.GET)
    public String adminMgrSlideItem(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ SLIDE ITEM");
        return "mgr-slide-item";
    }

    @RequestMapping(value = {"/slide-place"}, method = RequestMethod.GET)
    public String mgrSlide(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ SLIDE PLACE");
        return "mgr-slide-place";
    }

    /**
     * @return Quan ly khoa hoc
     */
    @RequestMapping(value = "/khoa-hoc", method = RequestMethod.GET)
    public String adminMgrCourse(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ KHÓA HỌC");
        return "admin-course";
    }

    @RequestMapping(value = "/bai-hoc", method = RequestMethod.GET)
    public String adminMgrCourseIem(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ BÀI HỌC");
        return "admin-course-item";
    }

    /**
     * @return Quan ly giao luu truc tuyen
     */
    @RequestMapping(value = "/giao-luu-truc-tuyen", method = RequestMethod.GET)
    public String adminOnlineExchange(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ GIAO LƯU TRỰC TUYẾN");
        return "admin-online-exchange";
    }

    @RequestMapping(value = "/giao-luu-truc-tuyen/danh-sach-cau-hoi", method = RequestMethod.GET)
    public String adminOnlineExchangeQuestion(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ CÂU HỎI GIAO LƯU TRỰC TUYẾN");
        return "admin-online-exchange-question";
    }

    /**
     * @return Quan ly video
     */
    @RequestMapping(value = "/video", method = RequestMethod.GET)
    public String adminMgrVideo(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ VIDEO");
        return "admin-video";
    }

    /**
     * @return Quan ly album
     */
    @RequestMapping(value = "/thu-vien-anh", method = RequestMethod.GET)
    public String adminMgrAlbum(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ THƯ VIỆN");
        return "admin-album";
    }


    /**
     * @return Quan ly tai lieu
     */
    @RequestMapping(value = "/tai-lieu", method = RequestMethod.GET)
    public String adminMgrDocument(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ TÀI LIỆU");
        return "admin-document";
    }

    /**
     * @return Quan ly web link
     */
    @RequestMapping(value = "/web-link", method = RequestMethod.GET)
    public String adminMgrWebLink(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ WEB LINK");
        return "mgr-web-link";
    }

    /**
     * @return Quan ly page
     */
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    public String adminMgrPage(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ PAGE");
        return "mgr-page";
    }

    @RequestMapping(value = "/quan-ly/them-loai-tin-tuc", method = RequestMethod.GET)
    public String adminAddPageNews(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ PAGE");
        JsonObject dataPage = new JsonObject();
        model.addAttribute("dataPage", ConvertUtils.toJson(dataPage));
        return "mgr-add-page-type-news";
    }

    @RequestMapping(value = "/quan-ly/sua-page-tin-tuc/{id}", method = RequestMethod.GET)
    public String adminEditPageNews(@PathVariable String id, ModelMap model) throws UnknownHostException, SocketTimeoutException {
        JsonObject dataPage = new JsonObject();
        if (!StringUtils.isNullOrWhiteSpace(id)) {
            ServiceReturnEntity<JsonObject> data = new PageInfo().getDetail(id);
            if (data.getCode() == 0 && data.getData() != null) {
                JsonObject temp = ConvertUtils.toJsonObject(data.getData());
                dataPage = ConvertUtils.toJsonObject(temp.get("page"));
            } else {
                return "page404";
            }
        }
        model.addAttribute("pageTitle", "ADMIN - SỬA KHOA PHÒNG");
        model.addAttribute("dataPage", ConvertUtils.toJson(dataPage));
        return "mgr-add-page-type-news";
    }

    @RequestMapping(value = "/quan-ly/them-khoa-phong", method = RequestMethod.GET)
    public String adminKhoaPhong(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - THÊM MỚI KHOA PHÒNG");
        JsonObject dataPage = new JsonObject();
        JsonObject dataUser = new JsonObject();
        model.addAttribute("dataPage", ConvertUtils.toJson(dataPage));
        model.addAttribute("dataUser", ConvertUtils.toJson(dataUser));
        return "mgr-add-page";
    }

    @RequestMapping(value = "/quan-ly/sua-khoa-phong/{id}", method = RequestMethod.GET)
    public String adminEditKhoaPhong(@PathVariable String id, ModelMap model) throws UnknownHostException, SocketTimeoutException {
        JsonObject dataPage = new JsonObject();
        if (!StringUtils.isNullOrWhiteSpace(id)) {
            ServiceReturnEntity<JsonObject> data = new PageInfo().getDetail(id);
            ServiceReturnEntity<JsonObject> dataUser = new UserInfo().search("1", "999999", "", "", "", "", "1", "", "", "", "", "", "");
            if (data.getCode() == 0 && data.getData() != null && dataUser.getCode() == 0 && dataUser.getData() != null) {
                JsonObject temp = ConvertUtils.toJsonObject(data.getData());
                dataPage = ConvertUtils.toJsonObject(temp.get("page"));
                JsonArray listUser = ConvertUtils.toJsonArray(dataUser.getData().get("data"));
                JsonArray listUser2 = new JsonArray();
                for (int i = 0; i < listUser.size(); i++) {
                    JsonObject json = ConvertUtils.toJsonObject(listUser.get(i));
                    listUser2.add(ConvertUtils.toJsonObject(json.get("user")));
                }
                model.addAttribute("dataUser", ConvertUtils.toJson(listUser2));
            } else {
                return "page404";
            }
        }
        model.addAttribute("pageTitle", "ADMIN - SỬA KHOA PHÒNG");
        model.addAttribute("dataPage", ConvertUtils.toJson(dataPage));
        return "mgr-add-page";
    }

    @RequestMapping(value = "/page/hoat-dong", method = RequestMethod.GET)
    public String adminMgrPageNews(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ HOẠT ĐỘNG KHOA PHÒNG");
        return "mgr-page-news";
    }

    @RequestMapping(value = "/page/album", method = RequestMethod.GET)
    public String adminMgrPageAlbum(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - QUẢN LÝ ALBUM ẢNH KHOA PHÒNG");
        return "mgr-page-album";
    }

    /**
     * @return Quan ly Goc tri an
     */
    @RequestMapping(value = "/goc-tri-an", method = RequestMethod.GET)
    public String adminMgrContribute(ModelMap model) {
        model.addAttribute("pageTitle", "AMDIN - QUẢN LÝ GÓC TRI ÂN");
        return "mgr-contribute";
    }

    @RequestMapping(value = "/goc-tri-an/them-moi", method = RequestMethod.GET)
    public String adminMgrAddContribute(ModelMap model) {
        model.addAttribute("pageTitle", "ADMIN - THÊM MỚI GÓC TRI ÂN");
        JsonObject dataContribute = new JsonObject();
        model.addAttribute("dataContribute", ConvertUtils.toJson(dataContribute));
        return "mgr-add-contribute";
    }

    @RequestMapping(value = "/goc-tri-an/sua-goc-tri-an/{id}", method = RequestMethod.GET)
    public String adminMgrEditContribute(@PathVariable String id, ModelMap model) throws UnknownHostException, SocketTimeoutException {
        JsonObject dataContribute = new JsonObject();
        if (!StringUtils.isNullOrWhiteSpace(id)) {
            ServiceReturnEntity<JsonObject> data = new ContributeInfo().getDetail(id);
            if (data.getCode() == 0 && data.getData() != null) {
                dataContribute = ConvertUtils.toJsonObject(data.getData());
            } else {
                return "page404";
            }
        }
        model.addAttribute("pageTitle", "ADMIN - SỬA KHOA PHÒNG");
        model.addAttribute("dataContribute", ConvertUtils.toJson(dataContribute));
        return "mgr-add-contribute";
    }

}
