package com.author.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import com.bookauthor.model.BookAuthorVO;

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

	@OneToMany(mappedBy = "compositeKey.authorVO",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	@OrderBy("authorVO.authorNumber asc")
	private List<BookAuthorVO> baVO=new ArrayList<>();
	
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

	public List<BookAuthorVO> getBaVO() {
		return baVO;
	}

	public void setBaVO(List<BookAuthorVO> baVO) {
		this.baVO = baVO;
	}
	
	
}
