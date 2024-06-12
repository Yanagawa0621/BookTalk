<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
            <input type="date" class="form-control" id="birthday" name="birthday" value="<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>">
        </div>
        <div class="form-group">
            <label for="photo">照片</label>
            <input type="file" class="form-control-file" id="photo" name="photo" accept="image/jpeg, image/png">
            <img id="photoPreview" src="${user.photo != null ? 'data:image/jpeg;base64,' + user.photoBase64 : ''}" alt="照片預覽" class="img-fluid mt-2" style="max-width: 200px;">
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
            <input type="date" class="form-control" id="registerDate" name="registerDate" value="<fmt:formatDate value="${user.registerDate}" pattern="yyyy-MM-dd"/>" readonly>
        </div>
        <div class="form-group">
            <label for="statusStartDate">狀態開始日期</label>
            <input type="date" class="form-control" id="statusStartDate" name="statusStartDate" value="<fmt:formatDate value="${user.statusStartDate}" pattern="yyyy-MM-dd"/>" readonly>
        </div>
        <button type="submit" class="btn btn-primary">保存</button>
    </form>
</div>
