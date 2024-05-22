<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    // 從URL參數或Session屬性中獲取當前頁面
    String selectPage = request.getParameter("selectPage");
    if (selectPage == null) {
    	selectPage = (String) session.getAttribute("currentPage");
        if (selectPage == null) {
        	selectPage = "home"; // 預設分頁
        }
    } else {
        session.setAttribute("currentPage", selectPage);
    }
%>

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>BOOK TALK</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/front-end/assets/img/favicon.ico">
    
    <!-- CSS 
    ========================= -->
    <!--bootstrap min css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/assets/css/bootstrap.min.css">
    <!--owl carousel min css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/assets/css/owl.carousel.min.css">
    <!--slick min css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/assets/css/slick.css">
    <!--magnific popup min css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/assets/css/magnific-popup.css">
    <!--font awesome css v4.7.0-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/assets/css/font.awesome.css">
    <!--ionicons min css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/assets/css/ionicons.min.css">
    <!--animate css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/assets/css/animate.css">
    <!--jquery ui min css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/assets/css/jquery-ui.min.css">
    <!--slinky menu css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/assets/css/slinky.menu.css">
    <!--plugins css-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/assets/css/plugins.css">    
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/front-end/assets/css/style.css">
    
    <!-- Font Awesome v5.15.4-->
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/back-end/plugins/fontawesome-free/css/all.min.css">
</head>