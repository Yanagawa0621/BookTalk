package com.likeRecord.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.article.model.ArticleVO;

import util.HibernateUtil;

public class LikeDAO implements LikeDAO_interface{
private SessionFactory factory;
	
    public LikeDAO() {
    	factory = HibernateUtil.getSessionFactory();
	}

    private Session getSession() {
		return factory.getCurrentSession();
	}
	@Override
	public void insert(LikeVO likeVO) {
		// TODO Auto-generated method stub
		getSession().save(likeVO);
	}

	@Override
	public void delete(LikeVO likeVO) {
		// TODO Auto-generated method stub
		getSession().delete(likeVO);
	}

	@Override
	public LikeVO getUsersLike(Integer userNumber, Integer articleNumber) {
		// TODO Auto-generated method stub
		String hql = "FROM LikeVO WHERE userNumber = :userNumber and articleNumber = :articleNumber" ;
        Query<LikeVO> query = getSession().createQuery(hql, LikeVO.class);
        query.setParameter("userNumber", userNumber);
        query.setParameter("articleNumber", articleNumber);
        return query.uniqueResult();
	}
	
}
