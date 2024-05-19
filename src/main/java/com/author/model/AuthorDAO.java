package com.author.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


import util.HibernateUtil;

public class AuthorDAO implements AuthorDAO_Impl {
	private SessionFactory factry;

	public AuthorDAO() {
		factry = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factry.getCurrentSession();
	}

	@Override
	public int increase(AuthorVO authVO) {
		try {
			getSession().save(authVO);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public int update(AuthorVO authVO) {
		try {
			getSession().update(authVO);
			return 1;
		} catch (Exception e) {
			return -1;
		}

	}

	@Override
	public AuthorVO singleQuery(Integer authorNumber) {
		return getSession().get(AuthorVO.class, authorNumber);
	}

	@Override
	public List<AuthorVO> getAll() {
		return getSession().createQuery("from AuthorVO",AuthorVO.class).list();
	}

	@Override
	public List<AuthorVO> keywordQuery(String zhAndenName) {
		return getSession().createQuery("from AuthorVO where authorName like :zhAndenName1 or englishName like :zhAndenName2",AuthorVO.class)
				.setParameter("zhAndenName1", "%"+zhAndenName+"%")
				.setParameter("zhAndenName2", "%"+zhAndenName+"%")
				.list();
	}
	
	// =================================以下是測試用的main方法========================================
		public static void main(String[] args) {
			SessionFactory factory;
			factory = HibernateUtil.getSessionFactory();
			Session session = factory.getCurrentSession();
			Transaction transaction = session.beginTransaction();
			AuthorDAO dao = new AuthorDAO();
			
			System.out.println(dao.getAll());

			transaction.commit();
		}
}
