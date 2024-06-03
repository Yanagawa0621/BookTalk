package com.loginRecord.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.loginRecord.model.LoginRecordDAO;
import com.loginRecord.model.LoginRecordService;
import com.loginRecord.model.LoginRecordServiceImpl;
import com.loginRecord.model.LoginRecordVO;
import com.user.model.UserVO;

import util.HibernateUtil;

@WebServlet("/loginRecord")
public class LoginRecordServlet extends HttpServlet {
    private LoginRecordService loginRecordService;

    @Override
    public void init() throws ServletException {
        loginRecordService = new LoginRecordServiceImpl(new LoginRecordDAO(HibernateUtil.getSessionFactory()));
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

        LoginRecordVO loginRecord = new LoginRecordVO();
        loginRecord.setUser(user);
        loginRecord.setLoginTime(new Date());
        loginRecord.setIp(ip);
        loginRecord.setArea(area);

        loginRecordService.addLoginRecord(loginRecord);

        response.sendRedirect(request.getContextPath() + "/back-end/user/loginSuccess.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userNumberStr = request.getParameter("userNumber");
        if (userNumberStr != null && !userNumberStr.isEmpty()) {
            try {
                Integer userNumber = Integer.parseInt(userNumberStr);
                List<LoginRecordVO> loginRecords = loginRecordService.getLoginRecordsByUserNumber(userNumber);
                request.setAttribute("loginRecords", loginRecords);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "使用者編號格式錯誤。");
            }
        }
        request.getRequestDispatcher("/back-end/user/loginRecord.jsp").forward(request, response);
    }
}
