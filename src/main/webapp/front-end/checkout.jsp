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
                    <div class="col-lg-6 col-md-6">                
                            <h3>收貨人明細</h3>
                            <div class="row">
                                <div class="col-12 mb-20">
                                    <label>收件人 <span>*</span></label>
                                    <input type="text" name="receiver" required>    
                                </div>

                                <div class="col-12 mb-20">
                                    <label for="country">收件地址 <span>*</span></label>
                                    <select class="select_option" name="cuntry" id="country"> 
                                        <option value="2">bangladesh</option>      
                                        <option value="3">Algeria</option> 
                                        <option value="4">Afghanistan</option>    
                                        <option value="5">Ghana</option>    
                                        <option value="6">Albania</option>    
                                        <option value="7">Bahrain</option>    
                                        <option value="8">Colombia</option>    
                                        <option value="9">Dominican Republic</option>   

                                    </select>
                                </div>

                                <div class="col-12 mb-20">
                                    <label>收件地址  <span>*</span></label>
                                    <input type="text" name="shippingAddress"  required>     
                                </div>
 
                                <div class="col-lg-6 mb-20">
                                    <label>Phone<span>*</span></label>
                                    <input type="text"> 

                                </div> 
                                 <div class="col-lg-6 mb-20">
                                    <label> Email Address   <span>*</span></label>
                                      <input type="text"> 

                                </div> 
                                <div class="col-12 mb-20">
                                    <input id="account" type="checkbox" data-target="createp_account" />
                                    <label for="account" data-toggle="collapse" data-target="#collapseOne" aria-controls="collapseOne">Create an account?</label>

                                    <div id="collapseOne" class="collapse one" data-parent="#accordion">
                                        <div class="card-body1">
                                           <label> Account password   <span>*</span></label>
                                            <input placeholder="password" type="password">  
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 mb-20">
                                    <input id="address" type="checkbox" data-target="createp_account" />
                                    <label class="righ_0" for="address" data-toggle="collapse" data-target="#collapsetwo" aria-controls="collapseOne">Ship to a different address?</label>

                                    <div id="collapsetwo" class="collapse one" data-parent="#accordion">
                                       <div class="row">
                                            <div class="col-lg-6 mb-20">
                                                <label>First Name <span>*</span></label>
                                                <input type="text">    
                                            </div>
                                            <div class="col-lg-6 mb-20">
                                                <label>Last Name  <span>*</span></label>
                                                <input type="text"> 
                                            </div>
                                            <div class="col-12 mb-20">
                                                <label>Company Name</label>
                                                <input type="text">     
                                            </div>
                                            <div class="col-12 mb-20">
                                                <div class="select_form_select">
                                                    <label for="countru_name">country <span>*</span></label>
                                                    <select class="select_option" name="cuntry" id="countru_name"> 
                                                        <option value="2">bangladesh</option>      
                                                        <option value="3">Algeria</option> 
                                                        <option value="4">Afghanistan</option>    
                                                        <option value="5">Ghana</option>    
                                                        <option value="6">Albania</option>    
                                                        <option value="7">Bahrain</option>    
                                                        <option value="8">Colombia</option>    
                                                        <option value="9">Dominican Republic</option>   

                                                    </select>
                                                </div> 
                                            </div>

                                            <div class="col-12 mb-20">
                                                <label>Street address  <span>*</span></label>
                                                <input placeholder="House number and street name" type="text">     
                                            </div>
                                            <div class="col-12 mb-20">
                                                <input placeholder="Apartment, suite, unit etc. (optional)" type="text">     
                                            </div>
                                            <div class="col-12 mb-20">
                                                <label>Town / City <span>*</span></label>
                                                <input  type="text">    
                                            </div> 
                                             <div class="col-12 mb-20">
                                                <label>State / County <span>*</span></label>
                                                <input type="text">    
                                            </div> 
                                            <div class="col-lg-6 mb-20">
                                                <label>Phone<span>*</span></label>
                                                <input type="text"> 

                                            </div> 
                                             <div class="col-lg-6">
                                                <label> Email Address   <span>*</span></label>
                                                  <input type="text"> 

                                            </div> 
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="order-notes">
                                         <label for="order_note">備註</label>
                                        <textarea name="note" placeholder="Notes about your order, e.g. special notes for delivery."></textarea>
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
                                <button type="submit" class="btn bg-gradient-primary btn-sm">去付款</button>
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
    
    
<!-- JS
============================================ -->

<%@include file="/front-end/component/script.jsp" %>



</body>

</html>