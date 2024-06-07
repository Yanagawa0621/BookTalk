<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							<h1 class="m-0">編輯看板</h1>
						</div>	<!-- /.col -->								
					</div>	<!-- /.row -->					
				</div>	<!-- /.container-fluid -->				
			</div>	<!-- /.content-header -->
			
			
			<!-- Main content -->
			<div class="content">
				<div class="row">
					<div class= "col-md-3">
						<form method="post" action="${pageContext.request.contextPath}/forum/forum.do" class="needs-validation" novalidate>
							<label for="orderInput">搜尋看板名稱</label>
							<div class="input-group">		
								<input type="text" name="name" placeholder="搜尋看板名稱" required>
						        <input type="hidden" name="action" value="getName_For_Display">
								<div class="invalid-tooltip">
          							請輸入看板名稱         							
        						</div>
        						<button type="submit" class="btn btn-default">
								<i class="fa fa-search"></i>
								</button>
							</div>				
						</form>	
						<%-- 錯誤表列 --%>
						<c:if test="${not empty errorMsgs}">
							<font style="color:red">請修正以下錯誤:</font>
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li style="color:red">${message}</li>
								</c:forEach>
							</ul>
						</c:if>
					</div>	<!-- /.col -->
					
				</div> <!-- /.row -->
				
				<br>
				<div class="card">
	              <div class="card-header">
	                <h3 class="card-title">看板</h3>
	              </div>	<!-- /.card-header -->
	              <div class="card-body">
		              <ul>
		                <li><a href="<%=request.getContextPath()%>/back-end/forum/listAllForum.jsp">List</a> all Forums.  <br><br></li>
		              	<li><a href='<%=request.getContextPath()%>/back-end/forum/addForum.jsp'>Add</a> a new forum.</li>
		              </ul>
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

<%@include file="/back-end/component/script.jsp" %>
<!-- Page specific script -->
</body>
</html>