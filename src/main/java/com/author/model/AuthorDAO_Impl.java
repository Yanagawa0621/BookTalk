package com.author.model;

import java.util.List;

public interface AuthorDAO_Impl {
	int increase (AuthorVO authVO);
	int update(AuthorVO authVO);
	AuthorVO singleQuery(Integer authorNumber);
	List<AuthorVO> getAll();
	List<AuthorVO> keywordQuery(String zhAndenName);
}
