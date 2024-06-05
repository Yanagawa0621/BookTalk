<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.order.model.*"%>
<%@page import="com.orderdetails.model.*"%>


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
					<div class="row justify-content-between">
						<div class="col-md-6">
							<h1 class="m-0">訂單列表</h1>
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
					<div class= "col-md-3 offset-md-1">
						<form method="post" action="${pageContext.request.contextPath}/order/order.do" class="needs-validation" novalidate>
							<label for="orderInput">搜尋訂單編號</label>
							<div class="input-group">		
								<input type="search" id="orderInput" name="orderNumber" class="form-control" placeholder="搜尋訂單編號" required>
								<input type="hidden" name="action" value="getOne_For_Display">	
								<div class="invalid-tooltip">
          							請輸入訂單編號         							
        						</div>
        						<button type="submit" class="btn btn-default">
								<i class="fa fa-search"></i>
								</button>
							</div>				
						</form>	
					</div>	<!-- /.col -->
					
					<div class= "col-md-3">
						<form method="post" action="${pageContext.request.contextPath}/order/order.do">
							<label for="orderStatusChoice">請選擇訂單狀態</label>
							<div class="input-group-append">
								<select id="orderStatusChoice" name="orderStatus" class="form-control" >	
									<option value="1">待處理</option>
									<option value="2">待出貨</option>	
									<option value="3">已出貨</option>	
									<option value="4">已完成 (尚未評價)</option>
									<option value="5">已完成</option>
									<option value="0">取消</option>						
								</select>
								<input type="hidden" name="action" value="getOneOrderStatus_For_Display">
								<button type="submit" class="btn btn-default">
								<i class="fa fa-search"></i>
								</button>
							</div>							
						</form>	
					</div>	<!-- /.col -->

					<div class= "col-md-3">
						<form method="post" action="${pageContext.request.contextPath}/order/order.do">
						<label for="memberOrderSearch">請輸入會員編號</label>
							<div class="input-group">		
								<input type="search" id="memberOrderSearch" name="userNumber" class="form-control" placeholder="輸入會員編號" required>
								<input type="hidden" name="action" value="getOneUserNumber_For_Display">
								<div class="invalid-tooltip">
          							請輸入會員編號         							
        						</div>
        						<button type="submit" class="btn btn-default">
								<i class="fa fa-search"></i>
								</button>
							</div>							
						</form>	
					</div>	<!-- /.col -->
					
<!-- 					<div class= "col-auto align-self-end"> -->
<%-- 						<a href="${pageContext.request.contextPath}/back-end/order/addOrder.jsp"> --%>
<!-- 							<button type="submit" class="btn btn-block bg-gradient-success">新增訂單</button> -->
<!-- 						</a>						 -->
<!-- 					</div>	 -->
					
				</div> <!-- /.row -->
				
				<br>
				<div class="card">
	              <div class="card-header">
	                <h3 class="card-title">所有訂單</h3>
	              </div>	<!-- /.card-header -->
	              <div class="card-body">
	                <table id="orderlist" class="table table-bordered table-hover dt-responsive nowrap">
	                  <thead>
		                  <tr>
		                    <th>訂單編號</th>
		                    <th>會員編號</th>
		                    <th>訂單狀態</th>
		                    <th>成立時間</th>		                    
		                    <th>出貨時間</th>
		                    <th>收件人</th>
		                    <th>收件地址</th>
		                    <th>手機</th>
		                    <th>運費</th>
		                    <th>總金額</th>
		                    <th>付款編號</th>
		                    <th>備註</th>
		                    <th>Action</th>
		                  </tr>
	                  </thead>
	                  <tbody>
		                  <c:forEach var="orderVO" items="${list}">
			                  <tr>
			                    <td>${orderVO.orderNumber}</td>
			                    <td>${orderVO.userNumber}</td>
			                    <td>
			                    	<c:if test = "${orderVO.orderStatus == 0}">
			                    		取消
			                    	</c:if>
			                    	<c:if test = "${orderVO.orderStatus == 1}">
			                    		待處理
			                    	</c:if>
			                    	<c:if test = "${orderVO.orderStatus == 2}">
			                    		待出貨
			                    	</c:if>
			                    	<c:if test = "${orderVO.orderStatus == 3}">
			                    		已出貨
			                    	</c:if>
			                    	<c:if test = "${orderVO.orderStatus == 4}">
			                    		已完成 (尚未評價)
			                    	</c:if>
			                    	<c:if test = "${orderVO.orderStatus == 5}">
			                    		已完成
			                    	</c:if>
			                    </td>
			                    <td>${orderVO.establishmentTime}</td>	                    
			                    <td>${orderVO.shippingTime}</td>
			                    <td>${orderVO.receiver}</td>
			                    <td>${orderVO.shippingAddress}</td>
			                    <td>${orderVO.telephoneNumber}</td>
			                    <td>${orderVO.deliveryFee}</td>
			                    <td>${orderVO.total}</td>
			                    <td>${orderVO.paymentNumber}</td>
			                    <td>${orderVO.note}</td>
			                    <td>
			                    	<form method="post" action="${pageContext.request.contextPath}/order/order.do">
			                    		<c:choose>
		                            		<c:when test="${orderVO.orderStatus == 1}">
		                            			<button type="submit" class="btn btn-block bg-gradient-primary btn-sm">查看</button>
										    </c:when>
										    <c:when test="${orderVO.orderStatus == 2}">
										        <button type="submit" class="btn btn-block btn-warning btn-sm">出貨</button>
										    </c:when>
										    <c:when test="${orderVO.orderStatus == 3}">
										        <button type="submit" class="btn btn-block btn-success btn-sm">查看</button>
										    </c:when>
										    <c:otherwise>
										        <button type="submit" class="btn btn-block btn-info btn-sm">查看</button>										    
										    </c:otherwise>
										</c:choose>
				                    		<input type="hidden" name="orderNumber"  value="${orderVO.orderNumber}"> 
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
		      "ordering": true,
		      "stateSave": false, // 預設為false 在頁面刷新時，是否要保存當前表格資料與狀態
		      "destroy": false, // 預設為false 是否銷毀當前暫存資料
		      "info": true,
		      "autoWidth": false,
		      "responsive": true,
		      "columnDefs":[
		          {
		            targets: [12],
		            responsivePriority: 1, 
		          },
		          {
			        targets: [5],
			        responsivePriority: 2, 
			      },
			      {
			        targets: [6],
			        responsivePriority: 4, 
			      },
			      {
				    targets: [7],
				    responsivePriority: 3, 
				  }
		      	],
		      language: {	//設定語言為繁中
		          url: "${pageContext.request.contextPath}/back-end/plugins/i18n/zh-HANT.json"
		      },
		      lengthMenu: [
		    	    [5, 10, 15, 20, 25, 50, -1],
		    	    [5, 10, 15, 20, 25, 50, "全部"],
		    	],
		    });			
		});
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
