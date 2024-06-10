<%@ page import="com.qa.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*"%>

<%
QaService qasce = new QaService();
List<QaVO> qalist = (List<QaVO>) request.getAttribute("qalist");
if (qalist == null) {
    qalist = qasce.getAll();
}
pageContext.setAttribute("qalist", qalist);
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
							<h1 class="m-0">常見問題Q&A列表</h1>
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
					<!-- 第一個搜尋表單 -->
					<div class= "col-md-3 offset-md-1">
						<form method="post" action="${pageContext.request.contextPath}/qaBack.do" class="needs-validation" novalidate>
							<label for="questionNo">Q&A編號搜尋</label>
							<div class="input-group">		
								<input type="search" id="questionNo" name="questionNo" class="form-control" placeholder="搜尋Q&A編號" required>
								<input type="hidden" name="action" value="keywords">	
								<div class="invalid-tooltip">
          							請輸入Q&A編號         							
        						</div>
        						<button type="submit" class="btn btn-default">
								<i class="fa fa-search"></i>
								</button>
							</div>				
						</form>	
					</div>	
					<!-- 第二個搜尋表單 -->
					<div class= "col-md-3 offset-md-1">
						<form method="post" action="${pageContext.request.contextPath}/qaBack.do" class="needs-validation" novalidate>
							<label for="question">問題名稱搜尋</label>
							<div class="input-group">		
								<input type="search" id="question" name="question" class="form-control" placeholder="搜尋問題名稱" required>
								<input type="hidden" name="action" value="keywords">	
								<div class="invalid-tooltip">
          							請輸入問題名稱         							
        						</div>
        						<button type="submit" class="btn btn-default">
								<i class="fa fa-search"></i>
								</button>
							</div>				
						</form>	
					</div>
					<!-- 第三個搜尋表單 -->
					<div class= "col-md-3 offset-md-1">
						<form method="post" action="${pageContext.request.contextPath}/qaBack.do" class="needs-validation" novalidate>
							<label for="status">狀態搜尋</label>
							<div class="input-group">		
								<select id="way" name="way" class="form-control" required>
									<option selected hidden disabled value="">搜尋狀態類型</option>
									<option value="Y">Q&A正在頁面上</option>
									<option value="N">Q&A已下架頁面</option>
								</select>
								<input type="hidden" name="action" value="keywords">	
								<div class="invalid-tooltip">
          							請輸入狀態名稱         							
        						</div>
        						<button type="submit" class="btn btn-default">
								<i class="fa fa-search"></i>
								</button>
							</div>				
						</form>	
					</div>	
					
					<!-- 新增Q&A問題 -->
					<div class= "col-md-4 d-flex justify-content-center align-self-end mt-3"">
						<a href="${pageContext.request.contextPath}/back-end/qa/addQa.jsp">
							<button type="submit" class="btn btn-block bg-gradient-success">新增Q&A問題</button>
						</a>						
					</div>
				</div> 
				
				<br>
				<div class="card">
	              <div class="card-header">
	                <h3 class="card-title">所有問題</h3>
	              </div>	<!-- /.card-header -->
	              <div class="card-body">
	                <table id="qalist" class="table table-bordered table-hover">
	                  <thead>
		                  <tr>
		                    <th style="width: 150px;">Q&A編號</th>
		                    <th style="width: 250px;">問題名稱</th>
		                    <th style="width: 50px;">狀態</th>
		                    <th style="width: 50px;">修改</th>
		                  </tr>
	                  </thead>
	                  <tbody>
		                  <c:forEach var="qaVO" items="${qalist}">
			                  <tr>
			                    <td>${qaVO.questionNo}</td>
			                    <td>${qaVO.question}</td>
								<td>
								<c:choose>
								    <c:when test="${qaVO.way == 'Y'}">
								       Q&A正在頁面上
								    </c:when>
								    <c:when test="${qaVO.way == 'N'}">
								       Q&A已下架頁面
								    </c:when>
								</c:choose>
								</td>
			                    <td>
			                    	<form method="post" action="${pageContext.request.contextPath}/qaBack.do">
			                    		<button type="submit" class="btn btn-block bg-gradient-primary btn-sm">修改</button>
									    <input type="hidden" name="qaVOId"  value="${qaVO.questionNo}">
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
			$('#qalist').DataTable({
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
		
		$("#bt").on("click", function() {
	    	 if(!valid()){
	    		 alert("Q&A編號請輸入數字");
	    		 return;
	    	 }else{
		    	 $('#questionNo_').val($('#questionNo').val());
		    	 $('#email_').val($('#email').val());
		    	 $('#problemType_').val($('#problemType').val());
		    	 $('#form1').submit();
	    	 }	    	 
	   	});
	     
	     function valid(){
	    	var questionNo = $('#questionNo').val();
	    	var result = true;
   	 	//訂單號碼驗證
   	 	if(questionNo != ''){
	    	  	var reg =  /^(0|[1-9]\d*)$/;
	    	  	result = reg.test(questionNo);
   	 	}
   	 	return result;
		}
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
