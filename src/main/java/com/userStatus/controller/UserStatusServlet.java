package com.userStatus.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
import com.userStatus.model.UserStatusDAO;
import com.userStatus.model.UserStatusService;
import com.userStatus.model.UserStatusServiceImpl;
import com.userStatus.model.UserStatusVO;

@WebServlet("/userStatus")
public class UserStatusServlet extends HttpServlet {

    private UserStatusService userStatusService;

    @Override
    public void init() throws ServletException {
        userStatusService = new UserStatusServiceImpl(new UserStatusDAO());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            try {
                if (action == null || action.isEmpty()) {
                    // 如果未指定操作，默認顯示所有用戶狀態
                    List<UserStatusVO> userStatusList = userStatusService.getAllUserStatuses();
                    request.setAttribute("userStatusList", userStatusList);
                    request.getRequestDispatcher("/userStatusList.jsp").forward(request, response);
                } else {
                    switch (action) {
                        case "edit":
                            showEditForm(request, response, session);
                            break;
                        case "update":
                            updateStatus(request, response, session);
                            break;
                        case "delete":
                            deleteStatus(request, response, session);
                            break;
                        default:
                            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
                    }
                }
                transaction.commit();
            } catch (Exception e) {
                if (transaction != null) transaction.rollback();
                throw new ServletException(e);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            try {
                if ("add".equals(action)) {
                    addUserStatus(request, response, session);
                } else {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
                }
                transaction.commit();
            } catch (Exception e) {
                if (transaction != null) transaction.rollback();
                throw new ServletException(e);
            }
        }
    }

    private void addUserStatus(HttpServletRequest request, HttpServletResponse response, Session session) throws ServletException, IOException {
        // 讀取表單輸入
        String statusName = request.getParameter("statusName");
        String statusDescribe = request.getParameter("statusDescribe");
        Integer statusDays = Integer.parseInt(request.getParameter("statusDays"));

        // 創建 UserStatusVO 物件
        UserStatusVO userStatus = new UserStatusVO();
        userStatus.setStatusName(statusName);
        userStatus.setStatusDescribe(statusDescribe);
        userStatus.setStatusDays(statusDays);

        // 調用 UserStatusService 添加用戶狀態
        userStatusService.addUserStatus(userStatus);

        // 重定向到用戶狀態列表頁面
        response.sendRedirect(request.getContextPath() + "/userStatus");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response, Session session) throws ServletException, IOException {
        // 從請求中讀取用戶狀態ID
        Integer userStatusId = Integer.parseInt(request.getParameter("userStatusId"));

        // 根據ID獲取用戶狀態
        UserStatusVO userStatus = userStatusService.getUserStatusByNumber(userStatusId);

        // 將用戶狀態物件設置為請求屬性
        request.setAttribute("userStatus", userStatus);

        // 轉發到編輯頁面
        request.getRequestDispatcher("/editUserStatus.jsp").forward(request, response);
    }

    private void updateStatus(HttpServletRequest request, HttpServletResponse response, Session session) throws ServletException, IOException {
        // 讀取表單輸入
        Integer userStatusId = Integer.parseInt(request.getParameter("userStatusId"));
        String statusName = request.getParameter("statusName");
        String statusDescribe = request.getParameter("statusDescribe");
        Integer statusDays = Integer.parseInt(request.getParameter("statusDays"));

        // 創建 UserStatusVO 物件
        UserStatusVO userStatus = new UserStatusVO();
        userStatus.setUserStatus(userStatusId);
        userStatus.setStatusName(statusName);
        userStatus.setStatusDescribe(statusDescribe);
        userStatus.setStatusDays(statusDays);

        // 調用 UserStatusService 更新用戶狀態
        userStatusService.updateUserStatus(userStatus);

        // 重定向到用戶狀態列表頁面
        response.sendRedirect(request.getContextPath() + "/userStatus");
    }

    private void deleteStatus(HttpServletRequest request, HttpServletResponse response, Session session) throws ServletException, IOException {
        // 從請求中讀取用戶狀態ID
        Integer userStatusId = Integer.parseInt(request.getParameter("userStatusId"));

        // 調用 UserStatusService 刪除用戶狀態
        userStatusService.deleteUserStatus(userStatusId);

        // 重定向到用戶狀態列表頁面
        response.sendRedirect(request.getContextPath() + "/userStatus");
    }
}
