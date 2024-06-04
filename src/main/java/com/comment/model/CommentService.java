package com.comment.model;

import java.time.LocalDateTime;

import com.article.model.ArticleVO;


public class CommentService {
	CommentDAO_interface dao;
	public CommentVO addComment(String content,Integer articleNumber, Integer userNumber){
		dao = new CommentDAO();
		CommentVO commentVO = new CommentVO();
		commentVO.setCommentState(1);
		commentVO.setCommentTime(LocalDateTime.now());
		commentVO.setContent(content);
		commentVO.setLikeSum(0);
		commentVO.setUserNumber(userNumber);
		ArticleVO articleVO =new ArticleVO();
		articleVO.setArticleNumber(articleNumber);
		commentVO.setArticleVO(articleVO);
		dao.insert(commentVO);
		return commentVO;
	}
	public void deleteComment(Integer commentNumber) {
		dao = new CommentDAO();
		dao.updateCommentStatus(commentNumber);
	}
	public void updateComment(CommentVO commentVO) {
		dao = new CommentDAO();
		dao.update(commentVO);
	}
	public CommentVO findComment(Integer commentNumber) {
		dao = new CommentDAO();
		return dao.findByCommentNumber(commentNumber);
	}
}
