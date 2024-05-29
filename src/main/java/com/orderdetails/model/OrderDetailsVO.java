package com.orderdetails.model;

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

import com.bookproducts.model.BookProductsVO;
import com.order.model.OrderVO;

@Entity
@Table(name = "order_details")
public class OrderDetailsVO implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "orderDetailsNumber", insertable = false, updatable = false)
	private Integer orderDetailsNumber;
	
	@ManyToOne
	@JoinColumn(name = "orderNumber", referencedColumnName = "orderNumber")
	private OrderVO orderVO;
	
	@ManyToOne
	@JoinColumn(name = "bookNumber", referencedColumnName = "bookNumber")
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


	public Integer getOrderDetailsNumber() {
		return orderDetailsNumber;
	}


	public void setOrderDetailsNumber(Integer orderDetailsNumber) {
		this.orderDetailsNumber = orderDetailsNumber;
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
		return "OrderDetailsVO [orderDetailsNumber=" + orderDetailsNumber + ", promotionProjectNumber="
				+ promotionProjectNumber + ", quantity=" + quantity + ", unitPrice=" + unitPrice + ", subtotal="
				+ subtotal + ", ratingScore=" + ratingScore + ", evaluateContent=" + evaluateContent + "]";
	}

}
