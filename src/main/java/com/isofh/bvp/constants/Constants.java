package com.isofh.bvp.constants;

public class Constants {

    public class Resources {
        public static final String ERROR = "Lỗi!";

        public class Message {
            public class Post {
                public static final String LOADING_POSTS_ERROR = "Không tải được bài viết";
                public static final String USER_CREATE_POST_SUCCESS = "Đặt câu hỏi thành công, câu hỏi của bạn cần được Admin phê duyệt";
                public static final String UPDATE_POST_SUCCESS = "Chỉnh sửa thành công";
                public static final String CREATE_POST_ERROR = "Tạo bài viết không thành công";
                public static final String CREATE_QUESTION_ERROR = "Đặt câu hỏi không thành công";
                public static final String EDIT_POST_ERROR = "Chỉnh sửa không thành công";
                public static final String DOCTOR_CREATE_POST_SUCCESS = "Tạo bài viết thành công, bài viết của bạn cần được Admin phê duyêt";
                public static final String ASSIGN_SUCCESS = "Duyệt câu hỏi thành công!";
                public static final String ASSIGN_ERROR = "Duyệt câu hỏi không thành công!";
                public static final String DELETE_SUCCESS = "Duyệt câu hỏi không thành công!";
                public static final String DELETE_ERROR = "Duyệt câu hỏi không thành công!";

            }

            public class User {
                public static final String LOGIN_EMAIL_OR_PASSWORD_INCORRECT = "Email/tên đăng nhập hoặc mặt khẩu không đúng. Vui lòng thử lại!";
                public static final String ACCOUNT_BLOCK = "Tài khoản đã bị khóa. Vui lòng liên hệ quản trị viên!.";
                public static final String LOGIN_ERROR = "Email/tên đăng nhập hoặc mật khẩu không đúng. Vui lòng nhập lại.";
                public static final String LOGIN_ERROR2 = "Tài khoản không đủ quyền!";
                public static final String LOGIN_ERROR3 = "Email/tên đăng nhập hoặc mật khẩu không đúng. Vui lòng thử lại!";
                public static final String LOGIN_ERROR4 = "Đăng nhập tài khoản không thành công!";
                public static final String LOGIN_SUCCES = "Đăng nhập thành công";
                public static final String REGISTER_SUCCESS = "Tạo tài khoản thành công!";
                public static final String REGISTER_ERROR = "Đăng kí tài khoản không thành công!";
                public static final String DOUBLE_EMAIL_OR_NICKNAME = "Email hoặc tên đăng nhập đã tồn tại. Vui lòng dùng email hoặc tên đăng nhập khác!";
                public static final String SEARCH_ERROR = "Lấy danh sách tài khoản không thành công!";
                public static final String GET_USER_ERROR = "Lấy thông tin tài khoản không thành công!";
                public static final String BLOCK_ERROR = "Khóa tài khoản không thành công!";
                public static final String BLOCK_SUCCESS = "Khóa tài khoản thành công!";
                public static final String CREATE_SUCCESS = "Tạo tài khoản thành công!";
                public static final String CREATE_ERROR = "Tạo tài khoản không thành công!";
                public static final String CREATE_ERROR_CODE2 = "Email này đã được sử dụng, vui lòng sử dụng email khác!";
                public static final String RESET_PASSWORD_ERROR = "Reset mật khẩu tài khoản không thành công!";
                public static final String RESET_PASSWORD_SUCCESS = "Đã đổi mật khẩu của tài khoản bạn chọn về 123456!";
                public static final String UPDATE_SUCCESS = "Cập nhật tài khoản thành công";
                public static final String UPDATE_ERROR = "Cập nhật tài khoản không thành công";
                public static final String CHANGE_PASSWORD_SUCCESS = "Thay đổi mật khẩu thành công!";
                public static final String CHANGE_PASSWORD_ERROR = "Thay đổi mật khẩu thất bại!";
                public static final String CHANGE_PASSWORD_ERROR_CODE_2 = " Mật khẩu cũ không chính xác!";
                public static final String FORGOT_PASSWORD_SUCCESS = "Mật khẩu mới đã được gửi đến mail của bạn!";
                public static final String FORGOT_PASSWORD_ERROR = "Không tìm thấy tài khoản với email bạn nhập!";
                public static final String SET_HIGH_LIGHT_SUCCESS = "Cập nhật bác sĩ nổi bật thành công";
                public static final String SET_HIGH_LIGHT_ERROR = "Cập nhật bác sĩ nổi bật không thành công";
                public static final String UPDATE_PASSWORD_SUCCESS = "Cập nhật mật khẩu thành công";
                public static final String UPDATE_PASSWORD_ERROR = "Cập nhật mật khẩu không thành công";
                public static final String CREATE_BY_EMAIL_SUCCESS = "Hệ thống đã tạo tài khoản với email vừa nhập, thông tin tài khoản đã được gửi về email của bạn!";
                public static final String CREATE_BY_EMAIL_ERROR = "Tài khoản lỗi!";
                public static final String UPDATE_EMAIL_SUCCESS = "Thông tin xác nhận đã được gửi về Email mới của bạn. Vui lòng kiểm tra email để xác nhận!";
                public static final String UPDATE_EMAIL_ERROR = "Cập nhật thông tin email không thành công!";
                public static final String UPDATE_EMAIL_ERROR_CODE_2 = "Địa chỉ email này đã tồn tại, vui lòng kiểm tra lại!!";
            }

            public class News {
                public static final String GET_LIST_NEWS_ERROR = "Lấy danh sách tin tức không thành công!";
                public static final String CREATE_NEWS_SUCCESS = "Thêm mới tin tức thành công!";
                public static final String CREATE_NEWS_ERROR = "Tạo tin tức thất bại!";
                public static final String DELETE_NEWS_SUCCESS = "Xóa tin tức thành công!";
                public static final String DELETE_NEWS_ERROR = "Xóa tin tức thất bại!";
                public static final String UPDATE_NEWS_SUCCESS = "Chỉnh sửa tin tức thành công!";
                public static final String UPDATE_NEWS_ERROR = "Cập nhật tin tức thất bại!";
                public static final String SET_HOT_NEWS_SUCCESS = "Chọn tin tức nổi bật thành công!";
                public static final String CANCEL_HOT_NEWS_SUCCESS = "Hủy tin tức nổi bật thành công!";
                public static final String SET_HOT_NEWS_ERROR = "Chọn tin tức nổi bật không thành công!";
                public static final String ASSIGN_TO_MENU_ERROR = "Phân loại tin tức vào menu không thành công!";
                public static final String ACCEPT_MOVE_TO_BVP_ERROR = "Tin tức từ Hội Lao không dược chấp nhận chuyển sang bệnh viện Phổi!";
                public static final String ACCEPT_MOVE_TO_BVP_SUCCESS = "Tin tức từ Hội Lao dược chấp nhận chuyển sang bệnh viện Phổi!";
                public static final String REJECT_MOVE_TO_BVP_ERROR = "Hủy bỏ tin tức từ Hội lao thất bại";
                public static final String REJECT_MOVE_TO_BVP_SUCCESS = "Hủy bỏ tin tức từ Hội lao thành công!";
                public static final String SET_CHARITY_ERROR = "Chọn tin tức sang góc từ thiện không thành công!";
                public static final String MAXIMUM_CONTENT_LENGTH = "Vui lòng không nhập quá 30000 ký tự!";
                public static final String MOVE_TO_BVP_ERROR = "Chuyển tin tức sang bệnh viện Phổi thất bại!";
                public static final String MOVE_TO_BVP_SUCCESS = "Chuyển tin tức sang bệnh viện Phổi thành công!";
                public static final String CANCEL_MOVE_TO_BVP_ERROR = "Hủy bỏ chuyển tin tức sang bệnh viện Phổi thất bại!";
                public static final String CANCEL_MOVE_TO_BVP_SUCCESS = "Hủy bỏ chuyển tin tức sang bệnh viện Phổi thành công!";
            }

            public class Video {
                public static final String SEARCH_ERROR = "Lấy danh sách video không thành công!";
                public static final String CREATE_SUCCESS = "Thêm mới video thành công!";
                public static final String CREATE_ERROR = "Tạo video thất bại!";
                public static final String DELETE_SUCCESS = "Xóa video thành công!";
                public static final String DELETE_ERROR = "Xóa video thất bại!";
                public static final String UPDATE_SUCCESS = "Chỉnh sửa video thành công!";
                public static final String UPDATE_ERROR = "Cập nhật video thất bại!";
                public static final String ACTIVE_SUCCESS = "Cập nhật video nổi bật thành công!";
                public static final String ACTIVE_ERROR = "Cập nhật video nổi bật thất bại!";
            }

            public class Contribute {
                public static final String GET_LIST_CONTRIBUTE_ERROR = "Lấy danh sách tri ân không thành công!";
                public static final String GET_DETAIL_CONTRIBUTE_ERROR = "Lấy chi tiết danh sách tri ân không thành công!";
                public static final String GET_BY_ALIAS_CONTRIBUTE_ERROR = "Lấy chi tiết danh sách tri ân không thành công!";
                public static final String CREATE_CONTRIBUTE_SUCCESS = "Thêm mới tri ân thành công!";
                public static final String CREATE_CONTRIBUTE_ERROR = "Tạo tri ân thất bại!";
                public static final String DELETE_CONTRIBUTE_SUCCESS = "Xóa tri ân thành công!";
                public static final String DELETE_CONTRIBUTE_ERROR = "Xóa tri ân thất bại!";
                public static final String UPDATE_CONTRIBUTE_SUCCESS = "Chỉnh sửa tri ân thành công!";
                public static final String UPDATE_CONTRIBUTE_ERROR = "Cập nhật tri ân thất bại!";
            }

            public class Course {
                public static final String SEARCH_ERROR = "Lấy danh sách khóa học không thành công!";
                public static final String CREATE_SUCCESS = "Thêm mới khóa học thành công!";
                public static final String CREATE_ERROR = "Tạo khóa học thất bại!";
                public static final String DELETE_SUCCESS = "Xóa khóa học thành công!";
                public static final String DELETE_ERROR = "Xóa khóa học thất bại!";
                public static final String UPDATE_SUCCESS = "Chỉnh sửa khóa học thành công!";
                public static final String UPDATE_ERROR = "Cập nhật khóa học thất bại!";
            }

            public class CourseItem {
                public static final String SEARCH_ERROR = "Lấy danh sách bài học không thành công!";
                public static final String CREATE_SUCCESS = "Thêm mới bài học thành công!";
                public static final String CREATE_ERROR = "Tạo bài học thất bại!";
                public static final String DELETE_SUCCESS = "Xóa bài học thành công!";
                public static final String DELETE_ERROR = "Xóa khóa bài thất bại!";
                public static final String UPDATE_SUCCESS = "Chỉnh sửa bài học thành công!";
                public static final String UPDATE_ERROR = "Cập nhật khóa bài thất bại!";
            }

            public class Menu {
                public static final String SEARCH_ERROR = "Lấy danh sách menu không thành công!";
                public static final String CREATE_SUCCESS = "Thêm mới menu thành công!";
                public static final String CREATE_ERROR = "Tạo menu thất bại!";
                public static final String DELETE_SUCCESS = "Xóa menu thành công!";
                public static final String DELETE_ERROR = "Xóa menu thất bại!";
                public static final String UPDATE_SUCCESS = "Chỉnh sửa menu thành công!";
                public static final String UPDATE_ERROR = "Cập nhật menu thất bại!";
                public static final String SET_ACTIVE_ERROR = "Kích hoạt menu thất bại!";
                public static final String SET_ACTIVE_SUCCESS = "Kích hoạt menu thành công!";
                public static final String SET_GROUP_SUCCESS = "Thêm menu vào group thành công!";
                public static final String SET_GROUP_ERROR = "Thêm menu vào group thất bại!";
            }

            public class HospitalUtility {
                public static final String SEARCH_ERROR = "Lấy danh sách dịch vụ không thành công!";
                public static final String CREATE_SUCCESS = "Thêm mới dịch vụ thành công!";
                public static final String CREATE_ERROR = "Thêm mới dịch vụ không thành công!";
                public static final String DELETE_SUCCESS = "Xóa dịch vụ thành công!";
                public static final String DELETE_ERROR = "Xóa dịch vụ không thành công!";
                public static final String UPDATE_SUCCESS = "Chỉnh sửa dịch vụ thành công!";
                public static final String UPDATE_ERROR = "Cập nhật dịch vụ không thành công!";
            }

            public class Advertise {
                public static final String SEARCH_SUCCESS = "Lấy danh sách tin nhắn quảng bá thành công!";
                public static final String SEARCH_ERROR = "Lấy danh sách tin nhắn quảng bá không thành công!";
                public static final String SEND_NOTIFICATION_SUCCESS = "Gửi tin nhắn quảng bá thành công!";
                public static final String SEND_NOTIFICATION_ERROR = "Gửi tin nhắn quảng bá không thành công!";
            }

            public class WebLink {
                public static final String SEARCH_ERROR = "Lấy danh sách web link không thành công!";
                public static final String CREATE_SUCCESS = "Thêm mới web link thành công!";
                public static final String CREATE_ERROR = "Tạo web link thất bại!";
                public static final String DELETE_SUCCESS = "Xóa web link thành công!";
                public static final String DELETE_ERROR = "Xóa web link thất bại!";
                public static final String UPDATE_SUCCESS = "Chỉnh sửa web link thành công!";
                public static final String UPDATE_ERROR = "Cập nhật web link thất bại!";
            }

            public class SlideItem {
                public static final String CREATE_SUCCESS = "Tạo slide item thành công";
                public static final String CREATE_ERROR = "Tạo slide item không thành công";
                public static final String DELETE_SUCCESS = "Xóa slide item thành công";
                public static final String DELETE_ERROR = "Xóa slide item không thành công";
                public static final String SEARCH_ERROR = "Lấy danh sách slide item không thành công";
                public static final String UPDATE_SUCCESS = "Cập nhật slide item thành công";
                public static final String UPDATE_ERROR = "Cập nhật slide item không thành công";
            }

            public class Slide {
                public static final String CREATE_SUCCESS = "Tạo slide thành công";
                public static final String CREATE_ERROR = "Tạo slide không thành công";
                public static final String DELETE_SUCCESS = "Xóa slide thành công";
                public static final String DELETE_ERROR = "Xóa slide không thành công";
                public static final String SEARCH_ERROR = "Lấy danh sách slide không thành công";
                public static final String UPDATE_SUCCESS = "Cập nhật slide thành công";
                public static final String UPDATE_ERROR = "Cập nhật slide không thành công";
                public static final String ACTIVE_SUCCESS = "Xác nhận slide thành công!";
                public static final String ACTIVE_ERROR = "Xác nhận slide thất bại!";
            }

            public class SlidePlace {
                public static final String SEARCH_ERROR = "Lấy danh sách slide place không thành công";
                public static final String UPDATE_SUCCESS = "Cập nhật slide place thành công";
                public static final String UPDATE_ERROR = "Cập nhật slide place không thành công";
            }

            public class Page {
                public static final String SEARCH_ERROR = "Lấy danh sách page không thành công!";
                public static final String CREATE_SUCCESS = "Thêm mới page thành công!";
                public static final String CREATE_ERROR = "Thêm mới page thất bại!";
                public static final String DELETE_SUCCESS = "Xóa page thành công!";
                public static final String DELETE_ERROR = "Xóa page thất bại!";
                public static final String UPDATE_SUCCESS = "Cập nhật page thành công!";
                public static final String UPDATE_ERROR = "Cập nhật page thất bại!";
            }

            public class Album {
                public static final String SEARCH_ERROR = "Lấy danh sách album không thành công!";
                public static final String CREATE_SUCCESS = "Thêm mới album thành công!";
                public static final String CREATE_ERROR = "Thêm mới album thất bại!";
                public static final String DELETE_SUCCESS = "Xóa album thành công!";
                public static final String DELETE_ERROR = "Xóa album thất bại!";
                public static final String UPDATE_SUCCESS = "Cập nhật album thành công!";
                public static final String UPDATE_ERROR = "Cập nhật album thất bại!";
            }

            public class Document {
                public static final String SEARCH_ERROR = "Lấy danh sách văn bản/tài liệu không thành công!";
                public static final String CREATE_SUCCESS = "Thêm mới văn bản/tài liệu thành công!";
                public static final String CREATE_ERROR = "Thêm mới văn bản/tài liệu thất bại!";
                public static final String DELETE_SUCCESS = "Xóa văn bản/tài liệu thành công!";
                public static final String DELETE_ERROR = "Xóa văn bản/tài liệu thất bại!";
                public static final String UPDATE_SUCCESS = "Cập nhật văn bản/tài liệu thành công!";
                public static final String UPDATE_ERROR = "Cập nhật văn bản/tài liệu thất bại!";
            }

            public class Tag {
                public static final String SEARCH_ERROR = "Lấy danh sách từ khóa không thành công!";
                public static final String DELETE_ERROR = "Xóa từ khóa không thành công!";
                public static final String DELETE_SUCCESS = "Xóa từ khóa thành công!";
                public static final String CREATE_ERROR = "Thêm mới từ khóa không thành công!";
                public static final String UPDATE_SUCCESS = "Cập nhật từ khóa thành công!";
                public static final String UPDATE_ERROR = "Cập nhật từ khóa không thành công!";
                public static final String UPDATE_ERROR_CODE2 = "Từ khóa này đã tồn tại, vui lòng cập nhật từ khóa khác!";
            }

            public class OnlineExchange {
                public static final String SEARCH_ERROR = "Lấy danh sách giao lưu trực tuyến không thành công!";
                public static final String CREATE_SUCCESS = "Thêm mới giao lưu trực tuyến thành công!";
                public static final String CREATE_ERROR = "Thêm mới giao lưu trực tuyến thất bại!";
                public static final String DELETE_SUCCESS = "Xóa giao lưu trực tuyến thành công!";
                public static final String DELETE_ERROR = "Xóa giao lưu trực tuyến thất bại!";
                public static final String DELETE_ERROR_CODE_2 = "Đã có câu hỏi trong giao lưu trực tuyến, vui lòng không xóa chủ đề!";
                public static final String UPDATE_SUCCESS = "Cập nhật giao lưu trực tuyến thành công!";
                public static final String UPDATE_ERROR = "Cập nhật giao lưu trực tuyến thất bại!";
                public static final String SET_ACTIVE_SUCCESS = "Kích hoạt giao lưu trực tuyến thành công!";
                public static final String SET_ACTIVE_ERROR = "Kích hoạt giao lưu trực tuyến thất bại!";
            }

            public class OnlineExchangeQuestion {
                public static final String SEARCH_ERROR = "Lấy danh sách câu hỏi không thành công!";
                public static final String CREATE_SUCCESS = "Đặt câu hỏi thành công, vui lòng chờ admin phê duyệt!";
                public static final String CREATE_ERROR = "Đặt câu hỏi thất bại, vui lòng thử lại!";
                public static final String DELETE_SUCCESS = "Xóa câu hỏi thành công!";
                public static final String DELETE_ERROR = "Xóa câu hỏi thất bại!";
                public static final String UPDATE_SUCCESS = "Cập nhật câu hỏi thành công!";
                public static final String UPDATE_ERROR = "Cập nhật câu hỏi thất bại!";
                public static final String APPROVAL_SUCCESS = "Duyệt câu hỏi thành công!";
                public static final String APPROVAL_ERROR = "Duyệt câu hỏi thất bại!";
            }

            public class Department {
                public static final String GET_ALL_ERROR = "Lấy danh sách chuyên khoa không thành công!";
            }

            public class UserAccess {
                public static final String CREATE_SUCCESS = "Susses!";
                public static final String CREATE_ERROR = "Error!";
            }

            public class Position {
                public static final String SEARCH_ERROR = "Lấy danh sách chức vụ không thành công!";
                public static final String CREATE_SUCCESS = "Thêm mới chức vụ thành công!";
                public static final String CREATE_ERROR = "Thêm mới chức vụ không thành công!";
                public static final String CREATE_ERROR_CODE2 = "Value này đã được sử dụng, vui lòng sử dụng value khác!";
                public static final String DELETE_SUCCESS = "Xóa chức vụ thành công!";
                public static final String DELETE_ERROR = "Xóa chức vụ thất bại!";
                public static final String UPDATE_SUCCESS = "Cập nhật chức vụ thành công!";
                public static final String UPDATE_ERROR = "Cập nhật chức vụ thất bại!";
            }
        }
    }

    public class Api {

        public class User {
            public static final String BLOCK = "user/block";
            public static final String CHANGE_PASSWORD = "user/change-password";
            public static final String CREATE = "user/create";
            public static final String FORGOT_PASSWORD = "user/forgot-password";
            public static final String GET_USER_BY_ID = "user/get-user-by-id";
            public static final String LOGIN = "user/login";
            public static final String LOGIN_SOCIAL = "user/login-social";
            public static final String USER_REGISTER = "user/register";
            public static final String RESET_PASSWORD = "user/reset-password";
            public static final String SEARCH = "user/search";
            public static final String UPDATE = "user/update";
            public static final String SET_HIGH_LIGHT = "user/set-high-light";
            public static final String GET_TOKEN_PASSWORD_INFO = "user/get-token-password-info";
            public static final String UPDATE_PASSWORD = "user/update-password";
            public static final String CREATE_BY_EMAIL = "user/create-by-email";
            public static final String USER_UPDATE_EMAIL = "user/update-email";
            public static final String VERIFY_EMAIL = "user/verify-email";
        }

        public class News {
            public static final String SEARCH = "news/search";
            public static final String DETAIL = "news/get-detail";
            public static final String ALIAS = "news/get-by-alias";
            public static final String CREATE = "news/create";
            public static final String DELETE = "news/delete";
            public static final String UPDATE = "news/update";
            public static final String SET_HOT_NEWS = "news/set-hot-news";
            public static final String ASSIGN_TO_MENU = "news/assign-to-menu";
            public static final String ACCEPT_MOVE_TO_BVP = "news/accept-move-to-bvp";
            public static final String CANCEL_MOVE_TO_BVP = "news/cancel-move-to-bvp";
            public static final String SET_CHARITY = "news/set-charity";
            public static final String GET_BY_ALIAS = "news/get-by-alias";
            public static final String MOVE_TO_BVP = "news/move-to-bvp";
            public static final String REJECT_MOVE_TO_BVP = "news/reject-move-to-bvp";
            public static final String SET_HIGH_LIGHT_NOTI = "news/set-high-light-noti";
        }

        public class Video {
            public static final String ACTIVE = "video/active";
            public static final String CREATE = "video/create";
            public static final String DELETE = "video/delete";
            public static final String GET_BY_ALIAS = "video/get-by-alias";
            public static final String GET_DETAIL = "video/get-detail";
            public static final String SEARCH = "video/search";
            public static final String UPDATE = "video/update";
        }

        public class Contribute {
            public static final String CREATE = "contribute/create";
            public static final String DELETE = "contribute/delete";
            public static final String SEARCH = "contribute/search";
            public static final String UPDATE = "contribute/update";
            public static final String GET_DETAIL = "contribute/get-detail";
            public static final String GET_BY_ALIAS = "contribute/get-by-alias";
        }

        public class Course {
            public static final String CREATE = "course/create";
            public static final String DELETE = "course/delete";
            public static final String SEARCH = "course/search";
            public static final String UPDATE = "course/update";
        }

        public class CourseItem {
            public static final String CREATE = "course-item/create";
            public static final String DELETE = "course-item/delete";
            public static final String GET_BY_COURSE = "course-item/get-by-course";
            public static final String SEARCH = "course-item/search";
            public static final String UPDATE = "course-item/update";
        }

        public class CourseItemComment {
            public static final String CREATE = "course-item-comment/create";
            public static final String DELETE = "course-item-comment/delete";
            public static final String SEARCH = "course-item-comment/search";
            public static final String UPDATE = "course-item-comment/update";
        }

        public class Menu {
            public static final String CREATE = "menu/create";
            public static final String DELETE = "menu/delete";
            public static final String GET_ALL = "menu/get-all";
            public static final String SEARCH = "menu/search";
            public static final String UPDATE = "menu/update";
            public static final String ACTIVE = "menu/set-active";
            public static final String GET_DETAIL = "menu/get-detail";
            public static final String GET_BY_GROUP = "menu/get-by-group";
            public static final String SET_GROUP = "menu/set-group";
        }

        public class HospitalUtility {
            public static final String CREATE = "hospital-utility/create";
            public static final String DELETE = "hospital-utility/delete";
            public static final String SEARCH = "hospital-utility/search";
            public static final String UPDATE = "hospital-utility/update";
        }

        public class WebLink {
            public static final String CREATE = "web-link/create";
            public static final String DELETE = "web-link/delete";
            public static final String SEARCH = "web-link/search";
            public static final String UPDATE = "web-link/update";
        }

        public class SlideItem {
            public static final String CREATE = "slide-item/create";
            public static final String DELETE = "slide-item/delete";
            public static final String SEARCH = "slide-item/search";
            public static final String UPDATE = "slide-item/update";
        }

        public class Slide {
            public static final String CREATE = "slide/create";
            public static final String DELETE = "slide/delete";
            public static final String SEARCH = "slide/search";
            public static final String UPDATE = "slide/update";
            public static final String ACTIVE = "slide/active";
        }

        public class SlidePlace {
            public static final String CREATE = "slide-place/create";
            public static final String DELETE = "slide-place/delete";
            public static final String SEARCH = "slide-place/search";
            public static final String UPDATE = "slide-place/update";
            public static final String GET_BY_NAME = "slide-place/get-name";
        }

        public class Page {
            public static final String CREATE = "page/create";
            public static final String DELETE = "page/delete";
            public static final String SEARCH = "page/search";
            public static final String UPDATE = "page/update";
            public static final String GET_DETAIL = "page/get-detail";
            public static final String GET_BY_ALIAS = "page/get-by-alias";
        }

        public class Album {
            public static final String CREATE = "album/create";
            public static final String DELETE = "album/delete";
            public static final String SEARCH = "album/search";
            public static final String UPDATE = "album/update";
            public static final String GET_DETAIL = "album/get-detail";
            public static final String GET_BY_ALIAS = "album/get-by-alias";
        }

        public class Document {
            public static final String CREATE = "document/create";
            public static final String DELETE = "document/delete";
            public static final String SEARCH = "document/search";
            public static final String UPDATE = "document/update";
            public static final String GET_DETAIL = "document/get-detail";
            public static final String GET_BY_ALIAS = "document/get-by-alias";
        }

        public class Tag {
            public static final String CREATE_MULTIPLE = "tag/create-multiple";
            public static final String DELETE = "tag/delete";
            public static final String GET_ALL = "tag/get-all";
            public static final String SEARCH = "tag/search";
            public static final String UPDATE = "tag/update";

        }

        public class Department {
            public static final String GET_ALL = "department/get-all";
            public static final String GET_LIST_DOCTOR_DEPARTMENT = "department/get-list-doctor-department";
        }

        public class Post {
            public static final String SEARCH = "post/search";
            public static final String GET_FOLLOWED_BY_USER = "/post/get-followed-by-user";
            public static final String CREATE = "post/create";
            public static final String UPDATE = "post/update";
            public static final String DELETE = "post/delete";
            public static final String GET_DETAIL = "post/get-detail";
            public static final String GET_BY_ALIAS = "post/get-by-alias";
            public static final String FOLLOW = "post/follow";
            public static final String LIKE = "post/like";
            public static final String GET_CLASSIFY_COUNT = "post/get-classify-count";
            public static final String POST_NOT_ANSWERED_IN_24H = "post/get-posts-not-answered-in-24h";
            public static final String ASSIGN = "post/assign";
            public static final String HIGHLIGHT = "post/get-highlight-post";
            public static final String STATUS_POST_DOCTOR = "post/set-post-approved-status";
            public static final String GET_BY_TAG = "post/get-by-tag";
        }

        public class Comment {
            public static final String SEARCH = "comment/search";
            public static final String CREATE = "comment/create";
            public static final String DELETE = "comment/delete";
            public static final String UPDATE = "comment/update";
            public static final String LIKE = "comment/like";
            public static final String ACCEPT_SOLUTION = "comment/accept-as-solution";
        }

        public class Image {
            public static final String UPLOAD = "image/upload";
        }

        public class File {
            public static final String UPLOAD = "file/uploadFile";
        }

        public class KeyValue {
            public static final String CREATE_OR_UPDATE = "key-value/create-or-update";
            public static final String GET_VALUE = "key-value/get-value";
        }

        public class OnlineExchange {
            public static final String CREATE = "online-exchange/create";
            public static final String DELETE = "online-exchange/delete";
            public static final String SEARCH = "online-exchange/search";
            public static final String UPDATE = "online-exchange/update";
            public static final String ACTIVE = "online-exchange/active";
            public static final String GET_DETAIL = "online-exchange/get-detail";
            public static final String GET_BY_ALIAS = "online-exchange/get-by-alias";
        }

        public class OnlineExchangeQuestion {
            public static final String APPROVAL = "online-exchange-question/approval";
            public static final String CREATE = "online-exchange-question/create";
            public static final String DELETE = "online-exchange-question/delete";
            public static final String SEARCH = "online-exchange-question/search";
            public static final String UPDATE = "online-exchange-question/update";
        }

        public class UserAccess {
            public static final String GET_COUNT = "user-access-count/get-count";
            public static final String CREATE = "user-access/create";
        }

        public class Position {
            public static final String CREATE = "position/create";
            public static final String DELETE = "position/delete";
            public static final String SEARCH = "position/search";
            public static final String UPDATE = "position/update";
        }
    }
}
