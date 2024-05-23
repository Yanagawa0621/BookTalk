package com.orderdetails.model;

import java.util.List;

public interface OrderDetailsService_inteface {
	public OrderDetailsVO addOrderDetails(OrderDetailsVO orderDetailsVO);
	public OrderDetailsVO updateOrderDetails(OrderDetailsVO orderDetailsVO);
	public List<OrderDetailsVO> getAll();
}
