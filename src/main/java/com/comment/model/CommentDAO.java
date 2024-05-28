package com.comment.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import util.HibernateUtil;

public class CommentDAO implements CommentDAO_interface {
	private SessionFactory factory;

	public CommentDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public void insert(CommentVO commentVO) {

		getSession().save(commentVO);
	}

	@Override
	public void update(CommentVO commentVO) {

		getSession().update(commentVO);
	}

	@Override
	public boolean updateCommentStatus(Integer commentNumber, Integer commentState) {

		CommentVO commentVO = getSession().get(CommentVO.class, commentNumber);
		if (commentVO != null) {
			commentVO.setCommentState(commentState);
			getSession().update(commentVO);
			return true;
		}
		return false;
	}

	@Override
	public List<CommentVO> findByArticleNumber(Integer articleNumber) {

		String hql = "FROM CommentVO WHERE articleVO.articleNumber = :articleNumber";
		Query<CommentVO> query = getSession().createQuery(hql, CommentVO.class);
		query.setParameter("articleNumber", articleNumber);
		return query.list();
	}
}
