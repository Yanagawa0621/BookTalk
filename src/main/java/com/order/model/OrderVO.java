package com.order.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Set;
import javax.persistence.*;
import com.orderdetails.model.OrderDetailsVO;

@Entity
@Table(name = "customer_order")
public class OrderVO implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "orderNumber", insertable = false, updatable = false)
	private Integer orderNumber;
	
	@OneToMany(mappedBy = "orderVO", cascade = CascadeType.ALL)
	@OrderBy("orderNumber asc")
	private Set<OrderDetailsVO> orderDetails;
	
	@Column(name = "userNumber", updatable = false)
	private Integer userNumber;
	
	@Column(name = "orderStatus")
	private Integer orderStatus;
	
	@Column(name = "establishmentTime", updatable = false)
	private Timestamp establishmentTime;
	
	@Column(name = "note", columnDefinition = "longtext")
	private String note;
	
	@Column(name = "shippingTime")
	private Timestamp shippingTime;
	
	@Column(name = "receiver")
	private String receiver;
	
	@Column(name = "shippingAddress")
	private String shippingAddress;
	
	@Column(name = "deliveryFee")
	private BigDecimal deliveryFee;
	
	@Column(name = "total")
	private BigDecimal total;
	
	public OrderVO() {
		super();
	}

	public Integer getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(Integer orderNumber) {
		this.orderNumber = orderNumber;
	}

	public Integer getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(Integer userNumber) {
		this.userNumber = userNumber;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Timestamp getEstablishmentTime() {
		return establishmentTime;
	}

	public void setEstablishmentTime(Timestamp establishmentTime) {
		this.establishmentTime = establishmentTime;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Timestamp getShippingTime() {
		return shippingTime;
	}

	public void setShippingTime(Timestamp shippingTime) {
		this.shippingTime = shippingTime;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public BigDecimal getDeliveryFee() {
		return deliveryFee;
	}

	public void setDeliveryFee(BigDecimal deliveryFee) {
		this.deliveryFee = deliveryFee;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public Set<OrderDetailsVO> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderDetailsVO> orderDetails) {
		this.orderDetails = orderDetails;
	}

	@Override
	public String toString() {
		return "OrderVO [orderNumber=" + orderNumber + ", orderDetails=" + orderDetails + ", userNumber=" + userNumber
				+ ", orderStatus=" + orderStatus + ", establishmentTime=" + establishmentTime + ", note=" + note
				+ ", shippingTime=" + shippingTime + ", receiver=" + receiver + ", shippingAddress=" + shippingAddress
				+ ", deliveryFee=" + deliveryFee + ", total=" + total + "]";
	}
	

}