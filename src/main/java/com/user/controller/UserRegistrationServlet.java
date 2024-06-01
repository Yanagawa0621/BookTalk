package com.user.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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

@MultipartConfig(maxFileSize = 2 * 1024 * 1024) // 設定最大文件大小為 2MB
@WebServlet("/register")
public class UserRegistrationServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl(new UserDAO(HibernateUtil.getSessionFactory()));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            addUser(request, response);
        } catch (DuplicateFieldException e) {
            handleException(request, response, e);
        } catch (Exception e) {
            e.printStackTrace();
            handleGeneralException(request, response, e);
        }
    }

    private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, DuplicateFieldException {
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

        // 設置固定值
        Integer accountStatusNumber = 1;
        Integer accessNumber = 1;
        Date statusStartDate = new Date(); // 設置狀態起始日為當天日期

        Date birthday = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            if (birthdayStr != null && !birthdayStr.isEmpty()) {
                birthday = dateFormat.parse(birthdayStr);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }

        UserVO user = new UserVO();
        user.setAccount(account);
        user.setPasscode(passcode);
        user.setName(name);
        user.setSex(sex.length() > 1 ? sex.substring(0, 1) : sex); // 确保sex值为一个字符
        user.seteMail(eMail);
        user.setIntroduceOneself(introduceOneself);
        user.setBirthday(birthday);
        user.setAccessNumber(accessNumber);
        user.setAccountStatusNumber(accountStatusNumber);
        user.setRegisterDate(new Date()); // 設置註冊日期為當天日期
        user.setStatusStartDate(statusStartDate);

        if (photoPart != null && photoPart.getSize() > 0) {
            // 驗證文件大小
            if (photoPart.getSize() > 2 * 1024 * 1024) {
                throw new DuplicateFieldException("photo", "文件大小超過限制的 2MB。");
            }

            // 驗證文件格式
            String contentType = photoPart.getContentType();
            if (!"image/jpeg".equals(contentType) && !"image/jpg".equals(contentType) && !"image/png".equals(contentType)) {
                throw new DuplicateFieldException("photo", "僅允許新增 JPG 和 PNG 格式的文件。");
            }

            byte[] photo = new byte[(int) photoPart.getSize()];
            photoPart.getInputStream().read(photo);
            user.setPhoto(photo);
        }

        user.setNationalIdNumber(nationalIdNumber);
        user.setTelephoneNumber(telephoneNumber);
        user.setCity(city);
        user.setDistrict(district);
        user.setAddress(city + district);

        System.out.println("User data to save: " + user);

        userService.addUser(user);
        response.sendRedirect(request.getContextPath() + "/front-end/user/login.jsp");
    }

    private void handleException(HttpServletRequest request, HttpServletResponse response, DuplicateFieldException e) throws ServletException, IOException {
        Map<String, String> errorMessage = new HashMap<>();
        errorMessage.put(e.getField(), e.getMessage());

        request.setAttribute("errorMessage", errorMessage);
        request.getRequestDispatcher("/front-end/user/registration.jsp").forward(request, response);
    }

    private void handleGeneralException(HttpServletRequest request, HttpServletResponse response, Exception e) throws ServletException, IOException {
        Map<String, String> errorMessage = new HashMap<>();
        errorMessage.put("generalError", "系統錯誤，請稍後再試。");

        request.setAttribute("errorMessage", errorMessage);
        request.getRequestDispatcher("/front-end/user/registration.jsp").forward(request, response);
    }

}
