<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

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
							<h1 class="m-0">會員列表</h1>
						</div>
						<!-- /.col -->						
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<section class="content">
				<div class="container-md">
					<form action="#">
						<div class="row">
							<div class="col-md-4">
								<div class="form-group">
									<div class="input-group">
										<input type="search" class="form-control" placeholder="搜尋會員帳號">
										<div class="input-group-append">
											<button type="submit" class="btn btn-default">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<select class="form-control" style="width: 100%;">
										<option selected hidden disabled value="">帳號狀態</option>
										<option>正常</option>
										<option>永久停權</option>
										<option>暫時停權7天</option>
									</select>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<select class="form-control" style="width: 100%;">
										<option selected hidden disabled value="">會員權限</option>
										<option>後台管理員</option>
										<option>一般會員</option>
									</select>
								</div>
							</div>
						</div>
					</form>
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		
		<!-- footer -->
		<%@include file="/back-end/component/footer.jsp" %>


	</div>
	<!-- ./wrapper -->

	<%@include file="/back-end/component/script.jsp" %>


</body>
</html>
