package com.promotionproject.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.Arrays;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import com.orderdetails.model.OrderDetailsVO;
import com.promotiondetails.model.PromotionDetailsVO;

@Entity
@Table(name = "promotion_project")
public class PromotionProjectVO implements Serializable  {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "promotionProjectNumber", insertable = false, updatable = false)
	private Integer promotionProjectNumber;
	
	@OneToMany(mappedBy = "promotionProjectVO", cascade = CascadeType.ALL)
	@OrderBy("orderNumber asc")
	private Set<OrderDetailsVO> orderDetails;
	
	@OneToMany(mappedBy = "promotionProjectVO", cascade = CascadeType.ALL)
	@OrderBy("promotionProjectNumber asc")
	private Set<PromotionDetailsVO> promotionDetailsVO;
	
	@Column(name = "promotionProjectName")
	private String promotionProjectName;
	
	@Column(name = "promotionStartDate")
	private Date promotionStartDate;
	
	@Column(name = "promotionLastDate")
	private Date promotionLastDate;
	
	@Column(name = "title")
	private String title;
	
	@Column(name = "content", columnDefinition = "longtext")
	private String content;
	
	@Column(name = "picture", columnDefinition = "longblob")
	private byte[] picture;
			
	public PromotionProjectVO() {
		super();
	}
	
	
	public Integer getPromotionProjectNumber() {
		return promotionProjectNumber;
	}
	public void setPromotionProjectNumber(Integer promotionProjectNumber) {
		this.promotionProjectNumber = promotionProjectNumber;
	}
	public String getPromotionProjectName() {
		return promotionProjectName;
	}
	public void setPromotionProjectName(String promotionProjectName) {
		this.promotionProjectName = promotionProjectName;
	}
	public Date getPromotionStartDate() {
		return promotionStartDate;
	}
	public void setPromotionStartDate(Date promotionStartDate) {
		this.promotionStartDate = promotionStartDate;
	}
	public Date getPromotionLastDate() {
		return promotionLastDate;
	}
	public void setPromotionLastDate(Date promotionLastDate) {
		this.promotionLastDate = promotionLastDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public byte[] getPicture() {
		return picture;
	}
	public void setPicture(byte[] picture) {
		this.picture = picture;
	}

	public Set<OrderDetailsVO> getOrderDetails() {
		return orderDetails;
	}
	
	public void setOrderDetails(Set<OrderDetailsVO> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public Set<PromotionDetailsVO> getPromotionDetailsVO() {
		return promotionDetailsVO;
	}

	public void setPromotionDetailsVO(Set<PromotionDetailsVO> promotionDetailsVO) {
		this.promotionDetailsVO = promotionDetailsVO;
	}


	@Override
	public String toString() {
		return "PromotionProjectVO [promotionProjectNumber=" + promotionProjectNumber + ", promotionProjectName="
				+ promotionProjectName + ", promotionStartDate=" + promotionStartDate + ", promotionLastDate="
				+ promotionLastDate + ", title=" + title + ", content=" + content + ", picture="
				+ Arrays.toString(picture) + "]";
	}

}
