package com.orderdetails.model;

import java.util.List;

import com.order.model.OrderService;
import com.order.model.OrderVO;



public class OrderDetailsService implements OrderDetailsService_inteface {
	private OrderDetailsDAO_interface dao;
	private OrderService orderSev;

	public OrderDetailsService() {
		dao = new OrderDetailsDAOHibernate();
		orderSev = new OrderService();
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
	
	//利用訂單明細編號、書籍編號查訂單
	@Override
	public OrderDetailsVO getByOrderDetailsNumberBookNumber(Integer orderDetailsNumber, Integer bookNumber) {
		return dao.findByOrderDetailsNumberBookNumber(orderDetailsNumber, bookNumber);
	}

	//更新評價及評價內容，及更新訂單狀態
	@Override
	public int updateEvaluateRatingScore(Integer orderNumber, List<OrderDetailsVO> orderDetailsVOList) {
		OrderVO orderVO = orderSev.getOneOrder(orderNumber);		
		orderVO.setOrderStatus(5);
		orderSev.updateOrder(orderVO);
		
		for(OrderDetailsVO orderDetailsVO : orderDetailsVOList) {
			updateOrderDetails(orderDetailsVO);
		}
		return 1;
	}

	@Override
	public List<OrderDetailsVO> getAll() {
		return dao.getAll();
	}

	public List<Object[]> getSalesSorting(){
		return dao.salesSorting();
	}
}
