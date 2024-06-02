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
	public OrderDetailsVO getByOrderDetailsNumberBookNumber(Integer orderDetailsNumber, Integer bookNumber) {
		return dao.findByOrderDetailsNumberBookNumber(orderDetailsNumber, bookNumber);
	}

	//更新評價及評價內容
	@Override
	public OrderDetailsVO updateEvaluateRatingScore(Integer orderDetailsNumber, Integer bookNumber, String evaluateContent, Integer ratingScore) {
		OrderDetailsVO orderDetailsVO = getByOrderDetailsNumberBookNumber(orderDetailsNumber, bookNumber);
		orderDetailsVO.setEvaluateContent(evaluateContent);
		orderDetailsVO.setRatingScore(ratingScore);
		updateOrderDetails(orderDetailsVO);
		return orderDetailsVO;
	}

	@Override
	public List<OrderDetailsVO> getAll() {
		return dao.getAll();
	}

	


	
}
