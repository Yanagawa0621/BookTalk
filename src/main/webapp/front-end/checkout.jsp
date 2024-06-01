<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html class="no-js" lang="en">

<!-- head -->
<%@include file="/front-end/component/head.jsp" %>

<body>
	<!--menu area start-->
    <%@include file="/front-end/component/menu.jsp" %>
    
    <!--menu area end-->

    <!--breadcrumbs area start-->
    <div class="breadcrumbs_area">
        <div class="container">   
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb_content">
                       <h3>結帳</h3>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/index.jsp">首頁</a></li>
                            <li>結帳</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>         
    </div>
    <!--breadcrumbs area end-->
    
    <!--Checkout page section-->
    <div class="Checkout_section mt-100">
       <div class="container">
       	  <form method="post" id="form2" name="newOrderDetailsForm" action="${pageContext.request.contextPath}/order/order.do">  
            <div class="checkout_form">
            	<div class="row">
					<div class= "col-md-3">
						<c:if test="${not empty errorMsgs}">
							<font style="color: red">請修正以下錯誤:</font>
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li style="color: red">${message}</li>
								</c:forEach>
							</ul>
						</c:if>
					</div>
				</div>         	
                <div class="row">
                    <div class="col-lg-6 col-md-6">                
                            <h3>收貨人明細</h3>
                            <div class="row">
                                <div class="col-12 mb-20">
                                    <label><h4>收件人 <span>*</span></h4></label>
                                    <input type="text" name="receiver" id="checkReceiver" required>    
                                </div>

                                <div class="col-12 mb-20">
                                    <label><h4>收件地址 <span>*</span></h4></label>
                                </div>
                                
                                <div class="col-lg-6 mb-20">
                                	<label for="city">縣市 <span>*</span></label>
                                	<select id="city" class="select_option" name="cityName">
									    <option value="">請選擇縣市</option>
									</select>
                                </div>

                                <div class="col-lg-6 mb-20">
                                	<label for="district">鄉鎮市區 <span>*</span></label>
                                	<select id="district" class="select_option" name="districtName" disabled>
									    <option value="">請選擇縣市後再選擇鄉鎮市區</option>
									</select>
                                </div>
                                
                                <!-- 隱藏的input，用於儲存郵遞區號 -->
								<input type="hidden" id="postalCode" name="postalCode">
								
								<div class="col-12 mb-20">
                                    <input type="text" name="otherAddress" id="checkOtherAddress" required>    
                                </div>
 
                                <div class="col-lg-6 mb-20">
                                    <label><h4>電話<span>*</span></h4>(範例：0912345678，10個數字)</label>
                                    <input type="text" name="tel" id="checkTel" required> 

                                </div> 
                                 <div class="col-lg-6 mb-20">
                                    <label><h4>Email<span>*</span></h4>(範例：example@gmail.com)</label>
                                      <input type="text" name="email" id="checkEmail" required> 

                                </div> 
                                
                                <div class="col-12">
                                    <div class="order-notes">
                                         <label for="order_note"><h4>備註</h4></label>
                                        <textarea name="note" placeholder=""></textarea>
                                    </div>    
                                </div>     	    	    	    	    	    	    
                            </div>                   
                    	</div>
                    
            			<div class="col-lg-6 col-md-6">                          
                            <h3>訂單明細</h3> 
                            <div class="order_table table-responsive">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>書籍名稱</th>
                                            <th>價格</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="cartItem" items="${cartList}">
	                                        <tr>
	                                            <td>${cartItem.bookTitle}</td>
	                                            <td>$ ${cartItem.bookPrice}</td>
	                                        </tr>
                                      	</c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>商品總金額</th>
                                            <td>$ ${subtotalSum}</td>
                                        </tr>
                                        <tr>
                                            <th>運費</th>
                                            <td><strong>$ ${deliveryFee}</strong></td>
                                        </tr>
                                        <tr class="order_total">
                                            <th>訂單總金額</th>
                                            <td><strong>$ ${total}</strong></td>
                                        </tr>
                                    </tfoot>
                                </table>                                
                            </div>
                             <div class="order_button" align="right">
                                <button type="button" id="checkGoCheckout" class="btn btn-primary">去付款</button>
                                <input type="hidden" name="userNumber" value="4">	<!-- 先將會員編號設死，實際要動態取得 -->
                                <input type="hidden" name="action" value="checkout">	
                            </div>              
                    	</div>
                	</div> 
            	</div>
          	</form> 
        </div>       
    </div>
    <!--Checkout page section end-->

    <!--footer area start-->
    <%@include file="/front-end/component/footer.jsp" %>
    <!--footer area end-->
    
    <!-- Modal -->
	<div class="modal fade" id="confirmToCheckout" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
	    <div class="modal-content">  
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="false"><i class="ion-android-close"></i></span>
	        </button>
	      <div class="modal-body">
	        <h3>目前只提供信用卡付款，請確認是否繼續？</h3>
	      </div>
	      <div class="modal-footer">
	     	<button type="button" class="btn btn-primary" id="confirmButton">確定</button>
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
	      </div>
	    </div>
	  </div>
	</div>
    
    
<!-- JS
============================================ -->

<%@include file="/front-end/component/script.jsp" %>
<script src="${pageContext.request.contextPath}/front-end/assets/js/address/tw.address.js"></script>
<script src="${pageContext.request.contextPath}/front-end/assets/js/cart/checkout.js"></script>


</body>

</html>