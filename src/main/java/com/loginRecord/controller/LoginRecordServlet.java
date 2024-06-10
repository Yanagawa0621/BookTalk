package com.loginRecord.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
import com.loginRecord.model.LoginRecordService;
import com.loginRecord.model.LoginRecordServiceImpl;
import com.loginRecord.model.LoginRecordVO;
import com.user.model.UserVO;

@WebServlet("/loginRecord")
public class LoginRecordServlet extends HttpServlet {
    private LoginRecordService loginRecordService;

    @Override
    public void init() throws ServletException {
        loginRecordService = new LoginRecordServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer userNumber = (Integer) request.getSession().getAttribute("userNumber");
        if (userNumber == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String ip = request.getRemoteAddr();
        String area = "Taiwan"; // 假設地區固定為Taiwan，可以根據需求修改

        UserVO user = new UserVO();
        user.setNumber(userNumber);

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            try {
                LoginRecordVO loginRecord = new LoginRecordVO();
                loginRecord.setUser(user);
                loginRecord.setLoginTime(new Date());
                loginRecord.setIp(ip);
                loginRecord.setArea(area);

                loginRecordService.addLoginRecord(loginRecord);

                transaction.commit();
                response.sendRedirect(request.getContextPath() + "/back-end/user/loginSuccess.jsp");
            } catch (Exception e) {
                if (transaction != null) transaction.rollback();
                throw new ServletException(e);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String userType = request.getParameter("userType");
        String timeRange = request.getParameter("timeRange");
        String customDaysStr = request.getParameter("customDays");

        // 打印參數以進行調試
        System.out.println("userName: " + userName);
        System.out.println("userType: " + userType);
        System.out.println("timeRange: " + timeRange);
        System.out.println("customDaysStr: " + customDaysStr);

        List<LoginRecordVO> loginRecords = loginRecordService.searchLoginRecords(userName, userType, timeRange, customDaysStr);
        request.setAttribute("loginRecords", loginRecords);

        request.getRequestDispatcher("/back-end/user/loginRecord.jsp").forward(request, response);
    }

}
