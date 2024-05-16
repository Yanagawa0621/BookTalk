package com.bookproducts.model;

import java.util.List;

public interface BookProductsDAO_Impl{
	
	List<BookProductsVO> getAll();
	List<BookProductsVO> npi(Integer year,Integer month);
	List<BookProductsVO> priceSearch(Double min,Double max);
	List<BookProductsVO> keywordSearch(String searchMain,String keywords);
	BookProductsVO singleQuery(Integer bookNumber);
}
