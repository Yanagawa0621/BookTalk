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
import com.user.model.UserDAO;
import com.user.model.UserVO;
import com.user.model.DuplicateFieldException; // 添加这一行
import util.HibernateUtil;

@WebServlet("/newPassword")
public class NewPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;

    public void init() throws ServletException {
        userService = new UserServiceImpl(new UserDAO(HibernateUtil.getSessionFactory()));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");
        RequestDispatcher dispatcher = null;

        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
            String email = (String) session.getAttribute("email");
            UserVO user = userService.getUserByAccount(email);

            if (user != null) {
                user.setPasscode(newPassword);
                try {
                    userService.updateUser(user);
                    request.setAttribute("status", "resetSuccess");
                } catch (DuplicateFieldException e) {
                    request.setAttribute("status", "resetFailed");
                }
                dispatcher = request.getRequestDispatcher("/front-end/user/login.jsp");
            } else {
                request.setAttribute("status", "resetFailed");
                dispatcher = request.getRequestDispatcher("/front-end/user/login.jsp");
            }
            dispatcher.forward(request, response);
        }
    }
}
