<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>新增使用者</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script>
    async function loadDistricts() {
        const response = await fetch('<%=request.getContextPath()%>/front-end/article/ckEditor/taiwan-districts.json');
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
        const selectedCity = "${user.city}";
        const selectedDistrict = "${user.district}";
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

    function previewImage() {
        const file = document.querySelector('input[name=photo]').files[0];
        const preview = document.getElementById('photoPreview');
        const reader = new FileReader();

        const maxSize = 2 * 1024 * 1024;
        const allowedTypes = ['image/jpeg', 'image/jpg', 'image/png'];

        if (file) {
            if (file.size > maxSize) {
                alert('文件大小超過限制的 2MB。');
                document.querySelector('input[name=photo]').value = '';
                preview.src = '';
                return;
            }

            if (!allowedTypes.includes(file.type)) {
                alert('僅允許 JPG 和 PNG 格式的文件。');
                document.querySelector('input[name=photo]').value = '';
                preview.src = '';
                return;
            }

            reader.addEventListener("load", function () {
                preview.src = reader.result;
            }, false);

            reader.readAsDataURL(file);
        }
    }

    function validateForm() {
        const passcode = document.querySelector('input[name="passcode"]').value;
        const nationalIdNumber = document.querySelector('input[name="nationalIdNumber"]').value;
        const telephoneNumber = document.querySelector('input[name="telephoneNumber"]').value;

        const passcodePattern = /^[A-Z][a-z]\d{6}$/;
        if (!passcodePattern.test(passcode)) {
            document.getElementById('passcodeError').textContent = "密碼必須以一個大寫字母開頭，接著一個小寫字母和6個數字。";
            return false;
        } else {
            document.getElementById('passcodeError').textContent = "";
        }

        const idPattern = /^[A-Z][12]\d{8}$/;
        if (!idPattern.test(nationalIdNumber)) {
            document.getElementById('nationalIdError').textContent = "身分證字號格式不正確。";
            return false;
        } else {
            document.getElementById('nationalIdError').textContent = "";
        }

        const phonePattern = /^09\d{8}$/;
        if (!phonePattern.test(telephoneNumber)) {
            document.getElementById('phoneError').textContent = "手機號碼格式不正確。";
            return false;
        } else {
            document.getElementById('phoneError').textContent = "";
        }

        return true;
    }

    document.addEventListener("DOMContentLoaded", function () {
        populateCities();
        document.querySelector('select[name=city]').addEventListener('change', updateDistricts);
        document.querySelector('input[name=photo]').addEventListener('change', previewImage);

        document.querySelector('form').addEventListener('submit', function (event) {
            if (!validateForm()) {
                event.preventDefault();
            }
        });
    });

    function togglePasswordVisibility() {
        var passcodeInput = document.querySelector('input[name="passcode"]');
        passcodeInput.type = passcodeInput.type === 'password' ? 'text' : 'password';
    }
    </script>
</head>
<body>
    <div class="container">
        <h2>註冊</h2>
        <form action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="account">帳號</label>
                <input type="text" class="form-control" id="account" name="account" value="${fn:escapeXml(user.account)}" required>
                <div class="text-danger">
                    <c:out value="${errorMessage['account']}" />
                </div>
            </div>
            <div class="form-group">
                <label for="passcode">密碼</label>
                <input type="password" class="form-control" id="passcode" name="passcode" value="${fn:escapeXml(user.passcode)}" required>
                <input type="checkbox" onclick="togglePasswordVisibility()"> 顯示密碼
                <div class="text-danger" id="passcodeError">
                    <c:out value="${errorMessage['passcode']}" />
                </div>
            </div>
            <div class="form-group">
                <label for="name">姓名</label>
                <input type="text" class="form-control" id="name" name="name" value="${fn:escapeXml(user.name)}" required>
                <div class="text-danger">
                    <c:out value="${errorMessage['name']}" />
                </div>
            </div>
            <div class="form-group">
                <label for="sex">性別</label>
                <select class="form-control" id="sex" name="sex" required>
                    <option value="M" ${user.sex == 'M' ? 'selected' : ''}>男</option>
                    <option value="F" ${user.sex == 'F' ? 'selected' : ''}>女</option>
                </select>
                <div class="text-danger">
                    <c:out value="${errorMessage['sex']}" />
                </div>
            </div>
            <div class="form-group">
                <label for="eMail">電子郵件</label>
                <input type="email" class="form-control" id="eMail" name="eMail" value="${fn:escapeXml(user.eMail)}" required>
                <div class="text-danger">
                    <c:out value="${errorMessage['eMail']}" />
                </div>
            </div>
            <div class="form-group">
                <label for="introduceOneself">自我介紹</label>
                <textarea class="form-control" id="introduceOneself" name="introduceOneself" rows="3">${fn:escapeXml(user.introduceOneself)}</textarea>
            </div>
            <div class="form-group">
                <label for="birthday">出生日期</label>
                <input type="date" class="form-control" id="birthday" name="birthday" value="${fn:escapeXml(user.birthday)}" required>
            </div>
            <div class="form-group">
                <label for="nationalIdNumber">身分證字號</label>
                <input type="text" class="form-control" id="nationalIdNumber" name="nationalIdNumber" value="${fn:escapeXml(user.nationalIdNumber)}" required>
                <div class="text-danger" id="nationalIdError">
                    <c:out value="${errorMessage['nationalIdNumber']}" />
                </div>
            </div>
            <div class="form-group">
                <label for="telephoneNumber">手機號碼</label>
                <input type="text" class="form-control" id="telephoneNumber" name="telephoneNumber" value="${fn:escapeXml(user.telephoneNumber)}" required>
                <div class="text-danger" id="phoneError">
                    <c:out value="${errorMessage['telephoneNumber']}" />
                </div>
            </div>
            <div class="form-group">
                <label for="city">縣市</label>
                <select class="form-control" id="city" name="city" required>
                    <option value="">請選擇縣市</option>
                </select>
            </div>
            <div class="form-group">
                <label for="district">區域</label>
                <select class="form-control" id="district" name="district" required>
                    <option value="">請選擇區域</option>
                </select>
            </div>
            <div class="form-group">
                <label for="address">地址</label>
                <input type="text" class="form-control" id="address" name="address" value="${fn:escapeXml(user.address)}" required>
            </div>
            <div class="form-group">
                <label for="photo">上傳照片</label>
                <input type="file" class="form-control-file" id="photo" name="photo" accept="image/jpeg, image/jpg, image/png">
                <img id="photoPreview" src="${user.photo != null ? 'data:image/jpeg;base64,' + user.photo : ''}" alt="預覽圖片" style="max-width: 200px; margin-top: 10px;">
                <div class="text-danger">
                    <c:out value="${errorMessage['photo']}" />
                </div>
            </div>
            <div class="text-danger">
                <c:out value="${errorMessage['generalError']}" />
            </div>
            <button type="submit" class="btn btn-primary">提交</button>
        </form>
    </div>
</body>
</html>
