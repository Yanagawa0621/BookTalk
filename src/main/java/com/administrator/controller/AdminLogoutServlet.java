package com.administrator.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/adminLogout")
public class AdminLogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
            System.out.println("AdminLogoutServlet: Session invalidated");
        } else {
            System.out.println("AdminLogoutServlet: No session to invalidate");
        }
        response.sendRedirect(request.getContextPath() + "/back-end/bk_login.jsp");
        System.out.println("AdminLogoutServlet: Redirecting to login page");
    }
}
