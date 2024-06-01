<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>編輯使用者</title>
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
            const selectedCity = "<c:out value='${user.city}'/>";
            const selectedDistrict = "<c:out value='${user.district}'/>";
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

            const nationalIdPattern = /^[A-Z]\d{9}$/;
            if (!nationalIdPattern.test(nationalIdNumber)) {
                document.getElementById('nationalIdError').textContent = "身份證字號格式不正確。";
                return false;
            } else {
                document.getElementById('nationalIdError').textContent = "";
            }

            const telephonePattern = /^\d{10}$/;
            if (!telephonePattern.test(telephoneNumber)) {
                document.getElementById('telephoneError').textContent = "手機號碼格式不正確。";
                return false;
            } else {
                document.getElementById('telephoneError').textContent = "";
            }

            return true;
        }

        window.addEventListener('load', function () {
            populateCities();
            document.querySelector('select[name=city]').addEventListener('change', updateDistricts);
            document.querySelector('input[name=photo]').addEventListener('change', previewImage);
        });
    </script>
</head>
<body>
<div class="container">
    <h2 class="my-4">編輯使用者</h2>
<form action="<%=request.getContextPath()%>/user" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="number" value="${user.number}">
    <!-- 錯誤訊息顯示區 -->
    <div class="text-danger">${errorMessage}</div>
    <div class="form-group">
        <label for="account">帳號</label>
        <input type="text" class="form-control" id="account" name="account" value="${user.account}" required>
        <div class="text-danger"><c:out value="${errorMessage['account']}"/></div>
    </div>
    <div class="form-group">
        <label for="passcode">密碼</label>
        <input type="password" class="form-control" id="passcode" name="passcode" value="${user.passcode}" required>
        <div class="text-danger" id="passcodeError"><c:out value="${errorMessage['passcode']}"/></div>
    </div>
    <div class="form-group">
        <label for="name">姓名</label>
        <input type="text" class="form-control" id="name" name="name" value="${user.name}" required>
        <div class="text-danger"><c:out value="${errorMessage['name']}"/></div>
    </div>
    <div class="form-group">
        <label for="eMail">電子郵件</label>
        <input type="email" class="form-control" id="eMail" name="eMail" value="${user.eMail}" required>
        <div class="text-danger"><c:out value="${errorMessage['eMail']}"/></div>
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
        <img id="photoPreview" src="data:image/jpeg;base64,${user.photoBase64}" alt="照片預覽" class="img-fluid mt-2" style="max-width: 200px;">
    </div>
    <div class="form-group">
        <label for="nationalIdNumber">身份證字號</label>
        <input type="text" class="form-control" id="nationalIdNumber" name="nationalIdNumber" value="${user.nationalIdNumber}" required>
        <div class="text-danger" id="nationalIdError"><c:out value="${errorMessage['nationalIdNumber']}"/></div>
    </div>
    <div class="form-group">
        <label for="telephoneNumber">手機號碼</label>
        <input type="text" class="form-control" id="telephoneNumber" name="telephoneNumber" value="${user.telephoneNumber}" required>
        <div class="text-danger" id="telephoneError"><c:out value="${errorMessage['telephoneNumber']}"/></div>
    </div>
    <div class="form-group">
        <label for="address">地址</label>
        <input type="text" class="form-control" id="address" name="address" value="${user.address}" required>
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
        <label for="accountStatusNumber">帳號狀態編號</label>
        <input type="text" class="form-control" id="accountStatusNumber" name="accountStatusNumber" value="${user.accountStatusNumber}" required>
        <div class="text-danger"><c:out value="${errorMessage['accountStatusNumber']}"/></div>
    </div>
    <div class="form-group">
        <label for="accessNumber">權限編號</label>
        <input type="text" class="form-control" id="accessNumber" name="accessNumber" value="${user.accessNumber}" required>
        <div class="text-danger"><c:out value="${errorMessage['accessNumber']}"/></div>
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
        <input type="date" class="form-control" id="registerDate" name="registerDate" value="${user.registerDate}" required>
    </div>
    <div class="form-group">
        <label for="statusStartDate">狀態開始日期</label>
        <input type="date" class="form-control" id="statusStartDate" name="statusStartDate" value="${user.statusStartDate}" required>
    </div>
    <button type="submit" class="btn btn-primary">更新資料</button>
</form>
</div>
</body>
</html>
