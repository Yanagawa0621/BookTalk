package com.user.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.user.model.DuplicateFieldException;
import com.user.model.UserService;
import com.user.model.UserServiceImpl;
import com.user.model.UserVO;
import com.access.model.AccessService;
import com.access.model.AccessServiceImpl;
import com.access.model.AccessVO;

@WebServlet("/updateUserProfile")
public class UserProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;
    private AccessService accessService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserServiceImpl();
        this.accessService = new AccessServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleRequest(request, response);
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "viewProfile";
        }

        try {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("loggedInUser") == null) {
                response.sendRedirect(request.getContextPath() + "/front-end/login/login.jsp");
                return;
            }

            switch (action) {
                case "viewProfile":
                    viewUserProfile(request, response);
                    break;
                case "updateProfile":
                    updateUserProfile(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "無效的操作");
                    break;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void viewUserProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        UserVO user = (UserVO) session.getAttribute("loggedInUser");
        List<AccessVO> accessList = accessService.getAllAccesses();

        request.setAttribute("user", user);
        request.setAttribute("accessList", accessList);
        request.getRequestDispatcher("/front-end/my-account.jsp").forward(request, response);
    }

    private void updateUserProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserVO user = (UserVO) request.getSession().getAttribute("loggedInUser");

        String account = request.getParameter("account");
        String passcode = request.getParameter("passcode");
        String name = request.getParameter("name");
        String eMail = request.getParameter("eMail");
        String introduceOneself = request.getParameter("introduceOneself");
        String birthday = request.getParameter("birthday");
        String nationalIdNumber = request.getParameter("nationalIdNumber");
        String telephoneNumber = request.getParameter("telephoneNumber");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String address = request.getParameter("address");
        String accountStatusNumber = request.getParameter("accountStatusNumber");
        String accessNumber = request.getParameter("accessNumber");
        String sex = request.getParameter("sex");
        String registerDate = request.getParameter("registerDate");
        String statusStartDate = request.getParameter("statusStartDate");

        try {
            // 更新用户信息
            user.setAccount(account);
            user.setPasscode(passcode);
            user.setName(name);
            user.seteMail(eMail);
            user.setIntroduceOneself(introduceOneself);
            user.setBirthday(java.sql.Date.valueOf(birthday));
            user.setNationalIdNumber(nationalIdNumber);
            user.setTelephoneNumber(telephoneNumber);
            user.setCity(city);
            user.setDistrict(district);
            user.setAddress(address);
            user.setAccountStatusNumber(Integer.parseInt(accountStatusNumber));
            user.setAccessNumber(Integer.parseInt(accessNumber));
            user.setSex(sex);
            user.setRegisterDate(java.sql.Date.valueOf(registerDate));
            user.setStatusStartDate(java.sql.Date.valueOf(statusStartDate));

            userService.updateUser(user);
            request.getSession().setAttribute("loggedInUser", user);

            viewUserProfile(request, response);
        } catch (DuplicateFieldException e) {
            request.setAttribute("errorMessage", e.getMessage());
            viewUserProfile(request, response);
        }
    }
}
