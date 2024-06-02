package com.orderdetails.model;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.bookproducts.model.BookProductsVO;
import com.google.gson.annotations.Expose;
import com.order.model.OrderVO;

@Entity
@Table(name = "order_details")
public class OrderDetailsVO implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "orderDetailsNumber", insertable = false, updatable = false)
	@Expose
	private Integer orderDetailsNumber;
	
	@ManyToOne
	@JoinColumn(name = "orderNumber", referencedColumnName = "orderNumber")
	private OrderVO orderVO;
	
	@ManyToOne
	@JoinColumn(name = "bookNumber", referencedColumnName = "bookNumber")
	private BookProductsVO bookProductsVO;
	
	@Column(name = "bookNumber", insertable = false, updatable = false)
	@Expose
	private Integer bookNumber;
	
	@Column(name = "promotionProjectNumber")
	@Expose
	private Integer promotionProjectNumber;	
	
	@Column(name = "quantity")
	@Expose
	private Integer quantity;
	
	@Column(name = "unitPrice")
	@Expose
	private BigDecimal unitPrice;
	
	@Column(name = "subtotal")
	@Expose
	private BigDecimal subtotal;
	
	@Column(name = "ratingScore", insertable = false)
	@Expose
	private Integer ratingScore;
	
	@Column(name = "evaluateContent", columnDefinition = "longtext")
	@Expose
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
	
	public Integer getBookNumber() {
		return bookNumber;
	}


	public void setBookNumber(Integer bookNumber) {
		this.bookNumber = bookNumber;
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
		return "OrderDetailsVO [orderDetailsNumber=" + orderDetailsNumber + ", bookNumber=" + bookNumber
				+ ", promotionProjectNumber=" + promotionProjectNumber + ", quantity=" + quantity + ", unitPrice="
				+ unitPrice + ", subtotal=" + subtotal + ", ratingScore=" + ratingScore + ", evaluateContent="
				+ evaluateContent + "]";
	}

	


}
