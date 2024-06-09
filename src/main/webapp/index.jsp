<%@page import="com.orderdetails.model.OrderDetailsService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bookproducts.model.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.YearMonth" %>
<%@ page import="com.article.model.*"%>
<%@ page import="com.forum.model.*"%>
<%@ page import="com.user.model.*"%>

<%  
    BookProductsService bpsce = new BookProductsService();
    List<BookProductsVO> list = bpsce.npiBp();
    pageContext.setAttribute("list", list);
%>

<% 
    LocalDate date = LocalDate.now();
    int year = date.getYear();
    int month = date.getMonthValue();
%>

<%
	OrderDetailsService odSce=new OrderDetailsService();
	List<Object[]> objList=odSce.getSalesSorting();
	pageContext.setAttribute("objList",objList);
%>
<!DOCTYPE html>
<html class="no-js" lang="en">

<!-- head -->
<%@include file="/front-end/component/head.jsp" %>

<body>
   
    <!--menu area start-->
    <%@include file="/front-end/component/menu.jsp" %>
    <!--menu area end-->
    
    <!--slider area start-->
    <section class="slider_section slider_s_two color_two mb-30">
        <div class="slider_area owl-carousel">
            <div class="single_slider d-flex align-items-center" data-bgimg="${pageContext.request.contextPath}/front-end/assets/img/slider/slider9.jpg">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="slider_content slider_c_two">
                                <h3>新書即將上市 ! </h3>
                                <h1>行如海潮：<br><span>海洋與我們的故事</span></h1>
                                <p>Move Like Water: A Story of the Sea and Its Creatures.</p>
                                <p>作者：Hannah Stowe (漢娜‧史托)</p>
                                <a class="button" href="#">出版日期：2024/06/18</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider d-flex align-items-center" data-bgimg="${pageContext.request.contextPath}/front-end/assets/img/slider/slider10.jpg">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="slider_content slider_c_two">
                                <h3>新書即將上市 !</h3>
                                <h1>生成式AI：<br><span>以ChatGPT</span> 與<br><span>OpenAI模型</span><br>實現高效創新</h1>
                                <p>作者：Valentina Alto</p>
                                <p>譯者：陳仁和</p> 
                                <a class="button" href="#">出版日期：2024/06/19</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--slider area end-->
    
    <!--banner area start-->
    <!--banner area end-->
       
    <!--product area start-->
    <div class="product_area product_style2 color_two  mb-100">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="section_title">
                       <h2><span>暢銷書籍</span></h2>
                    </div>
                </div>
            </div> 
            <div class="row">
                <div class="product_carousel product_column6 owl-carousel">
                    <c:forEach var="obj" items="${objList}">
                    	<c:set var="bpVO" value="${obj[0]}" />
                        <c:if test="${bpVO.productStatus==1}">
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                           <div class="label_product">
                                                <span class="label_new">new</span>
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
                                        <figcaption class="product_content">
                                            <div class="product_rating">
                                               <ul>
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
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
<!--                                                 <span class="old_price">$173.00</span> -->
                                            </div>
                                            <div class="add_to_cart">
                                                <a class="primary_img" href="${pageContext.request.contextPath}/bookproducts.do?bookNumber=${bpVO.bookNumber}&action=single_product_page" id="submitLink_${bpVO.bookNumber}"><span style="font-weight: bold;">商品詳細資訊</span></a>
                                            </div>
                                        </figcaption>
                                    </figure>
                                </article>
                         	</div>
                      	</c:if>
                  	</c:forEach>  
                </div> 
            </div> 
        </div> 
    </div>
    <!--product area end-->   
       
    <!--product area start-->
    <div class="product_area color_two">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="product_header">
                        <div class="section_title">
                           <h2><span>本月新品</span></h2>
                        </div>
                        <div class="product_tab_btn">
                            <!-- Empty div for spacing, no content inside -->
                        </div>
                    </div>
                </div>
            </div> 
            <div class="tab-content">
                <div class="tab-pane fade show active" id="classic" role="tabpanel">
                    <div class="row">
                        <div class="product_carousel product_column4 owl-carousel">
                            <c:forEach var="bpVO" items="${list}">
                                <c:if test="${bpVO.productStatus == 1}">
                                    <div class="col-lg-3">
                                        <article class="single_product">
                                            <figure>
                                                <div class="product_thumb">
                                                    <div class="label_product">
                                                        <span class="label_new">new</span>
                                                    </div>
                                                    <a class="primary_img" href="${pageContext.request.contextPath}/bookproducts.do?bookNumber=${bpVO.bookNumber}&action=single_product_page" id="submitLink_${bpVO.bookNumber}" target="_blank">
                                                        <img src="<%=request.getContextPath()%>/bap/Img?bookNumber=${bpVO.bookNumber}" alt="預覽失敗">
                                                    </a>
                                                    <div class="action_links">
                                                        <ul>
                                                            <li class="quick_button">詳細資訊<a href="#" data-toggle="modal" data-target="#modal_box" title="quick view">
                                                                <input type="hidden" name="bookNumber" value="${bpVO.bookNumber}">
                                                                <i class="icon icon-Eye"></i></a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <figcaption class="product_content">
                                                    <div class="product_rating">
                                                        <ul>
                                                            <!-- Rating stars will be rendered here -->
                                                        </ul>
                                                    </div>
                                                    <form method="GET" action="${pageContext.request.contextPath}/bookproducts.do" id="bookForm_${bpVO.bookNumber}">
                                                        <h4 class="product_name">
                                                            <input type="hidden" name="bookNumber" value="${bpVO.bookNumber}">
                                                            <input type="hidden" name="action" value="single_product_page">
                                                            <a href="${pageContext.request.contextPath}/bookproducts.do?bookNumber=${bpVO.bookNumber}&action=single_product_page" id="submitLink_${bpVO.bookNumber}" style="border: none; background-color: #ffffff; width: 100%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; display: inline-block; text-decoration: none; color: inherit;">${bpVO.bookTitle}</a>
                                                        </h4>
                                                    </form>
                                                    <div class="price_box"> 
                                                        <span class="current_price">NT$ ${bpVO.price}</span>
                                                    </div>
                                                    <div class="add_to_cart">
                                                        <a class="primary_img" href="${pageContext.request.contextPath}/bookproducts.do?bookNumber=${bpVO.bookNumber}&action=single_product_page" id="submitLink_${bpVO.bookNumber}"><span style="font-weight: bold;">商品詳細資訊</span></a>
                                                    </div>
                                                </figcaption>
                                            </figure>
                                        </article>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div> 
                    </div>   
                </div>
            </div>
        </div> 
    </div>
    <!--product area end-->
    
    <!-- blog area start -->
    <section class="blog_section color_two">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section_title">
                        <h2><span>熱門文章</span></h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="blog_carousel blog_column3 owl-carousel">
                    <jsp:useBean id="articleSvc" scope="page" class="com.article.model.ArticleService"/>
                    <c:set var="list" value="${articleSvc.getPopularArticle()}" />
                    <c:forEach var="articleVO" items="${list}" varStatus="loop" begin="0" end="2">
                        <div class="col-lg-3">
                            <article class="single_blog">
                                <figure>
                                    <div class="blog_thumb">
                                        ${articleVO.articleImage}
                                    </div>
                                    <figcaption class="blog_content">
                                        <h4 class="post_title"><a href="javascript:void(0);" onclick="confirmNavigation(event);" data-toggle="modal" data-target="#lightboxModal${loop.index}"><i class="fa fa-paper-plane"></i>${articleVO.title}</a></h4>
                                        <jsp:useBean id="userVO" scope="page" class="com.user.model.UserServiceImpl"/>
                                        <div class="blog_meta">
                                            <c:set var="ArticleUserNumber" value="${articleVO.userNumber}"/>
                                            <c:set var="userName" value="${userVO.getUserByNumber(ArticleUserNumber)}"/>
                                            <p>作者:${userName.name} / 發文日期: ${articleVO.issueTime} / 看板: ${articleVO.forumVO.name}</p>
                                        </div>
                                        <p class="post_desc">${articleVO.articleSummary}</p>
                                        <!-- <footer class="btn_more">
                                            <a href="#"> Read more</a>
                                        </footer> -->
                                    </figcaption>
                                </figure>
                            </article>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>
    <!--blog area end-->
    
    <!--newsletter area start-->
    <!--newsletter area end-->

    <!--footer area start-->
    <%@include file="/front-end/component/footer.jsp" %>
    <!--footer area end-->
   
    <!-- modal area start-->
    <div class="modal fade" id="modal_box" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true"><i class="ion-android-close"></i></span>
                </button>
                <div class="modal_body">
                </div>    
            </div>
        </div>
    </div>
    <!-- modal area end-->
    
<!-- JS ============================================ -->

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
                    let bookNumber = response.bookNumber;
                    let bookClassName = response.bookClassName;
                    let publishingHouseName = response.publishingHouseName;
                    let productStatus = response.productStatus;
                    let bookTitle = response.bookTitle;
                    let isbn = response.isbn;
                    let price = response.price;
                    let publicationDate = response.publicationDate;
                    let stock = response.stock;
                    let introductionContent = response.introductionContent;
                    let releaseDate = response.releaseDate;
                    let img = response.img[0];
                    let ratingScoreAvg = response.ratingScoreAvg;
                    let AuthorVO = response.AuthorVO;
                    
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
                                    htmlContent +=`    <div class="modal_right">`
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
                                                if(ratingScoreAvg != null) {
                                                    if(ratingScoreAvg >= 0) {
                                                        htmlContent +=`<li><a href="#"><i class="icon icon-Star"></i></a></li>`
                                                    }
                                                    if(ratingScoreAvg >= 1.5) {
                                                        htmlContent +=`<li><a href="#"><i class="icon icon-Star"></i></a></li>`
                                                    }
                                                    if(ratingScoreAvg >= 2.5) {
                                                        htmlContent +=`<li><a href="#"><i class="icon icon-Star"></i></a></li>`
                                                    }
                                                    if(ratingScoreAvg >= 3.5) {
                                                        htmlContent +=`<li><a href="#"><i class="icon icon-Star"></i></a></li>`
                                                    }
                                                    if(ratingScoreAvg >= 4.5) {
                                                        htmlContent +=`<li><a href="#"><i class="icon icon-Star"></i></a></li>`
                                                    }
                                                } else {
                                                    htmlContent +=`<p style="font-size: 16px; color: grey;">尚無評分<p>`
                                                }
                                                htmlContent +=`</ul>`
                                            htmlContent +=`</div>`
                                        htmlContent +=`<div class="variants_selects">`
                                            htmlContent +=`<div class="variants_size">`
                                                htmlContent +=`<h2>出版社:`+publishingHouseName+`</h2>`
                                                htmlContent +=`<h2>出版日期:`+publicationDate+`</h2>`
                                                htmlContent +=`<h2>書籍分類:`+bookClassName+`</h2>`
                                                AuthorVO.forEach(function(imgUrl, index) {
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
	
	<script type="text/javascript">
        window.onload = function() {
            // Check if the URL already has the selectPage parameter
            if (!window.location.search.includes('selectPage=home')) {
                // Redirect to the same URL with the selectPage parameter
                window.location.href = window.location.pathname + "?selectPage=home";
            }
        };
    </script>
    
    <script>
        function confirmNavigation(event) {
            event.preventDefault(); 
            if (confirm("前往論壇看更多？")) {
                window.location.href = "${pageContext.request.contextPath}/front-end/article/popularArticle.jsp"; // 替换成目标JSP页面的路径
            }
        }
    </script>
</body>

</html>
