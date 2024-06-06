<%@page import="com.bookproducts.model.BookProductsVO"%>
<%@page import="com.bookproducts.model.BookProductsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.bookclass.model.*"%>
<%@ page import="java.util.*"%>



<%
	Integer bookNumber = (Integer) request.getAttribute("bookNumber");
	BookProductsService bpSce=new BookProductsService();
	BookProductsVO bpVO=bpSce.singleQueryBpNp(bookNumber);
	request.setAttribute("bpVO", bpVO);
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
							<h1 class="m-0">是否要直接上架</h1>
						</div>	<!-- /.col -->						
					</div>	<!-- /.row -->					
				</div>	<!-- /.container-fluid -->				
			</div>	<!-- /.content-header -->


			<!-- Main content -->
				<div class="card">
	              <div class="card-header">
	              	<div class="row">
		                <div class="col-md-1">
		                	 <a href="${pageContext.request.contextPath}/back-end/bookProducts/bookProducts.jsp">
								<button type="button" class="btn btn-block bg-gradient-primary">不做上架回書籍列表</button>
							</a>
		                </div>
		            </div>
	              </div>
	              <!-- /.card-header -->
	              <div class="card-body">
	                <table id="orderlist" class="table table-bordered table-hover">
	                  <thead>
		                  <tr>
		                    <th>書籍編號</th>
		                    <th>書籍名稱</th>
		                    <th>ISBN</th>
		                    <th></th>
		                  </tr>
	                  </thead>
	                  <tbody>
	                  
		                  <tr>
			              	<td>${bpVO.bookNumber}</td>
			                <td>${bpVO.bookTitle}</td>
			                <td>${bpVO.isbn}</td>
			                <td>
			                	<form method="post" action="${pageContext.request.contextPath}/bookproducts.do">
				                    <button type="submit" class="btn btn-block bg-gradient-primary btn-sm">上架</button>
									<input type="hidden" name="bookNumber"  value="${bpVO.bookNumber}">
									<input type="hidden" name="action"	value="book_shelving">
			                   	</form>
			               	</td>
			              </tr>
		              
		              </tbody>                  
	                </table>
	              </div>
	              <!-- /.card-body -->
	            </div>
	            <!-- /.card -->
		</div>
		<!-- /.content-wrapper -->

		<!-- footer -->
		

	</div>
	<!-- ./wrapper -->

	<!-- js -->
	<%@include file="/back-end/component/script.jsp" %>	
	<!-- Page specific script -->
	<script>
		$(function() {	
			$('#orderlist').DataTable({
		      "paging": true,
		      "lengthChange": false,
		      "searching": false,
		      "ordering": false,
		      "info": true,
		      "autoWidth": false,
		      "responsive": true,
		      language: {	//設定語言為繁中
		          url: "https://cdn.datatables.net/plug-ins/2.0.5/i18n/zh-HANT.json"
		      },
		      lengthMenu: [
		    	    [5, 10, 15, 20, 25, 50, -1],
		    	    [5, 10, 15, 20, 25, 50, "全部"],
		    	],
		    });			
		});
	</script>
</body>
</html>