<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
</head>
<body>
    <h2>User Login</h2>
    <form action="userLogin" method="post">
        <label for="account">Account:</label>
        <input type="text" id="account" name="account" required><br>
        <label for="passcode">Password:</label>
        <input type="password" id="passcode" name="passcode" required><br>
        <input type="submit" value="Login">
    </form>
    <%
        if (request.getAttribute("errorMessage") != null) {
            out.println("<p style='color:red'>" + request.getAttribute("errorMessage") + "</p>");
        }
    %>
</body>
</html>
