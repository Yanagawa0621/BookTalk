package com.forum.model;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.article.model.ArticleVO;

import util.HibernateUtil;


public class ForumDAO implements ForumDAO_interface {
	private SessionFactory factory;

	public ForumDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}
	@Override
	public void insert(ForumVO forumVO) {
		// TODO Auto-generated method stub
		getSession().save(forumVO);
	}

	@Override
	public void update(ForumVO forumVO) {
		// TODO Auto-generated method stub
		getSession().update(forumVO);
	}


	@Override
	public ForumVO findByForumNumber(Integer forumNumber) {
		// TODO Auto-generated method stub
		String hql = "FROM ForumVO WHERE forumNumber = :forumNumber";
        Query<ForumVO> query = getSession().createQuery(hql, ForumVO.class);
        query.setParameter("forumNumber", forumNumber);
        return query.uniqueResult();
	}

	@Override
	public List<ForumVO> getAll() {
		// TODO Auto-generated method stub
		 String hql = "FROM ForumVO";
	        Query<ForumVO> query = getSession().createQuery(hql, ForumVO.class);
	        return query.list();
	}

	@Override
	public List<ForumVO> findByForumName(String name) {
		// TODO Auto-generated method stub
		 String hql = "FROM ForumVO WHERE name like :name";
	        Query<ForumVO> query = getSession().createQuery(hql, ForumVO.class);
	        query.setParameter("name", "%" + name + "%");
	        return query.list();
	}


//	public static void main(String[] args) {
////
//		ForumDAO forum = new ForumDAO();
//		ForumVO forumvo = forum.findByForumNumber(1);
//		System.out.println(forumvo.getForumNumber() + ",");
//		System.out.println(forumvo.getName());
//		
//		List<ForumVO> list = forum.findByForumName("版");
//		for (ForumVO aEmp : list) {
//			System.out.print(aEmp.getForumNumber() + ",");
//			System.out.print(aEmp.getName() + ",");
//
//		}
//		ForumVO forumVO = new ForumVO();
//		forumVO.setName("書版");
//		forum.insert(forumVO);
//	}

}
