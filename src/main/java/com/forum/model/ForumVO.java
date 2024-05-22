package com.forum.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import com.article.model.ArticleVO;

@Entity
@Table(name = "forum")
public class ForumVO implements java.io.Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer forumNumber;
	private String name;
	@OneToMany(mappedBy = "forumVO", cascade = CascadeType.ALL)
	@OrderBy("empno asc")
	private Set<ArticleVO> articleVO;

	public ForumVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ForumVO(Integer forumNumber, String name, Set<ArticleVO> articleVO) {
		super();
		this.forumNumber = forumNumber;
		this.name = name;
		this.articleVO = articleVO;
	}

	public Integer getForumNumber() {
		return forumNumber;
	}

	public void setForumNumber(Integer forumNumber) {
		this.forumNumber = forumNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<ArticleVO> getArticleVO() {
		return articleVO;
	}

	public void setArticleVO(Set<ArticleVO> articleVO) {
		this.articleVO = articleVO;
	}

}
