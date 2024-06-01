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
	
	@Column(name = "userNumber", updatable = false)
	private Integer userNumber;
	
	@Column(name = "orderStatus", insertable = false)
	private Integer orderStatus;
	
	@Column(name = "establishmentTime", insertable = false, updatable = false)
	private Timestamp establishmentTime;
	
	@Column(name = "shippingTime")
	private Timestamp shippingTime;
	
	@Column(name = "completeTime")
	private Timestamp completeTime;
	
	@Column(name = "receiver")
	private String receiver;
	
	@Column(name = "telephoneNumber")
	private String telephoneNumber;
	
	@Column(name = "shippingAddress")
	private String shippingAddress;
	
	@Column(name = "deliveryFee")
	private BigDecimal deliveryFee;
	
	@Column(name = "total")
	private BigDecimal total;
	
	@Column(name = "paymentNumber")
	private String paymentNumber;
	
	@Column(name = "note", columnDefinition = "longtext")
	private String note;
	
	@OneToMany(mappedBy = "orderVO", cascade = CascadeType.ALL)
	@OrderBy("orderNumber asc")
	private Set<OrderDetailsVO> orderDetails;
	
	
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
	
	public Timestamp getShippingTime() {
		return shippingTime;
	}

	public void setShippingTime(Timestamp shippingTime) {
		this.shippingTime = shippingTime;
	}

	public Timestamp getCompleteTime() {
		return completeTime;
	}

	public void setCompleteTime(Timestamp completeTime) {
		this.completeTime = completeTime;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getTelephoneNumber() {
		return telephoneNumber;
	}

	public void setTelephoneNumber(String telephoneNumber) {
		this.telephoneNumber = telephoneNumber;
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
	
	public String getPaymentNumber() {
		return paymentNumber;
	}

	public void setPaymentNumber(String paymentNumber) {
		this.paymentNumber = paymentNumber;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Set<OrderDetailsVO> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderDetailsVO> orderDetails) {
		this.orderDetails = orderDetails;
	}

	@Override
	public String toString() {
		return "OrderVO [orderNumber=" + orderNumber + ", userNumber=" + userNumber + ", orderStatus=" + orderStatus
				+ ", establishmentTime=" + establishmentTime + ", shippingTime=" + shippingTime + ", completeTime="
				+ completeTime + ", receiver=" + receiver + ", telephoneNumber=" + telephoneNumber
				+ ", shippingAddress=" + shippingAddress + ", deliveryFee=" + deliveryFee + ", total=" + total
				+ ", paymentNumber=" + paymentNumber + ", note=" + note + "]";
	}

}
