<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.user.model.UserVO"%>

<%
    UserVO user = (UserVO) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Welcome</title>
</head>
<body>
    <h2>Welcome, ${user.name}</h2>
    <p>You have successfully logged in.</p>
    <form action="<c:url value='/logout' />" method="post">
        <button type="submit">Logout</button>
    </form>
</body>
</html>
