<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="no-js" lang="en">

<!-- head -->
<%@include file="/front-end/component/head.jsp" %>

<body>
    <!-- menu area start -->
    <%@include file="/front-end/component/menu.jsp" %>
    <!-- menu area end -->
    
    <!-- breadcrumbs area start -->
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
    <!-- breadcrumbs area end -->
    
    <!-- my account start  -->
    <section class="main_content_area">
        <div class="container">   
            <div class="account_dashboard">
                <div class="row">
                    <div class="col-sm-12 col-md-3 col-lg-3">
                        <!-- Nav tabs -->
                        <div class="dashboard_tab_button">
                            <ul role="tablist" class="nav flex-column dashboard-list">
                                <li>
                                    <c:choose>
                                        <c:when test="${not empty sessionScope.loggedInUser}">
                                            歡迎, ${sessionScope.userName} (userNumber: ${sessionScope.userNumber})
                                        </c:when>
                                        <c:otherwise>
                                            <jsp:include page="/front-end/login/login.jsp" />
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                                <li><a href="#orders" data-toggle="tab" class="nav-link">訂單資訊</a></li>
                                <li><a href="#address" data-toggle="tab" class="nav-link">地址資訊</a></li>
                                <li><a href="#account-details" data-toggle="tab" class="nav-link">帳號資訊</a></li>
                                <li><a href="${pageContext.request.contextPath}/front-end/login/logout.jsp" class="nav-link">登出</a></li>
                            </ul>
                        </div>    
                    </div>
                    <div class="col-sm-12 col-md-9 col-lg-9">
                        <!-- Tab panes -->
                        <div class="tab-content dashboard_content">
                            <div class="tab-pane fade show active" id="dashboard">
                                <h3>Dashboard</h3>
                                <p>From your account dashboard, you can easily check & view your recent orders, manage your shipping and billing addresses, and edit your password and account details.</p>
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
                                            <!-- 訂單資訊表格內容 -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="address">
                                <!-- Include address_info.jsp here -->
                                <jsp:include page="/front-end/address_info.jsp" />
                            </div>
                            <div class="tab-pane fade" id="account-details">
                                <h3>帳號詳細資訊</h3>
                                <!-- Include account_details.jsp here -->
                                <jsp:include page="/front-end/account_details.jsp" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
    </section>			
    <!-- my account end   --> 

   <!-- footer area start -->
    <%@include file="/front-end/component/footer.jsp" %>
    <!-- footer area end -->
    
<!-- JS -->
<%@include file="/front-end/component/script.jsp" %>

</body>
</html>
