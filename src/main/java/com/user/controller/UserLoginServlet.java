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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebServlet("/userLogin")
public class UserLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;
    private LoginRecordService loginRecordService;
    private static final Logger logger = LoggerFactory.getLogger(UserLoginServlet.class);

    @Override
    public void init() throws ServletException {
        super.init();
        this.userService = new UserServiceImpl();
        this.loginRecordService = new LoginRecordServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // 防止創建新 session
        if (session != null) {
            session.invalidate(); // 使當前 session 無效
            logger.info("Session invalidated during GET request");
        }
        response.sendRedirect(request.getContextPath() + "/front-end/login/login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        String passcode = request.getParameter("passcode");

        UserVO user = userService.getUserByAccount(account);
        logger.info("Attempting login for account: {}", account);

        if (user != null && user.getPasscode().equals(passcode)) {
            HttpSession httpSession = request.getSession();
            httpSession.invalidate(); // 銷毀舊的 session
            httpSession = request.getSession(true); // 創建新的 session

            httpSession.setAttribute("loggedInUser", user);
            httpSession.setAttribute("userName", user.getName());
            httpSession.setAttribute("userNumber", user.getNumber());
            httpSession.setAttribute("welcomeMessage", "🎉 歡迎 " + user.getName() + " 來到 BookTalk! 📚");

            logger.info("User {} logged in successfully", user.getName());

            // 記錄登錄信息
            if (recordLogin(request, user)) {
                logger.info("Login record created for user: {}", user.getName());
                response.sendRedirect(request.getContextPath() + "/index.jsp");
            } else {
                logger.error("Failed to record login for user: {}", user.getName());
                request.setAttribute("errorMessage", "無法記錄登錄信息，請聯繫管理員");
                request.getRequestDispatcher("/front-end/login/login.jsp").forward(request, response);
            }
        } else {
            logger.warn("Invalid login attempt for account: {}", account);
            request.setAttribute("errorMessage", "帳號或密碼錯誤");
            request.getRequestDispatcher("/front-end/login/login.jsp").forward(request, response);
        }
    }

    private boolean recordLogin(HttpServletRequest request, UserVO user) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            LoginRecordVO loginRecord = new LoginRecordVO();
            loginRecord.setUser(user);
            loginRecord.setLoginTime(new Date());
            loginRecord.setIp(request.getRemoteAddr());
            loginRecord.setArea("Taiwan"); // 這個可以根據實際情況動態設置
            loginRecord.setUserType("user"); // 設置用戶類型為普通用戶

            loginRecordService.addLoginRecord(loginRecord);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            logger.error("Error recording login for user: {}", user.getName(), e);
            return false;
        }
    }
}
