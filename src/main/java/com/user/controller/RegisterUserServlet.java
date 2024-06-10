package com.user.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;
import com.user.model.DuplicateFieldException;
import com.user.model.UserService;
import com.user.model.UserServiceImpl;
import com.user.model.UserVO;

@WebServlet("/registerUser")
@MultipartConfig
public class RegisterUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        this.userService = new UserServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String account = request.getParameter("account");
        String passcode = request.getParameter("passcode");
        String name = request.getParameter("name");
        String eMail = request.getParameter("eMail");
        String introduceOneself = request.getParameter("introduceOneself");
        String birthdayStr = request.getParameter("birthday");
        String nationalIdNumber = request.getParameter("nationalIdNumber");
        String telephoneNumber = request.getParameter("telephoneNumber");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String address = request.getParameter("address");
        String sex = request.getParameter("sex");

        System.out.println("Received registration request:");
        System.out.println("Account: " + account);
        System.out.println("Passcode: " + passcode);
        System.out.println("Name: " + name);
        System.out.println("Email: " + eMail);
        System.out.println("IntroduceOneself: " + introduceOneself);
        System.out.println("Birthday: " + birthdayStr);
        System.out.println("National ID: " + nationalIdNumber);
        System.out.println("Telephone: " + telephoneNumber);
        System.out.println("City: " + city);
        System.out.println("District: " + district);
        System.out.println("Address: " + address);
        System.out.println("Sex: " + sex);
        
        try (Session hibernateSession = HibernateUtil.getSessionFactory().openSession()) {
            Transaction transaction = hibernateSession.beginTransaction();
            try {
                UserVO user = new UserVO();
                user.setAccount(account);
                user.setPasscode(passcode);
                user.setName(name);
                user.seteMail(eMail);
                user.setIntroduceOneself(introduceOneself);
                user.setNationalIdNumber(nationalIdNumber);
                user.setTelephoneNumber(telephoneNumber);
                user.setCity(city);
                user.setDistrict(district);
                user.setAddress(address);
                user.setSex(sex);

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date birthday = dateFormat.parse(birthdayStr);
                user.setBirthday(new java.sql.Date(birthday.getTime()));

                user.setAccountStatusNumber(1); // 設定帳號狀態為 "正常"
                user.setAccessNumber(1); // 設定權限編號為 "一般會員"
                Date today = new Date();
                user.setRegisterDate(new java.sql.Date(today.getTime()));
                user.setStatusStartDate(new java.sql.Date(today.getTime()));

                userService.addUser(user);
                transaction.commit();
                System.out.println("User registered successfully.");
                response.sendRedirect(request.getContextPath() + "/front-end/login/login.jsp");
            } catch (DuplicateFieldException e) {
                if (transaction != null) transaction.rollback();
                System.out.println("Duplicate field: " + e.getErrorMessage());
                request.setAttribute("fieldName", e.getErrorMessage().keySet().iterator().next());
                request.setAttribute("errorMessage", e.getErrorMessage().values().iterator().next());
                request.getRequestDispatcher("/front-end/login/registration.jsp").forward(request, response);
            } catch (ParseException e) {
                if (transaction != null) transaction.rollback();
                System.out.println("Date parse error: " + e.getMessage());
                request.setAttribute("errorMessage", "日期解析錯誤");
                request.getRequestDispatcher("/front-end/login/registration.jsp").forward(request, response);
            }
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
            throw new ServletException(e);
        }
    }
}
