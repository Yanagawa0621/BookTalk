package com.callcenter.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.google.gson.Gson;

import util.HibernateUtil;

public class CallCenterDAO implements CallCenterDAO_interface {

	private SessionFactory factory;

	public CallCenterDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public boolean save(CallCenterVO vo) {
		try {
			getSession().save(vo);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	@Override
	public List<CallCenterVO> createQuery(Integer orderNumber,String email,String problemType) {
		StringBuffer sb = new StringBuffer();
		sb.append("from CallCenterVO where 1=1 ");
		if(orderNumber != null) {
			sb.append(" and orderNumber=:orderNumber ");
		}
		if(email != null && !"".equals(email)) {
			sb.append(" and email like:email ");
		}
		if(problemType != null && !"".equals(problemType)) {
			sb.append(" and problemType=:problemType ");
		}
		CallCenterVO vo = new CallCenterVO();
		vo.setOrderNumber(orderNumber);
		vo.setEmail("%"+email+"%");
		vo.setProblemType(problemType);
		//System.out.println("SQL="+sb.toString());
		//System.out.println("vo="+new Gson().toJson(vo));
		return getSession().createQuery(sb.toString() , CallCenterVO.class)
				.setProperties(vo).list();
	}

	@Override
	public CallCenterVO queryVoById(Integer id) {
		return getSession().get(CallCenterVO.class, id);
	}
//=================================以下是測試用的main方法========================================
/*
*/
	public static void main(String[] args) {
		//新增
		/*
		CallCenterDAO ccDAO = new CallCenterDAO();
		CallCenterVO vo = new CallCenterVO();
		if (!"".equals(123)) {
			vo.setOrderNumber(Integer.valueOf(123));
		}
		vo.setProblemType("2");
		vo.setProblemDescription("測試問題描述");
		vo.setEmail("ABCD@yahoo.com.tw");
		vo.setAttachedFile(null);
		Session session = ccDAO.getSession();
		Transaction transaction = session.beginTransaction();
		boolean isScuess = ccDAO.save(vo);
		System.out.println("isScuess=" + isScuess);
		transaction.commit();
		*/
		//查詢
		/*
		CallCenterDAO ccDAO = new CallCenterDAO();
		Session session = ccDAO.getSession();
		Transaction transaction = session.beginTransaction();
		List<CallCenterVO> list = ccDAO.createQuery(null, "123@yahoo.com", null);
		System.out.println("list=" + list.size());
		transaction.commit();
		*/
		//單筆查詢
		/*
		CallCenterDAO ccDAO = new CallCenterDAO();
		Session session = ccDAO.getSession();
		Transaction transaction = session.beginTransaction();
		CallCenterVO vo = ccDAO.queryVoById(5);
		System.out.println("vo=" + new Gson().toJson(vo));
		transaction.commit();
		*/
	}
}
