<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String contextPath = request.getContextPath();
	String url = "/front-end/login/login.jsp";
	Integer userNumber = (Integer) session.getAttribute("userNumber");
	if (userNumber == null) {
	    response.sendRedirect(contextPath + url);
	    return;
	}
%>

<!DOCTYPE html>
<html class="no-js" lang="en">

<!-- head -->
<%@include file="/front-end/component/head.jsp" %>

<body>
	<!--menu area start-->
    <%@include file="/front-end/component/menu.jsp" %>
    
    <c:if test="${not empty userNumber}">
    	<input type="hidden" name="userNumber" id="getUserNumber" value="${userNumber}">
	</c:if>
    
    <!--menu area end-->
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
            <form method="post" id="cartForm" action="${pageContext.request.contextPath}/cart/cart.do"> 
                <div class="row">
                    <div class="col-12">
                        <div class="table_desc">
                            <div class="cart_page table-responsive">
                                <table id="full_cart">
		                            <thead>
		                                <tr>
		                                    <th>刪除</th>
		                                    <th>圖片</th>
		                                    <th>書籍名稱</th>
		                                    <th>價格</th>
		                                    <th>數量</th>
		                                    <th>金額</th>
		                                </tr>
		                            </thead>
		                            <tbody class="cart_tbody">
		                            	
		                            </tbody>
                        		</table>
                            </div>  
                            <div class="cart_submit">
                                <button type="button" class="btn_empty" id="cleanAllCart">全部清空</button>                              
                            </div>      
                        </div>
                     </div>
                 </div>
                 <!--coupon code area start-->
                <div class="coupon_area">
                    <div class="row">                        
                        <div class="col-lg-6 col-md-6 offset-md-6">
                            <div class="coupon_code right">
                                <h3>購物車總金額</h3>
                                <div class="coupon_inner">
                                   <div class="cart_subtotal">
                                       <p>商品總金額</p>
                                       <p class="cart_amount" id="data-subtotal"></p>
                                   </div>
                                   <div class="cart_subtotal">
                                       <p>運費</p>
                                       <p class="cart_amount" id="data-deliveryfee"></p>
                                   </div>
                                   <div class="cart_subtotal">
                                       <p>訂單總金額</p>
                                       <p class="cart_amount" id="data-total"></p>
                                   </div>
                                   <div class="checkout_btn">                                 		
			                           <button type="button" class="btn bg-gradient-primary btn-sm" id="checkoutBtn">去買單</button>   
			                           <input type="hidden" name="action" value="goToCheck">
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