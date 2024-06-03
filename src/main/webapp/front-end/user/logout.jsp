<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>

<%
    // Invalidate the session to log out the user
    session.invalidate();

    // Redirect to the login page
    response.sendRedirect(request.getContextPath() + "/front-end/login/login.jsp");
%>
