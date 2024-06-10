<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>登入記錄查詢</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2>登入記錄查詢</h2>
        <form action="${pageContext.request.contextPath}/loginRecord" method="get">
            <div class="form-group">
                <label for="userName">使用者名稱</label>
                <input type="text" class="form-control" id="userName" name="userName" placeholder="部分或全名">
            </div>
            <div class="form-group">
                <label for="userType">使用者類型</label>
                <select class="form-control" id="userType" name="userType">
                    <option value="">所有類型</option>
                    <option value="user">一般會員</option>
                    <option value="admin">後台管理員</option>
                </select>
            </div>
            <div class="form-group">
                <label for="timeRange">時間範圍</label>
                <select class="form-control" id="timeRange" name="timeRange" onchange="toggleCustomDays()">
                    <option value="">所有時間</option>
                    <option value="today">今天</option>
                    <option value="7days">7天內</option>
                    <option value="custom">自訂天數</option>
                    <option value="daterange">日期範圍</option>
                </select>
                <input type="number" class="form-control mt-2" id="customDays" name="customDays" placeholder="輸入天數" style="display: none;">
                <div class="mt-2" id="dateRangeInputs" style="display: none;">
                    <input type="date" class="form-control" id="startDate" name="startDate" placeholder="開始日期">
                    <input type="date" class="form-control mt-2" id="endDate" name="endDate" placeholder="結束日期">
                </div>
            </div>
            <button type="submit" class="btn btn-primary">查詢</button>
        </form>
        
        <c:if test="${not empty loginRecords}">
            <h3>登入記錄</h3>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>編號</th>
                        <th>使用者名稱</th>
                        <th>使用者類型</th>
                        <th>登入時間</th>
                        <th>IP位址</th>
                        <th>地區</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="record" items="${loginRecords}">
                        <tr>
                            <td>${record.number}</td>
                            <td><c:choose>
                                    <c:when test="${record.user != null}">
                                        ${record.user.name}
                                    </c:when>
                                    <c:otherwise>
                                        ${record.admin.name}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${record.userType}</td>
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
    
    <script>
        function toggleCustomDays() {
            const timeRange = document.getElementById("timeRange").value;
            const customDaysInput = document.getElementById("customDays");
            const dateRangeInputs = document.getElementById("dateRangeInputs");

            customDaysInput.style.display = "none";
            dateRangeInputs.style.display = "none";

            if (timeRange === "custom") {
                customDaysInput.style.display = "block";
            } else if (timeRange === "daterange") {
                dateRangeInputs.style.display = "block";
            }
        }
    </script>
</body>
</html>
