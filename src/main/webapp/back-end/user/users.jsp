<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="com.user.model.UserService" %>
<%@ page import="com.user.model.UserServiceImpl" %>
<%@ page import="com.user.model.UserDAO" %>
<%@ page import="com.user.model.UserVO" %>
<%@ page import="util.HibernateUtil" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // 獲取使用者列表
    UserService userService = new UserServiceImpl(new UserDAO(HibernateUtil.getSessionFactory()));
    List<UserVO> userList = userService.getAllUsers();

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
            .filter(user -> user.getAccountStatus().equals(accountStatus))
            .collect(Collectors.toList());
    }

    if (userRole != null && !userRole.isEmpty()) {
        userList = userList.stream()
            .filter(user -> user.getUserRole().equals(userRole))
            .collect(Collectors.toList());
    }

    request.setAttribute("userList", userList);
%>

<!DOCTYPE html>
<html>
<!-- head -->
<%@include file="/back-end/component/header.jsp" %>

<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">會員列表</h1>
                        </div>
                        <!-- /.col -->                        
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /.content-header -->

            <!-- Main content -->
            <section class="content">
                <div class="container-md">
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
                                        <option value="正常" ${param.accountStatus == '正常' ? 'selected' : ''}>正常</option>
                                        <option value="永久停權" ${param.accountStatus == '永久停權' ? 'selected' : ''}>永久停權</option>
                                        <option value="暫時停權7天" ${param.accountStatus == '暫時停權7天' ? 'selected' : ''}>暫時停權7天</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <select class="form-control" name="userRole" style="width: 100%;">
                                        <option selected hidden disabled value="">會員權限</option>
                                        <option value="後台管理員" ${param.userRole == '後台管理員' ? 'selected' : ''}>後台管理員</option>
                                        <option value="一般會員" ${param.userRole == '一般會員' ? 'selected' : ''}>一般會員</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </form>

                    <div class="container mt-5">
                        <h2 class="mb-4">會員列表</h2>
                        <table class="table table-striped">
                            <thead class="thead-dark">
                                <tr>
                                    <th>編號</th>
                                    <th>帳號</th>
                                    <th>名字</th>
                                    <th>電子郵件</th>
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
                                            <a href="${pageContext.request.contextPath}/user?action=edit&number=${user.number}" class="btn btn-sm btn-primary">編輯</a>
                                            <a href="${pageContext.request.contextPath}/user?action=delete&number=${user.number}" class="btn btn-sm btn-danger" onclick="return confirm('確定要刪除此會員嗎？');">刪除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <a href="${pageContext.request.contextPath}/back-end/user/addUser.jsp" class="btn btn-success mt-3">新增會員</a>
                    </div>
                </div>
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
        
        <!-- footer -->
        <%@include file="/back-end/component/footer.jsp" %>

    </div>
    <!-- ./wrapper -->

    <%@include file="/back-end/component/script.jsp" %>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
