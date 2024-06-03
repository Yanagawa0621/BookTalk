<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.user.model.UserService" %>
<%@ page import="com.user.model.UserServiceImpl" %>
<%@ page import="com.user.model.UserDAO" %>
<%@ page import="com.user.model.UserVO" %>
<%@ page import="util.HibernateUtil" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // get使用者列表
    UserService userService = new UserServiceImpl(new UserDAO(HibernateUtil.getSessionFactory()));
    List<UserVO> userList = userService.getAllUsers();
    request.setAttribute("userList", userList);
%>

<!DOCTYPE html>
<html>
<head>
    <title>User List</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">User List</h2>
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>編號</th>
                    <th>帳號</th>
                    <th>名字</th>
                    <th>電子郵件</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${userList}">
                    <tr>
                        <td>${user.number}</td>
                        <td>${user.account}</td>
                        <td>${user.name}</td>
                        <td>${user.eMail}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/user?action=edit&number=${user.number}" class="btn btn-sm btn-primary">Edit</a>
                            <a href="${pageContext.request.contextPath}/user?action=delete&number=${user.number}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="${pageContext.request.contextPath}/back-end/user/addUser.jsp" class="btn btn-success mt-3">Add New User</a>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
