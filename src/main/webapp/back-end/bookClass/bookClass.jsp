<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bookclass.model.*"%>

<%
	BookClassService bcSce=new BookClassService();
	List<BookClassVO> bcList=bcSce.getAllBcNp();
	pageContext.setAttribute("bcList", bcList);
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
					<div class="row justify-content-between">
						<div class="col-md-6">
							<h1 class="m-0">書籍類別列表</h1>
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
						<form method="post" action="${pageContext.request.contextPath}/bookClass.do" class="needs-validation" novalidate>
							<label for="orderInput">類別編號搜尋</label>
							<div class="input-group">		
								<input type="search" id="orderInput" name="classNumber" class="form-control" placeholder="搜尋類別編號" required>
								<input type="hidden" name="action" value="getOne_For_Display">	
								<div class="invalid-tooltip">
          							請輸入類別編號         							
        						</div>
        						<button type="submit" class="btn btn-default">
								<i class="fa fa-search"></i>
								</button>
							</div>				
						</form>	
					</div>	<!-- /.col -->

					<div class= "col-md-3 offset-md-1">
						<form method="post" action="${pageContext.request.contextPath}/bookClass.do" class="needs-validation" novalidate>
							<label for="orderInput">類別名稱搜尋</label>
							<div class="input-group">		
								<input type="search" id="orderInput" name="keywords" class="form-control" placeholder="搜尋類別名稱" required>
								<input type="hidden" name="className" value="getOne_For_Display">	
								<input type="hidden" name="action" value="keywords">	
								<div class="invalid-tooltip">
          							請輸入類別名稱         							
        						</div>
        						<button type="submit" class="btn btn-default">
								<i class="fa fa-search"></i>
								</button>
							</div>				
						</form>	
					</div>	<!-- /.col -->
					
					<div class= "col-auto align-self-end">
						<a href="${pageContext.request.contextPath}/back-end/bookClass/addBookClass.jsp">
							<button type="submit" class="btn btn-block bg-gradient-success">新增書籍類別</button>
						</a>						
					</div>	
					
				</div> <!-- /.row -->
				
				<br>
				<div class="card">
	              <div class="card-header">
	                <h3 class="card-title">所有類別</h3>
	              </div>	<!-- /.card-header -->
	              <div class="card-body">
	                <table id="orderlist" class="table table-bordered table-hover">
	                  <thead>
		                  <tr>
		                    <th style="width: 150px;">類別編號</th>
		                    <th style="width: 300px;">類別名稱</th>
		                    <th>修改</th>
		                  </tr>
	                  </thead>
	                  <tbody>
		                  <c:forEach var="bcVO" items="${bcList}">
			                  <tr>
			                    <td>${bcVO.classNumber}</td>
			                    <td>${bcVO.className}</td>
			                    <td>
			                    	<form method="post" action="${pageContext.request.contextPath}/bookClass.do">
			                    		<button type="submit" class="btn btn-block bg-gradient-primary btn-sm">修改</button>
									    <input type="hidden" name="classNumber"  value="${bcVO.classNumber}">
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
