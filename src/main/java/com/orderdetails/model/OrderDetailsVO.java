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

import com.bookproducts.model.BookProductsVO;
import com.order.model.OrderVO;

@Entity
@Table(name = "order_details")
public class OrderDetailsVO implements Serializable {
	
	@EmbeddedId
	private OrderDetailsId orderDetailsId;

	@ManyToOne
	@JoinColumn(name = "orderNumber", referencedColumnName = "orderNumber", insertable = false, updatable = false)
	private OrderVO orderVO;
	
	@ManyToOne
	@JoinColumn(name = "bookNumber", referencedColumnName = "bookNumber", insertable = false, updatable = false)
	private BookProductsVO bookProductsVO;
	
	@Column(name = "promotionProjectNumber")
	private Integer promotionProjectNumber;	
	
	@Column(name = "quantity")
	private Integer quantity;
	
	@Column(name = "unitPrice")
	private BigDecimal unitPrice;
	
	@Column(name = "subtotal")
	private BigDecimal subtotal;
	
	@Column(name = "ratingScore", insertable = false)
	private Integer ratingScore;
	
	@Column(name = "evaluateContent", columnDefinition = "longtext")
	private String evaluateContent;
	
	
	public OrderDetailsVO() {
		super();
	}
	
	public OrderDetailsVO(OrderDetailsId orderDetailsId) {
		super();
		this.orderDetailsId = orderDetailsId;
	}
	
	public OrderDetailsId getOrderDetailsId() {
		return orderDetailsId;
	}

	public void setOrderDetailsId(OrderDetailsId orderDetailsId) {
		this.orderDetailsId = orderDetailsId;
	}
	
	public OrderVO getOrderVO() {
		return orderVO;
	}

	public void setOrderVO(OrderVO orderVO) {
		this.orderVO = orderVO;
	}
	
	public BookProductsVO getBookProductsVO() {
		return bookProductsVO;
	}

	public void setBookProductsVO(BookProductsVO bookProductsVO) {
		this.bookProductsVO = bookProductsVO;
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

	public Integer getRatingScore() {
		return ratingScore;
	}

	public void setRatingScore(Integer ratingScore) {
		this.ratingScore = ratingScore;
	}

	public String getEvaluateContent() {
		return evaluateContent;
	}

	public void setEvaluateContent(String evaluateContent) {
		this.evaluateContent = evaluateContent;
	}


	@Override
	public String toString() {
		return "OrderDetailsVO [promotionProjectNumber=" + promotionProjectNumber + ", quantity=" + quantity
				+ ", unitPrice=" + unitPrice + ", subtotal=" + subtotal + ", ratingScore=" + ratingScore
				+ ", evaluateContent=" + evaluateContent + "]";
	}



	@Embeddable
	public static class OrderDetailsId implements Serializable{
		private static final long serialVersionUID = 1L;
		
		@Column(name = "orderNumber")
		private Integer orderNumber;

		@Column(name = "bookNumber")
		private Integer bookNumber;

		public OrderDetailsId() {
			super();
		}

		public OrderDetailsId(Integer orderNumber, Integer bookNumber) {
			super();
			this.orderNumber = orderNumber;
			this.bookNumber = bookNumber;
		}

		public Integer getOrderNumber() {
			return orderNumber;
		}

		public Integer getBookNumber() {
			return bookNumber;
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
			OrderDetailsId other = (OrderDetailsId) obj;
			return Objects.equals(bookNumber, other.bookNumber) && Objects.equals(orderNumber, other.orderNumber);
		}

		@Override
		public String toString() {
			return "OrderDetailsId [orderNumber=" + orderNumber + ", bookNumber=" + bookNumber + "]";
		}
	}

}
