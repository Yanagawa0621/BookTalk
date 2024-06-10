package com.user.controller;

import java.io.IOException;
import java.util.Date;
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
import com.loginRecord.model.LoginRecordService;
import com.loginRecord.model.LoginRecordServiceImpl;
import com.loginRecord.model.LoginRecordVO;

@WebServlet("/userLogin")
public class UserLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;
    private LoginRecordService loginRecordService;

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserServiceImpl();
        this.loginRecordService = new LoginRecordServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // 防止創建新 session
        if (session != null) {
            session.invalidate(); // 使當前 session 無效
        }
        response.sendRedirect(request.getContextPath() + "/front-end/login/login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        String passcode = request.getParameter("passcode");

        UserVO user = userService.getUserByAccount(account);

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            try {
                if (user != null && user.getPasscode().equals(passcode)) {
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("loggedInUser", user);
                    httpSession.setAttribute("userName", user.getName());
                    httpSession.setAttribute("userNumber", user.getNumber()); // 添加 userNumber 到 session
                    httpSession.setAttribute("welcomeMessage", "🎉 Welcome " + user.getName() + " to BookTalk! 📚"); // 登入成功後顯示歡迎該使用者+emoji

                    // 記錄登入信息
                    if (recordLogin(request, user)) {
                        response.sendRedirect(request.getContextPath() + "/index.jsp");
                    } else {
                        request.setAttribute("errorMessage", "無法記錄登錄信息，請聯繫管理員");
                        request.getRequestDispatcher("/front-end/my_account.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("errorMessage", "帳號或密碼錯誤");
                    request.getRequestDispatcher("/front-end/my_account.jsp").forward(request, response);
                }
                transaction.commit();
            } catch (Exception e) {
                if (transaction != null) transaction.rollback();
                throw new ServletException(e);
            }
        }
    }

    private boolean recordLogin(HttpServletRequest request, UserVO user) {
        try {
            LoginRecordVO loginRecord = new LoginRecordVO();
            loginRecord.setUser(user);
            loginRecord.setLoginTime(new Date());
            loginRecord.setIp(request.getRemoteAddr());
            loginRecord.setArea("Taiwan"); // 這個可以根據實際情況動態設置
            loginRecord.setUserType("user"); // 設置用戶類型為普通用戶

            loginRecordService.addLoginRecord(loginRecord);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
