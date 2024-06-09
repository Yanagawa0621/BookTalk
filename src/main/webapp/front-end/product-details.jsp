<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.bookproducts.model.*"%>

<%
BookProductsVO bpVO = (BookProductsVO) request.getAttribute("bpVO");
%>
<%
List<BookProductsVO> list = (List<BookProductsVO>) request.getAttribute("list");
%>

<!doctype html>
<html class="no-js" lang="en">


<%@include file="/front-end/component/head.jsp"%>


<body>

	<!--header area start-->

	<!--offcanvas menu area start-->
	<!--offcanvas menu area end-->
	<%@include file="/front-end/component/menu.jsp"%>
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
							<li><a
								href="${pageContext.request.contextPath}/front-end/shop.jsp">商城</a></li>
							<li>${bpVO.bookTitle}</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs area end-->

	<!--product details start-->
	<div class="product_details mt-100 mb-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product-details-tab">
						<div id="img-1" class="zoomWrapper single-zoom">
							<a href="#"> <img id="zoom1"
								src="data:image/jpeg;base64, ${bpVO.img[0]}"
								data-zoom-image="${bpVO.bookNumber}" alt="big-1">
							</a>
						</div>
						<div class="single-zoom-thumb">
							<ul class="s-tab-zoom owl-carousel single-product-active"
								id="gallery_01">
								<c:forEach var="img" items="${bpVO.img}">
									<li><a href="#" class="elevatezoom-gallery active"
										data-update="" data-image=""
										data-zoom-image=""> <img
											src="data:image/jpeg;base64, ${img}" alt="zo-th-1" />
									</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="product_d_right">
						<form action="#">

							<h1 style="font-weight: bold;">${bpVO.bookTitle}</h1>
							<div class="product_rating">
								<ul>
									<c:if test="${bpVO.ratingScoreAvg>=0}">
										<li><a href="#"><i class="icon icon-Star"></i></a></li>
									</c:if>

									<c:if test="${empty bpVO.ratingScoreAvg}">
										<li>尚無評論</li>
									</c:if>

									<c:if test="${bpVO.ratingScoreAvg>=1.5}">
										<li><a href="#"><i class="icon icon-Star"></i></a></li>
									</c:if>
									<c:if test="${bpVO.ratingScoreAvg>=2.5}">
										<li><a href="#"><i class="icon icon-Star"></i></a></li>
									</c:if>
									<c:if test="${bpVO.ratingScoreAvg>=3.5}">
										<li><a href="#"><i class="icon icon-Star"></i></a></li>
									</c:if>
									<c:if test="${bpVO.ratingScoreAvg>=4.5}">
										<li><a href="#"><i class="icon icon-Star"></i></a></li>
									</c:if>
									<li class="review">(評分)</li>
								</ul>
							</div>
							<div class="product_meta">
								<span style="font-weight: bold;">書籍類別:<a href="#"
									style="font-weight: bold; margin: 5px; display: inline-block;">${bpVO.bcVO.className}</a></span>
								<br>

								<c:forEach var="authorVO" items="${bpVO.authorVO}">
									<c:if test="${not empty authorVO.authorName}">
										<span style="font-weight: bold;">作者:&nbsp;&nbsp;${authorVO.authorName}</span>
										<br>
									</c:if>
									<c:if test="${empty authorVO.authorName}">
										<span style="font-weight: bold;">作者:&nbsp;&nbsp;${authorVO.englishName}</span>
										<br>
									</c:if>
								</c:forEach>
								<span style="font-weight: bold;">出版社:&nbsp;&nbsp;${bpVO.phVO.name}</span>
								<br> <span style="font-weight: bold;">出版日期:&nbsp;&nbsp;${bpVO.publicationDate}</span>
								<br> <span style="font-weight: bold;">國是書碼(ISBN):&nbsp;&nbsp;${bpVO.isbn}</span>
							</div>

							<div class="price_box">
								<span class="current_price">NT$ ${bpVO.price}</span>
							</div>

							<div class="product_variant quantity">
								<label>quantity</label> <input min="1" max="${bpVO.stock}" value="1"
									type="number">
								<button type="button" class="button" id="detail_add_cart">加入購物車</button>
							</div>

							<div class="product_desc">
								<h2>書籍介紹</h2>
								<p>${bpVO.introductionContent}</p>
							</div>



						</form>
						<div class="priduct_social">
							<ul>
								<li><a class="facebook" href="#" title="facebook"><i
										class="fa fa-facebook"></i> Like</a></li>
								<li><a class="twitter" href="#" title="twitter"><i
										class="fa fa-twitter"></i> tweet</a></li>
								<li><a class="pinterest" href="#" title="pinterest"><i
										class="fa fa-pinterest"></i> save</a></li>
								<li><a class="google-plus" href="#" title="google +"><i
										class="fa fa-google-plus"></i> share</a></li>
								<li><a class="linkedin" href="#" title="linkedin"><i
										class="fa fa-linkedin"></i> linked</a></li>
							</ul>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!--product details end-->

	<!--product info start-->
	<div class="product_d_info mb-90">
		<div class="container">
			<div class="row">
				<div class="col-12"></div>
			</div>
		</div>
	</div>
	<!--product info end-->

	<!--product area start-->
	<section class="product_area related_products">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section_title">
						<h2>
							<span>同類型的書籍</span>
						</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="product_carousel product_column4 owl-carousel">
					<c:if test="${not empty list}">
						<c:forEach var="bpVO" items="${list}">

							<div class="col-lg-3">
								<article class="single_product">
									<figure>
										<figure>
											<div class="product_thumb">
												<div class="label_product">

													<c:if
														test="${fn:substring(bpVO.releaseDate, 0, 4)==requestScope.currentYear && fn:substring(bpVO.releaseDate, 5, 7)==requestScope.currentMonth}">
														<span class="label_new">new</span>
													</c:if>
												</div>
												<a class="primary_img"
													href="${pageContext.request.contextPath}/bookproducts.do?bookNumber=${bpVO.bookNumber}&action=single_product_page"
													id="submitLink_${bpVO.bookNumber}"> <img
													src="<%=request.getContextPath()%>/bap/Img?bookNumber=${bpVO.bookNumber}"
													alt="預覽失敗">
												</a>
												<div class="action_links">
													<ul>
														<li class="quick_button">詳細資訊<a href="#"
															data-toggle="modal" data-target="#modal_box"
															title="quick view"> <input type="hidden"
																name="bookNumber" value="${bpVO.bookNumber}"><i
																class="icon icon-Eye"></i></a>
														</li>
													</ul>
												</div>
											</div>
											<div class="product_content grid_content">
												<div class="product_rating">
													<ul>
														<c:if test="${bpVO.ratingScoreAvg>=0}">
															<li><a href="javascript:void(0);"
																onclick="document.getElementById('bookForm_${bpVO.bookNumber}').submit();"><i
																	class="icon icon-Star"></i></a></li>
														</c:if>
														<c:if test="${bpVO.ratingScoreAvg>=1.5}">
															<li><a href="javascript:void(0);"
																onclick="document.getElementById('bookForm_${bpVO.bookNumber}').submit();"><i
																	class="icon icon-Star"></i></a></li>
														</c:if>
														<c:if test="${bpVO.ratingScoreAvg>=2.5}">
															<li><a href="javascript:void(0);"
																onclick="document.getElementById('bookForm_${bpVO.bookNumber}').submit();"><i
																	class="icon icon-Star"></i></a></li>
														</c:if>
														<c:if test="${bpVO.ratingScoreAvg>=3.5}">
															<li><a href="javascript:void(0);"
																onclick="document.getElementById('bookForm_${bpVO.bookNumber}').submit();"><i
																	class="icon icon-Star"></i></a></li>
														</c:if>
														<c:if test="${bpVO.ratingScoreAvg>=4.5}">
															<li><a href="javascript:void(0);"
																onclick="document.getElementById('bookForm_${bpVO.bookNumber}').submit();"><i
																	class="icon icon-Star"></i></a></li>
														</c:if>
													</ul>
												</div>
													<h4 class="product_name"> 
													<a href="${pageContext.request.contextPath}/bookproducts.do?bookNumber=${bpVO.bookNumber}&action=single_product_page" id="submitLink_${bpVO.bookNumber}" style="border: none; background-color: #ffffff; width: 100%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; display: inline-block; text-decoration: none; color: inherit;"><span style="font-weight: bold;">${bpVO.bookTitle}</span></a>
													</h4>
												<div class="price_box">
													<span class="current_price">NT$ ${bpVO.price}</span>
												</div>
												<div class="add_to_cart">
													<a class="primary_img" href="${pageContext.request.contextPath}/bookproducts.do?bookNumber=${bpVO.bookNumber}&action=single_product_page" id="submitLink_${bpVO.bookNumber}"><span style="font-weight: bold;">商品詳細資訊</span></a>
												</div>
											</div>
										</figure>
									</figure>
								</article>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<!--product area end-->

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
	<%@include file="/front-end/component/script.jsp"%>

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
					
					let htmlContent = ``
						htmlContent +=`<div class="container">`
						    htmlContent +=`<div class="row">`
                                htmlContent +=`<div class="col-lg-5 col-md-5 col-sm-12">`
						            htmlContent +=`<div class="modal_tab">`
						                htmlContent +=`<div class="tab-content product-details-large">`
						                    htmlContent +=`<div class="tab-pane fade show active" id="tab1" role="tabpanel" >`
                                                htmlContent +=`<div class="modal_tab_img">`
                                                    htmlContent +=`<img src="data:image/jpeg;base64,`+img+`" alt=""></a>`
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
						                htmlContent +=`<div class="modal_description mb-15">`
						                    htmlContent +=`<p>`+introductionContent+`</p>`
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