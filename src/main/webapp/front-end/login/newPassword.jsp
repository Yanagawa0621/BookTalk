<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>重設密碼</title>
<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css' rel='stylesheet'>
<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
<script type='text/javascript' src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<style>
.placeicon {
    font-family: fontawesome;
}

.custom-control-label::before {
    background-color: #dee2e6;
    border: #dee2e6;
}
</style>
</head>
<body class='snippet-body bg-info'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
            <div class="container bg-white rounded mt-2 mb-2 px-0">
                <div class="row justify-content-center align-items-center pt-3">
                    <h1><strong>重設密碼</strong></h1>
                </div>
                <div class="pt-3 pb-3">
                    <form class="form-horizontal" action="${pageContext.request.contextPath}/resetPassword" method="POST" onsubmit="return validatePassword()">
                        <div class="form-group row justify-content-center px-3">
                            <div class="col-9 px-0">
                                <input type="password" id="password" name="password" placeholder="&#xf084; &nbsp; 新密碼" class="form-control border-info placeicon">
                                <small id="passwordError" class="text-danger"></small>
                            </div>
                        </div>
                        <div class="form-group row justify-content-center px-3">
                            <div class="col-9 px-0">
                                <input type="password" id="confPassword" name="confPassword" placeholder="&#xf084; &nbsp; 確認新密碼" class="form-control border-info placeicon">
                                <small id="confPasswordError" class="text-danger"></small>
                            </div>
                        </div>
                        <div class="form-group row justify-content-center">
                            <div class="col-3 px-3 mt-3">
                                <input type="submit" value="Reset" class="btn btn-block btn-info">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="mx-0 px-0 bg-light">
                    <div class="px-4 pt-5">
                        <hr>
                    </div>
                    <div class="pt-2">
                        <div class="row justify-content-center">
                            <h5>還沒有帳號嗎?<span><a href="#" class="text-danger"> 來註冊吧!</a></span></h5>
                        </div>
                        <div class="row justify-content-center align-items-center pt-4 pb-5">
                            <div class="col-4"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type='text/javascript' src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>
<script>
function validatePassword() {
    const password = document.getElementById('password').value;
    const confPassword = document.getElementById('confPassword').value;
    const passwordError = document.getElementById('passwordError');
    const confPasswordError = document.getElementById('confPasswordError');
    
    const passcodePattern = /^[A-Za-z]\d{7,15}$/;
    passwordError.textContent = '';
    confPasswordError.textContent = '';

    if (!passcodePattern.test(password)) {
        passwordError.textContent = '密碼必須以字母開頭，且包含至少一個數字，長度為8至16個字符。';
        return false;
    }

    if (password !== confPassword) {
        confPasswordError.textContent = '確認密碼與新密碼不一致。';
        return false;
    }

    return true;
}
</script>
</body>
</html>
