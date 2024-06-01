package com.comment.model;

import java.time.LocalDateTime;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.article.model.ArticleVO;
import com.likeRecord.model.LikeVO;

@Entity
@Table(name = "comments")
public class CommentVO implements java.io.Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer commentNumber;
	private Integer userNumber;
	// private Integer articleNumber;
	@Column(name = "content", columnDefinition = "TEXT")
	private String content;
	private LocalDateTime commentTime;
	private Integer commentState;
	

	private Integer likeSum;
	@ManyToOne
	@JoinColumn(name = "articleNumber", referencedColumnName = "articleNumber")
	private ArticleVO articleVO;
	@OneToMany(mappedBy = "commentVO", cascade = CascadeType.ALL)
	private Set<LikeVO> likeVO;

	public CommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommentVO(Integer commentNumber, Integer userNumber, String content, LocalDateTime commentTime,
			Integer commentState, Integer likeSum, ArticleVO articleVO, Set<LikeVO> likeVO) {
		super();
		this.commentNumber = commentNumber;
		this.userNumber = userNumber;
		this.content = content;
		this.commentTime = commentTime;
		this.commentState = commentState;
		this.likeSum = likeSum;
		this.articleVO = articleVO;
		this.likeVO = likeVO;
	}

	public Integer getCommentNumber() {
		return commentNumber;
	}

	public void setCommentNumber(Integer commentNumber) {
		this.commentNumber = commentNumber;
	}

	public Integer getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(Integer userName) {
		this.userNumber = userName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(LocalDateTime commentTime) {
		this.commentTime = commentTime;
	}

	public Integer getCommentState() {
		return commentState;
	}

	public void setCommentState(Integer commentState) {
		this.commentState = commentState;
	}

	public Integer getLikeSum() {
		return likeSum;
	}

	public void setLikeSum(Integer likeSum) {
		this.likeSum = likeSum;
	}

	public ArticleVO getArticleVO() {
		return articleVO;
	}

	public void setArticleVO(ArticleVO articleVO) {
		this.articleVO = articleVO;
	}

	public Set<LikeVO> getLikeVO() {
		return likeVO;
	}

	public void setLikeVO(Set<LikeVO> likeVO) {
		this.likeVO = likeVO;
	}

}
