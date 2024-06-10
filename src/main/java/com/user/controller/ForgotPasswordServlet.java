package com.user.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import util.HibernateUtil;
import com.user.model.UserService;
import com.user.model.UserServiceImpl;
import com.user.model.UserVO;

@WebServlet("/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;

    @Override
    public void init() throws ServletException {
        this.userService = new UserServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        int otpvalue = 0;
        HttpSession mySession = request.getSession();

        if (email != null && !email.equals("")) {
            try (org.hibernate.Session hibernateSession = HibernateUtil.getSessionFactory().openSession()) {
                UserVO user = userService.getUserByEmail(email, hibernateSession);
                if (user != null) {
                    // Generate OTP
                    Random rand = new Random();
                    otpvalue = rand.nextInt(1255650);

                    // Sending OTP
                    String to = email;
                    Properties props = new Properties();
                    props.put("mail.smtp.host", "smtp.gmail.com");
                    props.put("mail.smtp.socketFactory.port", "465");
                    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.port", "465");

                    Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication("testsiantest@gmail.com", "cagw mzcm ovck ljvp");
                        }
                    });

                    try {
                        MimeMessage message = new MimeMessage(session);
                        message.setFrom(new InternetAddress("your-email@gmail.com"));
                        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                        message.setSubject("Password Reset OTP");
                        message.setText("Your OTP is: " + otpvalue);
                        Transport.send(message);
                        System.out.println("Message sent successfully");
                    } catch (MessagingException e) {
                        e.printStackTrace();
                        throw new RuntimeException(e);
                    }

                    request.setAttribute("message", "OTP is sent to your email id");
                    mySession.setAttribute("otp", otpvalue);
                    mySession.setAttribute("email", email);
                    request.getRequestDispatcher("/front-end/login/EnterOtp.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "Email is not registered");
                    request.getRequestDispatcher("/front-end/login/forgotPassword.jsp").forward(request, response);
                }
            }
        } else {
            request.setAttribute("message", "Email is required");
            request.getRequestDispatcher("/front-end/login/forgotPassword.jsp").forward(request, response);
        }
    }
}
