<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.access.model.AccessService" %>
<%@ page import="com.access.model.AccessServiceImpl" %>
<%@ page import="com.access.model.AccessVO" %>

<%
    AccessService accessService = new AccessServiceImpl();
    List<AccessVO> accessList = accessService.getAllAccesses();
    request.setAttribute("accessList", accessList);

    // 取得當天日期
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String today = sdf.format(new Date());
%>

<!DOCTYPE html>
<html>
<head>
    <title>註冊新用戶</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script>
    async function loadDistricts() {
        const response = await fetch('<%=request.getContextPath()%>/front-end/article/ckEditor/taiwan-districts.json', {
            headers: {
                'Content-Type': 'application/json; charset=UTF-8'
            }
        });
        const districts = await response.json();

        function getDistricts(city) {
            return districts[city] || [];
        }

        function getCities() {
            return Object.keys(districts);
        }

        return {
            getDistricts,
            getCities
        };
    }

    async function populateCities() {
        const TaiwanDistricts = await loadDistricts();
        const citySelect = document.querySelector('select[name=city]');
        const cities = TaiwanDistricts.getCities();
        cities.forEach(city => {
            const option = document.createElement('option');
            option.value = city;
            option.textContent = city;
            citySelect.appendChild(option);
        });

        // 預設選擇的縣市和區域
        const selectedCity = "<c:out value='${param.city}'/>";
        const selectedDistrict = "<c:out value='${param.district}'/>";
        if (selectedCity) {
            citySelect.value = selectedCity;
            await updateDistricts();
            const districtSelect = document.querySelector('select[name=district]');
            districtSelect.value = selectedDistrict;
        }
    }

    async function updateDistricts() {
        const TaiwanDistricts = await loadDistricts();
        const citySelect = document.querySelector('select[name=city]');
        const districtSelect = document.querySelector('select[name=district]');
        const selectedCity = citySelect.value;
        const districts = TaiwanDistricts.getDistricts(selectedCity);

        districtSelect.innerHTML = "<option value=''>請選擇區域</option>";
        districts.forEach(district => {
            const option = document.createElement('option');
            option.value = district;
            option.textContent = district;
            districtSelect.appendChild(option);
        });
    }

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
        populateCities();
        document.querySelector('select[name=city]').addEventListener('change', updateDistricts);
        document.getElementById('togglePassword').addEventListener('click', togglePassword);
        document.getElementById('photo').addEventListener('change', previewPhoto);

        // 如果存在 base64Photo，則設置照片預覽
        const base64Photo = '<%=request.getAttribute("base64Photo")%>';
        if (base64Photo) {
            const preview = document.getElementById('photoPreview');
            preview.src = 'data:image/jpeg;base64,' + base64Photo;
        }
    });
    </script>
</head>
<body>
<div class="container">
    <h2 class="my-4">註冊新用戶</h2>
    <form action="<%=request.getContextPath()%>/registerUser" method="post" enctype="multipart/form-data" accept-charset="UTF-8" onsubmit="return validateForm()">
        <!-- 錯誤訊息顯示區 -->
        <div class="text-danger">${errorMessage}</div>
        <div class="form-group">
            <label for="account">帳號</label>
            <input type="text" class="form-control" id="account" name="account" value="${param.account}" required>
            <div class="text-danger"><c:if test="${fieldName == 'account'}">${errorMessage}</c:if></div>
        </div>
        <div class="form-group">
            <label for="passcode">密碼</label>
            <div class="input-group">
                <input type="password" class="form-control" id="passcode" name="passcode" value="${param.passcode}" required>
                <div class="input-group-append">
                    <button type="button" class="btn btn-outline-secondary" id="togglePassword">顯示密碼</button>
                </div>
            </div>
            <div class="text-danger" id="passcodeError"><c:if test="${fieldName == 'passcode'}">${errorMessage}</c:if></div>
        </div>
        <div class="form-group">
            <label for="name">姓名</label>
            <input type="text" class="form-control" id="name" name="name" value="${param.name}" required>
            <div class="text-danger"><c:if test="${fieldName == 'name'}">${errorMessage}</c:if></div>
        </div>
        <div class="form-group">
            <label for="eMail">電子郵件</label>
            <input type="email" class="form-control" id="eMail" name="eMail" value="${param.eMail}" required>
            <div class="text-danger"><c:if test="${fieldName == 'eMail'}">${errorMessage}</c:if></div>
        </div>
        <div class="form-group">
            <label for="introduceOneself">自我介紹</label>
            <textarea class="form-control" id="introduceOneself" name="introduceOneself" rows="3">${param.introduceOneself}</textarea>
        </div>
        <div class="form-group">
            <label for="birthday">生日</label>
            <input type="date" class="form-control" id="birthday" name="birthday" value="${param.birthday}" required>
        </div>
		<div class="form-group">
		    <label for="photo">照片</label>
		    <input type="file" class="form-control-file" id="photo" name="photo" accept="image/jpeg, image/png">
		    <img id="photoPreview" src="${base64Photo != null ? 'data:image/jpeg;base64,' + base64Photo : ''}" alt="照片預覽" class="img-fluid mt-2" style="max-width: 200px;">
		    <input type="hidden" name="base64Photo" value="${base64Photo}">
		</div>
        </div>
        <div class="form-group">
            <label for="nationalIdNumber">身份證字號</label>
            <input type="text" class="form-control" id="nationalIdNumber" name="nationalIdNumber" value="${param.nationalIdNumber}" required>
            <div class="text-danger" id="nationalIdError"><c:if test="${fieldName == 'nationalIdNumber'}">${errorMessage}</c:if></div>
        </div>
        <div class="form-group">
            <label for="telephoneNumber">手機號碼</label>
            <input type="text" class="form-control" id="telephoneNumber" name="telephoneNumber" value="${param.telephoneNumber}" required>
            <div class="text-danger" id="telephoneError"><c:if test="${fieldName == 'telephoneNumber'}">${errorMessage}</c:if></div>
        </div>
        <div class="form-group">
            <label for="address">地址</label>
            <input type="text" class="form-control" id="address" name="address" value="${param.address}" required>
        </div>
        <div class="form-group">
            <label for="city">縣市</label>
            <select class="form-control" id="city" name="city" required>
                <option value="">請選擇縣市</option>
                <!-- 城市選項將由 JavaScript 動態填充 -->
            </select>
        </div>
        <div class="form-group">
            <label for="district">區域</label>
            <select class="form-control" id="district" name="district" required>
                <option value="">請選擇區域</option>
                <!-- 區域選項將由 JavaScript 動態填充 -->
            </select>
        </div>
        <div class="form-group">
            <label for="accountStatus">帳號狀態</label>
            <input type="text" class="form-control" id="accountStatus" name="accountStatus" value="正常" readonly>
        </div>
        <div class="form-group">
            <label for="accessNumber">權限編號</label>
            <input type="text" class="form-control" id="accessNumber" name="accessNumber" value="一般會員" readonly>
        </div>
        <div class="form-group">
            <label for="sex">性別</label>
            <select class="form-control" id="sex" name="sex" required>
                <option value="M" ${param.sex == 'M' ? 'selected' : ''}>男</option>
                <option value="F" ${param.sex == 'F' ? 'selected' : ''}>女</option>
            </select>
        </div>
        <div class="form-group">
            <label for="registerDate">註冊日期</label>
            <input type="date" class="form-control" id="registerDate" name="registerDate" value="<%=today%>" readonly>
        </div>
        <div class="form-group">
            <label for="statusStartDate">狀態開始日期</label>
            <input type="date" class="form-control" id="statusStartDate" name="statusStartDate" value="<%=today%>" readonly>
        </div>
        <button type="submit" class="btn btn-primary">註冊</button>
    </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
