<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="no-js" lang="en">
<head>
    <title>登入</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .login-form {
            max-width: 400px;
            margin: auto;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .login-form h3 {
            text-align: center;
            margin-bottom: 20px;
        }
        .error_message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-form mt-5">
            <h3>Login</h3>
            <form action="${pageContext.request.contextPath}/userLogin" method="post">
                <div class="form-group">
                    <label for="account">帳號👤</label>
                    <input type="text" class="form-control" id="account" name="account" required>
                </div>
                <div class="form-group">
                    <label for="passcode">密碼🔑</label>
                    <input type="password" class="form-control" id="passcode" name="passcode" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">🔥🔥🔥登入🔥🔥🔥 </button>
                <div class="form-group">
                    <a href="${pageContext.request.contextPath}/front-end/login/forgotPassword.jsp">忘記密碼🔒❓</a>
                </div>
                <div class="form-group">
                    <a href="${pageContext.request.contextPath}/front-end/login/registration.jsp">現在 我想來點...🐧會員註冊🐧</a>
                </div>
                <c:if test="${not empty errorMessage}">
                    <div class="error_message">${errorMessage}</div>
                </c:if>
            </form>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
