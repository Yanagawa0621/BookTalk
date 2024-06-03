<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        body { 
            background-color: #f8f9fa; 
            display: flex;
            justify-content: center; 
            align-items: center; 
            height: 100vh; 
        } 
        .login-container { 
            background-color: #ffffff; 
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
            width: 100%;
            max-width: 500px; 
        } 
        .login-container h2 { 
            margin-bottom: 20px; 
        } 
        .form-group { 
            margin-bottom: 15px; 
        } 
        .form-control { 
            border-radius: 5px; 
        } 
        .btn-primary { 
            width: 100%; 
            border-radius: 5px; 
        } 
        .error-message { 
            color: red; 
            margin-top: 10px; 
        } 
    </style>
</head>
<body>
    <input type="hidden" id="status" value="<%=request.getAttribute("status")%>">

    <div class="main">

        <!-- Sign in Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure>
                            <img src="${pageContext.request.contextPath}/images/signin-image.jpg" alt="sign up image">
                        </figure>
                        <a href="${pageContext.request.contextPath}/front-end/user/registration.jsp" class="signup-image-link">Create an account</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign in</h2>
                        <form action="<c:url value='/login' />" method="post" class="register-form" id="login-form">
                            <div class="form-group">
                                <label for="account"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="account" id="account" class="form-control" placeholder="Your Name" required="required"/>
                            </div>
                            <div class="form-group">
                                <label for="password"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="password" id="password" class="form-control" placeholder="Password" required="required"/>
                            </div>
                            <div class="form-group">
                                <a href="${pageContext.request.contextPath}/front-end/user/forgotPassword.jsp">Forgot Password?</a>
                            </div>
                            <div class="form-group form-button">
                                <button type="submit" class="btn btn-primary">Login</button>
                            </div>
                            <c:if test="${not empty errorMessage}">
                                <div class="error-message">
                                    ${errorMessage}
                                </div>
                            </c:if>
                        </form>
                        <div class="social-login">
                            <span class="social-label">Or login with</span>
                            <ul class="socials">
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">

    <script type="text/javascript">
    var status = document.getElementById("status").value;
    if (status == "failed") {
        swal("Sorry", "Wrong Username or Password", "error");
    } else if (status == "invalidEmail") {
        swal("Sorry", "Please Enter Username", "error");
    } else if (status == "invalidUpwd") {
        swal("Sorry", "Please Enter Password", "error");
    } else if (status == "resetSuccess") {
        swal("Congrats", "Password Reset Successful", "success");
    } else if (status == "resetFailed") {
        swal("Sorry", "Password Reset Failed", "error");
    }
    </script>
</body>
</html>
