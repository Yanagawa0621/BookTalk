package com.qa.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;



import util.HibernateUtil;

public class QaDAO implements QaDAO_interface {

	private SessionFactory factory;

	public QaDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	// 查詢全部
	@Override
	public List<QaVO> getAll() {
		return getSession().createQuery("from QaVO where way='Y'", QaVO.class).list();
	}

	
//=================================以下是測試用的main方法========================================
/*
	public static void main(String[] args) {
		QaDAO bp = new QaDAO();
		Session session = bp.getSession();
		Transaction transaction = session.beginTransaction();
		
		for(QaVO vo : bp.getAll() ) {
			System.out.println(vo.getQuestion());
		}
		System.out.println(bp.getAll());
		transaction.commit();
	}
*/
}
