<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>User Login</title>
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
             width: 100%; */
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
     <div class="login-container">
         <h2 class="text-center">Login</h2> 
        <form action="<c:url value='/login' />" method="post"> 
             <div class="form-group"> 
                 <label for="account">Account:</label> 
                 <input type="text" class="form-control" id="account" name="account" required> 
             </div> 
             <div class="form-group">
                 <label for="password">Password:</label>
                 <input type="password" class="form-control" id="password" name="password" required>
             </div> 
             <div> 
                 <button type="submit" class="btn btn-primary">Login</button>
             </div> 
             <c:if test="${not empty errorMessage}"> 
                 <div class="error-message">
                    ${errorMessage}
                </div> 
             </c:if>
        </form> 
         <div class="text-center mt-3"> 
            <a href="<c:url value='/front-end/user/registration.jsp' />">Don't have an account? Register here</a>
         </div>
    </div> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 </body>
</html>
