
$(function(){
	$(document).on("click", "#checkGoCheckout", function(event){
		event.preventDefault();
		validateFields();
		$("#confirmToCheckout").modal("show");
	});
			
	$(document).on("click", "#confirmButton", function(event){
		event.preventDefault();
		$("#form2").submit();
	});
	
	$("checkReceiver").on("input", validateFields);
	$("checkOtherAddress").on("input", validateFields);
	$("checkTel").on("input", validateFields);
	$("checkEmail").on("input", validateFields);
});

//檢查所有必填欄位是否都有輸入
function checkFilled(fieldIds){
	for(let i=0 ; i<fieldIds.length ; i++){
		const field = $("#" + fieldIds[i]);
		if(!field || field.val().trim() === ""){
			return false;
		}
	}
	return true;
}

//檢查email格式
function checkEmail(email){
	const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailPattern.test(email);
}

//檢查電話(手機)格式
function checkTel(phone){
	const phonePattern = /^[0-9]{10}$/;  // 10個數字
    return phonePattern.test(phone);
}


//驗證機制
function validateFields() {
    const requiredFields = ["checkReceiver", "city", "district", "checkOtherAddress", "checkTel", "checkEmail"];	//所有需要驗證欄位的id
    const confirmButton = $("#confirmButton");
    const modalBody = $("#confirmToCheckout .modal-body");
    const telField = $("#checkTel").val().trim();
    const emailField = $("#checkEmail").val().trim();
    
    
     if (telField != "" && telField != null){
    	 console.log("wov");
    	if (!checkTel(telField)) {
	        modalBody.text("電話請輸入10個數字，請按\"取消\"返回");
	        confirmButton.prop("disabled", true);
	        return;
    	}
     }
    
    if (emailField != "" && emailField != null){
    	if (!checkEmail(emailField)) {
            modalBody.text("請輸入有效的email，請按\"取消\"返回");
            confirmButton.prop("disabled", true);
            return;
        }
    }

    if (checkFilled(requiredFields)) {
    	confirmButton.prop("disabled", false);
    	modalBody.text("目前只提供信用卡付款，請確認是否繼續？");
    }else {
        confirmButton.prop("disabled", true);
        modalBody.text("請先填寫完整的收貨人明細資料，請按\"取消\"返回");
    }
}