<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="com.user.model.UserService" %>
<%@ page import="com.user.model.UserServiceImpl" %>
<%@ page import="com.user.model.UserDAO" %>
<%@ page import="com.user.model.UserVO" %>
<%@ page import="com.userStatus.model.UserStatusService" %>
<%@ page import="com.userStatus.model.UserStatusServiceImpl" %>
<%@ page import="com.userStatus.model.UserStatusDAO" %>
<%@ page import="com.userStatus.model.UserStatusVO" %>
<%@ page import="util.HibernateUtil" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/back-end/checkAdminSession.jsp" %>


<%
    // 獲取使用者列表和會員狀態列表
    UserService userService = new UserServiceImpl(new UserDAO());
    UserStatusService userStatusService = new UserStatusServiceImpl(new UserStatusDAO());
    List<UserVO> userList = userService.getAllUsers();
    List<UserStatusVO> userStatusList = userStatusService.getAllUserStatuses();

    // 建立一個Map以便快速查找帳號狀態
    Map<Integer, String> statusMap = userStatusList.stream()
        .collect(Collectors.toMap(UserStatusVO::getUserStatus, UserStatusVO::getStatusName));

    // 搜索功能
    String searchAccount = request.getParameter("searchAccount");
    String accountStatus = request.getParameter("accountStatus");
    String userRole = request.getParameter("userRole");

    if (searchAccount != null && !searchAccount.isEmpty()) {
        userList = userList.stream()
            .filter(user -> user.getAccount().contains(searchAccount))
            .collect(Collectors.toList());
    }

    if (accountStatus != null && !accountStatus.isEmpty()) {
        userList = userList.stream()
            .filter(user -> user.getAccountStatusNumber() != null && user.getAccountStatusNumber().toString().equals(accountStatus))
            .collect(Collectors.toList());
    }

    if (userRole != null && !userRole.isEmpty()) {
        userList = userList.stream()
            .filter(user -> user.getAccessNumber() != null && user.getAccessNumber().toString().equals(userRole))
            .collect(Collectors.toList());
    }

    request.setAttribute("userList", userList);
    request.setAttribute("statusMap", statusMap);
    request.setAttribute("userStatusList", userStatusList);
%>

<!DOCTYPE html>
<html>
<head>
    <title>User List</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">User List</h2>
        <form action="<%=request.getContextPath()%>/back-end/user/users.jsp" method="get">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="input-group">
                            <input type="search" class="form-control" name="searchAccount" placeholder="搜尋會員帳號" value="${param.searchAccount}">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-default">
                                    <i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <select class="form-control" name="accountStatus" style="width: 100%;">
                            <option selected hidden disabled value="">帳號狀態</option>
                            <c:forEach var="status" items="${userStatusList}">
                                <option value="${status.userStatus}" ${param.accountStatus == status.userStatus ? 'selected' : ''}>${status.statusName}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <select class="form-control" name="userRole" style="width: 100%;">
                            <option selected hidden disabled value="">會員權限</option>
                            <option value="1" ${param.userRole == '1' ? 'selected' : ''}>一般會員</option>
                            <option value="2" ${param.userRole == '2' ? 'selected' : ''}>後台管理員</option>
                        </select>
                    </div>
                </div>
            </div>
        </form>
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>編號</th>
                    <th>帳號</th>
                    <th>名字</th>
                    <th>電子郵件</th>
                    <th>帳號狀態</th>
                    <th>會員權限</th>
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
                        <td>${statusMap.get(user.getAccountStatusNumber())}</td>
                        <td>${user.getAccessNumber() == 1 ? '一般會員' : '後台管理員'}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/user?action=edit&number=${user.number}" class="btn btn-sm btn-primary">編輯</a>
                            <a href="${pageContext.request.contextPath}/user?action=delete&number=${user.number}" class="btn btn-sm btn-danger" onclick="return confirm('確定要刪除此用戶嗎？');">刪除</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="${pageContext.request.contextPath}/back-end/user/addUser.jsp" class="btn btn-success mt-3">新增會員</a>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
