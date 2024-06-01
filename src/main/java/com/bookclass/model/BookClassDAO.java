package com.bookclass.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.ConstraintViolationException;

import util.HibernateUtil;

public class BookClassDAO implements BookClassDAO_Impl {

	private SessionFactory factory;

	public BookClassDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}
	
	//新增
	@Override
	public int increase(BookClassVO bcVO) {
		try {
			getSession().save(bcVO);
			return 1;
		}catch (ConstraintViolationException e) {
			return -2;
		}catch (Exception e) {
			return -1;
		}
	}
	
	//修改
	@Override
	public int update(BookClassVO bcVO) {
		try {
			getSession().update(bcVO);
			return 1;
		}catch (ConstraintViolationException e) {
			return -2;
		}catch (Exception e) {
			return -1;
		}
	}
	
	//收尋全部
	@Override
	public List<BookClassVO> getAll() {
		return getSession().createQuery("from BookClassVO", BookClassVO.class).list();
	}
	
	//單筆搜尋
	@Override
	public BookClassVO singleQuery(Integer classNumber) {
		BookClassVO bcVO = getSession().get(BookClassVO.class, classNumber);
		return bcVO;
	}
	
	//模糊搜尋
	@SuppressWarnings("unchecked")
	@Override
	public List<BookClassVO> keywordQuery(String keywords) {
		List<BookClassVO> list = getSession().createQuery("from BookClassVO where className like :keywords")
				.setParameter("keywords", "%"+keywords+"%").list();
		return list;
	}

	// =================================以下是測試用的main方法========================================

//	public static void main(String[] args) {
//		BookClassDAO bc = new BookClassDAO();
//		Session session = bc.getSession();
//		Transaction transaction = session.beginTransaction();
//		System.out.println(bc.getAll());
//		transaction.commit();
//	}
}
