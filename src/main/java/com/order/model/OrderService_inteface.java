package com.order.model;

import java.util.List;
import java.util.Set;

import com.orderdetails.model.OrderDetailsVO;

public interface OrderService_inteface {
	public OrderVO addOrder(OrderVO ordreVO);
	public OrderVO updateOrder(OrderVO ordreVO);
	public OrderVO getOneOrder(Integer orderNumber);
	public List<OrderVO> getAll();
	public List<OrderVO> getOrderByUserNumber(Integer userNumber);
	public List<Integer> getUserNumber();
	public List<OrderVO> getOrderByOrderStatus(Integer orderStatus);
	public Set<OrderDetailsVO> getOrderDetailsVOsByOrderNumber(Integer orderNumber);
	public String checkout(Integer userNumber, OrderVO ordreVO, String contextPath);
}
