<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.article.model.*"%>
<%@ page import="com.forum.model.*"%>
<%@ page import="com.user.model.*"%>

<%
	ArticleService articleSvc = new ArticleService();
	List<ArticleVO> list = articleSvc.getPopularArticle();
	pageContext.setAttribute("list",list);
%>
<!doctype html>
<html class="no-js" lang="en">


<%@include file="/front-end/component/head.jsp" %>
    <style>
      	.modal-body p {
            line-height: 2; /* 调整行高 */
            margin-bottom: 20px; /* 调整段间距 */ 
	  	}
	  	.modal-footer {
	        text-align: center; /* 将输入框置中 */
		}
		.modal-form{
			display: flex;
			align-items: flex-start;
			width: 90%;
		}
		.comment-input {
		    width: 80%; /* 设置输入框宽度为容器的 90% */
		    height:50px;
		    padding: 10px; /* 设置内边距 */
		    border: 1px solid #ccc; /* 设置边框 */
		    border-radius: 5px; /* 设置边框圆角 */
		    box-sizing: border-box; /* 让边框宽度不会增加输入框的宽度 */
		}
		.form-input{
			height:50px;
		}
		.comment-area{
			border-bottom: 1px solid #4d4d4d;
		}
		.like-area {
		    display: flex;
		    align-items: center;
		}
		
		.like-area .like-button, .like-area .unlike-button {
		    margin-right: 10px;
		}
		
		.like-area .like-count {
		    font-size: 16px;
		    color: #333;
		    margin: 0;
		    padding-left: 10px;
		}
		.delete-form{
			margin-right: auto;
		}
		.article-button-area{
			display: flex;
		}

		.likeCom-area {
		    display: flex;
		    align-items: center; /* 垂直居中对齐 */
		}
		
		.likeCom-area .likeCom-button, .likeCom-area .unlikeCom-button {
		    margin-right: 0px;
		}
		
		.likeCom-area .likeCom-count {
		    font-size: 16px;
		    color: #333;
		    margin: 0;
		    padding: 10px;
		    margin-top: 0;
		}
 	 </style>


<body>
   
	<!--menu area start-->
    <%@include file="/front-end/component/menu.jsp" %>
    
    <!--breadcrumbs area start-->
    <div class="breadcrumbs_area">
        <div class="container">   
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb_content">
                        <h3>熱門文章</h3>
                        <ul>
                            <li><a href="index.html">home</a></li>
                            <li>熱門文章</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>         
    </div>
    <!--breadcrumbs area end-->
    
<!--*****************************blog area start***********************************-->
    <div class="blog_page_section mt-100">
        <div class="container">
            <div class="row">
                <div class="col-lg-9 col-md-12">
                    <div class="blog_wrapper">
                    <%@include file="/front-end/article/page1.file" %>
                    <c:forEach var="articleVO" items="${list}" varStatus="loop" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                        <c:if test="${articleVO.articleState == 1}">
	                        <article class="single_blog">
	                            <figure>
	                                <div class="blog_thumb">
	                                    ${articleVO.articleImage }
	                                </div>
	                                <figcaption class="blog_content">
	                                   <h4 class="post_title"><a href="#" onclick="event.preventDefault();"data-toggle="modal" data-target="#lightboxModal${loop.index}"><i class="fa fa-paper-plane"></i>${articleVO.title}</a></h4>
	                                   <!-- Modal -->
										<div class="modal fade" id="lightboxModal${loop.index}" tabindex="-1" role="dialog" aria-labelledby="lightboxModalLabel" aria-hidden="true">
										  <div class="modal-dialog modal-lg" role="document">
										    <div class="modal-content">
										      <div class="modal-header">
										        <h5 class="modal-title" id="lightboxModalLabel"style="font-size: 30px;">${articleVO.title}</h5>
										        <c:if test="${articleVO.userNumber == sessionScope.userNumber}">
										        	<div class="article-button-area">
										        	<form action="<%= request.getContextPath()%>/front-end/article/ckEditor/sample/updateArticle.jsp">
						                                <input type="hidden" name="articleNumber" value="${articleVO.articleNumber}" >
						                                <button type="submit">編輯文章</button>
						                            </form>
						                            <form action="<%=request.getContextPath()%>/article/article.do">
											        	<input type="hidden" name="action" value="delete">
											        	<input type="hidden" name="articleNumber" value="${articleVO.articleNumber}">
											    		<input type="submit" value="刪除" style="background:red;">
													</form>
													</div>
										        </c:if>
										        <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close">
										          <span aria-hidden="true">&times;</span>
										        </button>-->
										      </div> 
										      <div class="modal-body" style="font-size: 18px; padding: 30px;">
											        <!-- 燈箱内容區域 -->
												    ${articleVO.content}
												    <jsp:useBean id="likeSvc" scope="page" class="com.likeRecord.model.LikeService"/>
													<c:set var="userNumber" value="${sessionScope.userNumber}" />
													<c:set var="articleNumber" value="${articleVO.articleNumber}" />
													<c:set var="likeStatus" value="${likeSvc.getArticleLike(userNumber, articleNumber)}" />
													<c:choose>
												    <c:when test="${likeStatus == 1}">
												    	<div class="like-area">
													        <button id="like-button-${articleVO.articleNumber}" class="like-button" style="display: none;" onclick="like(${articleVO.articleNumber});"><i class="far fa-thumbs-up"></i></button>
													        <button id="unlike-button-${articleVO.articleNumber}" class="unlike-button" style="background:white;"onclick="unlike(${articleVO.articleNumber});"><i class="fas fa-thumbs-up"></i></button>
												    		<p class="like-count">${articleVO.likeSum}</p>
												    	</div>
												    </c:when>
												    <c:otherwise>
												    	<div class="like-area">
													        <button id="like-button-${articleVO.articleNumber}" class="like-button"  onclick="like(${articleVO.articleNumber});"><i class="far fa-thumbs-up"></i></button>
													        <button id="unlike-button-${articleVO.articleNumber}" class="unlike-button" style="display: none;" onclick="unlike(${articleVO.articleNumber});"><i class="fas fa-thumbs-up"></i></button>
													    	<p id="likeSum-count-${articleVO.articleNumber}" class="like-count">${articleVO.likeSum}</p>
													    </div>
												    </c:otherwise>
												</c:choose>
												<hr>
													    <jsp:useBean id="userVO" scope="page" class="com.user.model.UserServiceImpl"/>
											    <c:forEach var="commentVO" items="${articleVO.commentVO}">
											    	<c:if test="${commentVO.commentState == 1}">
													    <div class="comment-area-${commentVO.commentNumber}"> 
													    <c:set var="number" value="${commentVO.userNumber}"/>
													    <c:set var="user" value="${userVO.getUserByNumber(number)}"/>
													    	<p>${user.name}</p> 
													    	<p>${commentVO.content}</p> 
													    	<p>${commentVO.commentTime}</p>
													    	<jsp:useBean id="likeSvcCom" scope="page" class="com.likeRecord.model.LikeService"/>
															<c:set var="userNumberCom" value="${sessionScope.userNumber}" />
															<c:set var="commentNumber" value="${commentVO.commentNumber}" />
															<c:set var="likeStateCom" value="${likeSvcCom.getCommentLike(userNumberCom, commentNumber)}" />
															<c:choose>
															    <c:when test="${likeStateCom == 1}">
															    	<div class="likeCom-area">
																        <button id="likeCom-button-${commentVO.commentNumber}" class="likeCom-button" style="display: none;" onclick="likeCom(${commentVO.commentNumber});"><i class="far fa-thumbs-up"></i></button>
																        <button id="unlikeCom-button-${commentVO.commentNumber}" class="unlikeCom-button" style="background:white;" onclick="unlikeCom(${commentVO.commentNumber});"><i class="fas fa-thumbs-up"></i></button>
																        <p id="likeSumCom-count-${commentVO.commentNumber}" class="likeCom-count">${commentVO.likeSum}</p>
																        <c:if test="${commentVO.userNumber == sessionScope.userNumber}">
																	        <button class="updateCom-button"onclick="openUpdateText(${commentVO.commentNumber},'${commentVO.content}');">更新</button>
																	        <form class="delete-form" onsubmit="event.preventDefault(); deleteComment(${commentVO.commentNumber});">
																	    		<input type="submit" value="刪除" style="background:red;">
																	    	</form>
																    	</c:if>
															    	</div>
															    </c:when>
															    <c:otherwise>
															    	<div class="likeCom-area">
																        <button id="likeCom-button-${commentVO.commentNumber}" class="likeCom-button"onclick="likeCom(${commentVO.commentNumber});"><i class="far fa-thumbs-up"></i></button>
																        <button id="unlikeCom-button-${commentVO.commentNumber}" class="unlikeCom-button" style="background:white; display: none;" onclick="unlikeCom(${commentVO.commentNumber});"><i class="fas fa-thumbs-up"></i></button>
																   		<p id="likeSumCom-count-${commentVO.commentNumber}" class="likeCom-count">${commentVO.likeSum}</p>
																   		<c:if test="${commentVO.userNumber == sessionScope.userNumber}">
																	        <button class="updateCom-button"onclick="openUpdateText(${commentVO.commentNumber},'${commentVO.content}');">更新</button>
																	        <form class="delete-form" onsubmit="event.preventDefault(); deleteComment(${commentVO.commentNumber});">
																	    		<input type="submit" value="刪除" style="background:red;">
																	    	</form>
																    	</c:if>
																    </div>
															    </c:otherwise>
															</c:choose>
												    	</div>
												    	<hr>
										        	</c:if>
										        </c:forEach>
										      </div>
										      <div class="modal-footer">
										        <form class="modal-form" onsubmit="event.preventDefault(); submitComment(${articleVO.articleNumber});">
													<textarea id="comment${articleVO.articleNumber}" class="comment-input" placeholder="输入留言..." required></textarea>
													<input class ="form-input" type="submit" value="新增" >
												</form>
										      </div>
										    </div>
										  </div>
										</div>
										
	                                    <div class="blog_meta">
	                                    <c:set var="ArticleUserNumber" value="${articleVO.userNumber}"/>
	                                    <c:set var="userName" value="${userVO.getUserByNumber(ArticleUserNumber)}"/>
	                                        <p>作者:${userName.name} / 發文日期: ${articleVO.issueTime} / 看板: ${articleVO.forumVO.name}</p>
	                                    </div>
	                                    <p class="post_desc">${articleVO.articleSummary}</p>
	                                    <!-- <footer class="btn_more">
	                                        <a href="#"> Read more</a>
	                                    </footer> -->
	                                </figcaption>
	                            </figure>
	                        </article>
                        </c:if>
                    </c:forEach> 
                    </div>
                </div>  
                <div class="col-lg-3 col-md-12">
                    <div class="blog_sidebar_widget">
                    	<div class="widget_list widget_search">
                            <div class="widget_title">
                                <h3>發文</h3>
                            </div>
                            <form action="<%= request.getContextPath() %>/front-end/article/ckEditor/sample/addForumArticle.jsp">
                                <button class="post-button" type="submit">發文</button>
                            </form>
                        </div>
                        <div class="widget_list widget_search">
                            <div class="widget_title">
                                <h3>搜尋</h3>
                            </div>
                            <form action="<%= request.getContextPath()%>/article/article.do">
                                <input placeholder="Search..." type="text" name="title" required>
                                <input type="hidden" name="action" value="getName_For_Display">
                                <button type="submit">搜尋</button>
                            </form>
                        </div>
                        <%
						    ForumService forumSvc = new ForumService();
						    List<ForumVO> list1 = forumSvc.getAll();
						    pageContext.setAttribute("list1",list1);
						%>
                        <div class="widget_list comments">
                           <div class="widget_title">
                                <h3>所有看板</h3>
                            </div>
                          
                            <c:forEach var="forumVO" items="${list1}">
                            <div class="post_wrapper">
                                <div class="post_info">                                    
                                     <c:url var="forumUrl" value="/front-end/article/forumsArticle.jsp">
				                        <c:param name="forumNumber" value="${forumVO.forumNumber}" />
				                    </c:url>
				                    <a href="${forumUrl}">${forumVO.name}</a>
                                </div>
                            </div>
                            <hr>
                            </c:forEach>
                        </div>
                        <div class="widget_list widget_post">

                        </div>
                        <div class="widget_list widget_categories">
                           
                        </div>
                        <div class="widget_list widget_tag">
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--blog area end-->
    
    <!--blog pagination area start-->
    <div class="blog_pagination">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="pagination">
                        <ul>
                        	<%@include file="/front-end/article/page2.file" %>
                            <!--  <li class="current">1</li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li class="next"><a href="#">next</a></li>
                            <li><a href="#">>></a></li>-->
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--blog pagination area end-->
   
  <!--footer area start-->
    <%@include file="/front-end/component/footer.jsp" %>
    <!--footer area end-->
 
<!-- JS
============================================ -->


<%@include file="/front-end/component/script.jsp" %>
<script type="text/javascript">
//新增留言 之後須加上userNumber

var contextPath = "<%= request.getContextPath() %>";
var userID = "${sessionScope.userNumber != null ? sessionScope.userNumber : ''}";

window.onload = function() {
    if (!userID) {
        console.log("userID 未抓到值");
        // 这里可以进行相应的处理，如禁用某些功能或显示提示信息
        var formInputs = document.getElementsByClassName("form-input");
        for (var i = 0; i < formInputs.length; i++) {
            formInputs[i].disabled = true;
        }

        var postButtons = document.getElementsByClassName("post-button");
        for (var i = 0; i < postButtons.length; i++) {
            postButtons[i].disabled = true;
        }

        var likeButtons = document.getElementsByClassName("like-button");
        for (var i = 0; i < likeButtons.length; i++) {
            likeButtons[i].disabled = true;
        }

        var unlikeButtons = document.getElementsByClassName("unlike-button");
        for (var i = 0; i < unlikeButtons.length; i++) {
            unlikeButtons[i].disabled = true;
        }
        var unlikeButtons = document.getElementsByClassName("likeCom-button");
        for (var i = 0; i < unlikeButtons.length; i++) {
            unlikeButtons[i].disabled = true;
        }
        var unlikeButtons = document.getElementsByClassName("unlikeCom-button");
        for (var i = 0; i < unlikeButtons.length; i++) {
            unlikeButtons[i].disabled = true;
        }

    } else {
        console.log("userID 抓到的值为: " + userID);
        // 这里可以进行其他初始化操作
    }
};

function submitComment(articleNumber) {
    var comment = $("#comment" + articleNumber).val();
    $.ajax({
        type: "POST",
        url: contextPath + "/comment/comment.do",
        data: {
            action: "insert",
            content: comment,
            articleNumber: articleNumber
        },
        success: function(response) {
            alert("新增留言成功");
            // 更新留言区域
            $(".comment-input").val("");
            let commentNumber = response.commentNumber;
            $(".modal-body").append(
                    '<div class="comment-area-'+commentNumber+'">' +
                    '<p>您</p>' +
                    '<p>' + comment + '</p>' + 
                    '<p>現在</p>'+
                    '<div class="likeCom-area">' +
                    '<button id="likeCom-button-' + commentNumber + '" class="likeCom-button" onclick="likeCom(' + commentNumber + ');">' +
                    '<i class="far fa-thumbs-up"></i>' +
                    '</button>' +
                    '<button id="unlikeCom-button-' + commentNumber + '" class="unlikeCom-button" style="background:white; display: none;" onclick="unlikeCom(' + commentNumber + ');">' +
                    '<i class="fas fa-thumbs-up"></i>' +
                    '</button>' +
                    '<form class="delete-form" onsubmit="event.preventDefault(); deleteComment(' + commentNumber + ');">' +
                    '<input type="submit" value="刪除" style="background:red;">' +
                    '</form>' +
                    '</div>' +
                    '</div>'
                );
        },
        error: function(xhr, status, error) {
            console.error(error);
            alert("新增留言失败");
        }
    });
}

function like(articleNumber) {
    console.log("按");
    $.ajax({
        type: "POST",
        url: contextPath + "/like/like.do",
        data: {
            action: "insert",
            userNumber: userID,
            articleNumber: articleNumber
        },
        success: function(response) {
            alert("按讚成功");
            document.getElementById("like-button-" + articleNumber).style.display = "none";
            document.getElementById("unlike-button-" + articleNumber).style.display = "inline-block";
            const likeCountElement = document.getElementById("likeSum-count-" + articleNumber);
            // 获取当前值并转换为数字
            let currentValue = parseInt(likeCountElement.textContent, 10);
            // 增加 1
            currentValue += 1;
            // 将新的值更新回 p 标签
            likeCountElement.textContent = currentValue;
        },
        error: function(xhr, status, error) {
            console.error(error);
            alert("按讚失败");
        }
    });
}

function unlike(articleNumber) {
    $.ajax({
        type: "POST",
        url: contextPath + "/like/like.do",
        data: {
            action: "delete",
            userNumber: userID,
            articleNumber: articleNumber
        },
        success: function(response) {
            alert("取消按讚成功");
            document.getElementById("like-button-" + articleNumber).style.display = "inline-block";
            document.getElementById("unlike-button-" + articleNumber).style.display = "none";
            const likeCountElement = document.getElementById("likeSum-count-" + articleNumber);
            // 获取当前值并转换为数字
            let currentValue = parseInt(likeCountElement.textContent, 10);
            // 增加 1
            currentValue -= 1;
            // 将新的值更新回 p 标签
            likeCountElement.textContent = currentValue;
        },
        error: function(xhr, status, error) {
            console.error(error);
            alert("取消按讚失败");
        }
    });
}
function likeCom(commentNumber) {
    console.log("按");
    $.ajax({
        type: "POST",
        url: contextPath + "/like/like.do",
        data: {
            action: "insertCom",
            userNumber: userID,
            commentNumber: commentNumber
        },
        success: function(response) {
            alert("按讚成功");
            document.getElementById("likeCom-button-" + commentNumber).style.display = "none";
            document.getElementById("unlikeCom-button-" + commentNumber).style.display = "inline-block";
            const likeCountElement = document.getElementById("likeSumCom-count-" + commentNumber);
            // 获取当前值并转换为数字
            let currentValue = parseInt(likeCountElement.textContent, 10);
            // 增加 1
            currentValue += 1;
            // 将新的值更新回 p 标签
            likeCountElement.textContent = currentValue;
        },
        error: function(xhr, status, error) {
            console.error(error);
            alert("按讚失败");
        }
    });
}

function unlikeCom(commentNumber) {
    $.ajax({
        type: "POST",
        url: contextPath + "/like/like.do",
        data: {
            action: "deleteCom",
            userNumber: userID,
            commentNumber: commentNumber
        },
        success: function(response) {
            alert("取消按讚成功");
            document.getElementById("likeCom-button-" + commentNumber).style.display = "inline-block";
            document.getElementById("unlikeCom-button-" + commentNumber).style.display = "none";
            const likeCountElement = document.getElementById("likeSumCom-count-" + commentNumber);
            // 获取当前值并转换为数字
            let currentValue = parseInt(likeCountElement.textContent, 10);
            // 增加 1
            currentValue -= 1;
            // 将新的值更新回 p 标签
            likeCountElement.textContent = currentValue;
        },
        error: function(xhr, status, error) {
            console.error(error);
            alert("取消按讚失败");
        }
    });
}
function deleteComment(commentNumber) {
    $.ajax({
        type: "POST",
        url: contextPath + "/comment/comment.do",
        data: {
            action: "delete",
            commentNumber: commentNumber
        },
        success: function(response) {
            alert("刪除留言成功");
            // 更新留言区域
            $(".comment-area-"+ commentNumber).hide();
        },
        error: function(xhr, status, error) {
            console.error(error);
            alert("刪除留言失败");
        }
    });
}
function openUpdateText(commentNumber, content) {
    $(".comment-area-" + commentNumber).append(
    	'<div class="update-area">'+
        '<textarea id="textarea-' + commentNumber + '"style="width: 100%;" reqired>' + content + '</textarea>' +
        '<form class="update-form" onsubmit="event.preventDefault(); updateComment(' + commentNumber + ', document.getElementById(\'textarea-' + commentNumber + '\').value);">' +
        '<input type="submit" value="送出">' +
        '</form>'+
        '</div>'
    );
}
function updateComment(commentNumber,content){
	
	$.ajax({
        type: "POST",
        url: contextPath + "/comment/comment.do",
        data: {
            action: "update",
            commentNumber: commentNumber,
            content: content
        },
        success: function(response) {
            alert("更新留言成功");
            // 更新留言区域
            $(".comment-area-"+ commentNumber + " p:nth-child(2)").text(content);
        	$(".update-area").hide();
        },
        error: function(xhr, status, error) {
            console.error(error);
            alert("更新留言失败");
        }
    });
}
</script>

</body>

</html>