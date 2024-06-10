package com.qa.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

public class QaDAO implements QaDAO_interface {

	private SessionFactory factory;

	public QaDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	// 查詢全部
	@Override
	public List<QaVO> getAll() {
		return getSession().createQuery("from QaVO where way='Y'", QaVO.class).list();
	}
	
	@Override
	public boolean save(QaVO vo) {
		try {
			getSession().save(vo);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	
	@Override
	public QaVO queryVoById(Integer questionNo) {
		return getSession().get(QaVO.class, questionNo);
	}
	
	@Override
	public List<QaVO> createQuery(Integer questionNo,String question,String way) {
		StringBuffer sb = new StringBuffer();
		sb.append("from QaVO where 1=1 ");
		if(questionNo != null) {
			sb.append(" and questionNo=:questionNo ");
		}
		if(question != null && !"".equals(question)) {
			sb.append(" and question like:question ");
		}
		if(way != null && !"".equals(way)) {
			sb.append(" and way=:way ");
		}
		QaVO vo = new QaVO();
		vo.setQuestionNo(questionNo);
		vo.setQuestion("%"+question+"%");
		vo.setWay(way);
		//System.out.println("SQL="+sb.toString());
		//System.out.println("vo="+new Gson().toJson(vo));
		return getSession().createQuery(sb.toString() , QaVO.class)
				.setProperties(vo).list();
	}
	
	 @Override
	    public void update(QaVO vo) {
	        getSession().update(vo);
	    }
	 @Override
	 public QaVO findById(Integer questionNo) {
	        return getSession().get(QaVO.class, questionNo);
	    }
	 
	 
//=================================以下是測試用的main方法========================================
/*
	public static void main(String[] args) {
		QaDAO bp = new QaDAO();
		Session session = bp.getSession();
		Transaction transaction = session.beginTransaction();
		
		for(QaVO vo : bp.getAll() ) {
			System.out.println(vo.getQuestion());
		}
		System.out.println(bp.getAll());
		transaction.commit();
	}
	*/
}
