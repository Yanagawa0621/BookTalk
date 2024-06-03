<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up</title>

<!-- Font Icon -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<div class="main">
    <!-- Sign up form -->
    <section class="signup">
        <div class="container">
            <div class="signup-content">
                <div class="signup-form">
                    <h2 class="form-title">Sign up</h2>

                    <form method="post" action="register" class="register-form" id="register-form">
                        <div class="form-group">
                            <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="name" id="name" placeholder="Your Name" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="email"><i class="zmdi zmdi-email"></i></label>
                            <input type="email" name="email" id="email" placeholder="Your Email" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="pass" id="pass" placeholder="Password" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="re_pass"><i class="zmdi zmdi-lock-outline"></i></label>
                            <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password" required="required"/>
                        </div>
                        <div class="form-group">
                            <label for="contact"><i class="zmdi zmdi-phone"></i></label>
                            <input type="text" name="contact" id="contact" placeholder="Contact no" required="required"/>
                        </div>
                        <div class="form-group">
                            <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" required="required"/>
                            <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in <a href="#" class="term-service">Terms of service</a></label>
                        </div>
                        <div class="form-group form-button">
                            <input type="submit" name="signup" id="signup" class="form-submit" value="Register" />
                        </div>
                    </form>
                </div>
                <div class="signup-image">
                    <figure>
                        <img src="${pageContext.request.contextPath}/images/signup-image.jpg" alt="sign up image">
                    </figure>
                    <a href="${pageContext.request.contextPath}/front-end/login/login.jsp" class="signup-image-link">I am already member</a>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- JS -->
<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">

<script type="text/javascript">
<% String status = (String) request.getAttribute("status"); %>
<c:choose>
    <c:when test="${status == 'success'}">
        swal("Congrats", "Account Created Successfully", "success");
    </c:when>
    <c:when test="${status == 'invalidName'}">
        swal("Sorry", "Please Enter Name", "error");
    </c:when>
    <c:when test="${status == 'invalidEmail'}">
        swal("Sorry", "Please Enter Email", "error");
    </c:when>
    <c:when test="${status == 'invalidUpwd'}">
        swal("Sorry", "Please Enter Password", "error");
    </c:when>
    <c:when test="${status == 'invalidMobile'}">
        swal("Sorry", "Please Enter Mobile Number", "error");
    </c:when>
    <c:when test="${status == 'invalidMobileLength'}">
        swal("Sorry", "Mobile Number should be of 10 digits", "error");
    </c:when>
    <c:when test="${status == 'invalidConfirmPassword'}">
        swal("Sorry", "Passwords do not match", "error");
    </c:when>
</c:choose>
</script>

</body>
</html>
