package com.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.user.model.UserVO;

@WebFilter(urlPatterns = { "/front-end/my-account.jsp", "/front-end/account_details.jsp" })
public class LoginFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        if (session == null || session.getAttribute("loggedInUser") == null) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/front-end/login/login.jsp");
            return;
        }

        // 将用户信息放入 request 属性中
        UserVO user = (UserVO) session.getAttribute("loggedInUser");
        httpRequest.setAttribute("user", user);

        chain.doFilter(request, response);
    }

    public void init(FilterConfig fConfig) throws ServletException {}

    public void destroy() {}
}
