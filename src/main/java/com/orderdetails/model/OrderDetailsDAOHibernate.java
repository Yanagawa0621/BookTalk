package com.orderdetails.model;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.order.model.OrderVO;
import com.orderdetails.model.OrderDetailsVO.OrderDetailsId;
import util.HibernateUtil;

public class OrderDetailsDAOHibernate implements OrderDetailsDAO_interface{
	private SessionFactory factory;
	
	
	public OrderDetailsDAOHibernate() {
		factory = HibernateUtil.getSessionFactory();
	}
	
	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public void insert(OrderDetailsVO orderDetailsVO) {
		getSession().save(orderDetailsVO);		
	}

	@Override
	public int update(OrderDetailsVO orderDetailsVO) {	
		try {
			getSession().update(orderDetailsVO);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}
	
	@Override
	public OrderDetailsVO findByOrderDetailsId(OrderDetailsId orderDetailsId) {
		return getSession().get(OrderDetailsVO.class, orderDetailsId);
	}
	
	@Override
	public List<OrderDetailsVO> getAll() {
		return getSession().createQuery("from OrderDetailsVO", OrderDetailsVO.class)
				.getResultList();
	}

}