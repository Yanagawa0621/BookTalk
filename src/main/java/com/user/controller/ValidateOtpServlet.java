package com.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/validateOtp")
public class ValidateOtpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int value = Integer.parseInt(request.getParameter("otp"));
        HttpSession session = request.getSession();
        int otp = (int) session.getAttribute("otp");

        if (value == otp) {
            request.setAttribute("email", session.getAttribute("email"));
            request.setAttribute("status", "success");
            request.getRequestDispatcher("/front-end/login/newPassword.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "wrong otp");
            request.getRequestDispatcher("/front-end/login/EnterOtp.jsp").forward(request, response);
        }
    }
}
