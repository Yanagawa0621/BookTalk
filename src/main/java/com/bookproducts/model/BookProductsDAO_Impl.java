package com.bookproducts.model;

import java.util.List;

public interface BookProductsDAO_Impl{
	int increase(BookProductsVO bpVO);
	int update (BookProductsVO bpVO);
	List<BookProductsVO> getAll();
	List<BookProductsVO> npi(Integer year,Integer month);
	List<BookProductsVO> priceQuery(Double min,Double max);
	List<BookProductsVO> keywordQuery(String searchMain,String keywords);
	BookProductsVO singleQuery(Integer bookNumber);
}
