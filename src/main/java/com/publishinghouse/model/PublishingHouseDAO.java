package com.publishinghouse.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import util.HibernateUtil;

public class PublishingHouseDAO implements PublishingHouseDAO_Impl {
	private SessionFactory factory;

	public PublishingHouseDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int increase(PublishingHouseVO phVO) {
		try {
			getSession().save(phVO);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public int update(PublishingHouseVO phVO) {
		try {
			getSession().update(phVO);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public List<PublishingHouseVO> getAll() {
		return getSession().createQuery("from PublishingHouseVO", PublishingHouseVO.class).list();
	}

	@Override
	public List<PublishingHouseVO> keywordQuery(String Keywords) {
		return getSession().createQuery("from PublishingHouseVO where name like :Keywords", PublishingHouseVO.class)
				.setParameter("Keywords", "%" + Keywords + "%").list();
	}

	@Override
	public PublishingHouseVO singleQuery(Integer publishingHouseNumber) {
		return getSession().get(PublishingHouseVO.class, publishingHouseNumber);
	}

	// =================================以下是測試用的main方法========================================
//	public static void main(String[] args) {
//		SessionFactory factory;
//		factory = HibernateUtil.getSessionFactory();
//		Session session = factory.getCurrentSession();
//		Transaction transaction = session.beginTransaction();
//		PublishingHouseDAO dao = new PublishingHouseDAO();
//		System.out.println(dao.keywordQuery("文庫").get(0).getName());
//
//		transaction.commit();
//	}
}
