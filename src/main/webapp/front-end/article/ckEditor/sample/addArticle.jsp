<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.article.model.*"%>
<%@ page import="com.forum.model.*"%>
<%
	String str = request.getParameter("forumNumber");
	Integer forumNumber=null;
	try{
		forumNumber = Integer.parseInt(str);
		ForumService forumSvc1 = new ForumService();
	    ForumVO forumVO = forumSvc1.getForumNumber(forumNumber);
	    pageContext.setAttribute("forumVO",forumVO);
	}catch (NumberFormatException e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html><!--
	Copyright (c) 2014-2024, CKSource Holding sp. z o.o. All rights reserved.
	This file is licensed under the terms of the MIT License (see LICENSE.md).
-->

<html lang="en" dir="ltr">
	<head>
		<title>CKEditor 5 ClassicEditor build</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="icon" type="image/png" href="https://c.cksource.com/a/1/logos/ckeditor5.png">
		<link rel="stylesheet" type="text/css" href="styles.css">
		<style>
			.centered {
				max-width: 100% !important; /* 最大寬度不超過視窗寬度 */
				margin: 0 auto; /* 在視窗中置中 */
			}
			.row-editor {
				width: 70%; /* 設置寬度為視窗寬度的 70% */
				margin: 0 auto; /* 讓元素水平置中 */
				resize:none;
			}
			.thisforum {
				width: 1400px; /* 設置表單的寬度為 400 像素 */
				/* height: 300px; 設置表單的高度為 300 像素 */
				overflow: hidden;
			}
		</style>
	</head>
	<jsp:useBean id="forumSvc" scope="page" class="com.forum.model.ForumService"/>
	<body data-editor="ClassicEditor" data-collaboration="false" data-revision-history="false">
		<div class="centered">
			<div class="row row-editor">
				<div class="editor-container" style="padding:32px;">
					<form class="thisforum" action="<%=request.getContextPath()%>/article/article.do" method="post"  onsubmit="return validateForm()">
						看板:${forumVO.name}
						作者:${sessionScope.userNumber}
						<br>
						標題:
						<input type="text" name = "title" required style="width:94.5%; height:30px;">
						<textarea id="content" name="content" class="editor"></textarea>
						<input type="hidden" name="forumNumber" value="${forumVO.forumNumber}">
						<input type="hidden" name="action" value="insert">
						<input type="submit" value="送出新增">
					</form>
				</div>
			</div>
		</div>
		<script src="../build/ckeditor.js"></script>
		<script src="script.js"></script>
		
		<script type="text/javascript">
		
			function validateForm() {
			    var content = editor.getData();
			    if (content === "") {
			        alert("內容不能為空！");
			        return false; // 阻止表單提交
			    }
			    return true; // 允許表單提交
			}

		</script>
	</body>
</html>