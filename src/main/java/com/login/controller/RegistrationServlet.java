package com.login.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.model.UserService;
import com.user.model.UserServiceImpl;
import com.user.model.UserVO;
import com.user.model.DuplicateFieldException;
import com.user.model.UserDAO;
import util.HibernateUtil;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;

    public void init() {
        userService = new UserServiceImpl(new UserDAO(HibernateUtil.getSessionFactory()));
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("name");
        String uemail = request.getParameter("email");
        String upwd = request.getParameter("pass");
        String reupwd = request.getParameter("re_pass");
        String umobile = request.getParameter("contact");
        RequestDispatcher dispatcher = null;

        if (uname == null || uname.equals("")) {
            request.setAttribute("status", "invalidName");
            dispatcher = request.getRequestDispatcher("/front-end/user/registration.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (uemail == null || uemail.equals("")) {
            request.setAttribute("status", "invalidEmail");
            dispatcher = request.getRequestDispatcher("/front-end/user/registration.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (upwd == null || upwd.equals("")) {
            request.setAttribute("status", "invalidUpwd");
            dispatcher = request.getRequestDispatcher("/front-end/user/registration.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (!upwd.equals(reupwd)) {
            request.setAttribute("status", "invalidConfirmPassword");
            dispatcher = request.getRequestDispatcher("/front-end/user/registration.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if (umobile == null || umobile.equals("") || umobile.length() > 10) {
            request.setAttribute("status", "invalidMobile");
            dispatcher = request.getRequestDispatcher("/front-end/user/registration.jsp");
            dispatcher.forward(request, response);
            return;
        }

        UserVO user = new UserVO();
        user.setName(uname);
        user.seteMail(uemail);
        user.setPasscode(upwd);
        user.setTelephoneNumber(umobile);

        try {
            userService.addUser(user);
            request.setAttribute("status", "success");
        } catch (DuplicateFieldException e) {
            request.setAttribute("status", "duplicateField");
            request.setAttribute("field", e.getField());
        }

        dispatcher = request.getRequestDispatcher("/front-end/user/registration.jsp");
        dispatcher.forward(request, response);
    }
}
