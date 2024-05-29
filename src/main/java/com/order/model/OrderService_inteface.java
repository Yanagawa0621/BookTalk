package com.order.model;

import java.util.List;

public interface OrderService_inteface {
	public OrderVO addOrder(OrderVO ordreVO);
	public OrderVO updateOrder(OrderVO ordreVO);
	public OrderVO getOneOrder(Integer orderNumber);
	public List<OrderVO> getAll();
	public List<OrderVO> getOrderByUserNumber(Integer userNumber);
	public List<Integer> getUserNumber();
	public List<OrderVO> getOrderByOrderStatus(Integer orderStatus);
	public String checkout(Integer userNumber, OrderVO ordreVO, String contextPath);
}
