package com.article.model;

import java.time.LocalDateTime;
import java.util.List;
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
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.comment.model.CommentVO;
import com.forum.model.ForumVO;
import com.likeRecord.model.LikeVO;

@Entity
@Table(name = "article")
public class ArticleVO implements java.io.Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer articleNumber;
	private Integer userNumber;
	// private Integer forumNumber;
	@Column(name = "content", columnDefinition = "LONGTEXT")
	private String content;
	private LocalDateTime issueTime;
	private String title;
	private Integer articleState;
	private Integer likeSum;
	private Integer pageView;

	@ManyToOne
	@JoinColumn(name = "forumNumber", referencedColumnName = "forumNumber")
	private ForumVO forumVO;
	@OneToMany(mappedBy = "articleVO", cascade = CascadeType.ALL)
	@OrderBy("commentNumber asc")
	private Set<CommentVO> commentVO;
	@OneToMany(mappedBy = "articleVO", cascade = CascadeType.ALL)
	private Set<LikeVO> likeVO;
	
	 

	public ArticleVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ArticleVO(Integer articleNumber, Integer userNumber, String content, LocalDateTime issueTime, String title,
			Integer articleState, Integer likeSum, Integer pageView, ForumVO forumVO, Set<CommentVO> commentVO,
			Set<LikeVO> likeVO) {
		super();
		this.articleNumber = articleNumber;
		this.userNumber = userNumber;
		this.content = content;
		this.issueTime = issueTime;
		this.title = title;
		this.articleState = articleState;
		this.likeSum = likeSum;
		this.pageView = pageView;
		this.forumVO = forumVO;
		this.commentVO = commentVO;
		this.likeVO = likeVO;
	}

	public ForumVO getForumVO() {
		return forumVO;
	}

	public void setForumVO(ForumVO forumVO) {
		this.forumVO = forumVO;
	}

	public Integer getArticleNumber() {
		return articleNumber;
	}

	public void setArticleNumber(Integer articleNumber) {
		this.articleNumber = articleNumber;
	}

	public Integer getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(Integer userNumber) {
		this.userNumber = userNumber;
	}

//	public Integer getForumNumber() {
//		return forumNumber;
//	}
//
//	public void setForumNumber(Integer forumNumber) {
//		this.forumNumber = forumNumber;
//	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getIssueTime() {
		return issueTime;
	}

	public void setIssueTime(LocalDateTime issueTime) {
		this.issueTime = issueTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getArticleState() {
		return articleState;
	}

	public void setArticleState(Integer articleState) {
		this.articleState = articleState;
	}

	public Integer getLikeSum() {
		return likeSum;
	}

	public void setLikeSum(Integer likeSum) {
		this.likeSum = likeSum;
	}

	public Integer getPageView() {
		return pageView;
	}

	public void setPageView(Integer pageView) {
		this.pageView = pageView;
	}

	public Set<CommentVO> getCommentVO() {
		return commentVO;
	}

	public void setCommentVO(Set<CommentVO> commentVO) {
		this.commentVO = commentVO;
	}

	public Set<LikeVO> getLikeVO() {
		return likeVO;
	}

	public void setLikeVO(Set<LikeVO> likeVO) {
		this.likeVO = likeVO;
	}

}
