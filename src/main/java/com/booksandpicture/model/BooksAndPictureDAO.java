package com.booksandpicture.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.bookproducts.model.BookProductsVO;

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

	public List<BooksAndPictureVO> relatedPictures(BookProductsVO bpVO) {
		return getSession().createQuery("from BooksAndPictureVO where bpVO =:bpVO", BooksAndPictureVO.class)
				.setParameter("bpVO", bpVO).list();
	}

	@Override
	public BooksAndPictureVO singleQuery(Integer pictureNumber) {
		return getSession().get(BooksAndPictureVO.class, pictureNumber);
	}
}
