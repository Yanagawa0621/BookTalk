<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
    <h2 class="my-4">帳號詳細資訊</h2>
    <form action="${pageContext.request.contextPath}/updateUserProfile" method="post" enctype="multipart/form-data" accept-charset="UTF-8" onsubmit="return validateForm()">
        <!-- 錯誤訊息顯示區 -->
        <c:if test="${not empty errorMessage}">
            <div class="text-danger">${errorMessage}</div>
        </c:if>
        <div class="form-group">
            <label for="account">帳號</label>
            <input type="text" class="form-control" id="account" name="account" value="${user.account}" required readonly>
            <div class="text-danger"><c:if test="${fieldName == 'account'}">${errorMessage}</c:if></div>
        </div>
        <div class="form-group">
            <label for="passcode">密碼</label>
            <div class="input-group">
                <input type="password" class="form-control" id="passcode" name="passcode" value="${user.passcode}" required>
                <div class="input-group-append">
                    <button type="button" class="btn btn-outline-secondary" id="togglePassword">顯示密碼</button>
                </div>
            </div>
            <div class="text-danger" id="passcodeError"><c:if test="${fieldName == 'passcode'}">${errorMessage}</c:if></div>
        </div>
        <div class="form-group">
            <label for="name">姓名</label>
            <input type="text" class="form-control" id="name" name="name" value="${user.name}" required>
            <div class="text-danger"><c:if test="${fieldName == 'name'}">${errorMessage}</c:if></div>
        </div>
        <div class="form-group">
            <label for="eMail">電子郵件</label>
            <input type="email" class="form-control" id="eMail" name="eMail" value="${user.eMail}" required>
            <div class="text-danger"><c:if test="${fieldName == 'eMail'}">${errorMessage}</c:if></div>
        </div>
        <div class="form-group">
            <label for="introduceOneself">自我介紹</label>
            <textarea class="form-control" id="introduceOneself" name="introduceOneself" rows="3">${user.introduceOneself}</textarea>
        </div>
        <div class="form-group">
            <label for="birthday">生日</label>
            <input type="date" class="form-control" id="birthday" name="birthday" value="${user.birthday}" required>
        </div>
        <div class="form-group">
            <label for="photo">照片</label>
            <input type="file" class="form-control-file" id="photo" name="photo" accept="image/jpeg, image/png">
            <img id="photoPreview" src="${user.photo != null ? 'data:image/jpeg;base64,' + user.photo : ''}" alt="照片預覽" class="img-fluid mt-2" style="max-width: 200px;">
            <input type="hidden" name="base64Photo" value="${user.photo}">
        </div>
        <div class="form-group">
            <label for="nationalIdNumber">身份證字號</label>
            <input type="text" class="form-control" id="nationalIdNumber" name="nationalIdNumber" value="${user.nationalIdNumber}" required>
            <div class="text-danger" id="nationalIdError"><c:if test="${fieldName == 'nationalIdNumber'}">${errorMessage}</c:if></div>
        </div>
        <div class="form-group">
            <label for="telephoneNumber">手機號碼</label>
            <input type="text" class="form-control" id="telephoneNumber" name="telephoneNumber" value="${user.telephoneNumber}" required>
            <div class="text-danger" id="telephoneError"><c:if test="${fieldName == 'telephoneNumber'}">${errorMessage}</c:if></div>
        </div>
        <div class="form-group">
            <label for="accountStatus">帳號狀態</label>
            <input type="text" class="form-control" id="accountStatus" name="accountStatus" value="${user.getAccountStatus()}" readonly>
        </div>
        <div class="form-group">
            <label for="accessNumber">權限編號</label>
            <input type="text" class="form-control" id="accessNumber" name="accessNumber" value="${user.getUserRole()}" readonly>
        </div>
        <div class="form-group">
            <label for="sex">性別</label>
            <select class="form-control" id="sex" name="sex" required>
                <option value="M" ${user.sex == 'M' ? 'selected' : ''}>男</option>
                <option value="F" ${user.sex == 'F' ? 'selected' : ''}>女</option>
            </select>
        </div>
        <div class="form-group">
            <label for="registerDate">註冊日期</label>
            <input type="date" class="form-control" id="registerDate" name="registerDate" value="${user.registerDate}" readonly>
        </div>
        <div class="form-group">
            <label for="statusStartDate">狀態開始日期</label>
            <input type="date" class="form-control" id="statusStartDate" name="statusStartDate" value="${user.statusStartDate}" readonly>
        </div>
        <button type="submit" class="btn btn-primary">保存</button>
    </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function validateForm() {
        const passcode = document.querySelector('input[name="passcode"]').value;
        const nationalIdNumber = document.querySelector('input[name="nationalIdNumber"]').value;
        const telephoneNumber = document.querySelector('input[name="telephoneNumber"]').value;

        const passcodePattern = /^[A-Z][a-z]\d{6}$/;
        if (!passcodePattern.test(passcode)) {
            document.getElementById('passcodeError').textContent = "密碼必須以一個大寫字母開頭，接著一個小寫字母和6位數字。";
            return false;
        } else {
            document.getElementById('passcodeError').textContent = "";
        }

        const nationalIdPattern = /^[A-Z]\d{9}$/;
        if (!nationalIdPattern.test(nationalIdNumber)) {
            document.getElementById('nationalIdError').textContent = "身份證號格式不正確, 必須以一個大寫字母開頭，和9位數字。";
            return false;
        } else {
            document.getElementById('nationalIdError').textContent = "";
        }

        const telephonePattern = /^09\d{8}$/;
        if (!telephonePattern.test(telephoneNumber)) {
            document.getElementById('telephoneError').textContent = "電話號碼格式不正確, 必須以09為開頭，後面8個位數字。";
            return false;
        } else {
            document.getElementById('telephoneError').textContent = "";
        }

        return true;
    }

    function togglePassword() {
        const passcodeField = document.getElementById('passcode');
        const toggleBtn = document.getElementById('togglePassword');
        if (passcodeField.type === 'password') {
            passcodeField.type = 'text';
            toggleBtn.textContent = '隱藏密碼';
        } else {
            passcodeField.type = 'password';
            toggleBtn.textContent = '顯示密碼';
        }
    }

    function previewPhoto(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const preview = document.getElementById('photoPreview');
                preview.src = e.target.result;
            }
            reader.readAsDataURL(file);
        }
    }

    window.addEventListener('load', function () {
        document.getElementById('togglePassword').addEventListener('click', togglePassword);
        document.getElementById('photo').addEventListener('change', previewPhoto);

        // 如果存在 base64Photo，則設置照片預覽
        const base64Photo = '<c:out value="${user.photo}" />';
        if (base64Photo) {
            const preview = document.getElementById('photoPreview');
            preview.src = 'data:image/jpeg;base64,' + base64Photo;
        }
    });
</script>
