package com.order.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import util.HibernateUtil;

public class OrderDAOHibernate implements OrderDAO_interface {
	// SessionFactory 為 thread-safe，可宣告為屬性讓請求執行緒們共用
	private SessionFactory factory;
	
	public OrderDAOHibernate() {
		factory = HibernateUtil.getSessionFactory();
	}
	
	// Session 為 not thread-safe，所以此方法在各個增刪改查方法裡呼叫
	// 以避免請求執行緒共用了同個 Session
	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int insert(OrderVO orderVO) {
		return (Integer) getSession().save(orderVO);
	}

	@Override
	public int update(OrderVO orderVO) {
		try {
			getSession().update(orderVO);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public OrderVO findByPrimaryKey(Integer orderNumber) {
		return getSession().get(OrderVO.class, orderNumber);
	}

	@Override
	public List<OrderVO> getAll() {
		List<OrderVO> allOrdersList = getSession().createQuery("SELECT DISTINCT o FROM OrderVO o LEFT JOIN FETCH o.orderDetails od LEFT JOIN FETCH od.bookProductsVO", OrderVO.class)
				.getResultList();	
		return allOrdersList;
	}

	@Override
	public List<OrderVO> findByUserNumber(Integer userNumber) {
		return getSession().createQuery("SELECT DISTINCT o FROM OrderVO o LEFT JOIN FETCH o.orderDetails od LEFT JOIN FETCH od.bookProductsVO WHERE o.userNumber = :userNumber", 
				OrderVO.class)
				.setParameter("userNumber", userNumber)
				.getResultList();
	}
	
	@Override
	public List<Integer> getUserNumber() {
		return getSession().createQuery("select userNumber from OrderVO group by userNumber", Integer.class)
				.getResultList();
	}
	

	@Override
	public List<OrderVO> findByOrderStatus(Integer orderStatus) {
		return getSession().createQuery("SELECT DISTINCT o FROM OrderVO o LEFT JOIN FETCH o.orderDetails od LEFT JOIN FETCH od.bookProductsVO WHERE o.orderStatus = :orderStatus", 
				OrderVO.class)
				.setParameter("orderStatus", orderStatus)
				.getResultList();
		
//		return getSession().createQuery("from OrderVO where orderStatus = ?0 order by orderNumber", OrderVO.class)
//				.setParameter(0, orderStatus)
//				.getResultList();
	}

}
