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
		              <form method="post" name="updateOrderForm" action="${pageContext.request.contextPath}/order/order.do" class="needs-validation" novalidate>
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
											<option value="1" ${(orderVO.orderStatus == 1)?'selected':''} >待處理</option>
											<option value="2" ${(orderVO.orderStatus == 2)?'selected':''}>已確認</option>	
											<option value="3" ${(orderVO.orderStatus == 3)?'selected':''}>已出貨/運送中</option>
											<option value="4" ${(orderVO.orderStatus == 4)?'selected':''}>已送達/已完成</option>
											<option value="0" ${(orderVO.orderStatus == 0)?'selected':''} >取消</option>	
										</select>		                			
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
					                        <input type="text" name="shippingTime" class="form-control datetimepicker-input" data-target="#reservationdatetime" value="${orderVO.shippingTime}" />
					                        <div class="input-group-append" data-target="#reservationdatetime" data-toggle="datetimepicker">
					                            <div class="input-group-text"><i class="fa fa-calendar"></i></div>
					                        </div>
					                    </div>
							        </td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">收件人：</th>
		                			<td>
		                				<div class="input-group" style="width: 30%" >	
			                				<input type="text" name="receiver" class="form-control" value="${orderVO.receiver}" required>
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
		                					<input type="text" name="shippingAddress" class="form-control" value="${orderVO.shippingAddress}" required>
		                					<div class="invalid-tooltip">
	          									收件地址請勿空白      							
	        								</div>
		                				</div>
		                			</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">運費：</th>
		                			<td>
		                				<div class="input-group" style="width: 30%" >		                			
		                					<input type="text" name="deliveryFee" class="form-control" value="${orderVO.deliveryFee}" required>
		                					<div class="invalid-tooltip">
	          									請輸入運費      							
	        								</div>
		                				</div>
		                			</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">總金額：</th>
		                			<td>
		                				<div class="input-group" style="width: 30%" >		                			
		                					<input type="text" name="total" class="form-control" value="${orderVO.total}" required>
		                					<div class="invalid-tooltip">
	          									請輸入總金額     							
	        								</div>
		                				</div>
		                			</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">備註：</th>
		                			<td>
		                				<textarea name="note" class="form-control" style="width: 50%;">${orderVO.note}</textarea>
		                			</td>
		                		</tr>					               
			              	</tbody>
		                </table>
		                <div class="row">
		                	<div class="col-md-1 offset-md-10">
			                	<button type="submit" class="btn btn-block bg-gradient-primary btn">送出修改</button>
								<input type="hidden" name="orderNumber"  value="${orderVO.orderNumber}">
								<input type="hidden" name="userNumber"  value="${orderVO.userNumber}">
								<input type="hidden" name="establishmentTime"  value="${orderVO.establishmentTime}">
								<input type="hidden" name="action"	value="update">	 
		                	</div>
		                	<div class="col-md-1">
		                	 	<a href="${pageContext.request.contextPath}/back-end/order/order.jsp">
									<button type="button" class="btn btn-block bg-gradient-danger">取消</button>
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
		
		
	});
		
	</script>
	

</body>
</html>