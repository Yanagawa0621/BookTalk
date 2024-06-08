<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.administrator.model.AdministratorService" %>
<%@ page import="com.administrator.model.AdministratorServiceImpl" %>
<%@ page import="com.administrator.model.AdministratorVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>後台管理員列表</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">後台管理員列表</h2>
        <%
            AdministratorService adminService = new AdministratorServiceImpl();
            List<AdministratorVO> adminList = adminService.getAllAdministrators();
            String sortOrder = request.getParameter("sortOrder");
            if ("asc".equals(sortOrder)) {
                Collections.sort(adminList, Comparator.comparing(AdministratorVO::getAccount));
            } else if ("desc".equals(sortOrder)) {
                Collections.sort(adminList, Comparator.comparing(AdministratorVO::getAccount).reversed());
            }
            request.setAttribute("adminList", adminList);
        %>
        <form action="${pageContext.request.contextPath}/back-end/admin/adminList.jsp" method="get">
            <div class="form-group">
                <label for="sortOrder">排序方式:</label>
                <select id="sortOrder" name="sortOrder" class="form-control" onchange="this.form.submit()">
                    <option value="asc" <c:if test="${param.sortOrder == 'asc'}">selected</c:if>>帳號 (升序)</option>
                    <option value="desc" <c:if test="${param.sortOrder == 'desc'}">selected</c:if>>帳號 (降序)</option>
                </select>
            </div>
        </form>
        <c:if test="${not empty adminList}">
            <p>管理員數量: ${fn:length(adminList)}</p>
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
                            <a href="${pageContext.request.contextPath}/admin?action=delete&account=${admin.account}" class="btn btn-sm btn-danger" onclick="return confirm('確定要刪除嗎?');">刪除</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="${pageContext.request.contextPath}/admin?action=add" class="btn btn-success mt-3">新增管理員</a>
    </div>
    <!-- Bootstrap JS 和相依性 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
