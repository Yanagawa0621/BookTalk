package com.likeRecord.model;

import java.util.List;

public interface LikeDAO_interface {
	public void insert(LikeVO likeVO);

	public void delete(LikeVO likeVO);

	public LikeVO getUsersLike(Integer userNumber, Integer articleNumber);
	
	public LikeVO getUsersLikeCom(Integer userNumber, Integer commentNumber);
}
