package com.qa.model;

import java.util.List;


public interface QaDAO_interface{
	List<QaVO> getAll();
	QaVO queryVoById(Integer questionNo);
	boolean save(QaVO vo);
	List<QaVO> createQuery(Integer questionNo, String question, String way);
	void update(QaVO vo);
	QaVO findById(Integer questionNo);

}
