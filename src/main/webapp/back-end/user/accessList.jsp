<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Access List</title>
    <!-- 可以在這裡添加你的樣式表 -->
    <style>
        /* 可以在這裡添加自定義的樣式 */
    </style>
</head>
<body>
    <h1>Access List</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Access Number</th>
                <th>Name</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%-- 迭代顯示每個權限 --%>
            <c:forEach var="access" items="${accessList}">
                <tr>
                    <td>${access.accessNumber}</td>
                    <td>${access.name}</td>
                    <td>${access.accessDescribe}</td>
                    <td>
                        <a href="<%=request.getContextPath()%>/access?action=delete&accessNumber=${access.accessNumber}">Delete</a>
                        <!-- 如果需要的話，可以添加其他操作的鏈接 -->
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h2>Add Access</h2>
    <form action="<%=request.getContextPath()%>/access?action=add" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br>
        <label for="accessDescribe">Description:</label>
        <textarea id="accessDescribe" name="accessDescribe" required></textarea><br>
        <button type="submit">Add Access</button>
    </form>

    <!-- 添加其他頁面元素，如添加權限的表單 -->
</body>
</html>
