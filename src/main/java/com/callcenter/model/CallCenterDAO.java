package com.callcenter.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.json.JSONObject;

import util.HibernateUtil;

public class CallCenterDAO implements CallCenterDAO_interface {

	private SessionFactory factory;

	public CallCenterDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public boolean save(CallCenterVO vo) {
		try {
			getSession().save(vo);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

//=================================以下是測試用的main方法========================================
/*
	public static void main(String[] args) {
		CallCenterDAO ccDAO = new CallCenterDAO();
		CallCenterVO vo = new CallCenterVO();
		if (!"".equals(123)) {
			vo.setOrderNumber(Integer.valueOf(123));
		}
		vo.setProblemType("2");
		vo.setProblemDescription("測試問題描述");
		vo.setEmail("ABCD@yahoo.com.tw");
		vo.setAttachedFile(null);
		Session session = ccDAO.getSession();
		Transaction transaction = session.beginTransaction();
		boolean isScuess = ccDAO.save(vo);
		System.out.println("isScuess=" + isScuess);
		transaction.commit();
	}
*/
}
