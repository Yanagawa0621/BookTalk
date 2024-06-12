<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    HttpSession adminSession = request.getSession(false);
    if (adminSession == null || adminSession.getAttribute("loggedInAdmin") == null) {
        System.out.println("checkAdminSession: No session or loggedInAdmin attribute, redirecting to login page.");
        response.sendRedirect(request.getContextPath() + "/back-end/bk_login.jsp");
        return;
    }
%>
