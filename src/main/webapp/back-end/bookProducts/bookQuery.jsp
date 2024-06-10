<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bookproducts.model.*"%>

<%
	List<BookProductsVO> list= (List<BookProductsVO>) request.getAttribute("list");
	pageContext.setAttribute("list",list);
%>
    
<!DOCTYPE html>
<html>
<!-- head -->
<style>
	th,tr {
	  white-space: nowrap; /* 讓文字不換行 */
	}

    .fixed-size-form {
        width: 300px; /* 固定寬度 */
    }
     .form-row { 
         margin-bottom: 10px; /* 行間距 10px */ 
     } 
	
	.input-group {
        margin-bottom: 20px; /* 調整 input-group 的下邊距 */
    }
    
    table {
	    table-layout: fixed;
	    width: 100%;
	}
    
    th, td {
        white-space: nowrap; /* 禁止換行 */
        overflow: hidden; /* 超出部分隱藏 */
        text-overflow: ellipsis; /* 超出部分用...表示 */
    }
</style>

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
							<h1 class="m-0">書籍列表</h1>
						</div>	<!-- /.col -->								
					</div>	<!-- /.row -->					
				</div>	<!-- /.container-fluid -->				
			</div>	<!-- /.content-header -->
			
			
			<!-- Main content -->
			<div class="content">
				<div class="row">
					<div class= "g-col-6 offset-md-1">
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
				

				<div class="container">
				    <div class="row gy-5 gx-5">
				        <!-- 第一個表單 -->
				        <div class="col-md-4 d-flex justify-content-center mb-2">
				            <form method="post" action="${pageContext.request.contextPath}/bookproducts.do" class="needs-validation fixed-size-form" novalidate>
				                <label for="orderInput">搜尋書籍名稱</label>
				                <div class="input-group">
				                    <input type="search" name="Keywords" class="form-control" placeholder="搜尋書籍名稱" required>
				                    <input type="hidden" name="searchMain" value="bookTitle">
				                    <input type="hidden" name="action" value="book_search">
				                    <div class="invalid-tooltip">
				                        請輸入書籍名稱
				                    </div>
				                    <div class="input-group-append">
				                        <button type="submit" class="btn btn-default">
				                            <i class="fa fa-search"></i>
				                        </button>
				                    </div>
				                </div>
				            </form>
				        </div>
				
				        <!-- 第二個表單 -->
				        <div class="col-md-4 d-flex justify-content-center mb-2">
				            <form method="post" action="${pageContext.request.contextPath}/bookproducts.do" class="needs-validation fixed-size-form" novalidate>
				                <label for="orderInput">搜尋國際書碼(ISBN)</label>
				                <div class="input-group">
				                    <input type="search" name="Keywords" class="form-control" placeholder="搜尋書籍名稱" required>
				                    <input type="hidden" name="searchMain" value="isbn">
				                    <input type="hidden" name="action" value="book_search">
				                    <div class="invalid-tooltip">
				                        請輸入國際書碼(ISBN)
				                    </div>
				                    <div class="input-group-append">
				                        <button type="submit" class="btn btn-default">
				                            <i class="fa fa-search"></i>
				                        </button>
				                    </div>
				                </div>
				            </form>
				        </div>
				
				        <!-- 第三個表單 -->
				        <div class="col-md-4 d-flex justify-content-center mb-2">
				            <form method="post" action="${pageContext.request.contextPath}/bookproducts.do" class="needs-validation fixed-size-form" novalidate>
				                <label for="orderInput">搜尋書籍編號</label>
				                <div class="input-group">
				                    <input type="search" name="Keywords" class="form-control" placeholder="搜尋書籍名稱" required>
				                    <input type="hidden" name="searchMain" value="bookNumber">
				                    <input type="hidden" name="action" value="book_search">
				                    <div class="invalid-tooltip">
				                        請輸入書籍編號
				                    </div>
				                    <div class="input-group-append">
				                        <button type="submit" class="btn btn-default">
				                            <i class="fa fa-search"></i>
				                        </button>
				                    </div>
				                </div>
				            </form>
				        </div>
				
				        <!-- 第四個表單 -->
				        <div class="col-md-4 d-flex justify-content-center mb-2">
				            <form method="post" action="${pageContext.request.contextPath}/bookproducts.do" class="fixed-size-form">
				                <label for="orderStatusChoice">請選擇書籍狀態</label>
				                <div class="input-group">
				                    <select name="Keywords" class="form-control">
				                        <option value="1">上架</option>
				                        <option value="2">下架</option>
				                        <option value="0">未上架</option>
				                    </select>
				                    <input type="hidden" name="searchMain" value="productStatus">
				                    <input type="hidden" name="action" value="book_search">
				                    <div class="input-group-append">
				                        <button type="submit" class="btn btn-default">
				                            <i class="fa fa-search"></i>
				                        </button>
				                    </div>
				                </div>
				            </form>
				        </div>
				
				        <!-- 全部書籍按鈕 -->
				        <div class="col-md-4 d-flex justify-content-center align-self-end">
				            <a href="${pageContext.request.contextPath}/back-end/bookProducts/bookProducts.jsp">
				                <button type="button" class="btn btn-block bg-gradient-success">全部書籍</button>
				            </a>
				        </div>
				        
				        <!-- 新增書籍按鈕 -->
				        <div class="col-md-4 d-flex justify-content-center align-self-end">
				            <a href="${pageContext.request.contextPath}/back-end/order/addOrder.jsp">
				                <button type="button" class="btn btn-block bg-gradient-success">新增書籍</button>
				            </a>
				        </div>
				    </div>
				</div>
	
				<br>
				<div class="card">
	              <div class="card-header">
	                <h3 class="card-title">所有書籍</h3>
	              </div>	<!-- /.card-header -->
	              <div class="card-body">
	                <table id="orderlist" class="table table-bordered table-hover">
	                  <thead>
		                  <tr>
		                    <th style="width: 72px;">書籍編號</th>
		                    <th style="width: 215px;">書籍名稱</th>
		                    <th style="width: 111px;">ISBN</th>
		                    <th style="width: 111px;">書籍類別</th>
		                    <th style="width: 81px;">書籍狀態</th>
		                    <th style="width: 91px;">發布時間</th>		                    
		                    <th style="width: 91px;">出版社</th>
		                    <th>出版時間</th>
		                    <th>數量</th>
		                    <th>價格</th>
		                    <th></th>
		                  </tr>
	                  </thead>
	                  <tbody>
		                  <c:forEach var="bpVO" items="${list}">
			                  <tr>
			                    <td>${bpVO.bookNumber}</td>
			                    <td style="width: 150px;" title="${bpVO.bookTitle}">${bpVO.bookTitle}</td>
			                    <td>${bpVO.isbn}</td>	                    
			                    <td>${bpVO.bcVO.className}</td>
			                    <td>
			                    	<c:if test = "${bpVO.productStatus == 0}">
			                    		未上架
			                    	</c:if>
			                    	<c:if test = "${bpVO.productStatus == 1}">
			                    		上架
			                    	</c:if>
			                    	<c:if test = "${bpVO.productStatus == 2}">
			                    		下架
			                    	</c:if>
			                    </td>
			                    <td>${bpVO.releaseDate}</td>
			                    <td title="${bpVO.phVO.name}">${bpVO.phVO.name}</td>
			                    <td>${bpVO.publicationDate}</td>
			                    <td>${bpVO.stock}</td>
			                    <td>${bpVO.price}</td>
			                    <td>
			                    	<form method="post" action="${pageContext.request.contextPath}/bookproducts.do">
			                    		<button type="submit" class="btn btn-block bg-gradient-primary btn-sm">詳細內容和修改</button>
									    <input type="hidden" name="bookNumber"  value="${bpVO.bookNumber}">
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
