package com.promotiondetails.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.promotionproject.model.PromotionProjectVO;


@Entity
@Table(name = "promotion_details")
public class PromotionDetailsVO implements Serializable {
	
	@EmbeddedId
	private CompositeDetail compositeKey;
	
	@ManyToOne
	@JoinColumn(name = "promotionProjectNumber", referencedColumnName = "promotionProjectNumber", insertable = false, updatable = false)
	private PromotionProjectVO promotionProjectVO;	

	@Column(name = "promotionPrice")
	private BigDecimal promotionPrice;
	
	public PromotionDetailsVO() {
		super();
	}
	
	@Embeddable
	public static class CompositeDetail implements Serializable{
		private static final long serialVersionUID = 1L;
		
		@Column(name = "promotionProjectNumber")
		private Integer promotionProjectNumber;
		
		@Column(name = "promotionProductNumber")
		private Integer promotionProductNumber;

		public CompositeDetail() {
			super();
		}

		public CompositeDetail(Integer promotionProjectNumber, Integer promotionProductNumber) {
			super();
			this.promotionProjectNumber = promotionProjectNumber;
			this.promotionProductNumber = promotionProductNumber;
		}
		
		public Integer getPromotionProjectNumber() {
			return promotionProjectNumber;
		}
	
		public void setPromotionProjectNumber(Integer promotionProjectNumber) {
			this.promotionProjectNumber = promotionProjectNumber;
		}
	
		public Integer getPromotionProductNumber() {
			return promotionProductNumber;
		}
	
		public void setPromotionProductNumber(Integer promotionProductNumber) {
			this.promotionProductNumber = promotionProductNumber;
		}

		@Override
		public int hashCode() {
			return Objects.hash(promotionProductNumber, promotionProjectNumber);
		}

		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			CompositeDetail other = (CompositeDetail) obj;
			return Objects.equals(promotionProductNumber, other.promotionProductNumber)
					&& Objects.equals(promotionProjectNumber, other.promotionProjectNumber);
		}

	}
	

	public CompositeDetail getCompositeKey() {
		return compositeKey;
	}

	public void setCompositeKey(CompositeDetail compositeKey) {
		this.compositeKey = compositeKey;
	}

	public BigDecimal getPromotionPrice() {
		return promotionPrice;
	}

	public void setPromotionPrice(BigDecimal promotionPrice) {
		this.promotionPrice = promotionPrice;
	}

	public PromotionProjectVO getPromotionProjectVO() {
		return promotionProjectVO;
	}

	public void setPromotionProjectVO(PromotionProjectVO promotionProjectVO) {
		this.promotionProjectVO = promotionProjectVO;
	}

	@Override
	public String toString() {
		return "PromotionDetailsVO [compositeKey=" + compositeKey + ", promotionPrice=" + promotionPrice + "]";
	}
	
	
}
