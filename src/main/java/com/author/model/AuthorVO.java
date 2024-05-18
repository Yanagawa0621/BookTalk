package com.author.model;


import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import javax.persistence.Table;


import com.bookproducts.model.BookProductsVO;

@Entity
@Table(name = "author")
public class AuthorVO implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "authorNumber",updatable=false)
	private Integer authorNumber;

	@Column(name = "authorName")
	private String authorName;

	@Column(name = "englishName")
	private String englishName;

	@ManyToMany
	@JoinTable(name="book_author",joinColumns = {@JoinColumn(name="authorNumber",referencedColumnName = "authorNumber")},inverseJoinColumns = {@JoinColumn(name="bookNumber",referencedColumnName = "bookNumber")})
	private List<BookProductsVO> bpVO;
	
	public Integer getAuthorNumber() {
		return authorNumber;
	}

	public void setAuthorNumber(Integer authorNumber) {
		this.authorNumber = authorNumber;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getEnglishName() {
		return englishName;
	}

	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}

	public List<BookProductsVO> getBpVO() {
		return bpVO;
	}

	public void setBaVO(List<BookProductsVO> bpVO) {
		this.bpVO = bpVO;
	}
	
}
