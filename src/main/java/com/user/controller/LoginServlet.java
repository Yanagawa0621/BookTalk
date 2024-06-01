package com.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.user.model.UserDAO;
import com.user.model.UserService;
import com.user.model.UserServiceImpl;
import com.user.model.UserVO;
import util.HibernateUtil;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();
        userService = new UserServiceImpl(new UserDAO(HibernateUtil.getSessionFactory()));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        String password = request.getParameter("password");

        UserVO user = userService.getUserByAccount(account);

        if (user != null && user.getPasscode().equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect(request.getContextPath() + "/front-end/user/welcome.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid account or password");
            request.getRequestDispatcher("/front-end/user/login.jsp").forward(request, response);
        }
    }
}
