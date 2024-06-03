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
import javax.servlet.http.Part;

import com.user.model.DuplicateFieldException;
import com.user.model.UserDAO;
import com.user.model.UserService;
import com.user.model.UserServiceImpl;
import com.user.model.UserVO;
import util.HibernateUtil;

import org.hibernate.Session;

@MultipartConfig(maxFileSize = 2 * 1024 * 1024) // 設定最大文件大小為 2MB
@WebServlet("/user")
public class UserServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        // 初始化 Hibernate SessionFactory
        userService = new UserServiceImpl(new UserDAO(HibernateUtil.getSessionFactory()));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            handleRequest(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            handleRequest(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException(e);
        }
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "list":
                    listUsers(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                case "add":
                    addUser(request, response);
                    break;
                case "update":
                    updateUser(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "無效的操作");
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<UserVO> userList = userService.getAllUsers();
        request.setAttribute("userList", userList);
        request.getRequestDispatcher("/back-end/user/users.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer number = Integer.parseInt(request.getParameter("number"));
        UserVO existingUser = userService.getUserByNumber(number);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        request.setAttribute("birthday", existingUser.getBirthday() != null ? dateFormat.format(existingUser.getBirthday()) : "");
        request.setAttribute("registerDate", existingUser.getRegisterDate() != null ? dateFormat.format(existingUser.getRegisterDate()) : "");
        request.setAttribute("statusStartDate", existingUser.getStatusStartDate() != null ? dateFormat.format(existingUser.getStatusStartDate()) : "");
        request.setAttribute("user", existingUser);
        request.getRequestDispatcher("/back-end/user/editUser.jsp").forward(request, response);
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            UserVO user = parseUserFromRequest(request);
            userService.addUser(user);
            response.sendRedirect(request.getContextPath() + "/user?action=list");
        } catch (DuplicateFieldException e) {
            handleException(request, response, e, "/back-end/user/addUser.jsp", request);
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            UserVO user = parseUserFromRequest(request);
            user.setNumber(Integer.parseInt(request.getParameter("number")));
            userService.updateUser(user);
            response.sendRedirect(request.getContextPath() + "/user?action=list");
        } catch (DuplicateFieldException e) {
            handleException(request, response, e, "/back-end/user/editUser.jsp", request);
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer number = Integer.parseInt(request.getParameter("number"));
        userService.deleteUser(number);
        response.sendRedirect(request.getContextPath() + "/user?action=list");
    }

    private UserVO parseUserFromRequest(HttpServletRequest request) throws IOException, ServletException, DuplicateFieldException {
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
        String registerDateStr = request.getParameter("registerDate"); // 新增解析 registerDate
        String accountStatusNumberStr = request.getParameter("accountStatusNumber"); // 確保獲取 accountStatusNumber 欄位
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
        Date registerDate = null; // 新增 registerDate 變數
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            if (birthdayStr != null && !birthdayStr.isEmpty()) {
                birthday = dateFormat.parse(birthdayStr);
            }
            if (statusStartDateStr != null && !statusStartDateStr.isEmpty()) {
                statusStartDate = dateFormat.parse(statusStartDateStr);
            }
            if (registerDateStr != null && !registerDateStr.isEmpty()) { // 解析 registerDate
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
        user.setStatusStartDate(statusStartDate);
        user.setRegisterDate(registerDate); // 設置 registerDate
        user.setAccountStatusNumber(accountStatusNumber);
        user.setAccessNumber(accessNumber);
        return user;
    }

    private void handleException(HttpServletRequest request, HttpServletResponse response, DuplicateFieldException e, String formPage, HttpServletRequest originalRequest) throws ServletException, IOException {
        // 將錯誤訊息設置到 request 中
        request.setAttribute("errorMessage", Map.of(e.getField(), e.getMessage()));

        // 將原始請求參數設置回 request 以便在表單中顯示
        for (Map.Entry<String, String[]> entry : originalRequest.getParameterMap().entrySet()) {
            request.setAttribute(entry.getKey(), entry.getValue()[0]);
        }

        request.getRequestDispatcher(formPage).forward(request, response);
    }
}
