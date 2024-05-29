package com.orderdetails.model;

import java.util.List;

import com.bookproducts.model.BookProductsVO;

public interface OrderDetailsDAO_interface {
	public int insert(OrderDetailsVO orderDetailsVO);
	public int update(OrderDetailsVO orderDetailsVO);
	public List<OrderDetailsVO> getAll();
	public Double ratingScoreAvg(BookProductsVO bpVO);
}
