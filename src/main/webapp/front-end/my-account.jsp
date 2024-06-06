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
                       <h3>會員資訊</h3>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/index.jsp">首頁</a></li>
                            <li>會員資訊</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>         
    </div>
    <!--breadcrumbs area end-->
    
    <!-- my account start  -->
    <section class="main_content_area">
        <div class="container">   
            <div class="account_dashboard">
                <div class="row">
                    <div class="col-sm-12 col-md-3 col-lg-3">
                        <!-- Nav tabs -->
                        <div class="dashboard_tab_button">
                            <ul role="tablist" class="nav flex-column dashboard-list">
                                <li><a href="#login" data-toggle="tab" class="nav-link active">登入</a></li>
                                <li><a href="#orders" data-toggle="tab" class="nav-link">訂單資訊</a></li>
                                <li><a href="#address" data-toggle="tab" class="nav-link">地址資訊</a></li>
                                <li><a href="#account-details" data-toggle="tab" class="nav-link">帳號資訊</a></li>
                                <li><a href="#logout" class="nav-link">登出</a></li>
                            </ul>
                        </div>    
                    </div>
                    <div class="col-sm-12 col-md-9 col-lg-9">
                        <!-- Tab panes -->
                        <div class="tab-content dashboard_content">
                            <div class="tab-pane fade show active" id="dashboard">
                                <h3>Dashboard </h3>
                                <p>From your account dashboard. you can easily check &amp; view your <a href="#">recent orders</a>, manage your <a href="#">shipping and billing addresses</a> and <a href="#">Edit your password and account details.</a></p>
                            </div>
                            <div class="tab-pane fade" id="orders">
                                <h3>訂單資訊</h3>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>訂單編號</th>
                                                <th>訂單成立日期</th>
                                                <th>狀態</th>
                                                <th>訂單金額</th>
                                                <th>查看明細</th>	 	 	 	
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane" id="address">
                               <p>The following addresses will be used on the checkout page by default.</p>
                                <h4 class="billing-address">Billing address</h4>
                                <a href="#" class="view">Edit</a>
                                <p><strong>Bobby Jackson</strong></p>
                                <address>
                                    House #15<br>
                                    Road #1<br>
                                    Block #C <br>
                                    Banasree <br>
                                    Dhaka <br>
                                    1212
                                </address>
                                <p>Bangladesh</p>   
                            </div>
                            <div class="tab-pane fade" id="account-details">
                                <h3>帳號詳細資訊</h3>
                                <div class="login">
                                    <div class="login_form_container">
                                        <div class="account_login_form">
                                            <form action="#">
                                                <p>Already have an account? <a href="#">Log in instead!</a></p>
                                                <div class="input-radio">
                                                    <span class="custom-radio"><input type="radio" value="1" name="id_gender"> Mr.</span>
                                                    <span class="custom-radio"><input type="radio" value="1" name="id_gender"> Mrs.</span>
                                                </div> <br>
                                                <label>First Name</label>
                                                <input type="text" name="first-name">
                                                <label>Last Name</label>
                                                <input type="text" name="last-name">
                                                <label>Email</label>
                                                <input type="text" name="email-name">
                                                <label>Password</label>
                                                <input type="password" name="user-password">
                                                <label>Birthdate</label>
                                                <input type="text" placeholder="MM/DD/YYYY" value="" name="birthday">
                                                <span class="example">
                                                  (E.g.: 05/31/1970)
                                                </span>
                                                <br>
                                                <span class="custom_checkbox">
                                                    <input type="checkbox" value="1" name="optin">
                                                    <label>Receive offers from our partners</label>
                                                </span>
                                                <br>
                                                <span class="custom_checkbox">
                                                    <input type="checkbox" value="1" name="newsletter">
                                                    <label>Sign up for our newsletter<br><em>You may unsubscribe at any moment. For that purpose, please find our contact info in the legal notice.</em></label>
                                                </span>
                                                <div class="save_button primary_btn default_button">
                                                   <button type="submit">Save</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
        </div>        	
    </section>			
    <!-- my account end   --> 

   <!--footer area start-->
    <%@include file="/front-end/component/footer.jsp" %>
    <!--footer area end-->
    
<!-- JS
============================================ -->

<%@include file="/front-end/component/script.jsp" %>
<script src="${pageContext.request.contextPath}/front-end/assets/js/order/order.js"></script>


</body>

</html>