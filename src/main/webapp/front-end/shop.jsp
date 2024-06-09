<%@page import="com.bookclass.model.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.bookproducts.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.YearMonth"%>

<%
BookProductsService bpsce = new BookProductsService();
List<BookProductsVO> list = bpsce.getAllBp();
pageContext.setAttribute("list", list);
%>

<%
LocalDate date = LocalDate.now();
int year = date.getYear();
int month = date.getMonthValue();

request.setAttribute("currentYear", year);
request.setAttribute("currentMonth", month);
%>

<%
BookClassService bcSce=new BookClassService();
List<BookClassVO> bcList= bcSce.getAllBc();
pageContext.setAttribute("bcList", bcList);
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
						<h3>商城</h3>
						<ul>
							<li><a href="${pageContext.request.contextPath}/index.jsp">首頁</a></li>
							<li style="padding: 0;">商城</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->

	<!--shop  area start-->
	<div class="shop_area shop_reverse mt-100 mb-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-12">
					<!--sidebar widget start-->
					<aside class="sidebar_widget">
						<div class="widget_inner">
							<div class="widget_list widget_filter">
								<h3>依價格篩選</h3>
								<form action="#">
									<div id="slider-range"></div>
									<button type="submit">篩選</button>
									<input type="text" name="text" id="amount"
										style="width: 120px;" />

								</form>
							</div>
							<div class="widget_list widget_color">
								<h3>依書籍類別</h3>
								<ul>
								<c:forEach var="bcVO" items="${bcList}">
									<c:set var="count" value="0"/>
									<c:forEach var="mybpVO" items="${bcVO.bpVO}">
										<c:if test="${mybpVO.productStatus == 1}">
											<c:set var="count" value="${count + 1}" />
										</c:if>
									</c:forEach>
									<li class="class_search">
										<FORM METHOD="GET"  ACTION="${pageContext.request.contextPath}/bookClass.do" >
											<input type="submit" style="border: none; background-color: #ffffff;" value="${bcVO.className}"><span>(${count})</span>
											<input type="hidden" name="classNumber"  value="${bcVO.classNumber}">
											<input type="hidden" name="action" value="ClassNumberSearch">
										</FORM>
									</li>
								</c:forEach>
								</ul>
							</div>
						</div>
					</aside>
					<!--sidebar widget end-->
				</div>
				<div class="col-lg-9 col-md-12">
					<!--shop wrapper start-->
					<!--shop toolbar start-->
					<div class="shop_toolbar_wrapper">
						<div class="shop_toolbar_btn">

							<button data-role="grid_3" type="button"
								class="active btn-grid-3" data-toggle="tooltip" title="3"></button>
							<button data-role="grid_4" type="button" class=" btn-grid-4"
								data-toggle="tooltip" title="4"></button>
						</div>
						<div class=" niceselect_option">
							
						</div>
						<div class="page_amount">
							<%@include file="/front-end/component/page1.file" %>
						</div>
					</div>
					<!--shop toolbar end-->
					
					<div class="row shop_wrapper">
						<c:forEach var="bpVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
						<c:if test="${bpVO.productStatus==1}">
							<div class="col-lg-4 col-md-4 col-sm-6 col-12 ">
								<article class="single_product">
									<figure>
										<div class="product_thumb">
											<div class="label_product">

												<c:if test="${fn:substring(bpVO.releaseDate, 0, 4)==requestScope.currentYear && fn:substring(bpVO.releaseDate, 5, 7)==requestScope.currentMonth}">
													<span class="label_new">new</span>
												</c:if>
											</div>
											<a class="primary_img" href="${pageContext.request.contextPath}/bookproducts.do?bookNumber=${bpVO.bookNumber}&action=single_product_page" id="submitLink_${bpVO.bookNumber}" target="_blank">
									            <img src="<%=request.getContextPath()%>/bap/Img?bookNumber=${bpVO.bookNumber}" alt="預覽失敗">
									        </a>
											<div class="action_links">
												<ul>
													<li class="quick_button">詳細資訊<a href="#"
														data-toggle="modal" data-target="#modal_box"
														title="quick view"> <input type="hidden" name="bookNumber" value="${bpVO.bookNumber}"><i class="icon icon-Eye"></i></a>
													</li>
												</ul>
											</div>
										</div>
										<div class="product_content grid_content">
											<div class="product_rating">
												<ul>
												<c:if test="${bpVO.ratingScoreAvg>=0}">
													<li><a href="javascript:void(0);" onclick="document.getElementById('bookForm_${bpVO.bookNumber}').submit();"><i class="icon icon-Star"></i></a></li>
												</c:if>
												<c:if test="${bpVO.ratingScoreAvg>=1.5}">
													<li><a href="javascript:void(0);" onclick="document.getElementById('bookForm_${bpVO.bookNumber}').submit();"><i class="icon icon-Star"></i></a></li>
												</c:if>
												<c:if test="${bpVO.ratingScoreAvg>=2.5}">
													<li><a href="javascript:void(0);" onclick="document.getElementById('bookForm_${bpVO.bookNumber}').submit();"><i class="icon icon-Star"></i></a></li>
												</c:if>
												<c:if test="${bpVO.ratingScoreAvg>=3.5}">
													<li><a href="javascript:void(0);" onclick="document.getElementById('bookForm_${bpVO.bookNumber}').submit();"><i class="icon icon-Star"></i></a></li>
												</c:if>
												<c:if test="${bpVO.ratingScoreAvg>=4.5}">
													<li><a href="javascript:void(0);" onclick="document.getElementById('bookForm_${bpVO.bookNumber}').submit();"><i class="icon icon-Star"></i></a></li>
												</c:if>
												</ul>
											</div>
											<FORM METHOD="GET"  ACTION="${pageContext.request.contextPath}/bookproducts.do" id="bookForm_${bpVO.bookNumber}">
											<h4 class="product_name">
												<input type="hidden" name="bookNumber" value="${bpVO.bookNumber}">
												<input type="hidden" name="action" value="single_product_page">
												<a href="${pageContext.request.contextPath}/bookproducts.do?bookNumber=${bpVO.bookNumber}&action=single_product_page" id="submitLink_${bpVO.bookNumber}" style="border: none; background-color: #ffffff; width: 100%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; display: inline-block; text-decoration: none; color: inherit;">${bpVO.bookTitle}</a>
											</h4>
											</FORM>
											<div class="price_box">
												<span class="current_price">NT$ ${bpVO.price}</span>
											</div>
											<div class="add_to_cart">
												<a class="primary_img" href="${pageContext.request.contextPath}/bookproducts.do?bookNumber=${bpVO.bookNumber}&action=single_product_page" id="submitLink_${bpVO.bookNumber}"><span style="font-weight: bold;">商品詳細資訊</span></a>
											</div>
										</div>
									</figure>
								</article>
							</div>
							</c:if>
						</c:forEach>
						
					</div>
					<div class="shop_toolbar t_bottom">
						<%@include file="/front-end/component/page2.file" %>
					</div>
					
					<!--shop toolbar end-->
					<!--shop wrapper end-->
				</div>

			</div>
		</div>
	</div>
	<!--shop  area end-->

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
		$(document).ready(function() {
		    $('.quick_button').find('a').on('click', function(e) {
		    	
		        e.preventDefault();
		        let bookNumber = $(this).find('input[name="bookNumber"]').val();
		        $.ajax({
		            url: '${pageContext.request.contextPath}/bookproducts.do?action=product_page_ajax',
		            type: 'GET',
		            data: { bookNumber: bookNumber },
		            success: function(response) {
					let bookNumber=response.bookNumber;
					let bookClassName=response.bookClassName;
					let publishingHouseName=response.publishingHouseName;
					let productStatus=response.productStatus;
					let bookTitle=response.bookTitle;
					let isbn=response.isbn;
					let price=response.price;
					let publicationDate=response.publicationDate;
					let stock=response.stock;
					let introductionContent=response.introductionContent;
					let releaseDate=response.releaseDate;
					let img=response.img[0];
					let ratingScoreAvg=response.ratingScoreAvg;
// 					console.log(ratingScoreAvg)
					let AuthorVO=response.AuthorVO;
					
					let contextPath = '<%=request.getContextPath()%>';
			        let imgUrl = contextPath + '/bap/Img?bookNumber=' + bookNumber;
					
					let htmlContent = ``
						htmlContent +=`<div class="container">`
						    htmlContent +=`<div class="row">`
                                htmlContent +=`<div class="col-lg-5 col-md-5 col-sm-12">`
						            htmlContent +=`<div class="modal_tab">`
						                htmlContent +=`<div class="tab-content product-details-large">`
						                    htmlContent +=`<div class="tab-pane fade show active" id="tab1" role="tabpanel" >`
                                                htmlContent +=`<div class="modal_tab_img">`
                                                    htmlContent +=`<img src="`+imgUrl+`" alt=""></a>`
                                                htmlContent +=`</div>`
                                            htmlContent +=`</div>`
						                htmlContent +=`</div>`
						            htmlContent +=`</div>`
						        htmlContent +=`</div>`
						        htmlContent +=`<div class="col-lg-7 col-md-7 col-sm-12">`
						            htmlContent +=`	<div class="modal_right">`
						                htmlContent +=`<div class="modal_title mb-10">`
						                    htmlContent +=`<h2>`+bookTitle+`</h2>`
						                htmlContent +=`</div>`
						                htmlContent +=`<div class="modal_price mb-10">`
						                    htmlContent +=`<span class="new_price">NT$ `+price+`</span>`
						                htmlContent +=`</div>`
						                	htmlContent +=`<div class="product_rating">`
						                		htmlContent +=`<h2 style="font-size: 20px; font-weight:bold;">評分</h2><ul>`
						                		if(ratingScoreAvg!=null){
													if(ratingScoreAvg>=0){
														htmlContent +=`<li><a href="#"><i class="icon icon-Star"></i></a></li>`
			            							}
													if(ratingScoreAvg>=1.5){
														htmlContent +=`<li><a href="#"><i class="icon icon-Star"></i></a></li>`
													}
													if(ratingScoreAvg>=2.5){
														htmlContent +=`<li><a href="#"><i class="icon icon-Star"></i></a></li>`
													}
													if(ratingScoreAvg>=3.5){
														htmlContent +=`<li><a href="#"><i class="icon icon-Star"></i></a></li>`
													}
													if(ratingScoreAvg>=4.5){
														htmlContent +=`<li><a href="#"><i class="icon icon-Star"></i></a></li>`
													}
						                		}else {htmlContent +=`<p style="font-size: 16px; color: grey;">尚無評分<p>`}
												htmlContent +=`</ul>`
											htmlContent +=`</div>`
						                htmlContent +=`<div class="variants_selects">`
						                    htmlContent +=`<div class="variants_size">`
						                        htmlContent +=`<h2>出版社:`+publishingHouseName+`</h2>`
						                        htmlContent +=`<h2>出版日期:`+publicationDate+`</h2>`
						                        htmlContent +=`<h2>書籍分類:`+bookClassName+`</h2>`
						                        AuthorVO.forEach(function(imgUrl, index){
						                        	htmlContent +=`<h2>作者:`+imgUrl+`</h2>`
						                        });
						                    htmlContent +=`</div>`
						                    htmlContent +=`<div class="variants_color">`
						                    htmlContent +=`</div>`
						                    htmlContent +=`<div class="modal_add_to_cart">`
						                        htmlContent +=`<form action="#">`
                                                    htmlContent +=`<input min="1" max="`+stock+`" step="1" value="1" type="number">`
                                                    htmlContent +=`<button type="button" class="shop_add_cart">加入購物車</button>`
						                        htmlContent +=`</form>`
						                        	htmlContent +=`<div class="modal_description mb-15">`
									                	htmlContent +=`<br>`
									                	htmlContent +=`<h3>內容介紹:</h3>`
									                    htmlContent +=`<p>`+introductionContent+`</p>`
									                htmlContent +=`</div>`
						                    htmlContent +=`</div>`
						                htmlContent +=`</div>`
						            
						        htmlContent +=`</div>`
						    htmlContent +=`</div>`
						htmlContent +=`</div>`
                    htmlContent +=`</div>`
				    $('#modal_box .modal_body').html(htmlContent);
		            $('#modal_box').modal('show');
		            },
		            error: function(xhr, status, error) {
		                console.error('Ajax请求失败:', error);
		            }
		        });
		    })
		});
	</script>
</body>

</html>