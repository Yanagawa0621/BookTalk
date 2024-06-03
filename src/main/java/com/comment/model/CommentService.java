package com.comment.model;

import java.time.LocalDateTime;

import com.article.model.ArticleVO;


public class CommentService {
	CommentDAO_interface dao;
	public CommentVO addComment(String content,Integer articleNumber){
		dao = new CommentDAO();
		CommentVO commentVO = new CommentVO();
		commentVO.setCommentState(1);
		commentVO.setCommentTime(LocalDateTime.now());
		commentVO.setContent(content);
		commentVO.setLikeSum(0);
		commentVO.setUserNumber(1);
		ArticleVO articleVO =new ArticleVO();
		articleVO.setArticleNumber(articleNumber);
		commentVO.setArticleVO(articleVO);
		dao.insert(commentVO);
		return commentVO;
	}
}
