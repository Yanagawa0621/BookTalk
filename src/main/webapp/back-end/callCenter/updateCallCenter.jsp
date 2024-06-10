<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>

<% 
	//OrderVO orderVO = (OrderVO) request.getAttribute("orderVO");
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
							<h1 class="m-0">客服回覆</h1>
						</div>	<!-- /.col -->						
					</div>	<!-- /.row -->					
				</div>	<!-- /.container-fluid -->				
			</div>	<!-- /.content-header -->
			
			
			<!-- Main content -->
			<div class="content">
			<div class="card">
	              <div class="card-header">
	                <h3 class="card-title">${vo.orderNumber}號訂單</h3>
	              </div>	<!-- /.card-header -->
	              <div class="card-body">
		              <form method="post" name="updateCallcenterForm" action="${pageContext.request.contextPath}/callcenterBack.do" class="needs-validation" novalidate>
		                <table id="updateCallcenter" class="table table-bordered table-hover">
		                	<tbody>
		                		<tr>
		                			<th class="align-middle">訂單編號：</th>
		                			<td>${vo.orderNumber}</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">發問類型：</th>
		                			<td>${vo.problemTypeName}</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">問題描述：</th>
		                			<td>${vo.problemDescription}</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">email：</th>
		                			<td>${vo.email}</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">客訴日期：</th>
		                			<td>${vo.createdAt}</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">附加圖檔：</th>
		                			<td>
									<c:if test="${not empty vo.fileName}">
 										<a href="${pageContext.request.contextPath}/callcenterBack.do?id=${vo.id}">
											<button type="button" class="btn btn-block bg-gradient-primary btn">下載</button>
										</a>
									</c:if>
		                			</td>
		                		</tr>
		                		<tr >
		                			<th class="align-middle">回應內容：</th>
		                			<td>
		                			<textarea id="responseDescription" name="responseDescription" class="form-control" rows="4">${vo.responseDescription}</textarea>
		                		</tr>
			              	</tbody>
		                </table>
		                <div class="row">
		                	<div class="col-md-1 offset-md-10">
		                	<a href="${pageContext.request.contextPath}/back-end/callCenter/callCenter.jsp">
								<c:if test="${empty vo.responseAt}">
									 <button type="submit" class="btn btn-block bg-gradient-primary btn">回覆客戶</button>
								</c:if>
								<input type="hidden" name="ccVOId"  value="${vo.id}">
								<input type="hidden" name="action"	value="update">
								</a>	 
		                	</div>
		                	
		                	<div class="col-md-1">
		                	 	<a href="${pageContext.request.contextPath}/back-end/callCenter/callCenter.jsp">
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