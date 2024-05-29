package com.promotiondetails.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.promotionproject.model.PromotionProjectVO;


@Entity
@Table(name = "promotion_details")
public class PromotionDetailsVO implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "promotionDetailsNumber", insertable = false, updatable = false)
	private Integer promotionDetailsNumber;
	
	@ManyToOne
	@JoinColumn(name = "promotionProjectNumber", referencedColumnName = "promotionProjectNumber")
	private PromotionProjectVO promotionProjectVO;	
	
	@Column(name = "promotionProductNumber")
	private Integer promotionProductNumber;

	@Column(name = "promotionPrice")
	private BigDecimal promotionPrice;
	
	public PromotionDetailsVO() {
		super();
	}

	public Integer getPromotionDetailsNumber() {
		return promotionDetailsNumber;
	}

	public void setPromotionDetailsNumber(Integer promotionDetailsNumber) {
		this.promotionDetailsNumber = promotionDetailsNumber;
	}

	public PromotionProjectVO getPromotionProjectVO() {
		return promotionProjectVO;
	}

	public void setPromotionProjectVO(PromotionProjectVO promotionProjectVO) {
		this.promotionProjectVO = promotionProjectVO;
	}

	public Integer getPromotionProductNumber() {
		return promotionProductNumber;
	}

	public void setPromotionProductNumber(Integer promotionProductNumber) {
		this.promotionProductNumber = promotionProductNumber;
	}

	public BigDecimal getPromotionPrice() {
		return promotionPrice;
	}

	public void setPromotionPrice(BigDecimal promotionPrice) {
		this.promotionPrice = promotionPrice;
	}

	@Override
	public String toString() {
		return "PromotionDetailsVO [promotionDetailsNumber=" + promotionDetailsNumber + ", promotionProductNumber="
				+ promotionProductNumber + ", promotionPrice=" + promotionPrice + "]";
	}

}
