package com.user.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
import com.user.model.DuplicateFieldException;
import com.user.model.UserService;
import com.user.model.UserServiceImpl;
import com.user.model.UserVO;
import com.user.model.UserDAO;
import com.administrator.model.AdministratorService;
import com.administrator.model.AdministratorServiceImpl;
import com.administrator.model.AdministratorVO;

@MultipartConfig(maxFileSize = 2 * 1024 * 1024) // 設置最大文件大小為 2MB
@WebServlet("/user")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;
    private AdministratorService administratorService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserServiceImpl(new UserDAO());
        this.administratorService = new AdministratorServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        handleRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        handleRequest(request, response);
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        System.out.println("Content Type: " + request.getContentType()); // 添加日誌輸出

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            try {
                switch (action) {
                    case "list":
                        listUsers(request, response, session);
                        break;
                    case "listMembers":
                        listMembers(request, response, session);
                        break;
                    case "listAdmins":
                        listAdmins(request, response, session);
                        break;
                    case "edit":
                        showEditForm(request, response, session);
                        break;
                    case "delete":
                        deleteUser(request, response, session);
                        break;
                    case "add":
                        if (isMultipartContent(request)) {
                            addUser(request, response, session);
                        } else {
                            System.out.println("表單內容類型錯誤: " + request.getContentType());
                            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "表單必須設置為 multipart/form-data");
                        }
                        break;
                    case "update":
                        if (isMultipartContent(request)) {
                            updateUser(request, response, session);
                        } else {
                            System.out.println("表單內容類型錯誤: " + request.getContentType());
                            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "表單必須設置為 multipart/form-data");
                        }
                        break;
                    case "updateAddress":
                        updateAddress(request, response, session);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "無效的操作");
                        break;
                }
                transaction.commit();
            } catch (Exception e) {
                if (transaction != null) transaction.rollback();
                throw new ServletException(e);
            }
        }
    }

    private void updateAddress(HttpServletRequest request, HttpServletResponse response, Session session) throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        Integer userNumber = (Integer) httpSession.getAttribute("userNumber");
        if (userNumber == null) {
            response.sendRedirect(request.getContextPath() + "/front-end/login/login.jsp");
            return;
        }
        UserVO user = userService.getUserByNumber(userNumber);
        user.setCity(request.getParameter("city"));
        user.setDistrict(request.getParameter("district"));
        user.setAddress(request.getParameter("address"));
        try {
            userService.updateUser(user);
            httpSession.setAttribute("city", user.getCity());
            httpSession.setAttribute("district", user.getDistrict());
            httpSession.setAttribute("address", user.getAddress());
            response.sendRedirect(request.getContextPath() + "/front-end/my-account.jsp");
        } catch (DuplicateFieldException e) {
            handleException(request, response, e, "/front-end/my-account.jsp", user);
        }
    }

    private boolean isMultipartContent(HttpServletRequest request) {
        String contentType = request.getContentType();
        return contentType != null && contentType.startsWith("multipart/form-data");
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response, Session session) throws ServletException, IOException {
        List<UserVO> userList = userService.getAllUsers();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("/back-end/user/users.jsp").forward(request, response);
    }

    private void listMembers(HttpServletRequest request, HttpServletResponse response, Session session) throws ServletException, IOException {
        List<UserVO> memberList = userService.getUsersByRole(1); // 1 代表一般會員
        request.setAttribute("userList", memberList);
        request.getRequestDispatcher("/back-end/user/members.jsp").forward(request, response);
    }

    private void listAdmins(HttpServletRequest request, HttpServletResponse response, Session session) throws ServletException, IOException {
        List<UserVO> adminList = userService.getUsersByRole(2); // 2 代表後台管理員
        request.setAttribute("adminList", adminList);
        request.getRequestDispatcher("/back-end/user/adminList.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response, Session session) throws ServletException, IOException {
        Integer number = Integer.parseInt(request.getParameter("number"));
        UserVO existingUser = userService.getUserByNumber(number);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        request.setAttribute("birthday", existingUser.getBirthday() != null ? dateFormat.format(existingUser.getBirthday()) : "");
        request.setAttribute("registerDate", existingUser.getRegisterDate() != null ? dateFormat.format(existingUser.getRegisterDate()) : "");
        request.setAttribute("statusStartDate", existingUser.getStatusStartDate() != null ? dateFormat.format(existingUser.getStatusStartDate()) : "");
        request.setAttribute("user", existingUser);
        request.getRequestDispatcher("/back-end/user/editUser.jsp").forward(request, response);
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response, Session session) throws ServletException, IOException {
        try {
            UserVO user = parseUserFromRequest(request);
            userService.addUser(user);
            response.sendRedirect(request.getContextPath() + "/user?action=list");
        } catch (DuplicateFieldException e) {
            handleException(request, response, e, "/back-end/user/addUser.jsp", request);
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response, Session session) throws ServletException, IOException {
        try {
            UserVO user = parseUserFromRequest(request);
            user.setNumber(Integer.parseInt(request.getParameter("number")));

            // 獲取原始使用者信息
            UserVO originalUser = userService.getUserByNumber(user.getNumber());
            Integer originalAccessNumber = originalUser.getAccessNumber();

            // 如果沒有上傳新照片，則保留原來的照片
            if (user.getPhoto() == null || user.getPhoto().length == 0) {
                user.setPhoto(originalUser.getPhoto());
            }

            userService.updateUser(user);

            if (originalAccessNumber == 2 && user.getAccessNumber() != 2) { // 如果從 "後台管理員" 變更為其他角色
                administratorService.deleteAdministrator(user.getAccount());
            } else if (user.getAccessNumber() == 2) { // 如果新權限是 "後台管理員"
                AdministratorVO admin = administratorService.getAdministratorByAccount(user.getAccount());
                if (admin == null) {
                    admin = new AdministratorVO();
                    admin.setAccount(user.getAccount());
                    admin.setPasscode(user.getPasscode());
                    admin.setName(user.getName());
                    administratorService.addAdministrator(admin);
                } else {
                    admin.setPasscode(user.getPasscode());
                    admin.setName(user.getName());
                    administratorService.updateAdministrator(admin);
                }
            }

            response.sendRedirect(request.getContextPath() + "/user?action=list");
        } catch (DuplicateFieldException e) {
            handleException(request, response, e, "/back-end/user/editUser.jsp", request);
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response, Session session) throws ServletException, IOException {
        Integer number = Integer.parseInt(request.getParameter("number"));
        userService.deleteUser(number);
        response.sendRedirect(request.getContextPath() + "/user?action=list");
    }

    private UserVO parseUserFromRequest(HttpServletRequest request) throws IOException, ServletException, DuplicateFieldException {
        request.setCharacterEncoding("UTF-8");
        if (!isMultipartContent(request)) {
            throw new ServletException("表單必須設置為 multipart/form-data");
        }

        String account = request.getParameter("account");
        String passcode = request.getParameter("passcode");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String eMail = request.getParameter("eMail");
        String introduceOneself = request.getParameter("introduceOneself");
        String birthdayStr = request.getParameter("birthday");
        Part photoPart = request.getPart("photo");
        String nationalIdNumber = request.getParameter("nationalIdNumber");
        String telephoneNumber = request.getParameter("telephoneNumber");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String address = request.getParameter("address");
        String statusStartDateStr = request.getParameter("statusStartDate");
        String registerDateStr = request.getParameter("registerDate");
        String accountStatusNumberStr = request.getParameter("accountStatusNumber");
        Integer accountStatusNumber = accountStatusNumberStr != null && !accountStatusNumberStr.isEmpty() ? Integer.parseInt(accountStatusNumberStr) : null;

        Integer accessNumber = null;
        try {
            if (request.getParameter("accessNumber") != null && !request.getParameter("accessNumber").isEmpty()) {
                accessNumber = Integer.parseInt(request.getParameter("accessNumber"));
            }
        } catch (NumberFormatException e) {
            throw new DuplicateFieldException("權限編號", "無效的權限編號格式.");
        }

        if (accessNumber != null && !userService.isAccessNumberValid(accessNumber)) {
            throw new DuplicateFieldException("權限編號", "無效的權限編號. 請提供一個在權限表格中存在的有效權限編號.");
        }

        Date birthday = null;
        Date statusStartDate = null;
        Date registerDate = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            if (birthdayStr != null && !birthdayStr.isEmpty()) {
                birthday = dateFormat.parse(birthdayStr);
            }
            if (statusStartDateStr != null && !statusStartDateStr.isEmpty()) {
                statusStartDate = dateFormat.parse(statusStartDateStr);
            }
            if (registerDateStr != null && !registerDateStr.isEmpty()) {
                registerDate = dateFormat.parse(registerDateStr);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }

        UserVO user = new UserVO();
        user.setAccount(account);
        user.setPasscode(passcode);
        user.setName(name);
        user.setSex(sex);
        user.seteMail(eMail);
        user.setIntroduceOneself(introduceOneself);
        user.setBirthday(birthday);
        if (photoPart != null && photoPart.getSize() > 0) {
            byte[] photo = photoPart.getInputStream().readAllBytes();
            user.setPhoto(photo);
        }
        user.setNationalIdNumber(nationalIdNumber);
        user.setTelephoneNumber(telephoneNumber);
        user.setCity(city);
        user.setDistrict(district);
        user.setAddress(address);
        user.setAccountStatusNumber(accountStatusNumber);
        user.setAccessNumber(accessNumber);
        user.setStatusStartDate(statusStartDate);
        user.setRegisterDate(registerDate);

        return user;
    }

    private void handleException(HttpServletRequest request, HttpServletResponse response, DuplicateFieldException e, String jspPath, Object obj) throws ServletException, IOException {
        Map<String, String> errorMessage = e.getErrorMessage();
        request.setAttribute("errorMessage", errorMessage);
        request.setAttribute("user", obj);
        request.getRequestDispatcher(jspPath).forward(request, response);
    }
}
