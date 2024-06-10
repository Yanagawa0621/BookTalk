<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.callcenter.model.*"%>
<%
// 	callCenterBackService ccSce=new callCenterBackService();
// 	List<callCenterVO> list=ccSce.getAllPhNp();
// 	pageContext.setAttribute("list", list);
%>
    
<!DOCTYPE html>
<html>
<!-- head -->
<style>
	th,tr {
	  white-space: nowrap; /* 讓文字不換行 */
	}

    .fixed-size-form {
        width: 300px; /* 固定寬度 */
    }
     .form-row { 
         margin-bottom: 10px; /* 行間距 10px */ 
     } 
	
	.input-group {
        margin-bottom: 20px; /* 調整 input-group 的下邊距 */
    }
    
    table {
	    table-layout: fixed;
	    width: 100%;
	}
    
    th, td {
        white-space: nowrap; /* 禁止換行 */
        overflow: hidden; /* 超出部分隱藏 */
        text-overflow: ellipsis; /* 超出部分用...表示 */
        
/*     .btn btn-block { */
/*             white-space: nowrap; /* 确保文本不换行 */ */
/*             width: auto; /* 自动调整宽度 */ */
/*             min-width: 200px; /* 设置最小宽度，可以根据需要调整 */ */
/*         }     */
    }
</style>

<%@include file="/back-end/component/header.jsp" %>

<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row justify-content-between">
						<div class="col-md-6">
							<h1 class="m-0">客訴案件列表</h1>
						</div>	<!-- /.col -->								
					</div>	<!-- /.row -->					
				</div>	<!-- /.container-fluid -->				
			</div>	<!-- /.content-header -->
			
			
			<!-- Main content -->
			<div class="content">
				<div class="row">
					<div class= "col-md-3 offset-md-1">
						<c:if test="${not empty errorMsgs}">
							<font style="color: red">請修正以下錯誤:</font>
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li style="color: red">${message}</li>
								</c:forEach>
							</ul>
						</c:if>
					</div>
				</div>
				<div class="row">
			        <!-- 第一個搜尋表單 -->
					<div class= "col-md-3 offset-md-1">
						<form method="post" action="${pageContext.request.contextPath}/callcenterBack.do" class="needs-validation" novalidate>
							<label for="orderNumber">搜尋訂單編號</label>
							<div class="input-group">		
								<input type="search" id="orderNumber" name="orderNumber" class="form-control" placeholder="搜尋訂單編號" required>	
								<input type="hidden" name="action" value="keywords">	
								<div class="invalid-tooltip">
          							請輸入訂單編號         							
        						</div>
        						<button type="submit" class="btn btn-default">
								<i class="fa fa-search"></i>
								</button>
							</div>				
						</form>	
					</div>		

					<!-- 第二個表單 -->
					<div class= "col-md-3 offset-md-1">
						<form method="post" action="${pageContext.request.contextPath}/callcenterBack.do" class="needs-validation" novalidate>
							<label for="email">搜尋email</label>
							<div class="input-group">		
								<input type="search" id="email" name="email" class="form-control" placeholder="搜尋email" required>	
								<input type="hidden" name="action" value="keywords">	
								<div class="invalid-tooltip">
          							請輸入email         							
        						</div>
        						<button type="submit" class="btn btn-default">
								<i class="fa fa-search"></i>
								</button>
							</div>				
						</form>	
					</div>
					
					<!-- 第三個表單 -->
					<div class= "col-md-3 offset-md-1">
						<form method="post" action="${pageContext.request.contextPath}/callcenterBack.do" class="needs-validation" novalidate>
							<label for="problemType">發問類型</label>
							<div class="input-group">		
								<select id="problemType" name="problemType" class="form-control" required>
									<option selected hidden disabled value="">搜尋發問類型</option>
									<option value="1">書籍商品相關問題</option>
									<option value="2">訂單相關問題</option>
									<option value="3">其他建議相關</option>
								</select>
								<input type="hidden" name="action" value="keywords">	
								<div class="invalid-tooltip">
          							請選擇發問類型         							
        						</div>
        						<button type="submit" class="btn btn-default">
								<i class="fa fa-search"></i>
								</button>
							</div>				
						</form>	
					</div>	
					
					<!-- 全部客訴按鈕 -->
					<div class="col-md-4 d-flex justify-content-center align-self-end">
				      	<form id='form1' method="post" action="${pageContext.request.contextPath}/callcenterBack.do" class="needs-validation" novalidate>
				        <button id="bt" type="button" class="btn btn-block bg-gradient-success">全部客訴案件</button>
				       	<input type="hidden" id='orderNumber_' name="orderNumber"/>
				       	<input type="hidden" id='email_' name="email" />
				       	<input type="hidden" id='problemType_' name="problemType"/>
				       	</form>
				  	</div>
				</div>
				<br>
				<div class="card">
	              <div class="card-header">
	                <h3 class="card-title">所有客訴案件</h3>
	              </div>	<!-- /.card-header -->
	              <div class="card-body">
	                <table id="orderlist" class="table table-bordered table-hover">
	                  <thead>
		                  <tr>
		                    <th style="width: 15px;">編號</th>
		                    <th style="width: 90px;">發問類型</th>
<!-- 		                    <th style="width: 250px;">問題描述</th>		                     -->
		                    <th style="width: 110px;">email</th>		                    
		                    <th style="width: 100px;">訂單編號</th>
		                    <th style="width: 120px;">發問日期</th>
		                    <th style="width: 40px;">處理狀態</th>
		                    <th style="width: 50px;">回覆</th>
		                  </tr>
	                  </thead>
	                  <tbody>
  						  <c:forEach var="ccVO" items="${list}">
			                  <tr>
			                    <td>${ccVO.id}</td>
			                    <td>${ccVO.problemTypeName}</td>
			                    <td>${ccVO.email}</td>	                    
			                    <td>${ccVO.orderNumber}</td>
			                    <td>${ccVO.createdAt}</td>
			                    <td>
								<c:choose>
								    <c:when test="${ccVO.processStatus == '0'}">
								       待處理
								    </c:when>
								    <c:when test="${ccVO.processStatus == '1'}">
								       已完成
								    </c:when>
								</c:choose>
								</td>
			                    <td>
			                    	<form method="post" action="${pageContext.request.contextPath}/callcenterBack.do">
			                    		
			                    		<button type="submit" class="btn btn-block bg-gradient-primary btn-sm">
			                    		<c:choose>
										    <c:when test="${empty ccVO.responseAt}">
										        回覆
										    </c:when>
										    <c:otherwise>
										    	檢視
										    </c:otherwise>
										</c:choose>
			                    		</button>
									    <input type="hidden" name="ccVOId"  value="${ccVO.id}">
									    <input type="hidden" name="action"	value="getOne_For_Update">
			                    	</form>
			                    </td>
			                  </tr>
			              </c:forEach>
		              </tbody>                  
	                </table>
	              </div>
	              <!-- /.card-body -->
	            </div>
	            <!-- /.card -->
			</div>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		
		<!-- footer -->
		<%@include file="/back-end/component/footer.jsp" %>

	</div>
	<!-- ./wrapper -->

	<%@include file="/back-end/component/script.jsp" %>
	<!-- Page specific script -->
	<script>
		$(function() {
			$('.select2').select2()
			$('#orderlist').DataTable({
		      "paging": true,
		      "lengthChange": true,
		      "searching": false,
		      "ordering": false,
		      "info": true,
		      "autoWidth": false,
		      "responsive": true,
		      language: {	//設定語言為繁中
		          url: "${pageContext.request.contextPath}/plugins/i18n/zh-HANT.json"
		      },
		      lengthMenu: [
		    	    [5, 10, 15, 20, 25, 50, -1],
		    	    [5, 10, 15, 20, 25, 50, "全部"],
		    	],
		    });			
		});

	    // $("#form1").on("submit", function() {
	    $("#bt").on("click", function() {
	    	 if(!valid()){
	    		 alert("訂單編號請輸入數字");
	    		 return;
	    	 }else{
		    	 $('#orderNumber_').val($('#orderNumber').val());
		    	 $('#email_').val($('#email').val());
		    	 $('#problemType_').val($('#problemType').val());
		    	 $('#form1').submit();
	    	 }	    	 
	   	});
	     
	     function valid(){
	    	var orderNumber = $('#orderNumber').val();
	    	var result = true;
    	 	//訂單號碼驗證
    	 	if(orderNumber != ''){
	    	  	var reg =  /^(0|[1-9]\d*)$/;
	    	  	result = reg.test(orderNumber);
    	 	}
    	 	return result;
 		}
	</script>
	<script>
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(function() {
		  'use strict';
		  window.addEventListener('load', function() {
		    // Fetch all the forms we want to apply custom Bootstrap validation styles to
		    var forms = document.getElementsByClassName('needs-validation');
		    // Loop over them and prevent submission
		    var validation = Array.prototype.filter.call(forms, function(form) {
		      form.addEventListener('submit', function(event) {
		        if (form.checkValidity() === false) {
		          event.preventDefault();
		          event.stopPropagation();
		        }
		        form.classList.add('was-validated');
		      }, false);
		    });
		  }, false);
		})();
</script>
</body>
</html>