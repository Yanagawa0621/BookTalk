package com.promotionproject.model;

import java.util.*;

public interface PromotionProjectDAO_interface {
	public int insert(PromotionProjectVO promotionProjectVO);
	public int update(PromotionProjectVO promotionProjectVO);
	public PromotionProjectVO findByPrimaryKey(Integer promotionProjectNumber);	
	public List<PromotionProjectVO> getAll();
}
