<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.user.model.UserService" %>
<%@ page import="com.user.model.UserServiceImpl" %>
<%@ page import="com.user.model.UserDAO" %>
<%@ page import="com.user.model.UserVO" %>
<%@ page import="com.userStatus.model.UserStatusVO" %>
<%@ page import="util.HibernateUtil" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/back-end/checkAdminSession.jsp" %>


<%
    // 取得使用者清單
    UserService userService = new UserServiceImpl(new UserDAO());
    List<UserVO> userList = userService.getAllUsers();
    request.setAttribute("userList", userList);
%>

<!DOCTYPE html>
<html>
<head>
    <title>使用者清單</title>
    <!-- 引入 Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">使用者清單</h2>
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>編號</th>
                    <th>帳號</th>
                    <th>名字</th>
                    <th>電子郵件</th>
                    <th>帳號狀態</th>
                    <th>操作</th>
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
                            <c:choose>
                                <c:when test="${user.accountStatusNumber == 1}">正常</c:when>
                                <c:when test="${user.accountStatusNumber == 2}">永久停權</c:when>
                                <c:when test="${user.accountStatusNumber == 3}">暫時停權7天</c:when>
                                <c:otherwise>未知狀態</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/user?action=edit&number=${user.number}" class="btn btn-sm btn-primary">編輯</a>
                            <a href="${pageContext.request.contextPath}/user?action=delete&number=${user.number}" class="btn btn-sm btn-danger" onclick="return confirm('您確定要刪除此使用者嗎？');">刪除</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="${pageContext.request.contextPath}/back-end/user/addUser.jsp" class="btn btn-success mt-3">新增使用者</a>
    </div>
    <!-- 引入 Bootstrap JS 和相依性 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
