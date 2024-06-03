package com.qa.model;

import java.util.List;

public class QaService {
	QaDAO qaDAO = new QaDAO();
	
	public List<QaVO> getAll() {
		List<QaVO> vo = qaDAO.getAll() ;
		return vo;
 	}
}