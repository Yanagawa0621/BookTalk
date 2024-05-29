<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bookproducts.model.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.YearMonth" %>


<%  
	BookProductsService bpsce=new BookProductsService();
	List<BookProductsVO> list=bpsce.npiBp();
	pageContext.setAttribute("list",list);
%>

<% 
	LocalDate date=LocalDate.now();
	int year=date.getYear();
	int month=date.getMonthValue();
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
            <div class="single_slider d-flex align-items-center" data-bgimg="${pageContext.request.contextPath}/front-end/assets/img/slider/slider3.jpg">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="slider_content slider_c_two">
                                <h3>Top Selling!</h3>
                                <h1>Men <span>Bag</span><br> & Backpack</h1>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. </p> 
                                <a class="button" href="shop.html">Read more</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider d-flex align-items-center" data-bgimg="${pageContext.request.contextPath}/front-end/assets/img/slider/slider4.jpg">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="slider_content slider_c_two">
                                <h3>Best Selling!</h3>
                                <h1>The <span>New</span><br> Backpack</h1>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. </p> 
                                <a class="button" href="shop.html">Read more</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--slider area end-->
    
    <!--banner area start-->
    <div class="banner_area home-banner2 mb-95">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <figure class="single_banner">
                        <div class="banner_thumb">
                            <a href="shop.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/bg/banner4.jpg" alt=""></a> 
                        </div>
                    </figure>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <figure class="single_banner">
                        <div class="banner_thumb">
                            <a href="shop.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/bg/banner5.jpg" alt=""></a> 
                        </div>
                    </figure>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6">
                    <figure class="single_banner">
                        <div class="banner_thumb">
                            <a href="shop.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/bg/banner6.jpg" alt=""></a> 
                        </div>
                    </figure>
                </div>
            </div>
        </div>
    </div>
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
                    <div class="col-lg-3">
                        <article class="single_product">
                            <figure>
                                <div class="product_thumb">
                                   <div class="label_product">
                                       <span class="label_new">new</span>
                                        <span class="label_sale">12%</span>
                                    </div>
                                    <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product11.jpg" alt=""></a>
                                    <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product12.jpg" alt=""></a>
                                    <div class="action_links">
                                        <ul>
                                            <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li>
                                            <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>  
                                            <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <figcaption class="product_content">
                                    <div class="product_rating">
                                       <ul>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                       </ul>
                                    </div>
                                    <h4 class="product_name"><a href="product-details.html"> suscipit tempora  delectus  officia a, possimus at ipsam.</a></h4>
                                    <div class="price_box"> 
                                        <span class="current_price">$220.00</span>
                                        <span class="old_price">$240.00</span>
                                    </div>
                                    <div class="add_to_cart">
                                        <a href="cart.html" title="Add to cart">Add to Cart</a>
                                    </div>
                                    <div class="swatches-colors">
                                        <ul>
                                            <li><a class="color1" href="javascript:void(0)"></a></li>
                                            <li><a class="color2" href="javascript:void(0)"></a></li>
                                            <li><a class="color3" href="javascript:void(0)"></a></li>
                                            <li><a class="color4" href="javascript:void(0)"></a></li>
                                        </ul>
                                    </div>
                                </figcaption>
                            </figure>
                        </article>
                    </div> 
                    <div class="col-lg-3">
                        <article class="single_product">
                            <figure>
                                <div class="product_thumb">
                                   <div class="label_product">
                                        <span class="label_new">new</span>
                                    </div>
                                    <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product13.jpg" alt=""></a>
                                    <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product14.jpg" alt=""></a>
                                    <div class="action_links">
                                        <ul>
                                            <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li>
                                            <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>  
                                            <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <figcaption class="product_content">
                                    <div class="product_rating">
                                       <ul>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                       </ul>
                                    </div>
                                    <h4 class="product_name"><a href="product-details.html"> modi nisi cum officia error possimus, unde ipsam is.!</a></h4>
                                    <div class="price_box"> 
                                        <span class="current_price">$225.00</span>
                                        <span class="old_price">$235.00</span>
                                    </div>
                                    <div class="add_to_cart">
                                        <a href="cart.html" title="Add to cart">Add to Cart</a>
                                    </div>
                                    <div class="swatches-colors">
                                        <ul>
                                            <li><a class="color1" href="javascript:void(0)"></a></li>
                                            <li><a class="color2" href="javascript:void(0)"></a></li>
                                            <li><a class="color3" href="javascript:void(0)"></a></li>
                                            <li><a class="color4" href="javascript:void(0)"></a></li>
                                        </ul>
                                    </div>
                                </figcaption>
                            </figure>
                        </article>
                    </div>  
                    <div class="col-lg-3">
                        <article class="single_product">
                            <figure>
                                <div class="product_thumb">
                                   <div class="label_product">
                                        <span class="label_new">new</span>
                                    </div>
                                    <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product15.jpg" alt=""></a>
                                    <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product16.jpg" alt=""></a>
                                    <div class="action_links">
                                        <ul>
                                            <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li>
                                            <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>  
                                            <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <figcaption class="product_content">
                                    <div class="product_rating">
                                       <ul>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                       </ul>
                                    </div>
                                    <h4 class="product_name"><a href="product-details.html">Lorem ipsum dolor sit amet, elit, the display aliquid!</a></h4>
                                    <div class="price_box"> 
                                        <span class="current_price">$142.00</span>
                                        <span class="old_price">$173.00</span>
                                    </div>
                                    <div class="add_to_cart">
                                        <a href="cart.html" title="Add to cart">Add to Cart</a>
                                    </div>
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                    <div class="col-lg-3">
                        <article class="single_product">
                            <figure>
                                <div class="product_thumb">
                                   <div class="label_product">
                                        <span class="label_new">new</span>
                                        <span class="label_sale">10%</span>
                                    </div>
                                    <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product17.jpg" alt=""></a>
                                    <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product18.jpg" alt=""></a>
                                    <div class="action_links">
                                        <ul>
                                            <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li>
                                            <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>  
                                            <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <figcaption class="product_content">
                                    <div class="product_rating">
                                       <ul>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                       </ul>
                                    </div>
                                    <h4 class="product_name"><a href="product-details.html"> quidem totam, voluptatem quae quasi possimus iusto!</a></h4>
                                    <div class="price_box"> 
                                        <span class="current_price">$145.00</span>
                                        <span class="old_price">$178.00</span>
                                    </div>
                                    <div class="add_to_cart">
                                        <a href="cart.html" title="Add to cart">Add to Cart</a>
                                    </div>
                                    <div class="swatches-colors">
                                        <ul>
                                            <li><a class="color1" href="javascript:void(0)"></a></li>
                                            <li><a class="color2" href="javascript:void(0)"></a></li>
                                            <li><a class="color3" href="javascript:void(0)"></a></li>
                                            <li><a class="color4" href="javascript:void(0)"></a></li>
                                        </ul>
                                    </div>
                                </figcaption>
                            </figure>
                        </article>
                    </div> 
                    <div class="col-lg-3">
                        <article class="single_product">
                            <figure>
                                <div class="product_thumb">
                                   <div class="label_product">
                                        <span class="label_new">new</span>
                                    </div>
                                    <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product19.jpg" alt=""></a>
                                    <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product20.jpg" alt=""></a>
                                    <div class="action_links">
                                        <ul>
                                            <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li>
                                            <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>  
                                            <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <figcaption class="product_content">
                                    <div class="product_rating">
                                       <ul>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                       </ul>
                                    </div>
                                    <h4 class="product_name"><a href="product-details.html">iusto dignissimos illum. Quis provident ratione maiores.</a></h4>
                                    <div class="price_box"> 
                                        <span class="current_price">$179.00</span>
                                        <span class="old_price">$190.00</span>
                                    </div>
                                    <div class="add_to_cart">
                                        <a href="cart.html" title="Add to cart">Add to Cart</a>
                                    </div>
                                </figcaption>
                            </figure>
                        </article>
                    </div>  
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
<!--                             <ul class="nav" role="tablist"> -->
<!--                                 <li> -->
<!--                                     <a class="active" data-toggle="tab" href="#classic" role="tab" aria-controls="classic" aria-selected="true">  -->
<!--                                        classic -->
<!--                                     </a> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <a data-toggle="tab" href="#display" role="tab" aria-controls="display" aria-selected="false"> -->
<!--                                         Display  -->
<!--                                     </a> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <a data-toggle="tab" href="#processor" role="tab" aria-controls="processor" aria-selected="false"> -->
<!--                                         Processor  -->
<!--                                     </a> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <a data-toggle="tab" href="#accessories" role="tab" aria-controls="accessories" aria-selected="false"> -->
<!--                                         Accessories  -->
<!--                                     </a> -->
<!--                                 </li> -->
<!--                             </ul> -->
                        </div>
                    </div>
                </div>
            </div> 
            <div class="tab-content">
                <div class="tab-pane fade show active" id="classic" role="tabpanel">
                    <div class="row">
                        <div class="product_carousel product_column4 owl-carousel">

                        <c:forEach var="bpVO" items="${list}">
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
        </div> 
    </div>
    <!--product area end-->
    
    <!--blog area start-->
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
                    <div class="col-lg-3">
                        <article class="single_blog">
                            <figure>
                                <div class="blog_thumb">
                                    <a href="blog-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/blog/blog6.jpg" alt=""></a>
                                </div>
                                <figcaption class="blog_content">
                                   <h4 class="post_title"><a href="blog-details.html">Lorem ipsum dolor sit amet, consectetur adipisicing elit. </a></h4>
                                   <div class="articles_date">
                                        <span><i class="fas fa-calendar" aria-hidden="true"></i> 18/12/2022</span>
                                        <span><i class="fas fa-user" aria-hidden="true"></i> eCommerce Themes</span>
                                    </div>
                                    <p class="post_desc">Donec vitae hendrerit arcu, sit amet faucibus nisl. Cras pretium arcu ex. Aenean posuere libero eu augue condimentum rhoncus praesent</p>
                                    <a href="#">+ Read More</a>
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                    <div class="col-lg-3">
                        <article class="single_blog">
                            <figure>
                                <div class="blog_thumb">
                                    <a href="blog-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/blog/blog7.jpg" alt=""></a>
                                </div>
                                <figcaption class="blog_content">
                                   <h4 class="post_title"><a href="blog-details.html"> est ad quia aperiam unde quam hic, quae optio quis, is.</a></h4>
                                   <div class="articles_date">
                                        <span><i class="fas fa-calendar" aria-hidden="true"></i> 18/12/2022</span>
                                        <span><i class="fas fa-user" aria-hidden="true"></i> eCommerce Themes</span>
                                    </div>
                                    <p class="post_desc">Donec vitae hendrerit arcu, sit amet faucibus nisl. Cras pretium arcu ex. Aenean posuere libero eu augue condimentum rhoncus praesent</p>
                                    <a href="#">+ Read More</a>
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                    <div class="col-lg-3">
                        <article class="single_blog">
                            <figure>
                                <div class="blog_thumb">
                                    <a href="blog-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/blog/blog8.jpg" alt=""></a>
                                </div>
                                <figcaption class="blog_content">
                                   <h4 class="post_title"><a href="blog-details.html"> Aut doloremque, optio optio delectus est quae molestiae. </a></h4>
                                   <div class="articles_date">
                                        <span><i class="fas fa-calendar" aria-hidden="true"></i> 18/12/2022</span>
                                        <span><i class="fas fa-user" aria-hidden="true"></i> eCommerce Themes</span>
                                    </div>
                                    <p class="post_desc">Donec vitae hendrerit arcu, sit amet faucibus nisl. Cras pretium arcu ex. Aenean posuere libero eu augue condimentum rhoncus praesent</p>
                                    <a href="#">+ Read More</a>
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                    <div class="col-lg-3">
                        <article class="single_blog">
                            <figure>
                                <div class="blog_thumb">
                                    <a href="blog-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/blog/blog6.jpg" alt=""></a>
                                </div>
                                <figcaption class="blog_content">
                                   <h4 class="post_title"><a href="blog-details.html">est ad quia aperiam unde quam hic, quae optio quis, is. </a></h4>
                                   <div class="articles_date">
                                        <span><i class="fas fa-calendar" aria-hidden="true"></i> 18/12/2022</span>
                                        <span><i class="fas fa-user" aria-hidden="true"></i> eCommerce Themes</span>
                                    </div>
                                    <p class="post_desc">Donec vitae hendrerit arcu, sit amet faucibus nisl. Cras pretium arcu ex. Aenean posuere libero eu augue condimentum rhoncus praesent</p>
                                    <a href="#">+ Read More</a>
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                    <div class="col-lg-3">
                        <article class="single_blog">
                            <figure>
                                <div class="blog_thumb">
                                    <a href="blog-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/blog/blog7.jpg" alt=""></a>
                                </div>
                                <figcaption class="blog_content">
                                   <h4 class="post_title"><a href="blog-details.html">Lorem ipsum dolor sit amet, consectetur adipisicing elit. </a></h4>
                                   <div class="articles_date">
                                        <span><i class="fas fa-calendar" aria-hidden="true"></i> 18/12/2022</span>
                                        <span><i class="fas fa-user" aria-hidden="true"></i> eCommerce Themes</span>
                                    </div>
                                    <p class="post_desc">Donec vitae hendrerit arcu, sit amet faucibus nisl. Cras pretium arcu ex. Aenean posuere libero eu augue condimentum rhoncus praesent</p>
                                    <a href="#">+ Read More</a>
                                </figcaption>
                            </figure>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--blog area end-->
    
    <!--newsletter area start-->
    <div class="newsletter_area_start color_two">
        <div class="container">
            <div class="newsletter_container">
                <div class="row">
                    <div class="col-12">
                        <div class="section_title">
                           <h2>Sign <span>Up For Latest News</span></h2>
                            <p>Newsletter</p>
                        </div>
                         <div class="subscribe_form">
                            <form id="mc-form" class="mc-form footer-newsletter" >
                                <input id="mc-email" type="email" autocomplete="off" placeholder="Please enter your email to subscribe" />
                                <button id="mc-submit">Subscribe</button>
                                <div class="email_icon">
                                    <i class="icon-mail"></i>
                                </div>
                            </form>
                            <!-- mailchimp-alerts Start -->
                            <div class="mailchimp-alerts text-centre">
                                <div class="mailchimp-submitting"></div><!-- mailchimp-submitting end -->
                                <div class="mailchimp-success"></div><!-- mailchimp-success end -->
                                <div class="mailchimp-error"></div><!-- mailchimp-error end -->
                            </div><!-- mailchimp-alerts end -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
	
	<script type="text/javascript">
        window.onload = function() {
            // Check if the URL already has the selectPage parameter
            if (!window.location.search.includes('selectPage=home')) {
                // Redirect to the same URL with the selectPage parameter
                window.location.href = window.location.pathname + "?selectPage=home";
            }
        };
    </script>
</body>

</html>