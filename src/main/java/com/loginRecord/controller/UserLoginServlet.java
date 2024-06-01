package com.loginRecord.controller;

import java.io.IOException;
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

@WebServlet("/user/login")
public class UserLoginServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl(new UserDAO(HibernateUtil.getSessionFactory()));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        String passcode = request.getParameter("passcode");

        UserVO user = userService.getUserByAccount(account);

        if (user != null && user.getPasscode().equals(passcode)) {
            // 登录成功，记录会话信息
            HttpSession session = request.getSession();
            session.setAttribute("userNumber", user.getNumber());
            session.setAttribute("userName", user.getName());

            // 获取 IP 和区域信息
            String ip = request.getRemoteAddr();
            String area = getAreaByIp(ip); // 需要实现 getAreaByIp 方法

            // 将登录信息记录到数据库
            request.getRequestDispatcher("/loginRecord?userNumber=" + user.getNumber() + "&ip=" + ip + "&area=" + area).forward(request, response);
        } else {
            // 登录失败
            request.setAttribute("errorMessage", "账号或密码错误");
            request.getRequestDispatcher("/front-end/user/login.jsp").forward(request, response);
        }
    }

    private String getAreaByIp(String ip) {
        // 模拟区域信息，实际可以调用第三方API
        return "Taiwan";
    }
}
