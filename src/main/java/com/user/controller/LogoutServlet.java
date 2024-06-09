package com.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 獲取當前 session，如果不存在則返回 null
        HttpSession session = request.getSession(false);
        if (session != null) {
            // 使當前 session 無效
            session.invalidate();
        }
        // 重定向到登錄頁面
        response.sendRedirect(request.getContextPath() + "/front-end/login/login.jsp");
    }
}
