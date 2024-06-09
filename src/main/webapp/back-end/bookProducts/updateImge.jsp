<%@page import="com.bookproducts.model.BookProductsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.booksandpicture.model.*"%>
<%@ page import="java.util.*"%>

<%
BooksAndPictureService bapSce= new BooksAndPictureService();
Integer bookNumber=(Integer)request.getAttribute("bookNumber");
List<BooksAndPictureVO> bapVOList=(List<BooksAndPictureVO>) bapSce.getimg(bookNumber);
request.setAttribute("bapVOList", bapVOList);
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
							<h1 class="m-0">修改圖片</h1>
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
											<c:if test="${empty bapVOList}">
												<div id="upload-areas">
													<div class="upload-container">
														<input type="file" name="images[]" class="form-control image-input" accept="image/*">
														<img class="image-preview" src="" alt="Image Preview" style="width: 300px; height: auto;">
													</div>
												</div>
											</c:if>
											<c:forEach var="bapVO" items="${bapVOList}">
											    <div id="upload-areas">
											        <div class="upload-container">
												        <!-- 隱藏的 input 來選擇檔案 -->
												        <input type="file" name="oldImages[]" id="file-input-${bapVO.pictureNumber}" class="form-control image-input" accept="image/*" style="display: none;">
												        <!-- 自訂的按鈕來觸發檔案選擇 -->
												        <button type="button" class="btn btn-link replace-btn" value="${bapVO.pictureNumber}" onclick="document.getElementById('file-input-${bapVO.pictureNumber}').click()">更換圖片</button>
												        <!-- 圖片預覽 -->
												        <img id="image-preview-${bapVO.pictureNumber}" class="image-preview" src="${pageContext.request.contextPath}/booksandpicture.do?pictureNumber=${bapVO.pictureNumber}" alt="Image Preview" style="width: 300px; height: auto;">
												        <!-- 刪除按鈕 -->
												        <button type="button" class="btn btn-danger delete-button" value="${bapVO.pictureNumber}">標記刪除</button>
												    </div>
											    </div>
											</c:forEach>
											<button type="button" id="add-upload" class="btn btn-success add-author-btn">+</button>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="row">
								<div class="col-md-1 offset-md-10">
									<button type="submit" class="btn btn-block bg-gradient-primary btn">送出修改</button>
									<!-- 隱藏欄位，用於表單提交 -->
									<input type="hidden" name="bookNumber" value="${bookNumber}">
									<input type="hidden" name="replace" value="">
									<input type="hidden" name="removeImage" value="">
									<input type="hidden"  name="action" value="update">
								</div>
								<div class="col-md-1">
									<a href="${pageContext.request.contextPath}/back-end/bookProducts/bookProducts.jsp">
										<button type="button" class="btn btn-block bg-gradient-danger">不做變動</button>
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
	            uploadArea += '<input type="file" name="newImages[]" class="form-control image-input" accept="image/*">';
	            uploadArea += '<img class="image-preview" src="" alt="Image Preview" style="width: 300px; height: auto;">';
	            uploadArea += '</div>';
	            $(uploadArea).insertBefore($('#add-upload'));
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
	<script>
		$(document).ready(function() {
		    // 當選擇圖片後，更新對應的圖片預覽
		    $(document).on('change', '.image-input', function() {
		        var input = this;
		        var uploadContainer = $(input).closest('.upload-container');
		        var img = uploadContainer.find('.image-preview');
		        var pictureNumber = $(input).attr('id').split('-').pop();
	
		        if (input.files && input.files[0]) {
		            var reader = new FileReader();
		            reader.onload = function(e) {
		                img.attr('src', e.target.result);
	
		                // 檢查目前的 replace 輸入框的值是否已經包含了當前的 pictureNumber
		                var replaceInput = $('input[name="replace"]');
		                var currentReplaceValue = replaceInput.val();
		                var replaceValues = currentReplaceValue ? currentReplaceValue.split(',') : [];
	
		                if (!replaceValues.includes(pictureNumber)) {
		                    // 如果目前的 replace 值中不包含當前的 pictureNumber，則新增到 replace 裡面
		                    replaceValues.push(pictureNumber);
		                    replaceInput.val(replaceValues.join(','));
		                }
	
		                console.log('Current replace content:', replaceInput.val());
		            };
		            reader.readAsDataURL(input.files[0]);
		        }
		    });
		});
	</script>
	<script>
	$(document).ready(function() {
	    // 使用事件委託來處理刪除按鈕的點擊事件
	    $(document).on('click', '.delete-button', function() {
	        var $button = $(this);
	        var pictureNumber = $button.val();
// 	        console.log(pictureNumber);
	        // 找到相應的圖片預覽元素和其他操作
	        var $fileInput = $(`#file-input-${pictureNumber}`);
	        var $imagePreview = $(`#image-preview-${pictureNumber}`);
	        var $removeImageInput = $('input[name="removeImage"]');
	        var removeSet = new Set($removeImageInput.val().split(',').filter(Boolean));
	        
	        // 切換按鈕文字和執行相應操作
	        if ($button.text() === '標記刪除') {
	            $button.text('取消刪除');
	            addRemoveImage(pictureNumber);
	        } else {
	            $button.text('標記刪除');
	            removeRemoveImage(pictureNumber); // 取消刪除時移除相應的值
	        }
	        
	        // 印出移除集合的內容到控制台
	        console.log('Current removeImage content:', $removeImageInput.val());
	    });

	    function addRemoveImage(pictureNumber) {
	        var $removeImageInput = $('input[name="removeImage"]');
	        var removeSet = new Set($removeImageInput.val().split(',').filter(Boolean));
	        removeSet.add(pictureNumber);
	        $removeImageInput.val(Array.from(removeSet).join(','));
	        
// 	        console.log('Current removeImage content:', $removeImageInput.val());
	    }

	    function removeRemoveImage(pictureNumber) {
	        var $removeImageInput = $('input[name="removeImage"]');
	        var removeSet = new Set($removeImageInput.val().split(',').filter(Boolean));
	        removeSet.delete(pictureNumber); // 從集合中刪除該值
	        $removeImageInput.val(Array.from(removeSet).join(','));
	        
// 	        console.log('Current removeImage content:', $removeImageInput.val());
	    }

	    // 其他 JavaScript 代碼...
	});
	</script>
</body>
</html>