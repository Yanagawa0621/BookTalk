package com.orderdetails.model;

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

import com.order.model.OrderVO;
import com.promotionproject.model.PromotionProjectVO;

@Entity
@Table(name = "order_details")
public class OrderDetailsVO implements Serializable {
	
	@EmbeddedId
	private CompositeDetail compositeKey;

	@ManyToOne
	@JoinColumn(name = "orderNumber", referencedColumnName = "orderNumber", insertable = false, updatable = false)
	private OrderVO orderVO;	
	
	@Column(name = "promotionProjectNumber")
	private Integer promotionProjectNumber;
	
	@ManyToOne
	@JoinColumn(name = "promotionProjectNumber", referencedColumnName = "promotionProjectNumber", insertable = false, updatable = false)
	private PromotionProjectVO promotionProjectVO;	
	
	@Column(name = "quantity")
	private Integer quantity;
	
	@Column(name = "unitPrice")
	private BigDecimal unitPrice;
	
	@Column(name = "subtotal")
	private BigDecimal subtotal;
	
	@Column(name = "evaluateContent", columnDefinition = "longtext")
	private String evaluateContent;
	
	
	public OrderDetailsVO() {
		super();
	}
	
	@Embeddable
	public static class CompositeDetail implements Serializable{
		private static final long serialVersionUID = 1L;
		
		@Column(name = "orderNumber")
		private Integer orderNumber;

		@Column(name = "bookNumber")
		private Integer bookNumber;

		public CompositeDetail() {
			super();
		}

		public CompositeDetail(Integer orderNumber, Integer bookNumber) {
			super();
			this.orderNumber = orderNumber;
			this.bookNumber = bookNumber;
		}

		public Integer getOrderNumber() {
			return orderNumber;
		}

		public void setOrderNumber(Integer orderNumber) {
			this.orderNumber = orderNumber;
		}

		public Integer getBookNumber() {
			return bookNumber;
		}

		public void setBookNumber(Integer bookNumber) {
			this.bookNumber = bookNumber;
		}

		@Override
		public int hashCode() {
			return Objects.hash(bookNumber, orderNumber);
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
			return Objects.equals(bookNumber, other.bookNumber) && Objects.equals(orderNumber, other.orderNumber);
		}
		
	}
	
	
	public CompositeDetail getCompositeKey() {
		return compositeKey;
	}

	public void setCompositeKey(CompositeDetail compositeKey) {
		this.compositeKey = compositeKey;
	}


	public Integer getPromotionProjectNumber() {
		return promotionProjectNumber;
	}

	public void setPromotionProjectNumber(Integer promotionProjectNumber) {
		this.promotionProjectNumber = promotionProjectNumber;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public BigDecimal getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(BigDecimal unitPrice) {
		this.unitPrice = unitPrice;
	}

	public BigDecimal getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(BigDecimal subtotal) {
		this.subtotal = subtotal;
	}

	public String getEvaluateContent() {
		return evaluateContent;
	}

	public void setEvaluateContent(String evaluateContent) {
		this.evaluateContent = evaluateContent;
	}

	public OrderVO getOrderVO() {
		return orderVO;
	}

	public void setOrderVO(OrderVO orderVO) {
		this.orderVO = orderVO;
	}

	public PromotionProjectVO getPromotionProjectVO() {
		return promotionProjectVO;
	}

	public void setPromotionProjectVO(PromotionProjectVO promotionProjectVO) {
		this.promotionProjectVO = promotionProjectVO;
	}

	@Override
	public String toString() {
		return "OrderDetailsVO [compositeKey=" + compositeKey + ", promotionProjectNumber=" + promotionProjectNumber
				+ ", quantity=" + quantity + ", unitPrice=" + unitPrice + ", subtotal=" + subtotal
				+ ", evaluateContent=" + evaluateContent + "]";
	}

}
