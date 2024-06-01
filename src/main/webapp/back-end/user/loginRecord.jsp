<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>登入紀錄查詢</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>登入紀錄查詢</h2>
        <form action="${pageContext.request.contextPath}/loginRecord" method="get">
            <div class="form-group">
                <label for="userNumber">使用者編號</label>
                <input type="text" class="form-control" id="userNumber" name="userNumber" required>
            </div>
            <button type="submit" class="btn btn-primary">查詢</button>
        </form>
        
        <c:if test="${not empty loginRecords}">
            <h3>登入紀錄</h3>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>編號</th>
                        <th>使用者編號</th>
                        <th>登入時間</th>
                        <th>IP位址</th>
                        <th>地區</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="record" items="${loginRecords}">
                        <tr>
                            <td>${record.number}</td>
                            <td>${record.user.number}</td>
                            <td>${record.loginTime}</td>
                            <td>${record.ip}</td>
                            <td>${record.area}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
    </div>
</body>
</html>
