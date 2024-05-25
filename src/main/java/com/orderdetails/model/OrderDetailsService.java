package com.orderdetails.model;

import java.util.List;

public class OrderDetailsService implements OrderDetailsService_inteface {
	private OrderDetailsDAO_interface dao;

	public OrderDetailsService() {
		dao = new OrderDetailsDAOHibernate();
	}
	
	@Override
	public OrderDetailsVO addOrderDetails(OrderDetailsVO orderDetailsVO) {
		dao.insert(orderDetailsVO);		
		return orderDetailsVO;
	}
	
	@Override
	public OrderDetailsVO updateOrderDetails(OrderDetailsVO orderDetailsVO) {
		dao.update(orderDetailsVO);
		return orderDetailsVO;
	}
	
	@Override
	public List<OrderDetailsVO> getAll() {
		return dao.getAll();
	}
}
