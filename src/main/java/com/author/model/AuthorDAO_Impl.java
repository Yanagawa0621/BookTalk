package com.author.model;

import java.util.List;

public interface AuthorDAO_Impl {
	int increase (AuthorVO authVO);
	int update(AuthorVO authVO);
	AuthorVO singleQuery(Integer authorNumber);
	AuthorVO nameQuery(String name);
	List<AuthorVO> getAll();
	List<AuthorVO> keywordQuery(String zhAndenName);
}
