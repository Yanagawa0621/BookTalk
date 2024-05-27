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

	// 查詢全部
	@Override
	public List<BookProductsVO> getAll() {
		return getSession().createQuery("from BookProductsVO", BookProductsVO.class).list();
	}

	// 依金額查詢
	@Override
	public List<BookProductsVO> priceQuery(Double min, Double max) {
		return getSession()
				.createQuery("from BookProductsVO where price between :min and :max", BookProductsVO.class)
				.setParameter("min", min).setParameter("max", max).list();
	}

	// 依上架的年月查詢
	@Override
	public List<BookProductsVO> npi(int year, int month) {
		return getSession()
				.createQuery("from BookProductsVO where year(releaseDate)=:year and month(releaseDate)=:month",
						BookProductsVO.class)
				.setParameter("year", year).setParameter("month", month).list();
	}

	// 選擇欄位並模糊查詢
	@Override
	public List<BookProductsVO> keywordQuery(String searchMain, String keywords) {
		return getSession()
				.createQuery("from BookProductsVO where " + searchMain + " like :keywords", BookProductsVO.class)
				.setParameter("keywords", "%" + keywords + "%").list();
	}

	// 單筆查詢
	@Override
	public BookProductsVO singleQuery(Integer bookNumber) {
		return getSession().get(BookProductsVO.class, bookNumber);
	}
	
	//新增
	@Override
	public int increase(BookProductsVO bpVO) {
		try {
			getSession().save(bpVO);
			return bpVO.getBookNumber();
		} catch (Exception e) {
			return -1;
		}
	}
	
	//修改
	@Override
	public int update(BookProductsVO bpVO) {
		try {
			getSession().save(bpVO);
			return 0;
		} catch (Exception e) {
			return bpVO.getBookNumber();
		}
	}
	
//=================================以下是測試用的main方法========================================

//	public static void main(String[] args) {
//		BookProductsDAO bp = new BookProductsDAO();
//		Session session = bp.getSession();
//		Transaction transaction = session.beginTransaction();
////		System.out.println(bp.singleQuery(1).getBookTitle());
//		transaction.commit();
//	}

}
