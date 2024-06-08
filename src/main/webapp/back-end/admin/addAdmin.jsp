<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>新增管理員</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">新增管理員</h2>
        <form action="${pageContext.request.contextPath}/admin" method="post">
            <input type="hidden" name="action" value="create">
            <div class="form-group">
                <label for="account">帳號</label>
                <input type="text" class="form-control" id="account" name="account" required>
            </div>
            <div class="form-group">
                <label for="name">名稱</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="passcode">密碼</label>
                <div class="input-group">
                    <input type="password" class="form-control" id="passcode" name="passcode" required>
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button" onclick="togglePassword()">顯示/隱藏</button>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn btn-success">新增</button>
        </form>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function togglePassword() {
            var passcodeField = document.getElementById("passcode");
            if (passcodeField.type === "password") {
                passcodeField.type = "text";
            } else {
                passcodeField.type = "password";
            }
        }
    </script>
</body>
</html>
