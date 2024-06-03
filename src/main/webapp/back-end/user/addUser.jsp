<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>添加使用者</title>
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

            const telephonePattern = /^\d{10}$/;
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

        window.addEventListener('load', function () {
            populateCities();
            document.querySelector('select[name=city]').addEventListener('change', updateDistricts);
            document.querySelector('input[name=photo]').addEventListener('change', previewImage);
            document.getElementById('togglePassword').addEventListener('click', togglePassword);
        });
    </script>
</head>
<body>
<div class="container">
    <h2 class="my-4">新增使用者</h2>
    <form action="<%=request.getContextPath()%>/user" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
        <input type="hidden" name="action" value="add">
        <!-- 錯誤訊息顯示區 -->
        <div class="text-danger">${errorMessage}</div>
        <div class="form-group">
            <label for="account">帳號</label>
            <input type="text" class="form-control" id="account" name="account" value="${param.account}" required>
            <div class="text-danger"><c:out value="${errorMessage['account']}"/></div>
        </div>
        <div class="form-group">
            <label for="passcode">密碼</label>
            <div class="input-group">
                <input type="password" class="form-control" id="passcode" name="passcode" value="${param.passcode}" required>
                <div class="input-group-append">
                    <button type="button" class="btn btn-outline-secondary" id="togglePassword">顯示密碼</button>
                </div>
            </div>
            <div class="text-danger" id="passcodeError"><c:out value="${errorMessage['passcode']}"/></div>
        </div>
        <div class="form-group">
            <label for="name">姓名</label>
            <input type="text" class="form-control" id="name" name="name" value="${param.name}" required>
            <div class="text-danger"><c:out value="${errorMessage['name']}"/></div>
        </div>
        <div class="form-group">
            <label for="eMail">電子郵件</label>
            <input type="email" class="form-control" id="eMail" name="eMail" value="${param.eMail}" required>
            <div class="text-danger"><c:out value="${errorMessage['eMail']}"/></div>
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
            <img id="photoPreview" src="" alt="照片預覽" class="img-fluid mt-2" style="max-width: 200px;">
        </div>
        <div class="form-group">
            <label for="nationalIdNumber">身份證字號</label>
            <input type="text" class="form-control" id="nationalIdNumber" name="nationalIdNumber" value="${param.nationalIdNumber}" required>
            <div class="text-danger" id="nationalIdError"><c:out value="${errorMessage['nationalIdNumber']}"/></div>
        </div>
        <div class="form-group">
            <label for="telephoneNumber">手機號碼</label>
            <input type="text" class="form-control" id="telephoneNumber" name="telephoneNumber" value="${param.telephoneNumber}" required>
            <div class="text-danger" id="telephoneError"><c:out value="${errorMessage['telephoneNumber']}"/></div>
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
            <label for="accountStatusNumber">帳號狀態編號</label>
            <input type="text" class="form-control" id="accountStatusNumber" name="accountStatusNumber" value="${param.accountStatusNumber}" required>
            <div class="text-danger"><c:out value="${errorMessage['accountStatusNumber']}"/></div>
        </div>
        <div class="form-group">
            <label for="accessNumber">權限編號</label>
            <input type="text" class="form-control" id="accessNumber" name="accessNumber" value="${param.accessNumber}" required>
            <div class="text-danger"><c:out value="${errorMessage['accessNumber']}"/></div>
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
            <input type="date" class="form-control" id="registerDate" name="registerDate" value="${param.registerDate}" required>
        </div>
        <div class="form-group">
            <label for="statusStartDate">狀態開始日期</label>
            <input type="date" class="form-control" id="statusStartDate" name="statusStartDate" value="${param.statusStartDate}" required>
        </div>
        <button type="submit" class="btn btn-primary">新增使用者</button>
    </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
