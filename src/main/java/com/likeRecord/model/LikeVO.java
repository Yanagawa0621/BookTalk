package com.likeRecord.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.article.model.ArticleVO;
import com.comment.model.CommentVO;

@Entity
@Table(name = "my_like")
public class LikeVO {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer number;
	@ManyToOne
	@JoinColumn(name = "articleNumber", referencedColumnName = "articleNumber")
	// private Integer articleNumber;
	private ArticleVO articleVO;
	@ManyToOne
	@JoinColumn(name = "commentNumber", referencedColumnName = "commentNumber")
	// private Integer commentNumber;
	private CommentVO commentVO;
	private Integer userNumber;
	public LikeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LikeVO(Integer number, ArticleVO articleVO, CommentVO commentVO, Integer userNumber, Integer likeState) {
		super();
		this.number = number;
		this.articleVO = articleVO;
		this.commentVO = commentVO;
		this.userNumber = userNumber;
		
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public ArticleVO getArticleVO() {
		return articleVO;
	}
	public void setArticleVO(ArticleVO articleVO) {
		this.articleVO = articleVO;
	}
	public CommentVO getCommentVO() {
		return commentVO;
	}
	public void setCommentVO(CommentVO commentVO) {
		this.commentVO = commentVO;
	}
	public Integer getUserNumber() {
		return userNumber;
	}
	public void setUserNumber(Integer userNumber) {
		this.userNumber = userNumber;
	}
	
	
		

}
