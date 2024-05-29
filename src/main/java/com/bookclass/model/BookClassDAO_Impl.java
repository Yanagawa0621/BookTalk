package com.bookclass.model;

import java.util.List;

public interface BookClassDAO_Impl {
	int increase(BookClassVO bcVO);
	int update(BookClassVO bcVO);
	List<BookClassVO> getAll();
	BookClassVO singleQuery(Integer classNumber);
	List<BookClassVO> keywordQuery(String keywords);
}
