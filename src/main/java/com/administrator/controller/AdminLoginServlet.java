package com.administrator.controller;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.administrator.model.AdministratorService;
import com.administrator.model.AdministratorServiceImpl;
import com.administrator.model.AdministratorVO;
import com.loginRecord.model.LoginRecordService;
import com.loginRecord.model.LoginRecordServiceImpl;
import com.loginRecord.model.LoginRecordVO;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdministratorService adminService;
    private LoginRecordService loginRecordService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.adminService = new AdministratorServiceImpl();
        this.loginRecordService = new LoginRecordServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect(request.getContextPath() + "/back-end/bk_login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        String passcode = request.getParameter("passcode");

        AdministratorVO admin = adminService.getAdministratorByAccount(account);

        if (admin != null && admin.getPasscode().equals(passcode)) {
            HttpSession session = request.getSession();
            session.setAttribute("loggedInAdmin", admin);
            session.setAttribute("adminName", admin.getName());

            // 記錄登入信息
            recordLogin(request, admin);

            response.sendRedirect(request.getContextPath() + "/back-end/bk_index.jsp"); // 後台首頁
        } else {
            request.setAttribute("errorMessage", "帳號或密碼錯誤");
            request.getRequestDispatcher("/back-end/bk_login.jsp").forward(request, response);
        }
    }

    private void recordLogin(HttpServletRequest request, AdministratorVO admin) {
        LoginRecordVO loginRecord = new LoginRecordVO();
        loginRecord.setAdmin(admin);
        loginRecord.setLoginTime(new Date());
        loginRecord.setIp(request.getRemoteAddr());
        loginRecord.setArea("Taiwan"); // 這個可以根據實際情況動態設置
        loginRecord.setUserType("admin"); // 設置用戶類型為 "admin"

        loginRecordService.addLoginRecord(loginRecord);
    }
}
