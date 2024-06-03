package com.login.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.model.UserService;
import com.user.model.UserServiceImpl;
import com.user.model.UserVO;
import com.user.model.UserDAO;
import util.HibernateUtil;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;

    public void init() {
        userService = new UserServiceImpl(new UserDAO(HibernateUtil.getSessionFactory()));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;

        if (account == null || account.isEmpty()) {
            request.setAttribute("status", "invalidAccount");
            dispatcher = request.getRequestDispatcher("/front-end/user/login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (password == null || password.isEmpty()) {
            request.setAttribute("status", "invalidPassword");
            dispatcher = request.getRequestDispatcher("/front-end/user/login.jsp");
            dispatcher.forward(request, response);
            return;
        }

        UserVO user = userService.getUserByAccount(account);
        if (user != null && user.getPasscode().equals(password)) {
            session.setAttribute("userNumber", user.getNumber());
            session.setAttribute("userName", user.getName());
            session.setAttribute("user", user);

            System.out.println("User stored in session: " + user);

            response.sendRedirect(request.getContextPath() + "/front-end/my-account.jsp");
        } else {
            request.setAttribute("status", "failed");
            dispatcher = request.getRequestDispatcher("/front-end/user/login.jsp");
            dispatcher.forward(request, response);
        }
    }
}
