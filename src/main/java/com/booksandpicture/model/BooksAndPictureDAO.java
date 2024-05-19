package com.booksandpicture.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import util.HibernateUtil;

public class BooksAndPictureDAO implements BooksAndPictureDAO_Impl {
	private SessionFactory factory;

	public BooksAndPictureDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int increase(BooksAndPictureVO bapVO) {
		try {
			getSession().save(bapVO);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public int update(BooksAndPictureVO bapVO) {
		try {
			getSession().update(bapVO);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}
}
