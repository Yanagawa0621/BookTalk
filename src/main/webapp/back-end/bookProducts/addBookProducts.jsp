<%@page import="com.bookproducts.model.BookProductsVO"%>
<%@page import="com.publishinghouse.model.PublishingHouseService"%>
<%@page import="com.bookclass.model.BookClassService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bookclass.model.*"%>
<%@ page import="com.publishinghouse.model.*"%>
<%@ page import="com.author.model.*"%>
<%@ page import="java.util.*"%>

<%
	BookProductsVO bpVO= (BookProductsVO) request.getAttribute("bpVO");
%>

<% 
	BookClassService bcSce=new BookClassService();
	List<BookClassVO> bcList=bcSce.getAllBc();
	pageContext.setAttribute("bcList", bcList);
%>

<%
	PublishingHouseService phSce=new PublishingHouseService();
	List<PublishingHouseVO> phList=phSce.getAllPh();
	pageContext.setAttribute("phList", phList);
%>

<%
	AuthorService authorSce=new AuthorService();
	List<AuthorVO> authorList=authorSce.getAllArth();
	pageContext.setAttribute("authorList", authorList);
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
							<h1 class="m-0">新增書籍</h1>
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
	                <h3 class="card-title">輸入書籍資訊</h3>
	              </div>	<!-- /.card-header -->
	              <div class="card-body">
		              <form id="bookForm" method="post" name="newOrderForm" action="${pageContext.request.contextPath}/order/order.do" class="needs-validation" novalidate>
		                <table id="newOrder" class="table table-bordered table-hover">
		                	<tbody>
		                		<tr>
		                			<th class="align-middle">書籍名稱：</th>
		                			<td>
		                				<div class="input-group" style="width: 50%" >	
			                				<input type="text" name="receiver" class="form-control" value="<%= (bpVO==null)? "" : bpVO.getBookTitle()%>" required>
			                				<div class="invalid-tooltip">
	          									書籍名稱請勿空白         							
	        								</div>
        								</div>
		                			</td>
		                		</tr>
		                		<tr>		                			
		                			<th class="align-middle">ISBN：</th>		                			
		                			<td>
		                				<div class="input-group" style="width: 50%" >		                			
		                					<input type="text" name="shippingAddress" class="form-control" value="<%= (bpVO==null)? "" : bpVO.getIsbn()%>" required>
		                					<div class="invalid-tooltip">
	          									ISBN請勿空白      							
	        								</div>
		                				</div>
		                			</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">書籍類別：</th>
		                			<td>
		                				<div class="input-group" style="width: 20%" >		                			
		                					<select class="form-control" name="bookClassNumber">
		                					<c:forEach var="bcVO" items="${bcList}">
		                						<option value="${bcVO.classNumber}" <c:if test="${bpVO != null && bcVO.classNumber == bpVO.bcVO.bookClassNumber}">selected</c:if>>${bcVO.className}</option>
		                					</c:forEach>
		                					</select>
		                				</div>
		                			</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">出版社：</th>
		                			<td>
		                				<div class="input-group" style="width: 20%" >
		                					<select name="publishiingHouseCode" class="form-control">
						                     	<c:forEach var="phVO" items="${phList}">
		                							<option value="${phVO.publishingHouseNumber}" <c:if test="${bpVO != null && phVO.publishingHouseNumber == bpVO.phVO.publishingHouseNumber}">selected</c:if>>${phVO.name}</option>
		                						</c:forEach>
						                    </select>
		                				</div>
		                			</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">出版時間：</th>
		                			<td>
		                				<div class="input-group" style="width: 20%" >		                			
		                					<label for="reservationdatetime">選擇日期和時間</label>
							                <div class="input-group date" id="reservationdatetime" data-target-input="nearest">
							                    <input type="text" name="publicationDate" class="form-control datetimepicker-input" data-target="#reservationdatetime" required value="<%= (bpVO==null)? "" : bpVO.getPublicationDate()%>"/>
							                    <div class="input-group-append" data-target="#reservationdatetime" data-toggle="datetimepicker">
							                        <div class="input-group-text"><i class="far fa-clock"></i></div>
							                    </div>
							                    <div class="invalid-tooltip">
							                        請選擇日期和時間
							                    </div>
							                </div>
		                				</div>
		                			</td>
		                		</tr>
		                		<tbody id="authorTableBody">
		                		<tr>
			                        <th class="align-middle">作者：</th>
			                        <td>
			                            <div class="input-group author-input" style="width: 80%">
			                                <input type="text" name="author" class="form-control" required>
			                                <div class="invalid-tooltip">
			                                    請輸入作者名稱
			                                </div>
			                                <div class="input-group-append">
			                                    <button type="button" class="btn btn-success add-author-btn">+</button>
			                                </div>
			                            </div>
			                        </td>
			                    </tr>
			                    </tbody>
		                		<tr>
		                			<th class="align-middle">庫存量：</th>
		                			<td>
		                				<div class="input-group" style="width: 20%" >		                			
		                					<input type="text" name="total" class="form-control" required value="<%= (bpVO==null)? "" : bpVO.getStock()%>">
		                					<div class="invalid-tooltip">
	          									請輸入總金額     							
	        								</div>
		                				</div>
		                			</td>
		                		</tr>
		                		<tr>
		                			<th class="align-middle">價格：</th>
		                			<td>
		                				<div class="input-group" style="width: 20%" >		                			
		                					<input type="text" name="total" class="form-control" required value="<%= (bpVO==null)? "" : bpVO.getPrice()%>">
		                					<div class="invalid-tooltip">
	          									請輸入總金額     							
	        								</div>
		                				</div>
		                			</td>
		                		</tr>
		                		<tr>
							        <th class="align-middle">上傳圖片：</th>
							        <td>
							            <div class="input-group" style="width: 20%">
							                <input type="file" name="images" class="form-control" multiple onchange="previewImages(event)">
							            </div>
							            <div id="image-preview" style="margin-top: 10px;"></div>
							        </td>
							    </tr>
		                		<tr>
		                			<th class="align-middle">書籍介紹：</th>
		                			<td>
		                				<textarea name="note" class="form-control" style="width: 50%;"><c:out value="${bpVO == null ? '' : bpVO.getIntroductionContent()}" /></textarea>
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
		                	 	<a href="${pageContext.request.contextPath}/back-end/order/order.jsp">
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
	        format: 'YYYY-MM-DD',
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
	<script>
        $(document).ready(function() {
            // 添加新作者欄位
            $('#authorTableBody').on('click', '.add-author-btn', function() {
                const newAuthorRow = `
                    <tr>
                        <th class="align-middle">作者：</th>
                        <td>
                            <div class="input-group author-input" style="width: 80%">
                                <input type="text" name="author" class="form-control" required>
                                <div class="invalid-tooltip">
                                    請輸入作者名稱
                                </div>
                                <div class="input-group-append">
                                    <button type="button" class="btn btn-danger remove-author-btn">-</button>
                                </div>
                            </div>
                        </td>
                    </tr>
                `;
                $('#authorTableBody').append(newAuthorRow);
            });

            // 移除作者欄位
            $('#authorTableBody').on('click', '.remove-author-btn', function() {
                $(this).closest('tr').remove();
            });

            // 表單提交時的處理
            $('#bookForm').submit(function(event) {
                const authors = [];
                $('input[name="author"]').each(function() {
                    authors.push($(this).val());
                });
                console.log(authors); // 這裡你可以看到所有的作者名稱

                // 你可以選擇將作者名稱陣列序列化後提交到後端
                // 例如：使用hidden input來傳送
                $('<input>').attr({
                    type: 'hidden',
                    name: 'authors',
                    value: JSON.stringify(authors)
                }).appendTo('#bookForm');
            });
        });
    </script>
    
    <script>
		function previewImages(event) {
		    const previewContainer = document.getElementById('image-preview');
		    previewContainer.innerHTML = ""; // 清空預覽容器
		
		    const files = event.target.files;
		    if (files) {
		        Array.from(files).forEach(file => {
		            const reader = new FileReader();
		            reader.onload = function(e) {
		                const img = document.createElement('img');
		                img.src = e.target.result;
		                img.style.width = "100px";
		                img.style.marginRight = "10px";
		                img.style.marginBottom = "10px";
		                previewContainer.appendChild(img);
		            };
		            reader.readAsDataURL(file);
		        });
		    }
		}
	</script>

</body>
</html>