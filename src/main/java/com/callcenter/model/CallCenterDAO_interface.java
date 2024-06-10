package com.callcenter.model;

import java.util.List;

public interface CallCenterDAO_interface{
	boolean save(CallCenterVO vo);
	List<CallCenterVO> createQuery(Integer orderNumber,String email,String problemType);
	CallCenterVO queryVoById(Integer id);
}
