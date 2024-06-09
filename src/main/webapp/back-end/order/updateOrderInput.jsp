<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>

<% 
	OrderVO orderVO = (OrderVO) request.getAttribute("orderVO");
%>

<!DOCTYPE html>
<html>
<!-- head -->
<%@include file="/back-end/component/header.jsp" %>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">修改訂單</h1>
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
				
				<div class="card">
	              <div class="card-header">
	                <h3 class="card-title">${orderVO.orderNumber}號訂單</h3>
	              </div>	<!-- /.card-header -->
	              <div class="card-body">
		              <form method="post" id="updateOrderForm" action="${pageContext.request.contextPath}/order/order.do" class="needs-validation" novalidate>
		                <table id="updateOrder" class="table table-bordered table-hover">
		                	<tbody>
		                		<tr>
		                			<th class="align-middle">訂單編號：</th>
		                			<td>${orderVO.orderNumber}</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">會員編號：</th>
		                			<td>${orderVO.userNumber}</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">訂單狀態：</th>
		                			<td>
		                				<select name="orderStatus" class="form-control" style="width: 30%">
		                					<c:if test = "${orderVO.orderStatus == 0 ||  orderVO.orderStatus == 1 || orderVO.orderStatus == 2}">		                					
		                						<option value="1" ${(orderVO.orderStatus == 1)?'selected':''}>待處理</option>
												<option value="2" ${(orderVO.orderStatus == 2)?'selected':''}>待出貨</option>	
		                						<option value="3" ${(orderVO.orderStatus == 3)?'selected':''}>已出貨</option>
			                    				<option value="0" ${(orderVO.orderStatus == 0)?'selected':''}>取消</option>
			                    			</c:if>
			                    			<c:if test = "${orderVO.orderStatus == 3}">
												<option value="3" selected>已出貨</option>
			                    			</c:if>
			                    			<c:if test = "${orderVO.orderStatus == 4}">
			                    				<option value="4" selected>已完成 (尚未評價)</option>
			                    			</c:if>
			                    			<c:if test = "${orderVO.orderStatus == 5}">
			                    				<option value="5" selected>已完成</option>
			                    			</c:if>
										</select>		                			
		                			</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">訂單明細：</th>
		                			<td>
		                				<ul>
			                				<c:forEach var="orderDetailsVOs" items="${orderDetails}">
			                					 <li>
			                					 	<img src="${pageContext.request.contextPath}/bap/Img?bookNumber=${orderDetailsVOs.bookNumber}" width="70px" alt="">
			                					 	${orderDetailsVOs.bookProductsVO.bookTitle} - 單價：$ ${orderDetailsVOs.unitPrice}  - 數量：${orderDetailsVOs.quantity}
			                					 </li>
			                					 <br>
			                				</c:forEach>
		                				</ul>              			
		                			</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">成立時間：</th>
		                			<td>${orderVO.establishmentTime}</td>
		                		</tr>		                		
		                		<tr>
		                			<th class="align-middle">出貨時間：</th>
		                			<td>
		                				<div class="input-group date"  id="reservationdatetime" data-target-input="nearest" style="width: 30%">
<%-- 		                					<c:choose> --%>
<%-- 			                            		<c:when test="${orderVO.orderStatus == 2}"> --%>
<%-- 			                            			<input type="text" name="shippingTime" class="form-control datetimepicker-input" data-target="#reservationdatetime" value="${orderVO.shippingTime}" required/> --%>
<!-- 							                        <div class="input-group-append" data-target="#reservationdatetime" data-toggle="datetimepicker"> -->
<!-- 							                            <div class="input-group-text"><i class="fa fa-calendar"></i></div> -->
<!-- 							                        </div> -->
<%-- 											    </c:when> --%>
<%-- 											    <c:otherwise> --%>
											        <input type="text" name="shippingTime" class="form-control datetimepicker-input" data-target="#reservationdatetime" value="${orderVO.shippingTime}" disabled="disabled"/>									    
											    	<div class="input-group-append" data-target="#reservationdatetime" data-toggle="datetimepicker">
							                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
							                        </div>
<%-- 											    </c:otherwise> --%>
<%-- 											</c:choose> --%>
											<div class="invalid-tooltip">
	          									請選出貨時間         							
	        								</div>
					                    </div>
							        </td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">完成時間：</th>
		                			<td>${orderVO.completeTime}</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">收件人：</th>
		                			<td>
		                				<div class="input-group" style="width: 30%" >
		                					<c:choose>
			                            		<c:when test="${orderVO.orderStatus == 1}">
			                            			<input type="text" name="receiver" class="form-control" value="${orderVO.receiver}" required>
											    </c:when>
											    <c:when test="${orderVO.orderStatus == 2}">
			                            			<input type="text" name="receiver" class="form-control" value="${orderVO.receiver}" required>
											    </c:when>
											    <c:otherwise>
											       	<input type="text" name="receiver" class="form-control" value="${orderVO.receiver}" disabled="disabled" required>									    
											    </c:otherwise>
											</c:choose>
			                				<div class="invalid-tooltip">
	          									收件人請勿空白         							
	        								</div>
        								</div>
		                			</td>
		                		</tr>
		                		<tr>		                			
		                			<th class="align-middle">收件地址：</th>		                			
		                			<td>
		                				<div class="input-group" style="width: 50%" >
		                					<c:choose>
			                            		<c:when test="${orderVO.orderStatus == 1}">
			                            			<input type="text" name="shippingAddress" class="form-control" value="${orderVO.shippingAddress}" required>
											    </c:when>
											    <c:when test="${orderVO.orderStatus == 2}">
			                            			<input type="text" name="shippingAddress" class="form-control" value="${orderVO.shippingAddress}" required>
											    </c:when>
											    <c:otherwise>
											       	<input type="text" name="shippingAddress" class="form-control" value="${orderVO.shippingAddress}" disabled="disabled" required>									    
											    </c:otherwise>
											</c:choose>
		                					<div class="invalid-tooltip">
	          									收件地址請勿空白      							
	        								</div>
		                				</div>
		                			</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">手機：</th>
		                			<td>
		                				<div class="input-group" style="width: 30%" >
		                					<c:choose>
			                            		<c:when test="${orderVO.orderStatus == 1}">
			                            			<input type="text" name="telephone" id="checkTel" class="form-control" value="${orderVO.telephoneNumber}" required>
											    </c:when>
											    <c:when test="${orderVO.orderStatus == 2}">
			                            			<input type="text" name="telephone" id="checkTel" class="form-control" value="${orderVO.telephoneNumber}" required>
											    </c:when>
											    <c:otherwise>
											       	<input type="text" name="telephone" id="checkTel" class="form-control" value="${orderVO.telephoneNumber}" disabled="disabled" required>									    
											    </c:otherwise>
											</c:choose>
			                				<div class="invalid-tooltip">
	          									手機號碼請勿空白         							
	        								</div>
        								</div>
		                			</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">運費：</th>
		                			<td>${orderVO.deliveryFee}</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">總金額：</th>
		                			<td>${orderVO.total}</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">付款編號：</th>
		                			<td>${orderVO.paymentNumber}</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">備註：</th>
		                			<td>
		                				<c:choose>
			                            	<c:when test="${orderVO.orderStatus == 1}">
			                            		<textarea name="note" class="form-control" style="width: 50%;">${orderVO.note}</textarea>
											</c:when>
											<c:when test="${orderVO.orderStatus == 2}">
			                            		<textarea name="note" class="form-control" style="width: 50%;">${orderVO.note}</textarea>
											</c:when>
											<c:otherwise>
											    <textarea name="note" class="form-control" style="width: 50%;" disabled="disabled">${orderVO.note}</textarea>								    
											</c:otherwise>
										</c:choose>
		                			</td>
		                		</tr>					               
			              	</tbody>
		                </table>
		                <div class="row">
		                	<div class="col-md-1 offset-md-10" id="confirmArea">
		                		<c:choose>
			                        <c:when test="${orderVO.orderStatus == 1}">
			                            <button type="submit" class="btn btn-block bg-gradient-primary btn">確定</button>
									</c:when>
									<c:when test="${orderVO.orderStatus == 2}">
			                            <button type="submit" class="btn btn-block bg-gradient-primary btn">確定</button>
									</c:when>
								</c:choose>
								<input type="hidden" name="orderNumber"  value="${orderVO.orderNumber}">
								<input type="hidden" name="action"	value="update">	 
		                	</div>
		                	<div class="col-md-1">
		                	 	<a href="${pageContext.request.contextPath}/order/order.do?action=getAll">
									<button type="button" class="btn btn-block bg-gradient-danger">返回</button>
								</a>
		                	</div>
		                </div>
		               </form>
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
	
	<!-- js -->
	<%@include file="/back-end/component/script.jsp" %>
	<!-- Page specific script -->
<script>
	$(function(){	
		//Date and time picker
	    $('#reservationdatetime').datetimepicker({
	    	locale: 'zh-tw',
	        format: 'YYYY-MM-DD HH:mm',
	    	icons: { time: 'far fa-clock' }
	    });
		
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
	 
	
		
	 $(document).on("change", "select.form-control", function(){
		 if(this.value == 0){			
				$("#reservationdatetime").children("input").prop("disabled", true);	
				$("#confirmArea").children("button").replaceWith('<button type="button" class="btn btn-block bg-gradient-primary btn" id="cancelButton">取消訂單</button>');
		}
				 
		if(this.value == 1 || this.value == 2){
				$("#reservationdatetime").children("input").prop("disabled", true);	
				$("#confirmArea").children("button").replaceWith('<button type="submit" class="btn btn-block bg-gradient-primary btn">確定</button>');
		}
				 
		if(this.value == 3){
			let html =`
			<input type="text" name="shippingTime" class="form-control datetimepicker-input" data-target="#reservationdatetime" value="${orderVO.shippingTime}" required/>
		        <div class="input-group-append" data-target="#reservationdatetime" data-toggle="datetimepicker">
		            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
		        </div>
			`;
				$("#reservationdatetime").children("input").prop("disabled", false).prop('required', true);
				$("#confirmArea").children("button").replaceWith('<button type="submit" class="btn btn-block btn-warning btn">出貨</button>');
		}

	 });
	 
	 
	 $(document).on("click", "#cancelButton", function(event){
		 event.preventDefault();
		 event.stopPropagation();
		 if(confirm("是否取消訂單？")){
			 $("#updateOrderForm").submit();
		 }
	 });
	
 
	 $('#checkTel').on('input', function() {	//手機號碼可直接輸入數字，幫使用者自動加上-
	        let input = $(this).val().replace(/\D/g, ''); // 移除所有非數字字符
	        console.log('Input after removing non-digits:', input);
	        let formattedInput = '';

	        if (input.length > 0) {
	            formattedInput += input.substring(0, 4);
	            console.log('Formatted input after first segment:', formattedInput);
	        }
	        if (input.length > 4) {
	            formattedInput += '-' + input.substring(4, 7);
	            console.log('Formatted input after second segment:', formattedInput);
	        }
	        if (input.length > 7) {
	            formattedInput += '-' + input.substring(7, 10);
	            console.log('Formatted input after third segment:', formattedInput);
	        }

	        $(this).val(formattedInput);
	        console.log('Final formatted input:', formattedInput);
	});
	 
	 
});
		
</script>
	

</body>
</html>