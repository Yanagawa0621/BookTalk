package com.bookproducts.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import util.HibernateUtil;

public class BookProductsDAO implements BookProductsDAO_Impl {

	private SessionFactory factory;

	public BookProductsDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public List<BookProductsVO> getAll() {
		// TODO Auto-generated method stub
		return getSession().createQuery("from BookProductsVO", BookProductsVO.class).list();
	}

	@Override
	public List<BookProductsVO> priceSearch(Double min, Double max) {
		// TODO Auto-generated method stub
		return getSession().createQuery("from BookProductsVO where price between :min and :max", BookProductsVO.class)
				.setParameter("min", min).setParameter("max", max).list();
	}

	@Override
	public List<BookProductsVO> npi(Integer year,Integer month) {
		// TODO Auto-generated method stub
		return getSession().createQuery("from BookProductsVO where year(releaseDate)=:year and month(releaseDate)=:month", BookProductsVO.class)
				
				.setParameter("year", year).setParameter("month", month).list();
	}

	@Override
	public List<BookProductsVO> keywordSearch(String searchMain, String keywords) {
		// TODO Auto-generated method stub
		return getSession().createQuery("from BookProductsVO where " + searchMain + " like :keywords", BookProductsVO.class)
				.setParameter("keywords", "%"+keywords+"%").list();
	}

	@Override
	public BookProductsVO singleQuery(Integer bookNumber) {
		// TODO Auto-generated method stub
		return getSession().get(BookProductsVO.class, bookNumber);
	}

	public static void main(String[] args) {
		BookProductsDAO bp = new BookProductsDAO();
		Session session = bp.getSession();
		Transaction transaction = session.beginTransaction();
		System.out.println(bp.singleQuery(5));
		transaction.commit();
	}
}
