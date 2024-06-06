<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="com.administrator.model.AdministratorVO" %>

<%
    AdministratorVO admin = (AdministratorVO) session.getAttribute("loggedInAdmin");
    if (admin == null) {
        response.sendRedirect(request.getContextPath() + "/back-end/bk_login.jsp");
        return;
    }
    String adminName = admin.getName();
%>
