package com.bookproducts.model;

import java.util.List;

public interface BookProductsDAO_Impl{
	int increase(BookProductsVO bpVO);
	int update (BookProductsVO bpVO);
	List<BookProductsVO> getAll();
	List<BookProductsVO> npi(int year,int month);
	List<BookProductsVO> priceQuery(Double min,Double max);
	List<BookProductsVO> keywordQuery(String searchMain,String keywords);
	List<BookProductsVO> statusQuery(Integer productStatus);
	BookProductsVO singleQuery(Integer bookNumber);
}
