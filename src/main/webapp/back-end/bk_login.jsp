<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>後台登入</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .modal-dialog {
            max-width: 400px;
            margin: 1.75rem auto;
        }
        .modal-content {
            border-radius: 1rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .modal-header {
            border-bottom: none;
            position: relative;
            justify-content: center;
            background: linear-gradient(45deg, #0094B9, #00ACC8);
            border-top-left-radius: 1rem;
            border-top-right-radius: 1rem;
        }
        .modal-header h5 {
            color: #fff;
        }
        .modal-body {
            padding: 2rem;
        }
        .modal-body .form-control {
            border-radius: 2rem;
            margin-bottom: 1rem;
        }
        .modal-footer {
            border-top: none;
            justify-content: center;
        }
        .btn-custom {
            background: linear-gradient(45deg, #0094B9, #00ACC8);
            color: #fff;
            border-radius: 2rem;
            padding: 0.5rem 2rem;
        }
        .btn-custom:hover {
            background: linear-gradient(45deg, #00ACC8, #0094B9);
            color: #fff;
        }
    </style>
</head>
<body>
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="loginModalLabel">後台登入</h5>
        </div>
        <div class="modal-body">
            <form action="${pageContext.request.contextPath}/adminLogin" method="post">
                <div class="form-group">
                    <label for="account">帳號</label>
                    <input type="text" class="form-control" id="account" name="account" required>
                </div>
                <div class="form-group">
                    <label for="passcode">密碼</label>
                    <input type="password" class="form-control" id="passcode" name="passcode" required>
                </div>
                <c:if test="${not empty errorMessage}">
                    <div class="text-danger mt-2">${errorMessage}</div>
                </c:if>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-custom">登入</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
