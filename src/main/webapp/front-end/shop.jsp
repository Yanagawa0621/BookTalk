<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.bookproducts.model.*" %>
<%@ page import="java.util.*"%>

<%  
	BookProductsService bpsce=new BookProductsService();
	List<BookProductsVO> list=bpsce.getAllBp();
	pageContext.setAttribute("list",list);
%>

<!doctype html>
<html class="no-js" lang="en">

<!-- head -->
<%@include file="/front-end/component/head.jsp" %>

<body>

    <!--header area start-->
    <!--offcanvas menu area start-->
    <div class="off_canvars_overlay">
                
    </div>
    <div class="offcanvas_menu">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="canvas_open">
                        <a href="javascript:void(0)"><i class="ion-navicon"></i></a>
                    </div>
                    <div class="offcanvas_menu_wrapper">
                        <div class="canvas_close">
                            <a href="javascript:void(0)"><i class="ion-android-close"></i></a>  
                        </div>
                        <div class="header_account_area">
                            <div class="header_account-list search_bar">
                               <a href="javascript:void(0)"><span class="icon icon-Search"></span></a>
                                <div class="dropdown_search">
                                    <div class="search_close_btn">
                                        <a href="#"><i class="ion-close-round"></i></a>
                                    </div>
                                    <form action="#">
                                        <input placeholder="Search entire store here ..." type="text">
                                        <button type="submit"><span class="icon icon-Search"></span></button>
                                    </form>
                                </div>
                            </div>
                            <div class="header_account-list  mini_cart_wrapper">
                               <a href="javascript:void(0)"><i class="icon icon-FullShoppingCart"></i><span class="item_count">2</span></a>
                                <!--mini cart-->
                                <div class="mini_cart">
                                    <div class="cart_gallery">
                                        <div class="cart_item">
                                           <div class="cart_img">
                                               <a href="#"><img src="assets/img/s-product/product.jpg" alt=""></a>
                                           </div>
                                            <div class="cart_info">
                                                <a href="#">Lorem ipsum dolor sit amet, consectetur</a>
                                                <p>1 x <span> $65.00 </span></p>    
                                            </div>
                                            <div class="cart_remove">
                                                <a href="#"><i class="ion-ios-close-outline"></i></a>
                                            </div>
                                        </div>
                                        <div class="cart_item">
                                           <div class="cart_img">
                                               <a href="#"><img src="assets/img/s-product/product2.jpg" alt=""></a>
                                           </div>
                                            <div class="cart_info">
                                                <a href="#">impedit dolor sed soluta natus voluptas.</a>
                                                <p>1 x <span> $60.00 </span></p>    
                                            </div>
                                            <div class="cart_remove">
                                                 <a href="#"><i class="ion-ios-close-outline"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mini_cart_table">
                                        <div class="cart_table_border">
                                            <div class="cart_total">
                                                <span>Sub total:</span>
                                                <span class="price">$125.00</span>
                                            </div>
                                            <div class="cart_total mt-10">
                                                <span>total:</span>
                                                <span class="price">$125.00</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mini_cart_footer">
                                       <div class="cart_button">
                                            <a href="cart.html"><i class="fa fa-shopping-cart"></i> View cart</a>
                                        </div>
                                        <div class="cart_button">
                                            <a href="checkout.html"><i class="fa fa-sign-in"></i> Checkout</a>
                                        </div>

                                    </div>
                                </div>
                                <!--mini cart end-->
                           </div>
                            <div class="header_account-list top_links">
                                <a href="javascript:void(0)"><i class="icon icon-Settings"></i></a>
                                <div class="dropdown_links">
                                    <div class="dropdown_links_list">
                                        <h3>$Currency</h3>
                                        <ul>
                                            <li><a href="#">â¬ Euro</a></li>
                                            <li><a href="#">Â£ Pound Sterling</a></li>
                                            <li><a href="#">$ US Dollar</a></li>
                                        </ul>
                                    </div>
                                    <div class="dropdown_links_list">
                                        <h3><img src="assets/img/icon/language.png" alt=""> English</h3>
                                        <ul>
                                            <li><a href="#"><img src="assets/img/icon/language.png" alt=""> English</a></li>
                                            <li><a href="#"><img src="assets/img/icon/language2.png" alt="">  Germany</a></li>
                                        </ul>
                                    </div>
                                    <div class="dropdown_links_list">
                                        <h3>$Currency</h3>
                                        <ul>
                                            <li><a href="#">â¬ Euro</a></li>
                                            <li><a href="#">Â£ Pound Sterling</a></li>
                                            <li><a href="#">$ US Dollar</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="menu" class="text-left ">
                            <ul class="offcanvas_main_menu">
                                <li class="menu-item-has-children active">
                                    <a href="#">Home</a>
                                    <ul class="sub-menu">
                                        <li><a href="index.html">Home 1</a></li>
                                        <li><a href="index-2.html">Home 2</a></li>
                                        <li><a href="index-3.html">Home 3</a></li>
                                        <li><a href="index-4.html">Home 4</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">Shop</a>
                                    <ul class="sub-menu">
                                        <li class="menu-item-has-children">
                                            <a href="#">Shop Layouts</a>
                                            <ul class="sub-menu">
                                                <li><a href="shop.html">shop</a></li>
                                                <li><a href="shop-fullwidth.html">Full Width</a></li>
                                                <li><a href="shop-fullwidth-list.html">Full Width list</a></li>
                                                <li><a href="shop-right-sidebar.html">Right Sidebar </a></li>
                                                <li><a href="shop-right-sidebar-list.html"> Right Sidebar list</a></li>
                                                <li><a href="shop-list.html">List View</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children">
                                            <a href="#">other Pages</a>
                                            <ul class="sub-menu">
                                                <li><a href="cart.html">cart</a></li>
                                                <li><a href="wishlist.html">Wishlist</a></li>
                                                <li><a href="checkout.html">Checkout</a></li>
                                                <li><a href="my-account.html">my account</a></li>
                                                <li><a href="404.html">Error 404</a></li>
                                            </ul>
                                        </li>
                                        <li class="menu-item-has-children">
                                            <a href="#">Product Types</a>
                                            <ul class="sub-menu">
                                                <li><a href="product-details.html">product details</a></li>
                                                <li><a href="product-sidebar.html">product sidebar</a></li>
                                                <li><a href="product-grouped.html">product grouped</a></li>
                                                <li><a href="variable-product.html">product variable</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">blog</a>
                                    <ul class="sub-menu">
                                        <li><a href="blog.html">blog</a></li>
                                        <li><a href="blog-details.html">blog details</a></li>
                                        <li><a href="blog-fullwidth.html">blog fullwidth</a></li>
                                        <li><a href="blog-sidebar.html">blog sidebar</a></li>
                                    </ul>

                                </li>
                                <li class="menu-item-has-children">
                                    <a href="#">pages </a>
                                    <ul class="sub-menu">
                                        <li><a href="about.html">About Us</a></li>
                                        <li><a href="services.html">services</a></li>
                                        <li><a href="faq.html">Frequently Questions</a></li>
                                        <li><a href="contact.html">contact</a></li>
                                        <li><a href="login.html">login</a></li>
                                        <li><a href="404.html">Error 404</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="contact.html"> Contact Us</a> 
                                </li>
                                <li class="menu-item-has-children">
                                    <a href="shop.html"> Specials</a>
                                </li>
                            </ul>
                        </div>

                        <div class="offcanvas_footer">
                            <span><a href="#"><i class="fa fa-envelope-o"></i> info@yourdomain.com</a></span>
                            <ul>
                                <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li class="pinterest"><a href="#"><i class="fa fa-pinterest-p"></i></a></li>
                                <li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!--offcanvas menu area end-->
    <header>
        <div class="main_header sticky-header">
            <div class="container-fluid">
                <div class="header_container">
                    <div class="row align-items-center">
                        <div class="col-lg-2">
                            <div class="logo">
                                <a href="index-2.html"><img src="assets/img/logo/logo3.png" alt=""></a>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <!--main menu start-->
                            <div class="main_menu menu_center menu_position"> 
                                <nav>  
                                    <ul>
                                        <li style="margin: 0;"><a href="${pageContext.request.contextPath}/index.jsp">首頁</a></li>
                                        <li class="mega_items" style="margin: 0;" ><a class="active" href="${pageContext.request.contextPath}/${pageContext.request.contextPath}/front-end/shop.html">書籍商城</a></li>
                                        <li style="margin: 0;"><a href="shop.html">特價商品</a></li>
                                        <li style="margin: 0;"><a href="blog.html">論壇</a></li>
                                        <li style="margin: 0;"><a href="contact.html">聯絡我們</a></li>
                                        <li style="margin: 0;"><a href="#">客服相關<i class="fa fa-angle-down"></i></a>
                                            <ul class="sub_menu pages">
                                                <li><a href="about.html">About Us</a></li>
                                                <li><a href="services.html">services</a></li>
                                                <li><a href="faq.html">Frequently Questions</a></li>
                                                <li><a href="contact.html">contact</a></li>
                                                <li><a href="login.html">login</a></li>
                                                <li><a href="404.html">Error 404</a></li>
                                            </ul>
                                        </li>
                                    </ul>  
                                </nav> 
                            </div>
                            <!--main menu end-->
                        </div>
                        <div class="col-lg-2">
                            <div class="header_account_area">
                                <div class="header_account-list search_bar">
                                   <a href="javascript:void(0)"><span class="icon icon-Search"></span></a>
                                    <div class="dropdown_search">
                                        <div class="search_close_btn">
                                            <a href="#"><i class="ion-close-round"></i></a>
                                        </div>
                                        <form action="#">
                                            <select style="opacity: 0.8; font-size: 20px; border-radius: 40px;">
                                                <option name="searchMain" value="bookTitle">書籍名稱</option>
                                                <option name="searchMain" value="author">作者</option>
                                                <option name="searchMain" value="publishing_house">出版社</option>
                                                <option name="searchMain" value="isbn">國際書碼(ISBN)</option>
                                            </select>
                                            <input placeholder="請輸入關鍵字" type="text">
                                            <button type="submit"><span class="icon icon-Search"></span></button>
                                        </form>
                                    </div>
                                </div>
                                <div class="header_account-list  mini_cart_wrapper">
                                   <a href="javascript:void(0)"><i class="icon icon-FullShoppingCart"></i><span class="item_count">2</span></a>
                                    <!--mini cart-->
                                    <div class="mini_cart">
                                        <div class="cart_gallery">
                                            <div class="cart_item">
                                               <div class="cart_img">
                                                   <a href="#"><img src="assets/img/s-product/product.jpg" alt=""></a>
                                               </div>
                                                <div class="cart_info">
                                                    <a href="#">Lorem ipsum dolor sit amet, consectetur</a>
                                                    <p>1 x <span> $65.00 </span></p>    
                                                </div>
                                                <div class="cart_remove">
                                                    <a href="#"><i class="ion-ios-close-outline"></i></a>
                                                </div>
                                            </div>
                                            <div class="cart_item">
                                               <div class="cart_img">
                                                   <a href="#"><img src="assets/img/s-product/product2.jpg" alt=""></a>
                                               </div>
                                                <div class="cart_info">
                                                    <a href="#">impedit dolor sed soluta natus voluptas.</a>
                                                    <p>1 x <span> $60.00 </span></p>    
                                                </div>
                                                <div class="cart_remove">
                                                     <a href="#"><i class="ion-ios-close-outline"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mini_cart_table">
                                            <div class="cart_table_border">
                                                <div class="cart_total">
                                                    <span>Sub total:</span>
                                                    <span class="price">$125.00</span>
                                                </div>
                                                <div class="cart_total mt-10">
                                                    <span>total:</span>
                                                    <span class="price">$125.00</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mini_cart_footer">
                                           <div class="cart_button">
                                                <a href="cart.html"><i class="fa fa-shopping-cart"></i> View cart</a>
                                            </div>
                                            <div class="cart_button">
                                                <a href="checkout.html"><i class="fa fa-sign-in"></i> Checkout</a>
                                            </div>

                                        </div>
                                    </div>
                                    <!--mini cart end-->
                               </div>
                                <div class="header_account-list top_links">
								<a href="#"><i class="far fa-user"></i></a>
								<div class="dropdown_links">
									<div class="dropdown_links_list">
										<h3>
											<i class="fas fa-user-circle"></i> 會員資訊
										</h3>
										<ul>
											<li><a href="#">€ Euro</a></li>
											<li><a href="#">£ Pound Sterling</a></li>
											<li><a href="#">$ US Dollar</a></li>
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
    </header>
    <!--header area end-->

    
    <!--breadcrumbs area start-->
    <div class="breadcrumbs_area">
        <div class="container">   
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb_content">
                        <h3>商城</h3>
                        <ul>
                            <li><a href="/BoolTalk/index.jsp">首頁</a></li>
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
                                    <input type="text" name="text" id="amount" style="width: 120px;"/>   

                                </form> 
                            </div>
                            <div class="widget_list widget_color">
                                <h3>依書籍類別</h3>
                                <ul>
                                    <li>
                                        <a href="#">Black  <span>(6)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#"> Blue <span>(8)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#">Brown <span>(10)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#"> Green <span>(6)</span></a> 
                                    </li>
                                    <li>
                                        <a href="#">Pink <span>(4)</span></a> 
                                    </li>
                                  
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

                            <button data-role="grid_3" type="button" class="active btn-grid-3" data-toggle="tooltip" title="3"></button>

                            <button data-role="grid_4" type="button"  class=" btn-grid-4" data-toggle="tooltip" title="4"></button>

                            <button data-role="grid_list" type="button"  class="btn-list" data-toggle="tooltip" title="List"></button>
                        </div>
                        <div class=" niceselect_option">
                            <form class="select_option" action="#">
                                <select name="orderby" id="short">

                                    <option selected value="1">Sort by average rating</option>
                                    <option  value="2">Sort by popularity</option>
                                    <option value="3">Sort by newness</option>
                                    <option value="4">Sort by price: low to high</option>
                                    <option value="5">Sort by price: high to low</option>
                                    <option value="6">Product Name: Z</option>
                                </select>
                            </form>
                        </div>
                        <div class="page_amount">
                            <p>Showing 1–9 of 21 results</p>
                        </div>
                    </div>
                     <!--shop toolbar end-->
                     <div class="row shop_wrapper">
                        <div class="col-lg-4 col-md-4 col-sm-6 col-12 ">
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
                                    <div class="product_content grid_content">
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
                                    </div>
                                    <div class="product_content list_content">
                                       <div class="swatches-colors">
                                            <ul>
                                                <li><a class="color1" href="javascript:void(0)"></a></li>
                                                <li><a class="color2" href="javascript:void(0)"></a></li>
                                                <li><a class="color4" href="javascript:void(0)"></a></li>
                                                <li><a class="color3" href="javascript:void(0)"></a></li>
                                            </ul>
                                        </div>
                                        <div class="product_rating">
                                           <ul>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                               <li><a href="#"><i class="icon icon-Star"></i></a></li>
                                           </ul>
                                        </div>
                                        <h4 class="product_name"><a href="product-details.html">quidem totam, voluptatem quae quasi possimus</a></h4>
                                        <div class="product_desc">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamcoâ¦</p>
                                        </div>
                                        <div class="price_box"> 
                                            <span class="current_price">$145.00</span>
                                            <span class="old_price">$178.00</span>
                                        </div>
                                        
                                        <div class="action_links list_action_right">
                                            <ul>
                                                 <li class="add_to_cart"><a href="cart.html" title="Add to cart">Add to Cart</a></li>
                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li>
                                                <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>  
                                                <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </figure>
                            </article>
                        </div>
<!--                         <div class="col-lg-4 col-md-4 col-sm-6 col-12 "> -->
<!--                             <article class="single_product"> -->
<!--                                 <figure> -->
<!--                                     <div class="product_thumb"> -->
<!--                                        <div class="label_product"> -->
<!--                                             <span class="label_new">new</span> -->
<!--                                         </div> -->
<!--                                         <a class="primary_img" href="product-details.html"><img src="assets/img/product/product1.jpg" alt=""></a> -->
<!--                                         <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product2.jpg" alt=""></a> -->
<!--                                         <div class="action_links"> -->
<!--                                             <ul> -->
<!--                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content grid_content"> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html">Lorem ipsum dolor sit amet, elit, the display aliquid!</a></h4> -->
<!--                                         <div class="price_box">  -->
<!--                                             <span class="current_price">$155.00</span> -->
<!--                                             <span class="old_price">$188.00</span> -->
<!--                                         </div> -->
<!--                                         <div class="add_to_cart"> -->
<!--                                             <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content list_content"> -->
<!--                                        <div class="swatches-colors"> -->
<!--                                             <ul> -->
<!--                                                 <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html">Lorem ipsum dolor sit amet, elit, the display aliquid!</a></h4> -->
<!--                                         <div class="product_desc"> -->
<!--                                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamcoâ¦</p> -->
<!--                                         </div> -->
<!--                                         <div class="price_box">  -->
<!--                                              <span class="current_price">$155.00</span> -->
<!--                                             <span class="old_price">$188.00</span> -->
<!--                                         </div> -->
                                        
<!--                                         <div class="action_links list_action_right"> -->
<!--                                             <ul> -->
<!--                                                  <li class="add_to_cart"><a href="cart.html" title="Add to cart">Add to Cart</a></li> -->
<!--                                                  <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </figure> -->
<!--                             </article> -->
<!--                         </div> -->
<!--                         <div class="col-lg-4 col-md-4 col-sm-6 col-12 "> -->
<!--                             <article class="single_product"> -->
<!--                                 <figure> -->
<!--                                     <div class="product_thumb"> -->
<!--                                        <div class="label_product"> -->
<!--                                             <span class="label_new">new</span> -->
<!--                                             <span class="label_sale">10%</span> -->
<!--                                         </div> -->
<!--                                         <a class="primary_img" href="product-details.html"><img src="assets/img/product/product5.jpg" alt=""></a> -->
<!--                                         <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product6.jpg" alt=""></a> -->
<!--                                         <div class="action_links"> -->
<!--                                             <ul> -->
<!--                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content grid_content"> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html"> iusto dignissimos illum. Quis provident ratione.</a></h4> -->
<!--                                         <div class="price_box">  -->
<!--                                             <span class="current_price">$165.00</span> -->
<!--                                             <span class="old_price">$198.00</span> -->
<!--                                         </div> -->
<!--                                         <div class="add_to_cart"> -->
<!--                                             <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                         </div> -->
<!--                                         <div class="swatches-colors"> -->
<!--                                             <ul> -->
<!--                                                 <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content list_content"> -->
<!--                                        <div class="swatches-colors"> -->
<!--                                             <ul> -->
<!--                                                 <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html">iusto dignissimos illum. Quis provident ratione maiores.</a></h4> -->
<!--                                         <div class="product_desc"> -->
<!--                                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamcoâ¦</p> -->
<!--                                         </div> -->
<!--                                         <div class="price_box">  -->
<!--                                             <span class="current_price">$165.00</span> -->
<!--                                             <span class="old_price">$198.00</span> -->
<!--                                         </div> -->
                                        
<!--                                         <div class="action_links list_action_right"> -->
<!--                                             <ul> -->
<!--                                                  <li class="add_to_cart"><a href="cart.html" title="Add to cart">Add to Cart</a></li> -->
<!--                                                  <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </figure> -->
<!--                             </article> -->
<!--                         </div> -->
<!--                         <div class="col-lg-4 col-md-4 col-sm-6 col-12 "> -->
<!--                             <article class="single_product"> -->
<!--                                 <figure> -->
<!--                                     <div class="product_thumb"> -->
<!--                                        <div class="label_product"> -->
<!--                                             <span class="label_new">new</span> -->
<!--                                             <span class="label_sale">10%</span> -->
<!--                                         </div> -->
<!--                                         <a class="primary_img" href="product-details.html"><img src="assets/img/product/product7.jpg" alt=""></a> -->
<!--                                         <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product8.jpg" alt=""></a> -->
<!--                                         <div class="action_links"> -->
<!--                                             <ul> -->
<!--                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content grid_content"> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html"> suscipit delectus  officia a, possimus at ipsam.</a></h4> -->
<!--                                         <div class="price_box">  -->
<!--                                             <span class="current_price">$130.00</span> -->
<!--                                             <span class="old_price">$150.00</span> -->
<!--                                         </div> -->
<!--                                         <div class="add_to_cart"> -->
<!--                                             <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                         </div> -->
<!--                                         <div class="swatches-colors"> -->
<!--                                             <ul> -->
<!--                                                 <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content list_content"> -->
<!--                                        <div class="swatches-colors"> -->
<!--                                             <ul> -->
<!--                                                 <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html">suscipit delectus  officia a, possimus at ipsam.</a></h4> -->
<!--                                         <div class="product_desc"> -->
<!--                                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamcoâ¦</p> -->
<!--                                         </div> -->
<!--                                         <div class="price_box">  -->
<!--                                              <span class="current_price">$130.00</span> -->
<!--                                             <span class="old_price">$150.00</span> -->
<!--                                         </div> -->
                                        
<!--                                         <div class="action_links list_action_right"> -->
<!--                                             <ul> -->
<!--                                                  <li class="add_to_cart"><a href="cart.html" title="Add to cart">Add to Cart</a></li> -->
<!--                                                  <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </figure> -->
<!--                             </article> -->
<!--                         </div> -->
<!--                         <div class="col-lg-4 col-md-4 col-sm-6 col-12 "> -->
<!--                             <article class="single_product"> -->
<!--                                 <figure> -->
<!--                                     <div class="product_thumb"> -->
<!--                                        <div class="label_product"> -->
<!--                                             <span class="label_new">new</span> -->
<!--                                         </div> -->
<!--                                         <a class="primary_img" href="product-details.html"><img src="assets/img/product/product9.jpg" alt=""></a> -->
<!--                                         <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product10.jpg" alt=""></a> -->
<!--                                         <div class="action_links"> -->
<!--                                             <ul> -->
<!--                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content grid_content"> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html"> modi nisi cum officia error, unde ipsam is.!</a></h4> -->
<!--                                         <div class="price_box">  -->
<!--                                             <span class="current_price">$135.00</span> -->
<!--                                             <span class="old_price">$145.00</span> -->
<!--                                         </div> -->
<!--                                         <div class="add_to_cart"> -->
<!--                                             <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content list_content"> -->
<!--                                        <div class="swatches-colors"> -->
<!--                                             <ul> -->
<!--                                                 <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html">modi nisi cum officia error, unde ipsam is.!</a></h4> -->
<!--                                         <div class="product_desc"> -->
<!--                                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamcoâ¦</p> -->
<!--                                         </div> -->
<!--                                         <div class="price_box">  -->
<!--                                             <span class="current_price">$135.00</span> -->
<!--                                             <span class="old_price">$145.00</span> -->
<!--                                         </div> -->
                                        
<!--                                         <div class="action_links list_action_right"> -->
<!--                                             <ul> -->
<!--                                                  <li class="add_to_cart"><a href="cart.html" title="Add to cart">Add to Cart</a></li> -->
<!--                                                  <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </figure> -->
<!--                             </article> -->
<!--                         </div> -->
<!--                         <div class="col-lg-4 col-md-4 col-sm-6 col-12 "> -->
<!--                             <article class="single_product"> -->
<!--                                 <figure> -->
<!--                                     <div class="product_thumb"> -->
<!--                                        <div class="label_product"> -->
<!--                                             <span class="label_new">new</span> -->
<!--                                             <span class="label_sale">10%</span> -->
<!--                                         </div> -->
<!--                                         <a class="primary_img" href="product-details.html"><img src="assets/img/product/product11.jpg" alt=""></a> -->
<!--                                         <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product12.jpg" alt=""></a> -->
<!--                                         <div class="action_links"> -->
<!--                                             <ul> -->
<!--                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content grid_content"> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html"> suscipit tempora officia a, possimus at ipsam.</a></h4> -->
<!--                                         <div class="price_box">  -->
<!--                                             <span class="current_price">$155.00</span> -->
<!--                                             <span class="old_price">$175.00</span> -->
<!--                                         </div> -->
<!--                                         <div class="add_to_cart"> -->
<!--                                             <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                         </div> -->
<!--                                         <div class="swatches-colors"> -->
<!--                                             <ul> -->
<!--                                                 <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content list_content"> -->
<!--                                        <div class="swatches-colors"> -->
<!--                                             <ul> -->
<!--                                                 <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html">suscipit tempora officia a, possimus at ipsam.</a></h4> -->
<!--                                         <div class="product_desc"> -->
<!--                                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamcoâ¦</p> -->
<!--                                         </div> -->
<!--                                         <div class="price_box">  -->
<!--                                            <span class="current_price">$155.00</span> -->
<!--                                             <span class="old_price">$175.00</span> -->
<!--                                         </div> -->
                                        
<!--                                         <div class="action_links list_action_right"> -->
<!--                                             <ul> -->
<!--                                                  <li class="add_to_cart"><a href="cart.html" title="Add to cart">Add to Cart</a></li> -->
<!--                                                  <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </figure> -->
<!--                             </article> -->
<!--                         </div> -->
<!--                         <div class="col-lg-4 col-md-4 col-sm-6 col-12 "> -->
<!--                             <article class="single_product"> -->
<!--                                 <figure> -->
<!--                                     <div class="product_thumb"> -->
<!--                                        <div class="label_product"> -->
<!--                                             <span class="label_new">new</span> -->
<!--                                         </div> -->
<!--                                         <a class="primary_img" href="product-details.html"><img src="assets/img/product/product1.jpg" alt=""></a> -->
<!--                                         <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product2.jpg" alt=""></a> -->
<!--                                         <div class="action_links"> -->
<!--                                             <ul> -->
<!--                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content grid_content"> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html"> quidem totam, voluptatem quae quasi possimus iusto!</a></h4> -->
<!--                                         <div class="price_box">  -->
<!--                                             <span class="current_price">$162.00</span> -->
<!--                                             <span class="old_price">$172.00</span> -->
<!--                                         </div> -->
<!--                                         <div class="add_to_cart"> -->
<!--                                             <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content list_content"> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html">quidem totam, voluptatem quae quasi possimus</a></h4> -->
<!--                                         <div class="product_desc"> -->
<!--                                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamcoâ¦</p> -->
<!--                                         </div> -->
<!--                                         <div class="price_box">  -->
<!--                                             <span class="current_price">$162.00</span> -->
<!--                                             <span class="old_price">$172.00</span> -->
<!--                                         </div> -->
                                        
<!--                                         <div class="action_links list_action_right"> -->
<!--                                             <ul> -->
<!--                                                  <li class="add_to_cart"><a href="cart.html" title="Add to cart">Add to Cart</a></li> -->
<!--                                                  <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </figure> -->
<!--                             </article> -->
<!--                         </div> -->
<!--                         <div class="col-lg-4 col-md-4 col-sm-6 col-12 "> -->
<!--                             <article class="single_product"> -->
<!--                                 <figure> -->
<!--                                     <div class="product_thumb"> -->
<!--                                        <div class="label_product"> -->
<!--                                             <span class="label_new">new</span> -->
<!--                                             <span class="label_sale">10%</span> -->
<!--                                         </div> -->
<!--                                         <a class="primary_img" href="product-details.html"><img src="assets/img/product/product13.jpg" alt=""></a> -->
<!--                                         <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product14.jpg" alt=""></a> -->
<!--                                         <div class="action_links"> -->
<!--                                             <ul> -->
<!--                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content grid_content"> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html"> Lorem ipsum dolor sit amet, elit, the display aliquid!</a></h4> -->
<!--                                         <div class="price_box">  -->
<!--                                             <span class="current_price">$122.00</span> -->
<!--                                             <span class="old_price">$152.00</span> -->
<!--                                         </div> -->
<!--                                         <div class="add_to_cart"> -->
<!--                                             <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                         </div> -->
<!--                                         <div class="swatches-colors"> -->
<!--                                             <ul> -->
<!--                                                 <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content list_content"> -->
<!--                                        <div class="swatches-colors"> -->
<!--                                             <ul> -->
<!--                                                 <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html">Lorem ipsum dolor sit amet, elit, the display aliquid!</a></h4> -->
<!--                                         <div class="product_desc"> -->
<!--                                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamcoâ¦</p> -->
<!--                                         </div> -->
<!--                                         <div class="price_box">  -->
<!--                                              <span class="current_price">$122.00</span> -->
<!--                                             <span class="old_price">$152.00</span> -->
<!--                                         </div> -->
                                        
<!--                                         <div class="action_links list_action_right"> -->
<!--                                             <ul> -->
<!--                                                  <li class="add_to_cart"><a href="cart.html" title="Add to cart">Add to Cart</a></li> -->
<!--                                                  <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </figure> -->
<!--                             </article> -->
<!--                         </div> -->
<!--                         <div class="col-lg-4 col-md-4 col-sm-6 col-12 "> -->
<!--                             <article class="single_product"> -->
<!--                                 <figure> -->
<!--                                     <div class="product_thumb"> -->
<!--                                        <div class="label_product"> -->
<!--                                             <span class="label_new">new</span> -->
<!--                                             <span class="label_sale">10%</span> -->
<!--                                         </div> -->
<!--                                         <a class="primary_img" href="product-details.html"><img src="assets/img/product/product3.jpg" alt=""></a> -->
<!--                                         <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product4.jpg" alt=""></a> -->
<!--                                         <div class="action_links"> -->
<!--                                             <ul> -->
<!--                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content grid_content"> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html"> iusto illum. Quis provident ratione maiores.</a></h4> -->
<!--                                         <div class="price_box">  -->
<!--                                             <span class="current_price">$145.00</span> -->
<!--                                             <span class="old_price">$178.00</span> -->
<!--                                         </div> -->
<!--                                         <div class="add_to_cart"> -->
<!--                                             <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                         </div> -->
<!--                                         <div class="swatches-colors"> -->
<!--                                             <ul> -->
<!--                                                 <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content list_content"> -->
<!--                                        <div class="swatches-colors"> -->
<!--                                             <ul> -->
<!--                                                 <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html">iusto illum. Quis provident ratione maiores.</a></h4> -->
<!--                                         <div class="product_desc"> -->
<!--                                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamcoâ¦</p> -->
<!--                                         </div> -->
<!--                                         <div class="price_box">  -->
<!--                                             <span class="current_price">$145.00</span> -->
<!--                                             <span class="old_price">$178.00</span> -->
<!--                                         </div> -->
                                        
<!--                                         <div class="action_links list_action_right"> -->
<!--                                             <ul> -->
<!--                                                  <li class="add_to_cart"><a href="cart.html" title="Add to cart">Add to Cart</a></li> -->
<!--                                                  <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </figure> -->
<!--                             </article> -->
<!--                         </div> -->
<!--                         <div class="col-lg-4 col-md-4 col-sm-6 col-12 "> -->
<!--                             <article class="single_product"> -->
<!--                                 <figure> -->
<!--                                     <div class="product_thumb"> -->
<!--                                        <div class="label_product"> -->
<!--                                             <span class="label_new">new</span> -->
<!--                                             <span class="label_sale">10%</span> -->
<!--                                         </div> -->
<!--                                         <a class="primary_img" href="product-details.html"><img src="assets/img/product/product15.jpg" alt=""></a> -->
<!--                                         <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product16.jpg" alt=""></a> -->
<!--                                         <div class="action_links"> -->
<!--                                             <ul> -->
<!--                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content grid_content"> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html"> quidem totam, voluptatem quae quasi possimus iusto!</a></h4> -->
<!--                                         <div class="price_box">  -->
<!--                                             <span class="current_price">$145.00</span> -->
<!--                                             <span class="old_price">$178.00</span> -->
<!--                                         </div> -->
<!--                                         <div class="add_to_cart"> -->
<!--                                             <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                         </div> -->
<!--                                         <div class="swatches-colors"> -->
<!--                                             <ul> -->
<!--                                                 <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content list_content"> -->
<!--                                        <div class="swatches-colors"> -->
<!--                                             <ul> -->
<!--                                                 <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html">quidem totam, voluptatem quae quasi possimus</a></h4> -->
<!--                                         <div class="product_desc"> -->
<!--                                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamcoâ¦</p> -->
<!--                                         </div> -->
<!--                                         <div class="price_box">  -->
<!--                                             <span class="current_price">$145.00</span> -->
<!--                                             <span class="old_price">$178.00</span> -->
<!--                                         </div> -->
                                        
<!--                                         <div class="action_links list_action_right"> -->
<!--                                             <ul> -->
<!--                                                  <li class="add_to_cart"><a href="cart.html" title="Add to cart">Add to Cart</a></li> -->
<!--                                                  <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </figure> -->
<!--                             </article> -->
<!--                         </div> -->
<!--                         <div class="col-lg-4 col-md-4 col-sm-6 col-12 "> -->
<!--                             <article class="single_product"> -->
<!--                                 <figure> -->
<!--                                     <div class="product_thumb"> -->
<!--                                        <div class="label_product"> -->
<!--                                             <span class="label_new">new</span> -->
<!--                                             <span class="label_sale">10%</span> -->
<!--                                         </div> -->
<!--                                         <a class="primary_img" href="product-details.html"><img src="assets/img/product/product5.jpg" alt=""></a> -->
<!--                                         <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product6.jpg" alt=""></a> -->
<!--                                         <div class="action_links"> -->
<!--                                             <ul> -->
<!--                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content grid_content"> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html">  suscipit tempora officia a, possimus at ipsam.</a></h4> -->
<!--                                         <div class="price_box">  -->
<!--                                             <span class="current_price">$135.00</span> -->
<!--                                             <span class="old_price">$155.00</span> -->
<!--                                         </div> -->
<!--                                         <div class="add_to_cart"> -->
<!--                                             <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                         </div> -->
<!--                                         <div class="swatches-colors"> -->
<!--                                             <ul> -->
<!--                                                 <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content list_content"> -->
<!--                                        <div class="swatches-colors"> -->
<!--                                             <ul> -->
<!--                                                 <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html">suscipit tempora officia a, possimus at ipsam.</a></h4> -->
<!--                                         <div class="product_desc"> -->
<!--                                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamcoâ¦</p> -->
<!--                                         </div> -->
<!--                                         <div class="price_box">  -->
<!--                                             <span class="current_price">$135.00</span> -->
<!--                                             <span class="old_price">$155.00</span> -->
<!--                                         </div> -->
                                        
<!--                                         <div class="action_links list_action_right"> -->
<!--                                             <ul> -->
<!--                                                  <li class="add_to_cart"><a href="cart.html" title="Add to cart">Add to Cart</a></li> -->
<!--                                                  <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </figure> -->
<!--                             </article> -->
<!--                         </div> -->
<!--                         <div class="col-lg-4 col-md-4 col-sm-6 col-12 "> -->
<!--                             <article class="single_product"> -->
<!--                                 <figure> -->
<!--                                     <div class="product_thumb"> -->
<!--                                        <div class="label_product"> -->
<!--                                             <span class="label_new">new</span> -->
<!--                                             <span class="label_sale">10%</span> -->
<!--                                         </div> -->
<!--                                         <a class="primary_img" href="product-details.html"><img src="assets/img/product/product17.jpg" alt=""></a> -->
<!--                                         <a class="secondary_img" href="product-details.html"><img src="assets/img/product/product18.jpg" alt=""></a> -->
<!--                                         <div class="action_links"> -->
<!--                                             <ul> -->
<!--                                                 <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content grid_content"> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html"> quidem totam, voluptatem quae quasi possimus iusto!</a></h4> -->
<!--                                         <div class="price_box">  -->
<!--                                             <span class="current_price">$145.00</span> -->
<!--                                             <span class="old_price">$178.00</span> -->
<!--                                         </div> -->
<!--                                         <div class="add_to_cart"> -->
<!--                                             <a href="cart.html" title="Add to cart">Add to Cart</a> -->
<!--                                         </div> -->
<!--                                         <div class="swatches-colors"> -->
<!--                                             <ul> -->
<!--                                                 <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="product_content list_content"> -->
<!--                                        <div class="swatches-colors"> -->
<!--                                             <ul> -->
<!--                                                 <li><a class="color1" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color2" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color4" href="javascript:void(0)"></a></li> -->
<!--                                                 <li><a class="color3" href="javascript:void(0)"></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                         <div class="product_rating"> -->
<!--                                            <ul> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                                <li><a href="#"><i class="icon icon-Star"></i></a></li> -->
<!--                                            </ul> -->
<!--                                         </div> -->
<!--                                         <h4 class="product_name"><a href="product-details.html">quidem totam, voluptatem quae quasi possimus</a></h4> -->
<!--                                         <div class="product_desc"> -->
<!--                                             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamcoâ¦</p> -->
<!--                                         </div> -->
<!--                                         <div class="price_box">  -->
<!--                                             <span class="current_price">$145.00</span> -->
<!--                                             <span class="old_price">$178.00</span> -->
<!--                                         </div> -->
                                        
<!--                                         <div class="action_links list_action_right"> -->
<!--                                             <ul> -->
<!--                                                  <li class="add_to_cart"><a href="cart.html" title="Add to cart">Add to Cart</a></li> -->
<!--                                                  <li class="quick_button"><a href="#" data-toggle="modal" data-target="#modal_box"  title="quick view"> <i class="icon icon-Eye"></i></a></li> -->
<!--                                                 <li class="wishlist"><a href="wishlist.html" title="Add to Wishlist"><i class="icon icon-Heart"></i></a></li>   -->
<!--                                                 <li class="compare"><a href="#" title="Add to Compare"><i class="icon icon-MusicMixer"></i></a></li> -->
<!--                                             </ul> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </figure> -->
<!--                             </article> -->
<!--                         </div> -->
                    </div>

                    <div class="shop_toolbar t_bottom">
                        <div class="pagination">
                            <ul>
                                <li class="current">1</li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li class="next"><a href="#">next</a></li>
                                <li><a href="#">>></a></li>
                            </ul>
                        </div>
                    </div>
                    <!--shop toolbar end-->
                    <!--shop wrapper end-->
                </div>
            </div>
        </div>
    </div>
    <!--shop  area end-->
    
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
<!--jquery min js-->
<script src="assets/js/vendor/jquery-3.4.1.min.js"></script>
<!--popper min js-->
<script src="assets/js/popper.js"></script>
<!--bootstrap min js-->
<script src="assets/js/bootstrap.min.js"></script>
<!--owl carousel min js-->
<script src="assets/js/owl.carousel.min.js"></script>
<!--slick min js-->
<script src="assets/js/slick.min.js"></script>
<!--magnific popup min js-->
<script src="assets/js/jquery.magnific-popup.min.js"></script>
<!--counterup min js-->
<script src="assets/js/jquery.counterup.min.js"></script>
<!--jquery countdown min js-->
<script src="assets/js/jquery.countdown.js"></script>
<!--jquery ui min js-->
<script src="assets/js/jquery.ui.js"></script>
<!--jquery elevatezoom min js-->
<script src="assets/js/jquery.elevatezoom.js"></script>
<!--isotope packaged min js-->
<script src="assets/js/isotope.pkgd.min.js"></script>
<!--slinky menu js-->
<script src="assets/js/slinky.menu.js"></script>
<!-- Plugins JS -->
<script src="assets/js/plugins.js"></script>

<!-- Main JS -->
<script src="assets/js/main.js"></script>



</body>

</html>