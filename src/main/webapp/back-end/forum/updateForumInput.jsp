<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.forum.model.*" %>
<%
  ForumVO forumVO = (ForumVO) request.getAttribute("forumVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
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
							<h1 class="m-0">搜尋看板</h1>
						</div>	<!-- /.col -->								
					</div>	<!-- /.row -->					
				</div>	<!-- /.container-fluid -->				
			</div>	<!-- /.content-header -->
			
			
			<!-- Main content -->
			<div class="content">
				<div class="row">
					<div class= "col-md-3">
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
	              	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/forum/forum.do" name="form1">
		                 <table class="table table-bordered table-hover">
							<tr>
								<td>看板編號:<font color=red><b>*</b></font></td>
								<td><%=forumVO.getForumNumber()%></td>
							</tr>
							<tr>
								<td>看板姓名:</td>
								<td><input type="TEXT" name="name" value="<%=forumVO.getName()%>" size="45"/></td>
							</tr>
					     </table>
						 <br>
						 <input type="hidden" name="action" value="update">
						 <input type="hidden" name="forumNumber" value="<%=forumVO.getForumNumber()%>">
						 <input type="submit" value="送出修改"></FORM>
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