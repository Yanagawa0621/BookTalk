package com.userStatus.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.userStatus.model.UserStatusService;
import com.userStatus.model.UserStatusServiceImpl;
import com.userStatus.model.UserStatusVO;

@WebServlet("/userStatus")
public class UserStatusServlet extends HttpServlet {

    private UserStatusService userStatusService;

    @Override
    public void init() throws ServletException {
        // Initialize the implementation of UserStatusService
        userStatusService = new UserStatusServiceImpl(); // You should inject an instance of UserStatusService based on your actual setup
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null || action.isEmpty()) {
            // If no action specified, default to showing all user statuses
            List<UserStatusVO> userStatusList = userStatusService.getAllUserStatuses();
            request.setAttribute("userStatusList", userStatusList);
            request.getRequestDispatcher("/userStatusList.jsp").forward(request, response);
        } else {
            switch (action) {
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updateStatus(request, response);
                    break;
                case "delete":
                    deleteStatus(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addUserStatus(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }

    private void addUserStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Read form inputs
        String statusName = request.getParameter("statusName");
        String statusDescribe = request.getParameter("statusDescribe");
        Integer statusDays = Integer.parseInt(request.getParameter("statusDays"));

        // Create UserStatusVO object
        UserStatusVO userStatus = new UserStatusVO();
        userStatus.setStatusName(statusName);
        userStatus.setStatusDescribe(statusDescribe);
        userStatus.setStatusDays(statusDays);

        // Call UserStatusService to add user status
        userStatusService.addUserStatus(userStatus);

        // Redirect to user status list page
        response.sendRedirect(request.getContextPath() + "/userStatus");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Read user status ID from request
        Integer userStatusId = Integer.parseInt(request.getParameter("userStatusId"));

        // Get user status by ID
        UserStatusVO userStatus = userStatusService.getUserStatusByNumber(userStatusId);

        // Set user status object as request attribute
        request.setAttribute("userStatus", userStatus);

        // Forward to edit page
        request.getRequestDispatcher("/editUserStatus.jsp").forward(request, response);
    }

    private void updateStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Read form inputs
        Integer userStatusId = Integer.parseInt(request.getParameter("userStatusId"));
        String statusName = request.getParameter("statusName");
        String statusDescribe = request.getParameter("statusDescribe");
        Integer statusDays = Integer.parseInt(request.getParameter("statusDays"));

        // Create UserStatusVO object
        UserStatusVO userStatus = new UserStatusVO();
        userStatus.setUserStatus(userStatusId);
        userStatus.setStatusName(statusName);
        userStatus.setStatusDescribe(statusDescribe);
        userStatus.setStatusDays(statusDays);

        // Call UserStatusService to update user status
        userStatusService.updateUserStatus(userStatus);

        // Redirect to user status list page
        response.sendRedirect(request.getContextPath() + "/userStatus");
    }

    private void deleteStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Read user status ID from request
        Integer userStatusId = Integer.parseInt(request.getParameter("userStatusId"));

        // Call UserStatusService to delete user status
        userStatusService.deleteUserStatus(userStatusId);

        // Redirect to user status list page
        response.sendRedirect(request.getContextPath() + "/userStatus");
    }
}
