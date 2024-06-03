package com.comment.model;

import java.util.List;

import com.article.model.ArticleVO;

public interface CommentDAO_interface {
	public void insert(CommentVO commentVO);
	public void update(CommentVO commentVO);
	public boolean updateCommentStatus(Integer commentNumber);
	public List<CommentVO> findByArticleNumber(Integer articleNumber);
}
