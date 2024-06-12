<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="tab-pane" id="address">
    <h3>地址資訊</h3>
    <form action="${pageContext.request.contextPath}/user" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
        <input type="hidden" name="action" value="updateAddress" />
        <div class="form-group">
            <label for="address">地址</label>
            <input type="text" class="form-control" id="address" name="address" value="${sessionScope.user.address}" required>
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
        <button type="submit" class="btn btn-primary">保存</button>
    </form>
</div>

<script>
    async function loadDistricts() {
        const response = await fetch('${pageContext.request.contextPath}/front-end/article/ckEditor/taiwan-districts.json', {
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
        const selectedCity = "${sessionScope.user.city}";
        const selectedDistrict = "${sessionScope.user.district}";
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

        const selectedDistrict = "${sessionScope.user.district}";
        if (selectedDistrict) {
            districtSelect.value = selectedDistrict;
        }
    }

    window.addEventListener('load', function () {
        populateCities();
        document.querySelector('select[name=city]').addEventListener('change', updateDistricts);
    });
</script>
