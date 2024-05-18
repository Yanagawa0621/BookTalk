package com.publishinghouse.model;

import java.util.List;

public interface PublishingHouseDAO_Impl {
	int increase(PublishingHouseVO phVO);
	int update(PublishingHouseVO phVO);
	List<PublishingHouseVO> getAll();
	List<PublishingHouseVO> KeywordQuery(String Keywords);
	PublishingHouseVO singleQuery(Integer publishingHouseNumber);
	
}
