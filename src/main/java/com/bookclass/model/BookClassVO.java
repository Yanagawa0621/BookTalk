package com.bookclass.model;

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

import com.bookproducts.model.BookProductsVO;

@Entity
@Table(name = "book_class")
public class BookClassVO implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "classNumber",updatable=false)
	private Integer classNumber;

	@Column(name = "className",nullable = false)
	private String className;
	
	@OneToMany(mappedBy = "bcVO",cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch = FetchType.LAZY)
	@OrderBy("bookNumber asc")
	private List<BookProductsVO> bpVO;
	
	public Integer getClassNumber() {
		return classNumber;
	}

	public void setClassNumber(Integer classNumber) {
		this.classNumber = classNumber;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public List<BookProductsVO> getBpVO() {
		return bpVO;
	}

	public void setBpVO(List<BookProductsVO> bpVO) {
		this.bpVO = bpVO;
	}
	
}
