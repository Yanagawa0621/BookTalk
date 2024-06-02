package com.orderdetails.model;

import java.util.List;

public interface OrderDetailsService_inteface {
	public OrderDetailsVO addOrderDetails(OrderDetailsVO orderDetailsVO);
	public OrderDetailsVO updateOrderDetails(OrderDetailsVO orderDetailsVO);
	public OrderDetailsVO getByOrderDetailsNumberBookNumber(Integer orderDetailsNumber, Integer bookNumber);
	public OrderDetailsVO updateEvaluateRatingScore(Integer orderDetailsNumber, Integer bookNumber, String evaluateContent, Integer ratingScore);
	public List<OrderDetailsVO> getAll();
}
