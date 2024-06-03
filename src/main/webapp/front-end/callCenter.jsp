<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html class="no-js" lang="en">

<!-- head -->
<%@include file="/front-end/component/head.jsp" %>

<body>

	<!--header area start-->
	<!--offcanvas menu area start-->

	<!--offcanvas menu area end-->
	<%@include file="/front-end/component/menu.jsp" %>
	<!--header area end-->


	<!--breadcrumbs area start-->
	<div class="breadcrumbs_area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="breadcrumb_content">
						<h3>客服中心</h3>
						<ul>
							<li><a href="${pageContext.request.contextPath}/index.jsp">首頁</a></li>
							<li style="padding: 0;">客服相關</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->

	<!--callCenter  area start-->
	<form id="form1" >
	<div class="tb-div">	
	      <div class="mb-3">
	         <label for="orderNumber" class="form-label">訂單編號(Order number)訂單相關問題，請儘量提供訂單編號</label>
	         <input type="text" id="orderNumber" name="orderNumber">
	      </div>
	      
	      <div class="dropdown show">
		      <label class="form-label">發問類型</label>
		  	  <a id="problemType_" name="problemType_" class="btn btn-secondary dropdown-toggle" type="button"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		   		請選擇問題類型
		   	  </a>
			  <div class="dropdown-menu" aria-labelledby="problemType_">
			      <a href="#" class="dropdown-item" value="1">書籍商品相關問題</a>
			      <a href="#" class="dropdown-item" value="2">訂單相關問題</a>
			      <a href="#" class="dropdown-item" value="3">其他建議相關</a>
			  </div>
			  <input type="hidden" id="problemType" name="problemType">
		  </div>
		  
		  <label >我的問題是<em class="em">*</em></label>
		  <div class="textarea"">
		      <textarea id="problemDescription" name="problemDescription" class="form-control" required></textarea>
	      </div>
		  
	      <div class="mb-3">
	         <label for="email" class="form-label">E-mail信箱(E-mail account)<em class="em">*</em></label>
	         <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" required>
	         <div id="emailHelp" class="form-text">我們不會將您的e-mail告訴其他人</div>
	         <span id="emailError"></span>
	      </div>
	      
	      <label class="form-label" for="attachedFile">附加檔案(Attached file)2MB以下，僅接受jpg、png、txt(Only jpeg, png, and text which smaller than 2MB)</label>
		  <input type="file" class="form-control" id="attachedFile" name= "attachedFile"/>
		  <span id="attachedFileError"></span>
		  
	      <button id="bt" type="button" class="btn btn-primary">確認送出</button>
	</div>
	</form>
	<!--callCenter  area end-->

	<!--footer area start-->
    <%@include file="/front-end/component/footer.jsp" %>
    <!--footer area end-->

	<!-- modal area start-->
	<div class="modal fade" id="modal_box" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"><i class="ion-android-close"></i></span>
				</button>
				<div class="modal_body">
				</div>
			</div>
		</div>
	</div>
	<!-- modal area end-->


	<!-- JS
============================================ -->
<%@include file="/front-end/component/script.jsp" %>

<script>
$(document).ready(function(){
    var isTxt = function(name) {return name.match(/txt$/i)};
    var isJpg = function(name) {return name.match(/jpg$/i)};
    var isPng = function(name) {return name.match(/png$/i)};
    
    function is_valid_email_address(emailAddress){
		var pattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		return pattern.test(emailAddress);
        //設定變數pattern 是 (pattern的驗證格式)
        //回傳 替換文字內容emailAddress的值
	}  
    
    $('.dropdown-item').click(function(){
        var selectedText = $(this).text();
        $('#problemType_').text(selectedText);
    });

    $('.dropdown-item').click(function(event){
        event.preventDefault(); // 阻止默認行為
        var selectedText = $(this).text();
        $('#problemType_').text(selectedText);
    });

     $("#bt").on("click", function() {
    	 var form1 = document.getElementById("form1");
    	 var problemType_ = $('#problemType_').text();
    	 var attachedFile = $('#attachedFile').val();
    	 var email = $("#email").val();
    	 var pattern = /^\b[A-Z0-9-]+@[A-Z0-9]+\.com\b/i;
    	 
    	 if (!pattern.test(email)){
//     		 errorMessage = "請輸入格式正確的電子郵件地址";
//     		 $("#emailError").text(errorMessage);
//     		 $("#emailError").css("color","red");
			 alert("請輸入格式正確的電子郵件地址")
        	 return ;
     	 }

    	 if(attachedFile != '' && isTxt(attachedFile)!= 'txt' && isJpg(attachedFile)!= 'jpg' && isPng(attachedFile)!='png'){
//     		 errorMessage = "上傳檔案非 JPG/PNG/TXT";
//     		 $("#attachedFileError").text(errorMessage);
//     		 $("#attachedFileError").css("color","red");
			 alert("上傳檔案非 JPG/PNG/TXT")
        	 return ;
    	 }
    	 
    	 $('.dropdown-item').each(function(index, element) {
             // 打印每个元素的文本内容
             if(problemType_ == $(element).text()){
            	 var problemType = $(element).attr('value') ;
            	 $('#problemType').val(problemType);
             }
             //console.log('dropdown-item ' + (index + 1) + ': ' + $(element).text()+ ': '+ );
         });
         $.ajax({
             url: '${pageContext.request.contextPath}/callcenter.do',
             type: "POST",
             data: new FormData(form1),
             enctype: 'multipart/form-data;',
             processData: false,
             contentType: false
           }).done(function(data) {
        	  // console.log(JSON.stringify(data));
        	   if(typeof(data.fail) != "undefined"){
            	   alert(data.fail);
            	   return false ;
        	   }
        	  
           	   if(typeof(data.ok) != "undefined"){
            	   alert(data.ok);
            	   return false ;
            	   //TODO 導頁至首頁
        	   }
               return false;
           }).fail(function(jqXHR, textStatus) {
               alert('申請資料失敗');
               return false;
           });
   	});
});
</script>
</body>
</html>