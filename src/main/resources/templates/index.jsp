<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>index.jsp - Maven - Spring MVC - JSP Demo</title>

<link rel="stylesheet" href="<spring:url value='/webjars/bootstrap/4.2.1/css/bootstrap.min.css'/>"/>
<link rel="stylesheet" href="<spring:url value='/css/index.css'/>"/>

<link rel="stylesheet" href="<spring:url value='/out-statics/out-css/style.css'/>"/>
<script src="<spring:url value='/out-statics/out-js/app4.js'/>"></script>
</head>
<body>

<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top justify-content-center" onclick="changeColor()">
		 <div align="center"><h2 style="font-size: 30px ; width: max-content;">
		 <span class="hello-color">Hello, ${message} : </span> Spring Boot + Spring MVC + JSP3 
		 （
		 <img width="95px"  height="80px" src="<spring:url value='/images/spring boot.png'/>"> + 
		 <img width="95px"  height="80px" src="<spring:url value='/images/spring mvc.png'/>"> + 
		 <img width="100px" height="80px" src="<spring:url value='/images/jsp.png'/>">
		 ）
		 </h2><h3><a class="navbar-brand" href="https://docs.spring.io/spring-framework/docs/current/reference/html/web.html">
		 Spring Web MVC 官網 : https://docs.spring.io/spring-framework/docs/current/reference/html/web.html</a></h3></div>
</nav>

<!-- 	<main role="main" class="container"> -->
       <div class="starter-template">
           <span class="color1" id="title1">前端展示層(View) - 仍然保持著使用JSP技術</span>
           <h1><a href="https://spring.io/projects/spring-boot" class="index-green" id="title2">Spring Boot</a> <font color=black>+</font> 
               <a href="https://maven.apache.org/">Maven</a> ->&nbsp;
               <a href="https://docs.spring.io/spring-framework/docs/current/reference/html/web.html" class="index-green" id="title3">Spring MVC</a> <font color=black>+</font>
               <a href="https://www.tibame.com/course/33" class="index-green" id="title4">JSP3</a> ->&nbsp;
               <a href="https://www.tibame.com/course/33">Java WebApp</a>
           </h1><hr><br>
           <h3><a href="<spring:url value='/emp/select_page'/>" style="text-decoration:underline;color: black;">Click here to Spring MVC + JSP Project</a></h3>
       </div>
       
       <div style="float: right;left: -80.5%;position: relative;">
         開發順序:
         <ol style="float: left;left: 100%;position: relative;">
			<c:forEach var="listValue" items="${myList}">
				<li>${listValue}</li>
			</c:forEach>
	     </ol>
	   </div>
<!--     </main> -->

</body>
</html>