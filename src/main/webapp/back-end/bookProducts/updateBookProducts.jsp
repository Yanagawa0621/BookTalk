<%@page import="com.bookproducts.model.BookProductsVO"%>
<%@page import="com.publishinghouse.model.PublishingHouseService"%>
<%@page import="com.bookclass.model.BookClassService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bookclass.model.*"%>
<%@ page import="com.publishinghouse.model.*"%>
<%@ page import="com.author.model.*"%>
<%@ page import="java.util.*"%>

<%
BookProductsVO bpVO = (BookProductsVO) request.getAttribute("bpVO");
List<AuthorVO> authorVOLsit = bpVO.getAuthorVO();
session.setAttribute("authorVOLsit", authorVOLsit);
%>

<%
BookClassService bcSce = new BookClassService();
List<BookClassVO> bcList = bcSce.getAllBcNp();
session.setAttribute("bcList", bcList);
%>

<%
PublishingHouseService phSce = new PublishingHouseService();
List<PublishingHouseVO> phList = phSce.getAllPh();
session.setAttribute("phList", phList);
%>

<%
List<String> authorList = (List<String>) request.getAttribute("authorList");
%>

<%
String[] RemoveAuthor = (String[]) request.getAttribute("RemoveAuthor");
%>

<c:set var="removeAuthorString" value="" />
<c:forEach var="authorId" items="${RemoveAuthor}">
	<c:set var="removeAuthorString"
		value="${removeAuthorString}${authorId}, " />
</c:forEach>
<c:set var="removeAuthorString"
	value="${fn:substring(removeAuthorString, 0, fn:length(removeAuthorString)-2)}" />

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
							<h1 class="m-0">修改書籍</h1>
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
					<div class="card-header">
						<h3 class="card-title">修改書籍資訊</h3>
											<p>removeAuthorString 的值是: ${removeAuthorString}</p>
					</div>
					<!-- /.card-header -->
					<div class="card-body">
						<form id="bookForm" method="post"
							action="${pageContext.request.contextPath}/bookproducts.do"
							class="needs-validation" novalidate>
							<table id="newOrder" class="table table-bordered table-hover">
								<tbody>
									<tr>
										<th class="align-middle">書籍名稱：</th>
										<td>
											<div class="input-group" style="width: 50%">
												<input type="text" name="bookTitle" class="form-control"
													value="<%=(bpVO == null) ? "" : bpVO.getBookTitle()%>"
													required>
												<div class="invalid-tooltip">書籍名稱請勿空白</div>
											</div>
										</td>
									</tr>
									<tr>
										<th class="align-middle">ISBN：</th>
										<td>
											<div class="input-group" style="width: 50%">
												<input type="text" name="isbn" class="form-control"
													value="<%=(bpVO == null) ? "" : bpVO.getIsbn()%>" required>
												<div class="invalid-tooltip">ISBN請勿空白</div>
											</div>
										</td>
									</tr>
									<tr>
										<th class="align-middle">書籍類別：</th>
										<td>
											<div class="input-group" style="width: 20%">
												<select class="form-control" name="bookClassNumber">
													<c:forEach var="bcVO" items="${bcList}">
														<option value="${bcVO.classNumber}"
															${(bcVO.classNumber == bpVO.bcVO.classNumber)?'selected':''}>${bcVO.className}</option>
													</c:forEach>
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<th class="align-middle">書籍狀態：</th>
										<td>
											<div class="input-group" style="width: 20%">
												<select class="form-control" name="productStatus">
													<option value="0"
														${(0 == bpVO.productStatus)?'selected':''}>未上架</option>
													<option value="1"
														${(1 == bpVO.productStatus)?'selected':''}>上架</option>
													<option value="2"
														${(2 == bpVO.productStatus)?'selected':''}>下架</option>
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<th class="align-middle">上架日期：</th>
										<td>
											<div class="input-group" style="width: 20%">
												<input type="text" name="releaseDate" value="${bpVO.releaseDate}" class="form-control" readonly>
											</div>
										</td>
									</tr>
									<tr>
										<th class="align-middle">出版社：</th>
										<td>
											<div class="input-group" style="width: 20%">
												<select name="publishiingHouseCode" class="form-control">
													<c:forEach var="phVO" items="${phList}">
														<option value="${phVO.publishingHouseNumber}"
															<c:if test="${phVO.publishingHouseNumber == bpVO.phVO.publishingHouseNumber}">selected</c:if>>${phVO.name}</option>
													</c:forEach>
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<th class="align-middle">出版時間：</th>
										<td>
											<div class="input-group" style="width: 20%">
												<label for="reservationdatetime">選擇日期和時間</label>
												<div class="input-group date" id="reservationdatetime"
													data-target-input="nearest">
													<input type="text" name="publicationDate"
														class="form-control datetimepicker-input"
														data-target="#reservationdatetime" required
														value="<%=bpVO.getPublicationDate()%>" />
													<div class="input-group-append"
														data-target="#reservationdatetime"
														data-toggle="datetimepicker">
														<div class="input-group-text">
															<i class="far fa-clock"></i>
														</div>
													</div>
													<div class="invalid-tooltip">請選擇日期和時間</div>
												</div>
											</div>
										</td>
									</tr>
								<tbody id="authorTableBody">
									<c:if test="${empty bpVO.authorVO}">
										<tr>
											<th class="align-middle">作者：</th>
											<td>
												<div class="input-group author-input" style="width: 80%">
													<input type="text" name="author" class="form-control"
														required>
													<div class="invalid-tooltip">請輸入作者名稱</div>
													<div class="input-group-append">
														<button type="button"
															class="btn btn-success add-author-btn">+</button>
													</div>
												</div>
											</td>
										</tr>
									</c:if>
									<c:forEach var="authorVO" items="${bpVO.authorVO}"
										varStatus="status">
										<tr>
											<th class="align-middle">作者：</th>
											<td>
												<div class="input-group author-input" style="width: 80%">
													<input type="text" name="authorName" class="form-control"
														value="${authorVO.authorName != null ? authorVO.authorName : authorVO.englishName}"
														required disabled>
														
													<div class="invalid-tooltip">請輸入作者名稱</div>
													<div class="input-group-append">
														<c:choose>
															<c:when test="${status.first}">
																<button type="button"
																	class="btn btn-success add-author-btn">+</button>
															</c:when>
														</c:choose>
														<c:choose>
															<c:when
																test="${fn:contains(removeAuthorString, authorVO.authorNumber)}">
																<button type="button"
																	class="btn btn-success remove-author-button"
																	value="${authorVO.authorNumber}"
																	onclick="toggleRemoveAuthor(this)">恢復</button>
															</c:when>
															<c:otherwise>
																<button type="button"
																	class="btn btn-danger remove-author-button"
																	value="${authorVO.authorNumber}"
																	onclick="toggleRemoveAuthor(this)">刪除</button>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
									<c:if test="${not empty authorList}">
										<c:forEach var="author" items="${authorList}" varStatus="status">
										    <tr>
										        <th class="align-middle">作者：</th>
										        <td>
										            <div class="input-group author-input" style="width: 80%">
										                <input type="text" name="author" class="form-control" value="${author}" required>
										                <div class="invalid-tooltip">請輸入作者名稱</div>
										                <div class="input-group-append">
										                    <c:choose>
										                        <c:when test="${status.first}">
										                            <button type="button" class="btn btn-success add-author-btn">+</button>
										                        </c:when>
										                        <c:otherwise>
										                            <button type="button" class="btn btn-danger remove-author-btn">-</button>
										                        </c:otherwise>
										                    </c:choose>
										                </div>
										            </div>
										        </td>
										    </tr>
										</c:forEach>
									</c:if>
								</tbody>
								<tr>
									<th class="align-middle">庫存量：</th>
									<td>
										<div class="input-group" style="width: 20%">
											<input type="text" name="stock" class="form-control" required
												value="${bpVO.stock}">
											<div class="invalid-tooltip">請輸入總金額</div>
										</div>
									</td>
								</tr>
								<tr>
									<th class="align-middle">價格：</th>
									<td>
										<div class="input-group" style="width: 20%">
											<input type="text" name="price" class="form-control" required
												value="${bpVO.price}">
											<div class="invalid-tooltip">請輸入總金額</div>
										</div>
									</td>
								</tr>

								<tr>
									<th class="align-middle">書籍介紹：</th>
									<td><textarea name="introductionContent"
											class="form-control" style="width: 50%;"><c:out
												value="${bpVO.introductionContent}" /></textarea></td>
								</tr>
								</tbody>
							</table>
							<div class="row">
								<div class="col-md-1 offset-md-10">
									<!-- 隱藏的集合，用來存儲被刪除的作者ID -->
									<input type="hidden" name="RemoveAuthor"
										id="removeAuthorCollection" value="${removeAuthorString}">

									<input type="hidden" name="bookNumber"
										value="${bpVO.bookNumber}"> <input type="hidden"
										name="action" value="update">
									<button type="submit"
										class="btn btn-block bg-gradient-primary btn">送出修改</button>
								</div>
								<div class="col-md-1">
									<a
										href="${pageContext.request.contextPath}/back-end/bookProducts/bookProducts.jsp">
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
    let authorStates = {}; // 用來管理每個作者的狀態
    
    // 初始化作者狀態
    function initializeAuthorStates(removeAuthorString) {
        const removeAuthors = removeAuthorString.split(',');
        removeAuthors.forEach(authorId => {
            authorStates[authorId] = true; // 將刪除的作者設置為 true
        });
    }
    
    // 切換刪除狀態
    function toggleRemoveAuthor(button) {
        const authorId = button.value;
        const inputGroup = button.closest('.input-group');
        const authorInput = inputGroup.querySelector('input[name="authorName"]');
    
        if (authorStates[authorId]) {
            // 如果已經被標記為刪除，取消標記
            authorStates[authorId] = false;
//             authorInput.disabled = false;
            button.textContent = '刪除';
            button.classList.remove('btn-success');
            button.classList.add('btn-danger');
        } else {
            // 如果未被標記為刪除，添加標記
            authorStates[authorId] = true;
//             authorInput.disabled = true;
            button.textContent = '恢復';
            button.classList.remove('btn-danger');
            button.classList.add('btn-success');
        }
    
        // 更新隱藏的集合輸入框的值
        updateRemoveAuthorCollection();
    }
    
    // 更新隱藏的集合輸入框
    function updateRemoveAuthorCollection() {
        const removeAuthorSet = new Set();
        for (const authorId in authorStates) {
            if (authorStates[authorId]) {
                removeAuthorSet.add(authorId);
            }
        }
        document.getElementById('removeAuthorCollection').value = Array.from(removeAuthorSet).join(',');
    }
    
 // 表單載入時初始化
    document.addEventListener('DOMContentLoaded', function() {
        const removeAuthorString = '${removeAuthorString}'; // 從後端取得的刪除作者字串
        initializeAuthorStates(removeAuthorString);
        // 將初始化的 removeAuthorString 設置到隱藏的集合輸入框
        document.getElementById('removeAuthorCollection').value = removeAuthorString;
    });
</script>
</body>
</html>