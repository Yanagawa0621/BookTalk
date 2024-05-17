package com.bookproducts.model;

public class BookProductsService {
	BookProductsDAO bpDAO=new BookProductsDAO();
	
	public int addBp(BookProductsVO bpVO) {
		return bpDAO.increase(bpVO);
	}
	
	public int updateBp(BookProductsVO bpVO) {
		return bpDAO.update(bpVO);
	}
	
}
