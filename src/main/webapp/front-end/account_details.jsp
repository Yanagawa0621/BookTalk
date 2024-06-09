<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="account-details">
    <form action="${pageContext.request.contextPath}/updateUserProfile" method="post" enctype="multipart/form-data">
        <c:if test="${not empty errorMessage}">
            <div class="error">${errorMessage}</div>
        </c:if>
        <label for="account">Account</label>
        <input type="text" id="account" name="account" value="${user.account}" required>
        <label for="passcode">Password</label>
        <input type="password" id="passcode" name="passcode" value="${user.passcode}" required>
        <label for="name">Name</label>
        <input type="text" id="name" name="name" value="${user.name}" required>
        <label for="eMail">Email</label>
        <input type="email" id="eMail" name="eMail" value="${user.eMail}" required>
        <!-- 其他字段 -->
        <button type="submit">Save</button>
    </form>
</div>
