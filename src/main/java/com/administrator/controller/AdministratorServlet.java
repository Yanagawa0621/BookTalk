package com.administrator.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
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

@WebServlet("/admin")
public class AdministratorServlet extends HttpServlet {
    private AdministratorService adminService;
    private LoginRecordService loginRecordService;

    @Override
    public void init() throws ServletException {
        adminService = new AdministratorServiceImpl();
        loginRecordService = new LoginRecordServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handleRequest(request, response);
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                listAdmins(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteAdmin(request, response);
                break;
            case "add":
                showAddForm(request, response);
                break;
            case "create":
                createAdmin(request, response);
                break;
            case "update":
                updateAdmin(request, response);
                break;
            case "login":
                loginAdmin(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "無效的操作");
                break;
        }
    }

    private void listAdmins(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<AdministratorVO> adminList = adminService.getAllAdministrators();
        System.out.println("Servlet - Fetched Admin List Size: " + adminList.size());
        request.setAttribute("adminList", adminList);
        request.getRequestDispatcher("/back-end/admin/adminList.jsp").forward(request, response); // 使用轉發
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        AdministratorVO admin = adminService.getAdministratorByAccount(account);
        request.setAttribute("admin", admin);
        request.getRequestDispatcher("/back-end/admin/editAdmin.jsp").forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/back-end/admin/addAdmin.jsp").forward(request, response);
    }

    private void createAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        String name = request.getParameter("name");
        String passcode = request.getParameter("passcode");

        AdministratorVO admin = new AdministratorVO();
        admin.setAccount(account);
        admin.setName(name);
        admin.setPasscode(passcode);

        adminService.addAdministrator(admin);
        response.sendRedirect(request.getContextPath() + "/admin?action=list");
    }

    private void updateAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        String name = request.getParameter("name");
        String passcode = request.getParameter("passcode");

        AdministratorVO admin = new AdministratorVO();
        admin.setAccount(account);
        admin.setName(name);
        admin.setPasscode(passcode);

        adminService.updateAdministrator(admin);
        response.sendRedirect(request.getContextPath() + "/admin?action=list");
    }

    private void deleteAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        adminService.deleteAdministrator(account);
        response.sendRedirect(request.getContextPath() + "/admin?action=list");
    }

    private void loginAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        String passcode = request.getParameter("passcode");

        AdministratorVO admin = adminService.getAdministratorByAccount(account);
        if (admin != null && admin.getPasscode().equals(passcode)) {
            HttpSession session = request.getSession();
            session.setAttribute("loggedInAdmin", admin);
            session.setAttribute("adminName", admin.getName());

            if (recordLogin(request, admin)) {
                response.sendRedirect(request.getContextPath() + "/back-end/bk_index.jsp");
            } else {
                request.setAttribute("errorMessage", "無法記錄登錄信息，請聯繫管理員");
                request.getRequestDispatcher("/back-end/bk_login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "帳號或密碼錯誤");
            request.getRequestDispatcher("/back-end/bk_login.jsp").forward(request, response);
        }
    }

    private boolean recordLogin(HttpServletRequest request, AdministratorVO admin) {
        try {
            LoginRecordVO loginRecord = new LoginRecordVO();
            loginRecord.setAdminNumber(admin.getNumber());
            loginRecord.setLoginTime(new Date());
            loginRecord.setIp(request.getRemoteAddr());
            loginRecord.setArea("Taiwan");
            loginRecord.setUserType("admin");

            loginRecordService.addLoginRecord(loginRecord);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
