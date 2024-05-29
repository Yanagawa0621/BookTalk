<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.article.model.*"%>
<%@ page import="com.forum.model.*"%>
<%
	ArticleService articleSvc = new ArticleService();
	List<ArticleVO> list = articleSvc.getPopularArticle();
	pageContext.setAttribute("list",list);
%>
<!doctype html>
<html class="no-js" lang="en">

<head>
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
 	 </style>
</head>

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
                    <c:forEach var="articleVO" items="${list}" varStatus="loop">
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
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									          <span aria-hidden="true">&times;</span>
									        </button>
									      </div>
									      <div class="modal-body" style="font-size: 18px; padding: 30px;">
									        <!-- 燈箱内容區域 -->
										    ${articleVO.content}
										    <hr>
										    <c:forEach var="commentVO" items="${articleVO.commentVO}">
											    <div class="comment-area"> 
											    	<p>${commentVO.userNumber}</p> 
											    	<p>${commentVO.content}</p> 
											    </div>
									        </c:forEach>
									      </div>
									      <div class="modal-footer">
									        <form class="modal-form" onsubmit="event.preventDefault(); submitComment(${articleVO.articleNumber});">
												<textarea id="comment${articleVO.articleNumber}" class="comment-input" placeholder="输入留言..."></textarea>
												<input class ="form-input" type="submit" value="新增">
											</form>
									      </div>
									    </div>
									  </div>
									</div>
									
                                    <div class="blog_meta">
                                        <p>作者: <a href="#">${articleVO.userNumber}</a> / 發文日期: ${articleVO.issueTime} / 看板: <a href="#">${articleVO.forumVO.name}</a></p>
                                    </div>
                                    <p class="post_desc">${articleVO.articleSummary}</p>
                                    <footer class="btn_more">
                                        <a href="blog-details.html"> Read more</a>
                                    </footer>
                                </figcaption>
                            </figure>
                        </article>
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
                                <button type="submit">發文</button>
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
                            <div class="widget_title">
                                <h3>Recent Posts</h3>
                            </div>
                            <div class="post_wrapper">
                                <div class="post_thumb">
                                    <a href="blog-details.html"><img src="assets/img/blog/blog1.jpg" alt=""></a>
                                </div>
                                <div class="post_info">
                                    <h4><a href="blog-details.html">Blog image post</a></h4>
                                    <span>March 16, 2022 </span>
                                </div>
                            </div>
                             <div class="post_wrapper">
                                <div class="post_thumb">
                                    <a href="blog-details.html"><img src="assets/img/blog/blog2.jpg" alt=""></a>
                                </div>
                                <div class="post_info">
                                    <h4><a href="blog-details.html">Post with Gallery</a></h4>
                                    <span>March 16, 2022 </span>
                                </div>
                            </div>
                             <div class="post_wrapper">
                                <div class="post_thumb">
                                    <a href="blog-details.html"><img src="assets/img/blog/blog3.jpg" alt=""></a>
                                </div>
                                <div class="post_info">
                                    <h4><a href="blog-details.html">Post with Audio</a></h4>
                                    <span>March 16, 2022 </span>
                                </div>
                            </div>
                             <div class="post_wrapper">
                                <div class="post_thumb">
                                    <a href="blog-details.html"><img src="assets/img/blog/blog4.jpg" alt=""></a>
                                </div>
                                <div class="post_info">
                                    <h4><a href="blog-details.html">Post with Video</a></h4>
                                    <span>March 16, 2022 </span>
                                </div>
                            </div>
                        </div>
                        <div class="widget_list widget_categories">
                            <div class="widget_title">
                                <h3>Categories</h3>
                            </div>
                            <ul>
                                <li><a href="#">Audio</a></li>
                                <li><a href="#">Company</a></li>
                                <li><a href="#">Gallery</a></li>
                                <li><a href="#">Image</a></li>
                                <li><a href="#">Other</a></li>
                                <li><a href="#">Travel</a></li>
                            </ul>
                        </div>
                        <div class="widget_list widget_tag">
                            <div class="widget_title">
                                <h3>Tag products</h3>
                            </div>
                            <div class="tag_widget">
                                <ul>
                                    <li><a href="#">asian</a></li>
                                    <li><a href="#">brown</a></li>
                                    <li><a href="#">euro</a></li>
                                </ul>
                            </div>
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
                            <li class="current">1</li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li class="next"><a href="#">next</a></li>
                            <li><a href="#">>></a></li>
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
function submitComment(articleNumber) {
    var comment = $("#comment" + articleNumber).val();
    var contextPath = "<%= request.getContextPath() %>";

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
            // 更新留言區域
            $(".comment-input").val("");
            $(".modal-body").append("<div class='comment-area'><p>您</p>"+"<p>"+comment+"</p>");
        },
        error: function(xhr, status, error) {
            console.error(error);
            alert("新增留言失敗");
        }
    });
}
</script>



</body>

</html>