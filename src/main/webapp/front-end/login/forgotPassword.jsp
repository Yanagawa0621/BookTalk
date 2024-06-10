<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>忘記密碼</title>
<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css' rel='stylesheet'>
<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<style>
body {
    background-color: #eee;
    color: #505050;
    font-family: "Rubik", Helvetica, Arial, sans-serif;
    font-size: 14px;
    line-height: 1.5;
}

.forgot {
    background-color: #fff;
    padding: 12px;
    border: 1px solid #dfdfdf;
}

.padding-bottom-3x {
    padding-bottom: 72px !important;
}

.card-footer {
    background-color: #fff;
}

.btn {
    font-size: 13px;
}

.form-control:focus {
    color: #495057;
    background-color: #fff;
    border-color: #76b7e9;
    outline: 0;
    box-shadow: 0 0 0 0px #28a745;
}
</style>
</head>
<body>
    <div class="container padding-bottom-3x mb-2 mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-8 col-md-10">
                <div class="forgot">
                    <h2>忘記密碼了嗎？</h2>
                    <p>只需三個簡單步驟即可更改您的密碼，這將有助於您保護您的密碼！</p>
                    <ol class="list-unstyled">
                        <li><span class="text-primary text-medium">1. </span>在下方輸入您已註冊過 BookTalk 的電子郵件。</li>
                        <li><span class="text-primary text-medium">2. </span>我們的系統將向您的電子郵件發送一次性密碼 (OTP)。</li>
                        <li><span class="text-primary text-medium">3. </span>在下一頁輸入 OTP。</li>
                    </ol>
                </div>
                <form class="card mt-4" action="${pageContext.request.contextPath}/forgotPassword" method="POST">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="email-for-pass">輸入你的電子信箱</label>
                            <input class="form-control" type="text" name="email" id="email-for-pass" required>
                            <small class="form-text text-muted">請輸入已註冊的電子郵件地址。然後我們會將一次性密碼（OTP）發送到這個地址。</small>
                        </div>
                    </div>
                    <div class="card-footer">
                        <button class="btn btn-success" type="submit">Get New Password</button>
                        <button class="btn btn-danger" type="button" onclick="location.href='${pageContext.request.contextPath}/front-end/login/login.jsp'">Back to Login</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
</body>
</html>
