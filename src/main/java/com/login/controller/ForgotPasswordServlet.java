package com.login.controller;

import java.io.IOException;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.util.EmailUtil;
import com.user.model.UserService;
import com.user.model.UserServiceImpl;
import com.user.model.UserDAO;
import util.HibernateUtil;

@WebServlet("/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {
    private UserService userService;

    public void init() throws ServletException {
        userService = new UserServiceImpl(new UserDAO(HibernateUtil.getSessionFactory()));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        RequestDispatcher dispatcher = null;
        int otpvalue = 0;
        HttpSession mySession = request.getSession();

        if (email != null && !email.equals("")) {
            // Sending OTP
            Random rand = new Random();
            otpvalue = rand.nextInt(1255650);

            String subject = "OTP for Password Reset";
            String content = "Your OTP is: " + otpvalue;

            boolean isEmailSent = EmailUtil.sendEmail(email, subject, content);

            if (isEmailSent) {
                mySession.setAttribute("otp", otpvalue);
                mySession.setAttribute("email", email);
                request.setAttribute("message", "OTP is sent to your email id");
                dispatcher = request.getRequestDispatcher("/front-end/user/EnterOtp.jsp");
            } else {
                request.setAttribute("message", "Failed to send OTP. Please try again.");
                dispatcher = request.getRequestDispatcher("/front-end/user/forgotPassword.jsp");
            }
            dispatcher.forward(request, response);
        }
    }
}
