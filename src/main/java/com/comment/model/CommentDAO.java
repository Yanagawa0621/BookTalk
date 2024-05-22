package com.comment.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.article.model.ArticleVO;

import util.HibernateUtil;

public class CommentDAO implements CommentDAO_interface{

	@Override
	public void insert(CommentVO commentVO) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.save(commentVO);
			session.getTransaction().commit();

		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		
	}

	@Override
	public void update(CommentVO commentVO) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.update(commentVO);
			session.getTransaction().commit();

		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		
	}

	@Override
	public boolean updateCommentStatus(Integer commentNumber, Integer commentState) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
            session.beginTransaction();
            CommentVO commentVO = session.get(CommentVO.class, commentNumber);
            if (commentVO != null) {
            	commentVO.setCommentState(commentState);
                session.update(commentVO);
                session.getTransaction().commit();
                return true;
            }
            
        } catch (Exception e) {
        		e.printStackTrace();
        		session.getTransaction().rollback();
            }
            return false;
		
	}

	@Override
	public List<CommentVO> findByArticleNumber(Integer articleNumber) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<CommentVO> commentVO = null;

		try {
			session.beginTransaction();
			String hql = "FROM CommentVO WHERE articleVO.articleNumber = :articleNumber";
			Query<CommentVO> query = session.createQuery(hql, CommentVO.class);
			query.setParameter("articleNumber", articleNumber);
			commentVO = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} 
		return commentVO;
	}

}
