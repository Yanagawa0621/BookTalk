package com.promotionproject.model;

import java.util.*;

public interface PromotionProjectDAO_interface {
	public void insert(PromotionProjectVO promotionProjectVO);
	public void update(PromotionProjectVO promotionProjectVO);
	public PromotionProjectVO findByPrimaryKey(Integer promotionProjectNumber);	
	public List<PromotionProjectVO> getAll();
}
