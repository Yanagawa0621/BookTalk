<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.bookproducts.model.*"%>

<%BookProductsVO bpVO=(BookProductsVO)request.getAttribute("bpVO");%>

<!doctype html>
<html class="no-js" lang="en">

<head>
<%@include file="/front-end/component/head.jsp" %>
</head>

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
                            <li><a href="${pageContext.request.contextPath}/front-end/shop.jsp">商城</a></li>
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
                            <a href="#">
                                <img id="zoom1" src="data:image/jpeg;base64, ${bpVO.img[0]}" data-zoom-image="assets/img/product/productbig4.jpg" alt="big-1">
                            </a>
                        </div>
                        <div class="single-zoom-thumb">
                            <ul class="s-tab-zoom owl-carousel single-product-active" id="gallery_01">
                            	<c:forEach var="img" items="${bpVO.img}">
                                <li>
                                    <a href="#" class="elevatezoom-gallery active" data-update="" data-image="assets/img/product/productbig4.jpg" data-zoom-image="assets/img/product/productbig4.jpg">
                                        <img src="data:image/jpeg;base64, ${img}" alt="zo-th-1"/>
                                    </a>
                                </li>
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
                                <span style="font-weight: bold;">書籍類別:<a href="#" style="font-weight: bold; margin: 5px; display: inline-block;">${bpVO.bcVO.className}</a></span>
                                <br>

                                <c:forEach var="authorVO" items="${bpVO.authorVO}">
                                <span style="font-weight: bold;">作者:&nbsp;&nbsp;${authorVO.authorName}</span>
                                <br>
                                </c:forEach>
                                <span style="font-weight: bold;">出版社:&nbsp;&nbsp;${bpVO.phVO.name}</span>
                       			<br>
                                <span style="font-weight: bold;">出版日期:&nbsp;&nbsp;${bpVO.publicationDate}</span>
                                <br>
                                <span style="font-weight: bold;">國是書碼(ISBN):&nbsp;&nbsp;${bpVO.isbn}</span>
                            </div>
							
                            <div class="price_box">
                                <span class="current_price">NT$ ${bpVO.price}</span>
                            </div>
                            
                            <div class="product_variant quantity">
                                <label>quantity</label>
                                <input min="1" max="100" value="1" type="number">
                                <button class="button" type="submit">add to cart</button>  
                            </div>
                            
                            <div class="product_desc">
                            <h2>書籍介紹</h2>
                                <p>${bpVO.introductionContent}</p>
                            </div>
                            
                            
                            
                        </form>
                        <div class="priduct_social">
                            <ul>
                                <li><a class="facebook" href="#" title="facebook"><i class="fa fa-facebook"></i> Like</a></li>           
                                <li><a class="twitter" href="#" title="twitter"><i class="fa fa-twitter"></i> tweet</a></li>           
                                <li><a class="pinterest" href="#" title="pinterest"><i class="fa fa-pinterest"></i> save</a></li>           
                                <li><a class="google-plus" href="#" title="google +"><i class="fa fa-google-plus"></i> share</a></li>        
                                <li><a class="linkedin" href="#" title="linkedin"><i class="fa fa-linkedin"></i> linked</a></li>        
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
                <div class="col-12">
                      
                </div>
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
                       <h2><span>同類型的書籍</span></h2>
                    </div>
                </div>
            </div> 
            <div class="row">
                <div class="product_carousel product_column4 owl-carousel">
                    <div class="col-lg-3">
                        <article class="single_product">
                            <figure>
                                <div class="product_thumb">
                                   <div class="label_product">
                                        <span class="label_new">new</span>
                                    </div>
                                    <a class="primary_img" href="product-details.html"><img src="assets/img/product/product1.jpg" alt=""></a>
                                    <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product2.jpg" alt=""></a>
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
                                    <a class="primary_img" href="product-details.html"><img src="assets/img/product/product3.jpg" alt=""></a>
                                    <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product4.jpg" alt=""></a>
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
                                    <a class="primary_img" href="product-details.html"><img src="assets/img/product/product5.jpg" alt=""></a>
                                    <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product6.jpg" alt=""></a>
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
                    <div class="col-lg-3">
                        <article class="single_product">
                            <figure>
                                <div class="product_thumb">
                                   <div class="label_product">
                                       <span class="label_new">new</span>
                                        <span class="label_sale">12%</span>
                                    </div>
                                    <a class="primary_img" href="product-details.html"><img src="assets/img/product/product7.jpg" alt=""></a>
                                    <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product8.jpg" alt=""></a>
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
                                    <a class="primary_img" href="product-details.html"><img src="assets/img/product/product10.jpg" alt=""></a>
                                    <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product9.jpg" alt=""></a>
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
                </div> 
            </div>  
        </div>
    </section>
    <!--product area end-->
    
   <!--footer area start-->
    <footer class="footer_widgets foote_other">
       <div class="container">
            <div class="footer_top">
                <div class="row">
                    <div class="col-lg-3 col-md-8 col-sm-8">
                        <div class="widgets_container footer_contact">
                            <h3>About us</h3>
                            <p>We are a team of designers and developers that 
                                create high quality HTML Template, Woocommerce, Shopify Theme.</p>
                            <p><i class="icon icon-Pointer"></i> The Barn, Ullenhall, Henley in Arden 
                            B578 5CC, England</p>
                            <p><i class="icon icon-Phone"></i> <a href="tel:+123.456.789">+123.456.789</a> - <a href="tel:+123.456.678">+123.456.678</a></p>
                            <p><i class="icon icon-Mail"></i> <a href="#">#</a></p>
                        </div>          
                    </div>
                    <div class="col-lg-2 col-md-4 col-sm-4">
                        <div class="widgets_container widget_menu">
                            <h3>Information</h3>
                            <div class="footer_menu">
                                <ul>
                                    <li><a href="about.html">About Us</a></li>
                                    <li><a href="#">Delivery Information</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Terms & Conditions</a></li>
                                    <li><a href="contact.html">Contact us</a></li>
                                    <li><a href="#">Returns</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12">
                        <div class="widgets_container footer-linkup">
                            <h3>Our Twitter Feed</h3>
                            <p>Check out "Alice - Multipurpose Responsive #Magento #Theme" on <br> #Envato by <a href="#">@Plazathemes</a> <br> #Themeforest <a href="#">https://t.co/DNdhAwzm88</a></p>
                            <p>Check Out "Emos - Multi Store Responsive #Magento #Theme" on #Envato by <br>  <a href="#">@Plazathemes</a> #Themeforest <a href="#">https://t.co/08oCVAr5dy</a></p>
                            
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-10">
                        <div class="widgets_container footer_instragam">
                            <h3>instagram</h3>
                            <div class="instagram_container">
                                <div class="instagram_thumb">
                                    <a href="#"><img src="assets/img/about/instragam1.jpg" alt=""></a>
                                    <div class="instagram_boxcmt">
                                        <span class="likecount">5</span>
                                        <span class="commentcount">1</span>
                                    </div>
                                </div>
                                <div class="instagram_thumb">
                                    <a href="#"><img src="assets/img/about/instragam2.jpg" alt=""></a>
                                    <div class="instagram_boxcmt">
                                        <span class="likecount">5</span>
                                        <span class="commentcount">1</span>
                                    </div>
                                </div>
                                <div class="instagram_thumb">
                                    <a href="#"><img src="assets/img/about/instragam3.jpg" alt=""></a>
                                    <div class="instagram_boxcmt">
                                        <span class="likecount">5</span>
                                        <span class="commentcount">1</span>
                                    </div>
                                </div>
                                <div class="instagram_thumb">
                                    <a href="#"><img src="assets/img/about/instragam4.jpg" alt=""></a>
                                    <div class="instagram_boxcmt">
                                        <span class="likecount">5</span>
                                        <span class="commentcount">1</span>
                                    </div>
                                </div>
                                <div class="instagram_thumb">
                                    <a href="#"><img src="assets/img/about/instragam5.jpg" alt=""></a>
                                    <div class="instagram_boxcmt">
                                        <span class="likecount">5</span>
                                        <span class="commentcount">1</span>
                                    </div>
                                </div>
                                <div class="instagram_thumb">
                                    <a href="#"><img src="assets/img/about/instragam2.jpg" alt=""></a>
                                    <div class="instagram_boxcmt">
                                        <span class="likecount">5</span>
                                        <span class="commentcount">1</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer_bottom">
            <div class="container">
                <div class="row align-items-center">
                </div>
            </div>
        </div>   
    </footer>
    <!--footer area end-->
    
    <!-- modal area start-->
    <div class="modal fade" id="modal_box" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true"><i class="ion-android-close"></i></span>
                </button>
                <div class="modal_body">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-5 col-md-5 col-sm-12">
                                <div class="modal_tab">  
                                    <div class="tab-content product-details-large">
                                        <div class="tab-pane fade show active" id="tab1" role="tabpanel" >
                                            <div class="modal_tab_img">
                                                <a href="#"><img src="assets/img/product/productbig1.jpg" alt=""></a>    
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tab2" role="tabpanel">
                                            <div class="modal_tab_img">
                                                <a href="#"><img src="assets/img/product/productbig2.jpg" alt=""></a>    
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tab3" role="tabpanel">
                                            <div class="modal_tab_img">
                                                <a href="#"><img src="assets/img/product/productbig3.jpg" alt=""></a>    
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tab4" role="tabpanel">
                                            <div class="modal_tab_img">
                                                <a href="#"><img src="assets/img/product/productbig4.jpg" alt=""></a>    
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal_tab_button">    
                                        <ul class="nav product_navactive owl-carousel" role="tablist">
                                            <li >
                                                <a class="nav-link active" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="false"><img src="assets/img/product/product1.jpg" alt=""></a>
                                            </li>
                                            <li>
                                                 <a class="nav-link" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false"><img src="assets/img/product/product2.jpg" alt=""></a>
                                            </li>
                                            <li>
                                               <a class="nav-link button_three" data-toggle="tab" href="#tab3" role="tab" aria-controls="tab3" aria-selected="false"><img src="assets/img/product/product3.jpg" alt=""></a>
                                            </li>
                                            <li>
                                               <a class="nav-link" data-toggle="tab" href="#tab4" role="tab" aria-controls="tab4" aria-selected="false"><img src="assets/img/product/product8.jpg" alt=""></a>
                                            </li>

                                        </ul>
                                    </div>    
                                </div>  
                            </div> 
                            <div class="col-lg-7 col-md-7 col-sm-12">
                                <div class="modal_right">
                                    <div class="modal_title mb-10">
                                        <h2>Donec Ac Tempus</h2> 
                                    </div>
                                    <div class="modal_price mb-10">
                                        <span class="new_price">$64.99</span>    
                                        <span class="old_price" >$78.99</span>    
                                    </div>
                                    <div class="modal_description mb-15">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia iste laborum ad impedit pariatur esse optio tempora sint ullam autem deleniti nam in quos qui nemo ipsum numquam, reiciendis maiores quidem aperiam, rerum vel recusandae </p>    
                                    </div> 
                                    <div class="variants_selects">
                                        <div class="variants_size">
                                           <h2>size</h2>
                                           <select class="select_option">
                                               <option selected value="1">s</option>
                                               <option value="1">m</option>
                                               <option value="1">l</option>
                                               <option value="1">xl</option>
                                               <option value="1">xxl</option>
                                           </select>
                                        </div>
                                        <div class="variants_color">
                                           <h2>color</h2>
                                           <select class="select_option">
                                               <option selected value="1">purple</option>
                                               <option value="1">violet</option>
                                               <option value="1">black</option>
                                               <option value="1">pink</option>
                                               <option value="1">orange</option>
                                           </select>
                                        </div>
                                        <div class="modal_add_to_cart">
                                            <form action="#">
                                                <input min="1" max="100" step="2" value="1" type="number">
                                                <button type="submit">add to cart</button>
                                            </form>
                                        </div>   
                                    </div>
                                    <div class="modal_social">
                                        <h2>Share this product</h2>
                                        <ul>
                                            <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                                            <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                            <li class="pinterest"><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                            <li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                            <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                        </ul>    
                                    </div>      
                                </div>    
                            </div>    
                        </div>     
                    </div>
                </div>    
            </div>
        </div>
    </div>
    <!-- modal area end-->


    
<!-- JS
============================================ -->
<%@include file="/front-end/component/script.jsp" %>



</body>

</html>