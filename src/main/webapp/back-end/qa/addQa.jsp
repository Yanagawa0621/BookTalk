<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bookclass.model.*"%>

<% 
	
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
							<h1 class="m-0">新增Q&A</h1>
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
	              
	              <div class="card-body">
		              <form method="post" name="updateQaForm" action="${pageContext.request.contextPath}/qaBack.do" class="needs-validation" novalidate>
		                <table id="updateOrder" class="table table-bordered table-hover">
		                	
		                	<tbody>
		                		<tr>
		                			<th class="align-middle">問題編號：</th>
		                			<td>
		                				<div class="input-group" style="width: 20%" >	
			                				<input type="text" name="questionNo" class="form-control" value="${vo.questionNo}" required>
			                				<div class="invalid-tooltip">
	          									編號請勿空白         							
	        								</div>
        								</div>
		                			</td>
		                		</tr>
		                	
		                	<tbody>
		                		<tr>
		                			<th class="align-middle">問題：</th>
		                			<td>
		                				<div class="input-group" style="width: 100%" >	
			                				<input type="text" name="question" class="form-control" value="${vo.question}" required>
			                				<div class="invalid-tooltip">
	          									問題請勿空白         							
	        								</div>
        								</div>
		                			</td>
		                		</tr>					               
			              	</tbody>
			              	<tbody>
		                		<tr>
		                			<th class="align-middle">回答：</th>
		                			<td>
		                				<div class="input-group" style="width: 100%" >	
			                				<input type="text" name="answer" class="form-control" value="${vo.answer}" required>
			                				<div class="invalid-tooltip">
	          									回答請勿空白         							
	        								</div>
        								</div>
		                			</td>
		                		</tr>					               
			              	</tbody>
			              	<tbody>
		                		<tr>
		                			<th class="align-middle">是否上架Q&A：</th>
		                			<td>
		                				<div class="input-group" style="width: 100%" >	
			                				<input type="text" name="way" class="form-control" value="${vo.way}" placeholder="Y為上架,N為下架" required>
			                				<div class="invalid-tooltip">
	          									回答請勿空白         							
	        								</div>
        								</div>
		                			</td>
		                		</tr>					               
			              	</tbody>
		                </table>
		                <div class="row">
		                	<div class="col-md-1 offset-md-10">
			                	<button type="submit" class="btn btn-block bg-gradient-primary btn">送出修改</button>
								<input type="hidden" name="questionNo"  value="${vo.questionNo}">
								<input type="hidden" name="action"	value="add">	 
		                	</div>
		                	<div class="col-md-1">
		                	 	<a href="${pageContext.request.contextPath}/back-end/qa/qa.jsp">
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