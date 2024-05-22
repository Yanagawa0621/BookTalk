package com.orderdetails.model;

import java.util.List;

import com.bookproducts.model.BookProductsVO;
import com.orderdetails.model.OrderDetailsVO.OrderDetailsId;


public interface OrderDetailsDAO_interface {
	public void insert(OrderDetailsVO orderDetailsVO);
	public int update(OrderDetailsVO orderDetailsVO);
	public OrderDetailsVO findByOrderDetailsId(OrderDetailsId orderDetailsId);
	public List<OrderDetailsVO> getAll();
	public Double ratingScoreAvg(BookProductsVO bpVO);
}
