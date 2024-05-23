<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bookproducts.model.*" %>
<%@ page import="java.util.*"%>

<%  
	BookProductsService bpsce=new BookProductsService();
	List<BookProductsVO> list=bpsce.npiBp();
	pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html class="no-js" lang="en">

<!-- head -->
<%@include file="/front-end/component/head.jsp" %>

<body>
   
    <!--header area start-->
    <%@include file="/front-end/component/menu.jsp" %>
    
    <!--header area end-->
    
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
                            <div class="col-lg-3">
                                <article class="single_product">
                                    <figure>
                                        <div class="product_thumb">
                                           <div class="label_product">
                                                <span class="label_new">new</span>
                                            </div>
                                            <a class="primary_img" href="product-details.html"><img src="<%=request.getContextPath()%>/bap/Img?bookNumber=${bpVO.bookNumber}" alt="預覽失敗"></a>
<%--                                             <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product11.jpg" alt=""></a> --%>
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
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
                                               </ul>
                                            </div>
                                            <h4 class="product_name"><a href="product-details.html">${bpVO.bookTitle}</a></h4>
                                            <div class="price_box"> 
                                                <span class="current_price">$${bpVO.price}</span>
<!--                                                 <span class="old_price">$173.00</span> -->
                                            </div>
                                            <div class="add_to_cart">
                                                <a href="cart.html" title="Add to cart">Add to Cart</a>
                                            </div>
                                        </figcaption>
                                    </figure>
                                </article>
                            </div>
                            </c:forEach>
<!--                             <div class="col-lg-3"> -->
<!--                                 <article class="single_product"> -->
<!--                                     <figure> -->
<!--                                         <div class="product_thumb"> -->
<!--                                            <div class="label_product"> -->
<!--                                                 <span class="label_new">new</span> -->
<!--                                                 <span class="label_sale">10%</span> -->
<!--                                             </div> -->
<%--                                             <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product20.jpg" alt=""></a> --%>
<%--                                             <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product11.jpg" alt=""></a> --%>
<!--                                             <div class="action_links"> -->
<!--                                                 <ul> -->
<!--                                                     <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                     <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                     <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <figcaption class="product_content"> -->
<!--                                             <div class="product_rating"> -->
<!--                                                <ul> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                </ul> -->
<!--                                             </div> -->
<!--                                             <h4 class="product_name"><a href="product-details.html"> quidem totam, voluptatem quae quasi possimus iusto!</a></h4> -->
<!--                                             <div class="price_box">  -->
<!--                                                 <span class="current_price">$145.00</span> -->
<!--                                                 <span class="old_price">$178.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="add_to_cart"> -->
<!--                                                 <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                             </div> -->
<!--                                             <div class="swatches-colors"> -->
<!--                                                 <ul> -->
<!--                                                     <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </figcaption> -->
<!--                                     </figure> -->
<!--                                 </article> -->
<!--                             </div>  -->
<!--                             <div class="col-lg-3"> -->
<!--                                 <article class="single_product"> -->
<!--                                     <figure> -->
<!--                                         <div class="product_thumb"> -->
<!--                                            <div class="label_product"> -->
<!--                                                 <span class="label_new">new</span> -->
<!--                                             </div> -->
<%--                                             <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product19.jpg" alt=""></a> --%>
<%--                                             <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product12.jpg" alt=""></a> --%>
<!--                                             <div class="action_links"> -->
<!--                                                 <ul> -->
<!--                                                     <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                     <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                     <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <figcaption class="product_content"> -->
<!--                                             <div class="product_rating"> -->
<!--                                                <ul> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                </ul> -->
<!--                                             </div> -->
<!--                                             <h4 class="product_name"><a href="product-details.html">iusto dignissimos illum. Quis provident ratione maiores.</a></h4> -->
<!--                                             <div class="price_box">  -->
<!--                                                 <span class="current_price">$179.00</span> -->
<!--                                                 <span class="old_price">$190.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="add_to_cart"> -->
<!--                                                 <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                             </div> -->
<!--                                         </figcaption> -->
<!--                                     </figure> -->
<!--                                 </article> -->
<!--                             </div>  -->
<!--                             <div class="col-lg-3"> -->
<!--                                 <article class="single_product"> -->
<!--                                     <figure> -->
<!--                                         <div class="product_thumb"> -->
<!--                                            <div class="label_product"> -->
<!--                                                <span class="label_new">new</span> -->
<!--                                                 <span class="label_sale">12%</span> -->
<!--                                             </div> -->
<%--                                             <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product18.jpg" alt=""></a> --%>
<%--                                             <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product13.jpg" alt=""></a> --%>
<!--                                             <div class="action_links"> -->
<!--                                                 <ul> -->
<!--                                                     <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                     <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                     <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <figcaption class="product_content"> -->
<!--                                             <div class="product_rating"> -->
<!--                                                <ul> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                </ul> -->
<!--                                             </div> -->
<!--                                             <h4 class="product_name"><a href="product-details.html"> suscipit tempora  delectus  officia a, possimus at ipsam.</a></h4> -->
<!--                                             <div class="price_box">  -->
<!--                                                 <span class="current_price">$220.00</span> -->
<!--                                                 <span class="old_price">$240.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="add_to_cart"> -->
<!--                                                 <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                             </div> -->
<!--                                             <div class="swatches-colors"> -->
<!--                                                 <ul> -->
<!--                                                     <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </figcaption> -->
<!--                                     </figure> -->
<!--                                 </article> -->
<!--                             </div>  -->
<!--                             <div class="col-lg-3"> -->
<!--                                 <article class="single_product"> -->
<!--                                     <figure> -->
<!--                                         <div class="product_thumb"> -->
<!--                                            <div class="label_product"> -->
<!--                                                 <span class="label_new">new</span> -->
<!--                                             </div> -->
<%--                                             <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product17.jpg" alt=""></a> --%>
<%--                                             <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product14.jpg" alt=""></a> --%>
<!--                                             <div class="action_links"> -->
<!--                                                 <ul> -->
<!--                                                     <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                     <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                     <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <figcaption class="product_content"> -->
<!--                                             <div class="product_rating"> -->
<!--                                                <ul> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                </ul> -->
<!--                                             </div> -->
<!--                                             <h4 class="product_name"><a href="product-details.html"> modi nisi cum officia error possimus, unde ipsam is.!</a></h4> -->
<!--                                             <div class="price_box">  -->
<!--                                                 <span class="current_price">$225.00</span> -->
<!--                                                 <span class="old_price">$235.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="add_to_cart"> -->
<!--                                                 <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                             </div> -->
<!--                                             <div class="swatches-colors"> -->
<!--                                                 <ul> -->
<!--                                                     <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </figcaption> -->
<!--                                     </figure> -->
<!--                                 </article> -->
<!--                             </div>   -->
                        </div> 
                    </div>   
                </div>
<!--                 <div class="tab-pane fade" id="display" role="tabpanel"> -->
<!--                     <div class="row"> -->
<!--                         <div class="product_carousel product_column4 owl-carousel"> -->
<!--                             <div class="col-lg-3"> -->
<!--                                 <article class="single_product"> -->
<!--                                     <figure> -->
<!--                                         <div class="product_thumb"> -->
<!--                                            <div class="label_product"> -->
<!--                                                <span class="label_new">new</span> -->
<!--                                                 <span class="label_sale">12%</span> -->
<!--                                             </div> -->
<%--                                             <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product16.jpg" alt=""></a> --%>
<%--                                             <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product15.jpg" alt=""></a> --%>
<!--                                             <div class="action_links"> -->
<!--                                                 <ul> -->
<!--                                                     <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                     <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                     <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <figcaption class="product_content"> -->
<!--                                             <div class="product_rating"> -->
<!--                                                <ul> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                </ul> -->
<!--                                             </div> -->
<!--                                             <h4 class="product_name"><a href="product-details.html"> suscipit tempora  delectus  officia a, possimus at ipsam.</a></h4> -->
<!--                                             <div class="price_box">  -->
<!--                                                 <span class="current_price">$220.00</span> -->
<!--                                                 <span class="old_price">$240.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="add_to_cart"> -->
<!--                                                 <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                             </div> -->
<!--                                             <div class="swatches-colors"> -->
<!--                                                 <ul> -->
<!--                                                     <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </figcaption> -->
<!--                                     </figure> -->
<!--                                 </article> -->
<!--                             </div>  -->
<!--                             <div class="col-lg-3"> -->
<!--                                 <article class="single_product"> -->
<!--                                     <figure> -->
<!--                                         <div class="product_thumb"> -->
<!--                                            <div class="label_product"> -->
<!--                                                 <span class="label_new">new</span> -->
<!--                                             </div> -->
<%--                                             <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product17.jpg" alt=""></a> --%>
<%--                                             <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product18.jpg" alt=""></a> --%>
<!--                                             <div class="action_links"> -->
<!--                                                 <ul> -->
<!--                                                     <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                     <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                     <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <figcaption class="product_content"> -->
<!--                                             <div class="product_rating"> -->
<!--                                                <ul> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                </ul> -->
<!--                                             </div> -->
<!--                                             <h4 class="product_name"><a href="product-details.html"> modi nisi cum officia error possimus, unde ipsam is.!</a></h4> -->
<!--                                             <div class="price_box">  -->
<!--                                                 <span class="current_price">$225.00</span> -->
<!--                                                 <span class="old_price">$235.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="add_to_cart"> -->
<!--                                                 <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                             </div> -->
<!--                                             <div class="swatches-colors"> -->
<!--                                                 <ul> -->
<!--                                                     <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </figcaption> -->
<!--                                     </figure> -->
<!--                                 </article> -->
<!--                             </div>   -->
<!--                             <div class="col-lg-3"> -->
<!--                                 <article class="single_product"> -->
<!--                                     <figure> -->
<!--                                         <div class="product_thumb"> -->
<!--                                            <div class="label_product"> -->
<!--                                                 <span class="label_new">new</span> -->
<!--                                             </div> -->
<%--                                             <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product19.jpg" alt=""></a> --%>
<%--                                             <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product20.jpg" alt=""></a> --%>
<!--                                             <div class="action_links"> -->
<!--                                                 <ul> -->
<!--                                                     <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                     <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                     <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <figcaption class="product_content"> -->
<!--                                             <div class="product_rating"> -->
<!--                                                <ul> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                </ul> -->
<!--                                             </div> -->
<!--                                             <h4 class="product_name"><a href="product-details.html">Lorem ipsum dolor sit amet, elit, the display aliquid!</a></h4> -->
<!--                                             <div class="price_box">  -->
<!--                                                 <span class="current_price">$142.00</span> -->
<!--                                                 <span class="old_price">$173.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="add_to_cart"> -->
<!--                                                 <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                             </div> -->
<!--                                         </figcaption> -->
<!--                                     </figure> -->
<!--                                 </article> -->
<!--                             </div> -->
<!--                             <div class="col-lg-3"> -->
<!--                                 <article class="single_product"> -->
<!--                                     <figure> -->
<!--                                         <div class="product_thumb"> -->
<!--                                            <div class="label_product"> -->
<!--                                                 <span class="label_new">new</span> -->
<!--                                                 <span class="label_sale">10%</span> -->
<!--                                             </div> -->
<%--                                             <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product21.jpg" alt=""></a> --%>
<%--                                             <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product15.jpg" alt=""></a> --%>
<!--                                             <div class="action_links"> -->
<!--                                                 <ul> -->
<!--                                                     <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                     <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                     <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <figcaption class="product_content"> -->
<!--                                             <div class="product_rating"> -->
<!--                                                <ul> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                </ul> -->
<!--                                             </div> -->
<!--                                             <h4 class="product_name"><a href="product-details.html"> quidem totam, voluptatem quae quasi possimus iusto!</a></h4> -->
<!--                                             <div class="price_box">  -->
<!--                                                 <span class="current_price">$145.00</span> -->
<!--                                                 <span class="old_price">$178.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="add_to_cart"> -->
<!--                                                 <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                             </div> -->
<!--                                             <div class="swatches-colors"> -->
<!--                                                 <ul> -->
<!--                                                     <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </figcaption> -->
<!--                                     </figure> -->
<!--                                 </article> -->
<!--                             </div>  -->
<!--                             <div class="col-lg-3"> -->
<!--                                 <article class="single_product"> -->
<!--                                     <figure> -->
<!--                                         <div class="product_thumb"> -->
<!--                                            <div class="label_product"> -->
<!--                                                 <span class="label_new">new</span> -->
<!--                                             </div> -->
<%--                                             <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product16.jpg" alt=""></a> --%>
<%--                                             <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product17.jpg" alt=""></a> --%>
<!--                                             <div class="action_links"> -->
<!--                                                 <ul> -->
<!--                                                     <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                     <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                     <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <figcaption class="product_content"> -->
<!--                                             <div class="product_rating"> -->
<!--                                                <ul> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                </ul> -->
<!--                                             </div> -->
<!--                                             <h4 class="product_name"><a href="product-details.html">iusto dignissimos illum. Quis provident ratione maiores.</a></h4> -->
<!--                                             <div class="price_box">  -->
<!--                                                 <span class="current_price">$179.00</span> -->
<!--                                                 <span class="old_price">$190.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="add_to_cart"> -->
<!--                                                 <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                             </div> -->
<!--                                         </figcaption> -->
<!--                                     </figure> -->
<!--                                 </article> -->
<!--                             </div>   -->
<!--                         </div>  -->
<!--                     </div>  -->
<!--                 </div> -->
<!--                 <div class="tab-pane fade" id="processor" role="tabpanel"> -->
<!--                     <div class="row"> -->
<!--                         <div class="product_carousel product_column4 owl-carousel"> -->
<!--                              <div class="col-lg-3"> -->
<!--                                 <article class="single_product"> -->
<!--                                     <figure> -->
<!--                                         <div class="product_thumb"> -->
<!--                                            <div class="label_product"> -->
<!--                                                 <span class="label_new">new</span> -->
<!--                                                 <span class="label_sale">10%</span> -->
<!--                                             </div> -->
<%--                                             <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product18.jpg" alt=""></a> --%>
<%--                                             <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product19.jpg" alt=""></a> --%>
<!--                                             <div class="action_links"> -->
<!--                                                 <ul> -->
<!--                                                     <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                     <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                     <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <figcaption class="product_content"> -->
<!--                                             <div class="product_rating"> -->
<!--                                                <ul> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                </ul> -->
<!--                                             </div> -->
<!--                                             <h4 class="product_name"><a href="product-details.html"> quidem totam, voluptatem quae quasi possimus iusto!</a></h4> -->
<!--                                             <div class="price_box">  -->
<!--                                                 <span class="current_price">$145.00</span> -->
<!--                                                 <span class="old_price">$178.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="add_to_cart"> -->
<!--                                                 <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                             </div> -->
<!--                                             <div class="swatches-colors"> -->
<!--                                                 <ul> -->
<!--                                                     <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </figcaption> -->
<!--                                     </figure> -->
<!--                                 </article> -->
<!--                             </div>  -->
<!--                             <div class="col-lg-3"> -->
<!--                                 <article class="single_product"> -->
<!--                                     <figure> -->
<!--                                         <div class="product_thumb"> -->
<!--                                            <div class="label_product"> -->
<!--                                                 <span class="label_new">new</span> -->
<!--                                             </div> -->
<%--                                             <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product20.jpg" alt=""></a> --%>
<%--                                             <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product21.jpg" alt=""></a> --%>
<!--                                             <div class="action_links"> -->
<!--                                                 <ul> -->
<!--                                                     <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                     <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                     <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <figcaption class="product_content"> -->
<!--                                             <div class="product_rating"> -->
<!--                                                <ul> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                </ul> -->
<!--                                             </div> -->
<!--                                             <h4 class="product_name"><a href="product-details.html">iusto dignissimos illum. Quis provident ratione maiores.</a></h4> -->
<!--                                             <div class="price_box">  -->
<!--                                                 <span class="current_price">$179.00</span> -->
<!--                                                 <span class="old_price">$190.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="add_to_cart"> -->
<!--                                                 <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                             </div> -->
<!--                                         </figcaption> -->
<!--                                     </figure> -->
<!--                                 </article> -->
<!--                             </div>  -->
<!--                             <div class="col-lg-3"> -->
<!--                                 <article class="single_product"> -->
<!--                                     <figure> -->
<!--                                         <div class="product_thumb"> -->
<!--                                            <div class="label_product"> -->
<!--                                                 <span class="label_new">new</span> -->
<!--                                             </div> -->
<%--                                             <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product15.jpg" alt=""></a> --%>
<%--                                             <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product16.jpg" alt=""></a> --%>
<!--                                             <div class="action_links"> -->
<!--                                                 <ul> -->
<!--                                                     <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                     <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                     <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <figcaption class="product_content"> -->
<!--                                             <div class="product_rating"> -->
<!--                                                <ul> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                </ul> -->
<!--                                             </div> -->
<!--                                             <h4 class="product_name"><a href="product-details.html">Lorem ipsum dolor sit amet, elit, the display aliquid!</a></h4> -->
<!--                                             <div class="price_box">  -->
<!--                                                 <span class="current_price">$142.00</span> -->
<!--                                                 <span class="old_price">$173.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="add_to_cart"> -->
<!--                                                 <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                             </div> -->
<!--                                         </figcaption> -->
<!--                                     </figure> -->
<!--                                 </article> -->
<!--                             </div> -->
<!--                             <div class="col-lg-3"> -->
<!--                                 <article class="single_product"> -->
<!--                                     <figure> -->
<!--                                         <div class="product_thumb"> -->
<!--                                            <div class="label_product"> -->
<!--                                                <span class="label_new">new</span> -->
<!--                                                 <span class="label_sale">12%</span> -->
<!--                                             </div> -->
<%--                                             <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product17.jpg" alt=""></a> --%>
<%--                                             <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product18.jpg" alt=""></a> --%>
<!--                                             <div class="action_links"> -->
<!--                                                 <ul> -->
<!--                                                     <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                     <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                     <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <figcaption class="product_content"> -->
<!--                                             <div class="product_rating"> -->
<!--                                                <ul> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                </ul> -->
<!--                                             </div> -->
<!--                                             <h4 class="product_name"><a href="product-details.html"> suscipit tempora  delectus  officia a, possimus at ipsam.</a></h4> -->
<!--                                             <div class="price_box">  -->
<!--                                                 <span class="current_price">$220.00</span> -->
<!--                                                 <span class="old_price">$240.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="add_to_cart"> -->
<!--                                                 <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                             </div> -->
<!--                                             <div class="swatches-colors"> -->
<!--                                                 <ul> -->
<!--                                                     <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </figcaption> -->
<!--                                     </figure> -->
<!--                                 </article> -->
<!--                             </div>  -->
<!--                             <div class="col-lg-3"> -->
<!--                                 <article class="single_product"> -->
<!--                                     <figure> -->
<!--                                         <div class="product_thumb"> -->
<!--                                            <div class="label_product"> -->
<!--                                                 <span class="label_new">new</span> -->
<!--                                             </div> -->
<%--                                             <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product19.jpg" alt=""></a> --%>
<%--                                             <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product20.jpg" alt=""></a> --%>
<!--                                             <div class="action_links"> -->
<!--                                                 <ul> -->
<!--                                                     <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                     <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                     <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <figcaption class="product_content"> -->
<!--                                             <div class="product_rating"> -->
<!--                                                <ul> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                </ul> -->
<!--                                             </div> -->
<!--                                             <h4 class="product_name"><a href="product-details.html"> modi nisi cum officia error possimus, unde ipsam is.!</a></h4> -->
<!--                                             <div class="price_box">  -->
<!--                                                 <span class="current_price">$225.00</span> -->
<!--                                                 <span class="old_price">$235.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="add_to_cart"> -->
<!--                                                 <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                             </div> -->
<!--                                             <div class="swatches-colors"> -->
<!--                                                 <ul> -->
<!--                                                     <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </figcaption> -->
<!--                                     </figure> -->
<!--                                 </article> -->
<!--                             </div>   -->
<!--                         </div>  -->
<!--                     </div>  -->
<!--                 </div> -->
<!--                 <div class="tab-pane fade" id="accessories" role="tabpanel"> -->
<!--                     <div class="row"> -->
<!--                         <div class="product_carousel product_column4 owl-carousel"> -->
<!--                             <div class="col-lg-3"> -->
<!--                                 <article class="single_product"> -->
<!--                                     <figure> -->
<!--                                         <div class="product_thumb"> -->
<!--                                            <div class="label_product"> -->
<!--                                                 <span class="label_new">new</span> -->
<!--                                             </div> -->
<%--                                             <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product13.jpg" alt=""></a> --%>
<%--                                             <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product21.jpg" alt=""></a> --%>
<!--                                             <div class="action_links"> -->
<!--                                                 <ul> -->
<!--                                                     <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                     <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                     <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <figcaption class="product_content"> -->
<!--                                             <div class="product_rating"> -->
<!--                                                <ul> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                </ul> -->
<!--                                             </div> -->
<!--                                             <h4 class="product_name"><a href="product-details.html">iusto dignissimos illum. Quis provident ratione maiores.</a></h4> -->
<!--                                             <div class="price_box">  -->
<!--                                                 <span class="current_price">$179.00</span> -->
<!--                                                 <span class="old_price">$190.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="add_to_cart"> -->
<!--                                                 <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                             </div> -->
<!--                                         </figcaption> -->
<!--                                     </figure> -->
<!--                                 </article> -->
<!--                             </div>  -->
<!--                             <div class="col-lg-3"> -->
<!--                                 <article class="single_product"> -->
<!--                                     <figure> -->
<!--                                         <div class="product_thumb"> -->
<!--                                            <div class="label_product"> -->
<!--                                                <span class="label_new">new</span> -->
<!--                                                 <span class="label_sale">12%</span> -->
<!--                                             </div> -->
<%--                                             <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product14.jpg" alt=""></a> --%>
<%--                                             <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product20.jpg" alt=""></a> --%>
<!--                                             <div class="action_links"> -->
<!--                                                 <ul> -->
<!--                                                     <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                     <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                     <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <figcaption class="product_content"> -->
<!--                                             <div class="product_rating"> -->
<!--                                                <ul> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                </ul> -->
<!--                                             </div> -->
<!--                                             <h4 class="product_name"><a href="product-details.html"> suscipit tempora  delectus  officia a, possimus at ipsam.</a></h4> -->
<!--                                             <div class="price_box">  -->
<!--                                                 <span class="current_price">$220.00</span> -->
<!--                                                 <span class="old_price">$240.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="add_to_cart"> -->
<!--                                                 <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                             </div> -->
<!--                                             <div class="swatches-colors"> -->
<!--                                                 <ul> -->
<!--                                                     <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </figcaption> -->
<!--                                     </figure> -->
<!--                                 </article> -->
<!--                             </div>  -->
<!--                             <div class="col-lg-3"> -->
<!--                                 <article class="single_product"> -->
<!--                                     <figure> -->
<!--                                         <div class="product_thumb"> -->
<!--                                            <div class="label_product"> -->
<!--                                                 <span class="label_new">new</span> -->
<!--                                             </div> -->
<%--                                             <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product15.jpg" alt=""></a> --%>
<%--                                             <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product19.jpg" alt=""></a> --%>
<!--                                             <div class="action_links"> -->
<!--                                                 <ul> -->
<!--                                                     <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                     <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                     <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <figcaption class="product_content"> -->
<!--                                             <div class="product_rating"> -->
<!--                                                <ul> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                </ul> -->
<!--                                             </div> -->
<!--                                             <h4 class="product_name"><a href="product-details.html"> modi nisi cum officia error possimus, unde ipsam is.!</a></h4> -->
<!--                                             <div class="price_box">  -->
<!--                                                 <span class="current_price">$225.00</span> -->
<!--                                                 <span class="old_price">$235.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="add_to_cart"> -->
<!--                                                 <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                             </div> -->
<!--                                             <div class="swatches-colors"> -->
<!--                                                 <ul> -->
<!--                                                     <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </figcaption> -->
<!--                                     </figure> -->
<!--                                 </article> -->
<!--                             </div>  -->
<!--                             <div class="col-lg-3"> -->
<!--                                 <article class="single_product"> -->
<!--                                     <figure> -->
<!--                                         <div class="product_thumb"> -->
<!--                                            <div class="label_product"> -->
<!--                                                 <span class="label_new">new</span> -->
<!--                                             </div> -->
<%--                                             <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product16.jpg" alt=""></a> --%>
<%--                                             <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product18.jpg" alt=""></a> --%>
<!--                                             <div class="action_links"> -->
<!--                                                 <ul> -->
<!--                                                     <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                     <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                     <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <figcaption class="product_content"> -->
<!--                                             <div class="product_rating"> -->
<!--                                                <ul> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                </ul> -->
<!--                                             </div> -->
<!--                                             <h4 class="product_name"><a href="product-details.html">Lorem ipsum dolor sit amet, elit, the display aliquid!</a></h4> -->
<!--                                             <div class="price_box">  -->
<!--                                                 <span class="current_price">$142.00</span> -->
<!--                                                 <span class="old_price">$173.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="add_to_cart"> -->
<!--                                                 <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                             </div> -->
<!--                                         </figcaption> -->
<!--                                     </figure> -->
<!--                                 </article> -->
<!--                             </div> -->
<!--                             <div class="col-lg-3"> -->
<!--                                 <article class="single_product"> -->
<!--                                     <figure> -->
<!--                                         <div class="product_thumb"> -->
<!--                                            <div class="label_product"> -->
<!--                                                 <span class="label_new">new</span> -->
<!--                                                 <span class="label_sale">10%</span> -->
<!--                                             </div> -->
<%--                                             <a class="primary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product17.jpg" alt=""></a> --%>
<%--                                             <a class="secondary_img" href="product-details.html"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product11.jpg" alt=""></a> --%>
<!--                                             <div class="action_links"> -->
<!--                                                 <ul> -->
<!--                                                     <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                     <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                     <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                         <figcaption class="product_content"> -->
<!--                                             <div class="product_rating"> -->
<!--                                                <ul> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                    <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                </ul> -->
<!--                                             </div> -->
<!--                                             <h4 class="product_name"><a href="product-details.html"> quidem totam, voluptatem quae quasi possimus iusto!</a></h4> -->
<!--                                             <div class="price_box">  -->
<!--                                                 <span class="current_price">$145.00</span> -->
<!--                                                 <span class="old_price">$178.00</span> -->
<!--                                             </div> -->
<!--                                             <div class="add_to_cart"> -->
<!--                                                 <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                             </div> -->
<!--                                             <div class="swatches-colors"> -->
<!--                                                 <ul> -->
<!--                                                     <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                                     <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 </ul> -->
<!--                                             </div> -->
<!--                                         </figcaption> -->
<!--                                     </figure> -->
<!--                                 </article> -->
<!--                             </div>   -->
<!--                         </div>  -->
<!--                     </div>  -->
<!--                 </div> -->
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
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-5 col-md-5 col-sm-12">
                                <div class="modal_tab">  
                                    <div class="tab-content product-details-large">
                                        <div class="tab-pane fade show active" id="tab1" role="tabpanel" >
                                            <div class="modal_tab_img">
                                                <a href="#"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/productbig1.jpg" alt=""></a>    
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tab2" role="tabpanel">
                                            <div class="modal_tab_img">
                                                <a href="#"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/productbig2.jpg" alt=""></a>    
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tab3" role="tabpanel">
                                            <div class="modal_tab_img">
                                                <a href="#"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/productbig3.jpg" alt=""></a>    
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tab4" role="tabpanel">
                                            <div class="modal_tab_img">
                                                <a href="#"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/productbig4.jpg" alt=""></a>    
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal_tab_button">    
                                        <ul class="nav product_navactive owl-carousel" role="tablist">
                                            <li >
                                                <a class="nav-link active" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="false"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product1.jpg" alt=""></a>
                                            </li>
                                            <li>
                                                 <a class="nav-link" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product2.jpg" alt=""></a>
                                            </li>
                                            <li>
                                               <a class="nav-link button_three" data-toggle="tab" href="#tab3" role="tab" aria-controls="tab3" aria-selected="false"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product3.jpg" alt=""></a>
                                            </li>
                                            <li>
                                               <a class="nav-link" data-toggle="tab" href="#tab4" role="tab" aria-controls="tab4" aria-selected="false"><img src="${pageContext.request.contextPath}/front-end/assets/img/product/product8.jpg" alt=""></a>
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