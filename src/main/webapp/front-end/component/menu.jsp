<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cart.model.*"%>
<%@ page import="java.util.*"%>


<!-- offcanvas menu area start -->
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
									class="icon icon-FullShoppingCart"></i><span id= "offcanvas_item_count" class="item_count">0</span></a>
							<!--mini cart-->
							<div class="mini_cart">
								<div id= "offcanvas_mini_cart" class="cart_gallery">
								
								</div>						
								<div class="cart_button">
									<a href="${pageContext.request.contextPath}/front-end/cart.jsp" id="offcanvas-view-cart-items"><i class="fa fa-shopping-cart"></i> 查看購物車</a>
								</div>					
							</div>
							<!--mini cart end-->
						</div>						
						<div class="header_account-list top_links">
							<a href="${pageContext.request.contextPath}/front-end/my-account.jsp"><i class="far fa-user"></i></a>
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
					<div id="menu" class="text-left ">
						<ul class="offcanvas_main_menu">
							<li class="menu-item-has-children ${currentPage == 'home' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/index.jsp?selectPage=home">首頁</a></li>
							<li class="menu-item-has-children ${currentPage == 'shop' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/front-end/shop.jsp?selectPage=shop">書籍商城</a></li>
<%-- 							<li class="menu-item-has-children ${currentPage == 'promotion' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/front-end/shop.jsp?selectPage=promotion">特價商品</a></li> --%>
							<li class="menu-item-has-children ${currentPage == 'article' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/front-end/article/popularArticle.jsp?selectPage=article">論壇</a></li>
							<li class="menu-item-has-children"><a href="#">聯絡我們</a></li>
							<li class="menu-item-has-children"><a href="#">客服相關</a>
								<ul class="sub-menu">
									<li><a href="#">關於我們</a></li>
									<li><a href="#">Frequently Questions</a></li>
									<li><a href="#">contact</a></li>
									<li><a href="#">login</a></li>
									<li><a href="#">Error 404</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- offcanvas menu area end -->

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
								<ul>
									<li><a class="${currentPage == 'home' ? 'active' : ''}" href="${pageContext.request.contextPath}/index.jsp?selectPage=home">首頁</a></li>
									<li><a class="${currentPage == 'shop' ? 'active' : ''}" href="${pageContext.request.contextPath}/front-end/shop.jsp?selectPage=shop">書籍商城</a></li>
<%-- 									<li><a class="${currentPage == 'promotion' ? 'active' : ''}" href="${pageContext.request.contextPath}/front-end/shop.jsp?selectPage=promotion">特價商品</a></li> --%>
									<li><a class="${currentPage == 'article' ? 'active' : ''}" href="${pageContext.request.contextPath}/front-end/article/popularArticle.jsp?selectPage=article">論壇</a></li>
									<li><a href="#">聯絡我們</a></li>
									<li><a href="#">客服相關<i class="fa fa-angle-down"></i></a>
										<ul class="sub_menu pages">
											<li><a href="#">關於我們</a></li>
											<li><a href="#">Frequently Questions</a></li>
											<li><a href="#">contact</a></li>
											<li><a href="#">login</a></li>
											<li><a href="#">Error 404</a></li>
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
									<form method="get" action="${pageContext.request.contextPath}/bookproducts.do">
                                            <select name="searchMain" style="opacity: 0.8; font-size: 20px; border-radius: 40px;">
                                                <option value="bookTitle">書籍名稱</option>
                                                <option value="author">作者</option>
                                                <option value="publishing_house">出版社</option>
                                                <option value="isbn">國際書碼(ISBN)</option>
                                            </select>
                                            <input type="hidden" name="action" value="query_bar">
                                            <input placeholder="請輸入關鍵字" type="text" name="Keywords" required autocomplete="off">
                                            <button type="submit"><span class="icon icon-Search"></span></button>
                                   </form>
								</div>
							</div>
							<div class="header_account-list  mini_cart_wrapper">
								<a href="javascript:void(0)">
								<i class="icon icon-FullShoppingCart"></i><span id="menu_item_count" class="item_count">0</span></a>
								<!--mini cart-->
								<div class="mini_cart">
									<div id= "menu_mini_cart" class="cart_gallery">
									
									</div>									
									<div class="cart_button">
										<a href="${pageContext.request.contextPath}/front-end/cart.jsp" id="menu-view-cart-items"><i class="fa fa-shopping-cart"></i> 查看購物車</a>
									</div>						
								</div>
								<!--mini cart end-->
							</div>
							<div class="header_account-list top_links">
								<a href="${pageContext.request.contextPath}/front-end/my-account.jsp"><i class="far fa-user"></i></a>
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
