<%@ page import="com.qa.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.YearMonth"%>

<%
QaService qasce = new QaService();
List<QaVO> qalist = qasce.getAll();
pageContext.setAttribute("qalist", qalist);
%>
<!doctype html>
<html class="no-js" lang="en">

<!-- head -->
<%@include file="/front-end/component/head.jsp" %>

<body>

	<!--header area start-->
	<!--offcanvas menu area start-->

	<!--offcanvas menu area end-->
	<%@include file="/front-end/component/menu.jsp" %>
	<!--header area end-->


	<!--breadcrumbs area start-->
	<div class="breadcrumbs_area">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="breadcrumb_content">
						<h3>常見問題Q&A</h3>
						<ul>
							<li><a href="${pageContext.request.contextPath}/index.jsp">首頁</a></li>
							<li style="padding: 0;">客服相關</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->

	<!--qa  area start-->
	<ul class="qalist">
	 <c:forEach var="qaVO" items="${qalist}">
	  <li>
	    <a class="link_title" href="#">
	      <button type="button" class="switch_btn">
	        <span class="-plus">+</span>
	        <span class="-minus">-</span>
	      </button>
	      Q${qaVO.questionNo}. ${qaVO.question}
	    </a>
	    
	    <div class="inner_block">
	      A${qaVO.questionNo}. ${qaVO.answer}
	    </div>
	  </li>
	 </c:forEach>
	</ul>
	<!--qa  area end-->

	<!--footer area start-->
    <%@include file="/front-end/component/footer.jsp" %>
    <!--footer area end-->

	<!-- modal area start-->
	<div class="modal fade" id="modal_box" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true"><i class="ion-android-close"></i></span>
				</button>
				<div class="modal_body">
				</div>
			</div>
		</div>
	</div>
	<!-- modal area end-->


	<!-- JS
============================================ -->
<%@include file="/front-end/component/script.jsp" %>

<script>
	$("a.link_title").on("click", function(e){
	  e.preventDefault();
	  $(this).closest("li").toggleClass("-on");
	  $(this).closest("li").find("div.inner_block").slideToggle();
	});
</script>

</body>

</html>