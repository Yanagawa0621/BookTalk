<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.publishinghouse.model.*"%>

<% 
	PublishingHouseVO phVO=(PublishingHouseVO) request.getAttribute("phVO");
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
							<h1 class="m-0">新增出版社</h1>
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
	              </div>	<!-- /.card-header -->
	              <div class="card-body">
		              <form method="post" name="updateOrderForm" action="${pageContext.request.contextPath}/publisingHouse.do" class="needs-validation" novalidate>
		                <table id="updateOrder" class="table table-bordered table-hover">
		                	<tbody>
		                		<tr>
		                			<th class="align-middle">名稱：</th>
		                			<td>
			                			<input class="form-control" type="text" name="name" value="<%=(phVO==null)? "":phVO.getName()%>" required>
			                			<div class="invalid-tooltip">
		          							名稱請勿空白         							
		        						</div>
		                			</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">地址：</th>
		                			<td>
			                			<input class="form-control" type="text" name="address" placeholder="111台北市士林區中山北路七段14巷72-74號" value="<%=(phVO==null)? "":phVO.getAddress()%>" required>
			                			<div class="invalid-tooltip">
		          							地址請勿空白         							
		        						</div>
		                			</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">負責人：</th>
		                			<td>
			                			<input class="form-control" type="text" name="personInCharge" value="<%=(phVO==null)? "":phVO.getPersonInCharge() %>" required>
			                			<div class="invalid-tooltip">
		          							負責人請勿空白         							
		        						</div>
		                			</td>
		                		</tr>
		                		<tr>		                			
		                			<th class="align-middle">電話：</th>		                			
		                			<td>
			                			<input class="form-control" type="text" placeholder="範例:02-12345678(若有分機請加-xxx),手機為:0912345678" name="telephoneNumber" value="<%=(phVO==null)? "":phVO.getTelephoneNumber() %>" required>
			                			<div class="invalid-tooltip">
		          							電話請勿空白         							
		        						</div>
		                			</td>
		                		</tr>					               
			              	</tbody>
		                </table>
		                <div class="row">
		                	<div class="col-md-1 offset-md-10">
			                	<button type="submit" class="btn btn-block bg-gradient-primary btn">送出新增</button>
								<input type="hidden" name="action"	value="insert">	 
		                	</div>
		                	<div class="col-md-1">
		                	 	<a href="${pageContext.request.contextPath}/back-end/publishingHouse/publishingHouse.jsp">
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