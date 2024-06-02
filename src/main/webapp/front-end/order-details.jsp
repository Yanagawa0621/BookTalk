<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html class="no-js" lang="en">

<!-- head -->
<%@include file="/front-end/component/head.jsp" %>

<!-- 星號更新用 -->
<style>
div.stars{
	display : inline-block;
}

div.stars > span.star{
	cursor:pointer;
	display: inline-block;
	margin-right: 3px;
}

div.stars > span.star.-on{
	color: gold;
}
</style>

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
                       <h3>訂單明細</h3>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/index.jsp">首頁</a></li>
                            <li>訂單明細</li>
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
            <form method="post" id="orderDetailsForm" action="${pageContext.request.contextPath}/order/order.do"> 
                <div class="row">
                    <div class="col-12">
                        <div class="table_desc">
                            <div class="cart_page table-responsive">
                            	<table id="orderDetalisList">
	                					<thead>
							              	<tr>
								               <th>圖片</th>
								               <th>書籍名稱</th>
								               <th>數量</th>		                    
								               <th>單價</th>		                    
							                </tr>
							              </thead>
							              <tbody>
								              <c:forEach var="orderDetailsVOs" items="${orderDetailsVOs}">
									              	<tr data-bookNumber="${orderDetailsVOs.bookNumber}" data-bookTitle="${orderDetailsVOs.bookProductsVO.bookTitle}">
									              		<td>
									              			<a href="${pageContext.request.contextPath}/bookproducts.do?bookNumber=${orderDetailsVOs.bookNumber}&action=single_product_page">
															<img src="${pageContext.request.contextPath}/bap/Img?bookNumber=${orderDetailsVOs.bookNumber}" width="70px" alt=""></a>
														</td>	                    
									                    <td>${orderDetailsVOs.bookProductsVO.bookTitle}</td>
									                    <td>${orderDetailsVOs.quantity}</td>
									                    <td>${orderDetailsVOs.unitPrice}</td>
									              	</tr>
									         </c:forEach>  
								       	</tbody>								      		
	                			</table>
                            </div>
                            <div class="cart_submit">
                            	<c:choose>
                            		<c:when test="${orderVO.orderStatus == 0}">
										<button type="button" class="btn_empty" id="orderCanceled" disabled>訂單已取消</button> 
								    </c:when>
								    <c:when test="${orderVO.orderStatus == 3}">
								        <button type="button" class="btn_empty" id="gofinishOrder">完成訂單</button>
								    </c:when>
								    <c:when test="${orderVO.orderStatus == 4}">
								    	<button type="button" class="btn_empty" id="goEvaluate">評價</button>
								    </c:when>
								    <c:when test="${orderVO.orderStatus == 5}">
								    	<div><h4>已完成</h4></div>
								    </c:when>
								    <c:otherwise>
								        <button type="button" class="btn_empty" id="finishOrder" disabled>完成訂單</button>
										<button type="button" class="btn_empty" id="cancelOrder">取消訂單</button>   
								    </c:otherwise>
								</c:choose>
				          </div>  
                        </div>
                     </div>
                 </div>
              </form>
                 <form method="post" id="orderList" name="newOrderDetailsForm" action="${pageContext.request.contextPath}/order/order.do">  
		            <div class="checkout_form">	
		                <div class="row">
		                    <div class="col-lg-6 col-md-6">                
		                            <h3>收貨人明細</h3>
		                            <div class="row">
		                            	<div class="col-lg-5 col-md-5 offset-md-1 mb-20"><h4>訂單編號</h4></div>							
			                            <div class="col-lg-6 col-md-6 mb-20"><h4 id="orderNumber">${orderVO.orderNumber}</h4></div>			
			                        </div>
			                        <div class="row">
		                            	<div class="col-lg-5 col-md-5 offset-md-1 mb-20"><h4>訂單狀態</h4></div>							
			                            <div class="col-lg-6 col-md-6 mb-20">
			                            	<c:if test = "${orderVO.orderStatus == 0}">
												<h4>取消</h4>
											</c:if>
											<c:if test = "${orderVO.orderStatus == 1}">
												<h4>已確認</h4>
											</c:if>
											<c:if test = "${orderVO.orderStatus == 2}">
												<h4>待出貨</h4>
											</c:if>
											<c:if test = "${orderVO.orderStatus == 3}">
												<h4>待收貨</h4>
											</c:if>
											<c:if test = "${orderVO.orderStatus == 4}">
												<h4>已完成 (尚未評價)</h4>
											</c:if>
											<c:if test = "${orderVO.orderStatus == 5}">
												<h4>已完成</h4>
											</c:if>
			                            </div>			
			                        </div>
			                        <div class="row">
		                            	<div class="col-lg-5 col-md-5 offset-md-1 mb-20"><h4>成立時間</h4></div>							
			                            <div class="col-lg-6 col-md-6 mb-20"><h4>${orderVO.establishmentTime}</h4></div>			
			                        </div>
			                        <div class="row">
		                            	<div class="col-lg-5 col-md-5 offset-md-1 mb-20"><h4>出貨時間</h4></div>							
			                            <div class="col-lg-6 col-md-6 mb-20"><h4>${orderVO.shippingTime}</h4></div>			
			                        </div>
			                        <div class="row">
		                            	<div class="col-lg-5 col-md-5 offset-md-1 mb-20"><h4>完成時間</h4></div>							
			                            <div class="col-lg-6 col-md-6 mb-20"><h4>${orderVO.completeTime}</h4></div>			
			                        </div>
			                        <div class="row">
		                            	<div class="col-lg-5 col-md-5 offset-md-1 mb-20"><h4>收件人</h4></div>							
			                            <div class="col-lg-6 col-md-6 mb-20"><h4>${orderVO.receiver}</h4></div>			
			                        </div>
			                        <div class="row">
		                            	<div class="col-lg-5 col-md-5 offset-md-1 mb-20"><h4>電話</h4></div>							
			                            <div class="col-lg-6 col-md-6 mb-20"><h4>${orderVO.telephoneNumber}</h4></div>			
			                        </div>
			                        <div class="row">
		                            	<div class="col-lg-5 col-md-5 offset-md-1 mb-20"><h4>收件地址</h4></div>							
			                            <div class="col-lg-6 col-md-6 mb-20"><h4>${orderVO.shippingAddress}</h4></div>			
			                        </div>
			                        <div class="row">
		                            	<div class="col-lg-5 col-md-5 offset-md-1 mb-20"><h4>付款編號</h4></div>							
			                            <div class="col-lg-6 col-md-6 mb-20"><h4>${orderVO.paymentNumber}</h4></div>			
			                        </div>
			                        <div class="row">
		                            	<div class="col-lg-5 col-md-5 offset-md-1 mb-20"><h4>備註</h4></div>							
			                            <div class="col-lg-6 col-md-6 mb-20"><h4>${orderVO.note}</h4></div>			
			                        </div>
		                       </div>
		                       <div class="col-lg-6 col-md-6">
		                            <div class="coupon_code right">
		                                <h3>訂單總金額</h3>
		                                <div class="coupon_inner">
		                                   <div class="cart_subtotal">
		                                       <p>商品總金額</p>
		                                       <p class="cart_amount" id="orderDetails-subtotal">$ ${subtotalSum}</p>
		                                   </div>
		                                   <div class="cart_subtotal">
		                                       <p>運費</p>
		                                       <p class="cart_amount" id="orderDetails-deliveryfee">$ ${orderVO.deliveryFee}</p>
		                                   </div>
		                                   <div class="cart_subtotal">
		                                       <p>訂單總金額</p>
		                                       <p class="cart_amount" id="dorderDetails-total">$ ${orderVO.total}</p>
		                                   </div>  
		                                </div>
		                            </div>
		                        </div>                      
		                   </div>
		               </div> 
		          	</form>
        	</div>     
    	</div>
    <!--shopping cart area end -->
    
    <!--footer area start-->
    <%@include file="/front-end/component/footer.jsp" %>
    <!--footer area end-->
    
    <!-- Modal -->
	<div class="modal fade" id="evaluateArea" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
	    <div class="modal-content">  
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="false"><i class="fas fa-window-close"></i></span>
	        </button>
	      <div class="modal-body">
	       	<div class="container my-4">
		        <div class="card">
		            <div class="card-header">
		                <h3 class="title">評價書籍</h3>
		            </div>
		            <div id="books">
			            <div class="card-body">
			                <div class="alert alert-warning">請提供您的寶貴評論！</div>
			                           
			            </div>
		            </div>
		            
		        </div>
		    </div>
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
<script src="${pageContext.request.contextPath}/front-end/assets/js/order/order.details.js"></script>


</body>
</html>