<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session != null) {
        session.invalidate();
    }
    // 檢查是否已經提交響應，並且只有在尚未提交響應時進行重定向
    if (!response.isCommitted()) {
        response.sendRedirect(request.getContextPath() + "/front-end/login/login.jsp");
    }
%>
