<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理員列表</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">管理員列表</h2>
        <c:if test="${not empty adminList}">
            <p>管理員數量: ${fn:length(adminList)}</p>
            <c:forEach var="admin" items="${adminList}">
                <p>Account: ${admin.account}, Name: ${admin.name}</p> <!-- Add this line for debugging -->
            </c:forEach>
        </c:if>
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>帳號</th>
                    <th>名稱</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="admin" items="${adminList}">
                    <tr>
                        <td>${admin.account}</td>
                        <td>${admin.name}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin?action=edit&account=${admin.account}" class="btn btn-sm btn-primary">編輯</a>
                            <a href="${pageContext.request.contextPath}/admin?action=delete&account=${admin.account}" class="btn btn-sm btn-danger">刪除</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="${pageContext.request.contextPath}/admin?action=add" class="btn btn-success mt-3">新增管理員</a>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
