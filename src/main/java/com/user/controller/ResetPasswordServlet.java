package com.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
import com.user.model.UserService;
import com.user.model.UserServiceImpl;
import com.user.model.UserVO;
import com.user.model.DuplicateFieldException;

@WebServlet("/resetPassword")
public class ResetPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        this.userService = new UserServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        String confPassword = request.getParameter("confPassword");

        if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
            String email = (String) session.getAttribute("email");

            try (Session hibernateSession = HibernateUtil.getSessionFactory().openSession()) {
                Transaction transaction = hibernateSession.beginTransaction();

                UserVO user = userService.getUserByEmail(email, hibernateSession);
                if (user != null) {
                    user.setPasscode(newPassword);
                    try {
                        userService.updateUser(user, hibernateSession);
                        transaction.commit();
                        request.setAttribute("status", "resetSuccess");
                    } catch (DuplicateFieldException e) {
                        transaction.rollback();
                        request.setAttribute("status", "resetFailed");
                        request.setAttribute("errorMessage", e.getMessage());
                    }
                } else {
                    request.setAttribute("status", "resetFailed");
                    request.setAttribute("message", "Email not found");
                }

                request.getRequestDispatcher("/front-end/login/login.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("message", "Passwords do not match");
            request.getRequestDispatcher("/front-end/login/newPassword.jsp").forward(request, response);
        }
    }
}
