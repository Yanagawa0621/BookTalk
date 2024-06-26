<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.order.model.*"%>

<%
// Integer bookNumber = (Integer) request.getAttribute("bookNumber");

%>

<!DOCTYPE html>
<html>
<!-- head -->
<%@include file="/back-end/component/header.jsp"%>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">新增圖片</h1>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->


			<!-- Main content -->
			<div class="content">
				<div class="row">
					<div class="col-md-3 offset-md-1">
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
					<div class="card-header"></div>
					<!-- /.card-header -->
					<div class="card-body">
						<form id="image-upload-form" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/booksandpicture.do" class="needs-validation" novalidate>
							<table id="newOrder" class="table table-bordered table-hover">
								<tbody>
									<tr>
										<th class="align-middle">圖片：</th>
										<td>
											<div id="upload-areas">
												<div class="upload-container">
													<input type="file" name="images[]" class="form-control image-input" accept="image/*">
													<img class="image-preview" src="" alt="Image Preview" style="width: 300px; height: auto;">
												</div>
											</div>
											<button type="button" id="add-upload" class="btn btn-success add-author-btn">+</button>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="row">
								<div class="col-md-1 offset-md-10">
									<button type="submit" class="btn btn-block bg-gradient-primary btn">送出新增</button>
									<input type="hidden"  name="bookNumber" value="${bookNumber}"> 
									<input type="hidden"  name="action" value="insert">
								</div>
								<div class="col-md-1">
									<a href="${pageContext.request.contextPath}/back-end/bookProducts/newBookOnTheShelves.jsp?bookNumber=${bookNumber}">
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
		<%@include file="/back-end/component/footer.jsp"%>

	</div>
	<!-- ./wrapper -->

	<!-- js -->
	<%@include file="/back-end/component/script.jsp"%>
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
	
	<script>
    $(document).ready(function() {
        $('#add-upload').click(function() {
            var uploadArea = '<div class="upload-container">';
            uploadArea += '<input type="file" name="images[]" class="form-control image-input" accept="image/*">';
            uploadArea += '<img class="image-preview" src="" alt="Image Preview" style="width: 300px; height: auto;">';
            uploadArea += '</div>';
            $('#upload-areas').append(uploadArea);
        });

        // 當選擇圖片後，更新對應的圖片預覽
        $(document).on('change', '.image-input', function() {
            var input = this;
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    $(input).next('.image-preview').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        });

        function submitForm() {
            // 執行表單提交動作
            $('#image-upload-form').submit();
        }
    });
</script>
</body>
</html>