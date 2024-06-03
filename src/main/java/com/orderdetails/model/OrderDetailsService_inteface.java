package com.orderdetails.model;

import java.util.List;


public interface OrderDetailsService_inteface {
	public OrderDetailsVO addOrderDetails(OrderDetailsVO orderDetailsVO);
	public OrderDetailsVO updateOrderDetails(OrderDetailsVO orderDetailsVO);
	
	//利用訂單明細編號、書籍編號查訂單
	public OrderDetailsVO getByOrderDetailsNumberBookNumber(Integer orderDetailsNumber, Integer bookNumber);
	
	//更新評價及評價內容，及更新訂單狀態
	public int updateEvaluateRatingScore(Integer orderNumber, List<OrderDetailsVO> orderDetailsVOList);
	
	public List<OrderDetailsVO> getAll();
}
