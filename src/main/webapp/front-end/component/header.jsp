<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--offcanvas menu area start-->
<div class="off_canvars_overlay"></div>
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
									<button type="submit">
										<span class="icon icon-Search"></span>
									</button>
								</form>
							</div>
						</div>
						<div class="header_account-list  mini_cart_wrapper">
							<a href="javascript:void(0)"><i
								class="icon icon-FullShoppingCart"></i><span class="item_count">2</span></a>
							<!--mini cart-->
							<div class="mini_cart">
								<div class="cart_gallery">
									<div class="cart_item">
										<div class="cart_img">
											<a href="#"><img src="${pageContext.request.contextPath}/front-end/assets/img/s-product/product.jpg" alt=""></a>
										</div>
										<div class="cart_info">
											<a href="#">Lorem ipsum dolor sit amet, consectetur</a>
											<p>
												1 x <span> $65.00 </span>
											</p>
										</div>
										<div class="cart_remove">
											<a href="#"><i class="ion-ios-close-outline"></i></a>
										</div>
									</div>
									<div class="cart_item">
										<div class="cart_img">
											<a href="#"><img src="${pageContext.request.contextPath}/front-end/assets/img/s-product/product2.jpg" alt=""></a>
										</div>
										<div class="cart_info">
											<a href="#">impedit dolor sed soluta natus voluptas.</a>
											<p>
												1 x <span> $60.00 </span>
											</p>
										</div>
										<div class="cart_remove">
											<a href="#"><i class="ion-ios-close-outline"></i></a>
										</div>
									</div>
								</div>
								<div class="mini_cart_table">
									<div class="cart_table_border">
										<div class="cart_total">
											<span>Sub total:</span> <span class="price">$125.00</span>
										</div>
										<div class="cart_total mt-10">
											<span>total:</span> <span class="price">$125.00</span>
										</div>
									</div>
								</div>
								<div class="mini_cart_footer">
									<div class="cart_button">
										<a href="cart.jsp"><i class="fa fa-shopping-cart"></i>
											View cart</a>
									</div>
									<div class="cart_button">
										<a href="checkout.jsp"><i class="fa fa-sign-in"></i>
											Checkout</a>
									</div>

								</div>
							</div>
							<!--mini cart end-->
						</div>
						<div class="header_account-list top_links">
							<a href="javascript:void(0)"><i class="far fa-user"></i></a>
							<div class="dropdown_links">
								<div class="dropdown_links_list">
									<h3>$Currency</h3>
									<ul>
										<li><a href="#">€ Euro</a></li>
										<li><a href="#">£ Pound Sterling</a></li>
										<li><a href="#">$ US Dollar</a></li>
									</ul>
								</div>
								<div class="dropdown_links_list">
									<h3><img src="${pageContext.request.contextPath}/front-end/assets/img/icon/language.png" alt=""> English</h3>
									<ul>
										<li><a href="#"><img src="${pageContext.request.contextPath}/front-end/assets/img/icon/language.png" alt=""> English</a></li>
										<li><a href="#"><img src="${pageContext.request.contextPath}/front-end/assets/img/icon/language2.png" alt=""> Germany</a></li>
									</ul>
								</div>
								<div class="dropdown_links_list">
									<h3>$Currency</h3>
									<ul>
										<li><a href="#">€ Euro</a></li>
										<li><a href="#">£ Pound Sterling</a></li>
										<li><a href="#">$ US Dollar</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div id="menu" class="text-left ">
						<ul class="offcanvas_main_menu">
							<li class="menu-item-has-children active"><a href="#">Home</a>
								<ul class="sub-menu">
									<li><a href="index.html">Home 1</a></li>
									<li><a href="index-2.html">Home 2</a></li>
									<li><a href="index-3.html">Home 3</a></li>
									<li><a href="index-4.html">Home 4</a></li>
								</ul></li>
							<li class="menu-item-has-children"><a href="#">Shop</a>
								<ul class="sub-menu">
									<li class="menu-item-has-children"><a href="#">Shop
											Layouts</a>
										<ul class="sub-menu">
											<li><a href="shop.html">shop</a></li>
											<li><a href="shop-fullwidth.html">Full Width</a></li>
											<li><a href="shop-fullwidth-list.html">Full Width
													list</a></li>
											<li><a href="shop-right-sidebar.html">Right Sidebar
											</a></li>
											<li><a href="shop-right-sidebar-list.html"> Right
													Sidebar list</a></li>
											<li><a href="shop-list.html">List View</a></li>
										</ul></li>
									<li class="menu-item-has-children"><a href="#">other
											Pages</a>
										<ul class="sub-menu">
											<li><a href="${pageContext.request.contextPath}/front-end/cart.jsp">cart</a></li>
											<li><a href="wishlist.html">Wishlist</a></li>
											<li><a href="checkout.html">Checkout</a></li>
											<li><a href="my-account.html">my account</a></li>
											<li><a href="404.html">Error 404</a></li>
										</ul></li>
									<li class="menu-item-has-children"><a href="#">Product
											Types</a>
										<ul class="sub-menu">
											<li><a href="product-details.html">product details</a></li>
											<li><a href="product-sidebar.html">product sidebar</a></li>
											<li><a href="product-grouped.html">product grouped</a></li>
											<li><a href="variable-product.html">product variable</a></li>
										</ul></li>
								</ul></li>
							<li class="menu-item-has-children"><a href="#">blog</a>
								<ul class="sub-menu">
									<li><a href="blog.html">blog</a></li>
									<li><a href="blog-details.html">blog details</a></li>
									<li><a href="blog-fullwidth.html">blog fullwidth</a></li>
									<li><a href="blog-sidebar.html">blog sidebar</a></li>
								</ul></li>
							<li class="menu-item-has-children"><a href="#">pages </a>
								<ul class="sub-menu">
									<li><a href="about.html">About Us</a></li>
									<li><a href="services.html">services</a></li>
									<li><a href="faq.html">Frequently Questions</a></li>
									<li><a href="contact.html">contact</a></li>
									<li><a href="login.html">login</a></li>
									<li><a href="404.html">Error 404</a></li>
								</ul></li>
							<li class="menu-item-has-children"><a href="contact.html">
									Contact Us</a></li>
							<li class="menu-item-has-children"><a href="shop.html">
									Specials</a></li>
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
			<div class="header_container color_two">
				<div class="row align-items-center">
					<div class="col-lg-2">
						<div class="logo">
							<a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/front-end/assets/img/logo/logo3.png" alt=""></a>
						</div>
					</div>
					<div class="col-lg-8">
						<!--main menu start-->
						<div class="main_menu menu_three menu_position">
							<nav>
								<ul style>
									<li><a class="active" href="${pageContext.request.contextPath}/index.jsp">首頁</a></li>
									<li><a href="shop.html">書籍商城</a></li>
									<li><a href="shop.html">特價商品</a></li>
									<li><a href="blog.html">論壇</a></li>
									<li><a href="contact.html">聯絡我們</a></li>
									<li><a href="#">客服相關<i class="fa fa-angle-down"></i></a>
										<ul class="sub_menu pages">
											<li><a href="about.html">關於我們</a></li>
											<li><a href="faq.html">Frequently Questions</a></li>
											<li><a href="contact.html">contact</a></li>
											<li><a href="login.html">login</a></li>
											<li><a href="404.html">Error 404</a></li>
										</ul></li>
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
										<input placeholder="Search entire store here ..." type="text">
										<button type="submit">
											<span class="icon icon-Search"></span>
										</button>
									</form>
								</div>
							</div>
							<div class="header_account-list  mini_cart_wrapper">
								<a href="javascript:void(0)"><i
									class="icon icon-FullShoppingCart"></i><span class="item_count">2</span></a>
								<!--mini cart-->
								<div class="mini_cart">
									<div class="cart_gallery">
										<div class="cart_item">
											<div class="cart_img">
												<a href="#"><img src="${pageContext.request.contextPath}/front-end/assets/img/s-product/product.jpg" alt=""></a>
											</div>
											<div class="cart_info">
												<a href="#">Lorem ipsum dolor sit amet, consectetur</a>
												<p>
													1 x <span> $65.00 </span>
												</p>
											</div>
											<div class="cart_remove">
												<a href="#"><i class="ion-ios-close-outline"></i></a>
											</div>
										</div>
										<div class="cart_item">
											<div class="cart_img">
												<a href="#"><img src="${pageContext.request.contextPath}/front-end/assets/img/s-product/product2.jpg" alt=""></a>
											</div>
											<div class="cart_info">
												<a href="#">impedit dolor sed soluta natus voluptas.</a>
												<p>
													1 x <span> $60.00 </span>
												</p>
											</div>
											<div class="cart_remove">
												<a href="#"><i class="ion-ios-close-outline"></i></a>
											</div>
										</div>
									</div>
									<div class="mini_cart_table">
										<div class="cart_table_border">
											<div class="cart_total">
												<span>Sub total:</span> <span class="price">$125.00</span>
											</div>
											<div class="cart_total mt-10">
												<span>total:</span> <span class="price">$125.00</span>
											</div>
										</div>
									</div>
									<div class="mini_cart_footer">
										<div class="cart_button">
											<a href="${pageContext.request.contextPath}/front-end/cart.jsp"><i class="fa fa-shopping-cart"></i> 查看購物車</a>
										</div>
										<div class="cart_button">
											<a href="checkout.html"><i class="fas fa-sign-in-alt"></i> 結帳</a>
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