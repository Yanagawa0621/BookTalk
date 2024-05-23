<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html class="no-js" lang="en">

<!-- head -->
<%@include file="/front-end/component/head.jsp" %>

<body>
	<!--header area start-->
    <%@include file="/front-end/component/menu.jsp" %>
    
    <!--header area end-->
	<!--breadcrumbs area start-->
    <div class="breadcrumbs_area">
        <div class="container">   
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb_content">
                       <h3>購物車</h3>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/index.jsp">首頁</a></li>
                            <li>購物車</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>         
    </div>
    <!--breadcrumbs area end-->
    
     <!--shopping cart area start -->

    <div class="shopping_cart_area mt-100">
        <div class="container">  
            <form method="post" action="${pageContext.request.contextPath}/cart/cart.do"> 
                <div class="row">
                    <div class="col-12">
                        <div class="table_desc">
                            <div class="cart_page table-responsive">
                                <table>
		                            <thead>
		                                <tr>
		                                    <th>刪除</th>
		                                    <th>圖片</th>
		                                    <th>書籍名稱</th>
		                                    <th>價格</th>
		                                    <th>數量</th>
		                                    <th>剩餘數量</th>
		                                    <th>金額</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                            	<c:forEach var="cartItem" items="${cartList}">
		                            		<tr>
			                                   <td><a href="#"><i class="far fa-trash-alt fa-2x"></i></a></td>
			                                   <td><a href="#"><img src="assets/img/s-product/product.jpg" alt=""></a></td>
			                                   <td><a href="#">${cartItem.bookTitle}</a></td>
			                                   <td>${cartItem.bookPrice}</td>
			                                   <td class="product_quantity"><label>數量</label><input min="1" max="${cartItem.bookStock}" value="${cartItem.quantity}" type="number"></td>
			                                   <td>${cartItem.bookStock}</td>
			                                   <td>${cartItem.subtotal}</td>
		                                	</tr>
		                                	<input type="hidden" name="userNumber" value="${cartItem.userNumber}">
		                            	</c:forEach>
		                            </tbody>
                        		</table>   
                            </div>  
                            <div class="cart_submit">
                                <button type="submit">更新購物車</button>                                
                            </div>      
                        </div>
                     </div>
                 </div>
                 <!--coupon code area start-->
                <div class="coupon_area">
                    <div class="row">                        
                        <div class="col-lg-12 col-md-12">
                            <div class="coupon_code right">
                                <h3>購物車總金額</h3>
                                <div class="coupon_inner">
                                   <div class="cart_subtotal">
                                       <p>商品總金額</p>
                                       <p class="cart_amount">£215.00</p>
                                   </div>
                                   <div class="cart_subtotal ">
                                       <p>運費總金額</p>
                                       <p class="cart_amount"><span>Flat Rate:</span> £255.00</p>
                                   </div>
                                   <a href="#">Calculate shipping</a>

                                   <div class="cart_subtotal">
                                       <p>總付款金額</p>
                                       <p class="cart_amount">£215.00</p>
                                   </div>
                                   <div class="checkout_btn">
                                       <a href="#">去買單</a>
                                   </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--coupon code area end-->
            </form> 
        </div>     
    </div>
    <!--shopping cart area end -->
    
    <!--footer area start-->
    <%@include file="/front-end/component/footer.jsp" %>
    <!--footer area end-->
 
<!-- JS
============================================ -->

<%@include file="/front-end/component/script.jsp" %>
	
</body>
</html>