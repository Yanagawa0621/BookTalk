package com.order.model;

import java.util.List;


public interface OrderDAO_interface {
	public int insert(OrderVO orderVO);
	public int update(OrderVO orderVO);
	public OrderVO findByPrimaryKey(Integer orderNumber);
	public List<OrderVO> getAll();
	public List<OrderVO> findByUserNumber(Integer userNumber);
	public List<Integer> getUserNumber();
	public List<OrderVO> findByOrderStatus(Integer orderStatus);
}
