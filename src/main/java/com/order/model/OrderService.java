package com.order.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.*;

public class OrderService {
	private OrderDAO_interface dao;

	public OrderService() {
		dao = new OrderDAOHibernate();
	}
	
	public OrderVO addOrder(OrderVO ordreVO) {
	
		OrderVO orderVO = ordreVO;
		
//		orderVO.setUserNumber(userNumber);
//		orderVO.setReceiver(receiver);
//		orderVO.setShippingAddress(shippingAddress);
//		orderVO.setDeliveryFee(deliveryFee);
//		orderVO.setTotal(total);
//		orderVO.setNote(note);
		dao.insert(orderVO);
		
		return orderVO;
	}
	
	public OrderVO updateOrder(OrderVO ordreVO) {
	
		OrderVO orderVO = ordreVO;
		
//		orderVO.setOrderNumber(orderNumber);
//		orderVO.setUserNumber(userNumber);
//		orderVO.setOrderStatus(orderStatus);
//		orderVO.setEstablishmentTime(establishmentTime);
//		orderVO.setNote(note);
//		orderVO.setShippingTime(shippingTime);
//		orderVO.setReceiver(receiver);
//		orderVO.setShippingAddress(shippingAddress);
//		orderVO.setDeliveryFee(deliveryFee);
//		orderVO.setTotal(total);
		dao.update(orderVO);
		
		return orderVO;
	}
	
	public OrderVO getOneOrder(Integer orderNumber) {
		return dao.findByPrimaryKey(orderNumber);
	}
	
	public List<OrderVO> getAll(){
		return dao.getAll();
	}
	
	public List<OrderVO> getOrderByUserNumber(Integer userNumber) {
		return dao.findByUserNumber(userNumber);
	}

	public List<Integer> getUserNumber(){
		return dao.getUserNumber();
	}
	
	public List<OrderVO> getOrderByOrderStatus(Integer orderStatus) {
		return dao.findByOrderStatus(orderStatus);
	}
}
