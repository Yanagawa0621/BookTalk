package com.promotiondetails.model;

import java.util.List;


public interface PromotionDeatilsDAO_interface {
	public void insert(PromotionDetailsVO promotionDeatilsVO);
	public void update(PromotionDetailsVO promotionDeatilsVO);
	public List<PromotionDetailsVO> getAll();

}
