package com.orderdetails.model;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.bookproducts.model.BookProductsVO;
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
	public int insert(OrderDetailsVO orderDetailsVO) {
		return (Integer) getSession().save(orderDetailsVO);		
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
	public OrderDetailsVO findByOrderDetailsNumberBookNumber(Integer orderDetailsNumber, Integer bookNumber) {
		return getSession().createQuery("from OrderDetailsVO where orderDetailsNumber = ?0 AND bookNumber = ?1", OrderDetailsVO.class)
				.setParameter(0, orderDetailsNumber)
				.setParameter(1, bookNumber)
				.getSingleResult();
	}
	
	@Override
	public List<OrderDetailsVO> getAll() {
		return getSession().createQuery("from OrderDetailsVO", OrderDetailsVO.class)
				.getResultList();
	}

	@Override
	public Double ratingScoreAvg(BookProductsVO bpVO) {
		return (Double) getSession().createQuery("select avg(od.ratingScore) from OrderDetailsVO od where od.bookProductsVO=:bookProductsVO")
				.setParameter("bookProductsVO", bpVO)
				.uniqueResult();
	}
	
	public List<Object[]> salesSorting() {
	    return getSession().createQuery(
	            "select od.bookProductsVO, count(od.ratingScore) as count " +
	            "from OrderDetailsVO od " +
	            "where od.ratingScore > 1 " +
	            "group by od.bookProductsVO " +
	            "order by count(od.ratingScore) desc", Object[].class)
	        .setMaxResults(10)
	        .list();
	}
}
