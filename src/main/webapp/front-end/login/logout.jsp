<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/front-end/my-account.jsp" %>

<%
    // Invalidate the session to log out the user
    session.invalidate();

    // Redirect to the login page
    response.sendRedirect(request.getContextPath() + "/front-end/login/login.jsp");
%>
