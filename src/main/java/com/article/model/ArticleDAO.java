package com.article.model;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.temporal.TemporalAdjusters;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import util.HibernateUtil;

public class ArticleDAO implements ArticleDAO_interface {
	public void insert(ArticleVO articleVO) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.save(articleVO);
			session.getTransaction().commit();

		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}

	}

	@Override
	public void update(ArticleVO articleVO) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.update(articleVO);
			session.getTransaction().commit();

		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}

	}

	@Override
	public List<ArticleVO> findByForumName(String name) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<ArticleVO> articleVO = null;

		try {
			session.beginTransaction();
			String hql = "FROM ArticleVO WHERE forumVO.name = :name";
			Query<ArticleVO> query = session.createQuery(hql, ArticleVO.class);
			query.setParameter("name", name);
			articleVO = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return articleVO;
	}

	@Override
	public List<ArticleVO> findByKeyWord(String keyword) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<ArticleVO> articleVO = null;
		try {
			session.beginTransaction();
			String hql = "FROM ArticleVO WHERE forumVO.name like :keyword";
			Query<ArticleVO> query = session.createQuery(hql, ArticleVO.class);
			query.setParameter("keyword", "%" + keyword + "%");
			articleVO = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return articleVO;
	}

	@Override
	// UserVO還沒
	public List<ArticleVO> findByUserName(String userName) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<ArticleVO> articleVO = null;

		try {
			session.beginTransaction();
			String hql = "FROM ArticleVO WHERE userName = :userName";
			Query<ArticleVO> query = session.createQuery(hql, ArticleVO.class);
			query.setParameter("userName", userName);
			articleVO = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return articleVO;
	}

	@Override
	public List<ArticleVO> findByOrderByPageView() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<ArticleVO> articleVO = null;

		try {
			session.beginTransaction();
			String hql = "FROM ArticleVO ORDER BY pageView DESC";
			Query<ArticleVO> query = session.createQuery(hql, ArticleVO.class);
			articleVO = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return articleVO;
	}

	@Override
	public List<ArticleVO> findByOrderByLikeSum() {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<ArticleVO> articleVO = null;

		try {
			session.beginTransaction();
			String hql = "FROM ArticleVO ORDER BY likeSum DESC";
			Query<ArticleVO> query = session.createQuery(hql, ArticleVO.class);
			articleVO = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return articleVO;
	}

	@Override
	public List<ArticleVO> findByOrderByPageViewThisMonth(String name) {
		// TODO Auto-generated method stub
		LocalDateTime now = LocalDateTime.now();
		// 獲得當前月份的第一天
		LocalDateTime firstDayOfMonth = now.with(TemporalAdjusters.firstDayOfMonth());
		// 獲得取下個月的第一天
		LocalDateTime firstDayOfNextMonth = firstDayOfMonth.plusMonths(1);

		String hql = "FROM ArticleVO a WHERE a.forumVO.name = :forumName AND a.issueTime >= :startDate AND a.issueTime < :endDate ORDER BY a.pageView DESC";

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<ArticleVO> articleVO = null;
		try {
			session.beginTransaction();
			Query<ArticleVO> query = session.createQuery(hql, ArticleVO.class);
			query.setParameter("forumName", name);
			query.setParameter("startDate", firstDayOfMonth);
			query.setParameter("endDate", firstDayOfNextMonth);
			articleVO = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return articleVO;
	}

	@Override
	public List<ArticleVO> findByOrderByLikeSumThisMont(String name) {
		// TODO Auto-generated method stub
		LocalDateTime now = LocalDateTime.now();
		// 獲得當前月份的第一天
		LocalDateTime firstDayOfMonth = now.with(TemporalAdjusters.firstDayOfMonth());
		// 獲得取下個月的第一天
		LocalDateTime firstDayOfNextMonth = firstDayOfMonth.plusMonths(1);

		String hql = "FROM ArticleVO a WHERE a.forumVO.name = :forumName AND a.issueTime >= :startDate AND a.issueTime < :endDate ORDER BY a.likeView DESC";

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<ArticleVO> articleVO = null;
		try {
			session.beginTransaction();
			Query<ArticleVO> query = session.createQuery(hql, ArticleVO.class);
			query.setParameter("forumName", name);
			query.setParameter("startDate", firstDayOfMonth);
			query.setParameter("endDate", firstDayOfNextMonth);
			articleVO = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return articleVO;
	}

	@Override
	public List<ArticleVO> findByOrderByPageViewThisWeek(Integer forumNumber) {
		// TODO Auto-generated method stub
		LocalDateTime now = LocalDateTime.now();
		LocalDateTime startOfWeek = now.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY)).withHour(0)
				.withMinute(0).withSecond(0).withNano(0);
		LocalDateTime startOfNextWeek = startOfWeek.plusWeeks(1);

		String hql = "FROM ArticleVO a WHERE a.forumVO.forumNumber = :forumNumber AND a.issueTime >= :startOfWeek AND a.issueTime < :startOfNextWeek ORDER BY a.pageView DESC";

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<ArticleVO> articleVO = null;
		try {
			session.beginTransaction();
			Query<ArticleVO> query = session.createQuery(hql, ArticleVO.class);
			query.setParameter("forumNumber", forumNumber);
			query.setParameter("startOfWeek", startOfWeek);
			query.setParameter("startOfNextWeek", startOfNextWeek);
			articleVO = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return articleVO;
	}

	@Override
	public boolean updateArticleStatus(Integer articleNumber, Integer articleState) {
		// TODO Auto-generated method stub
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			ArticleVO articleVO = session.get(ArticleVO.class, articleNumber);
			if (articleVO != null) {
				articleVO.setArticleState(articleState);
				session.update(articleVO);
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
	public List<ArticleVO> findAllByOrderByPageViewThisMonth() {
		// TODO Auto-generated method stub
		LocalDateTime now = LocalDateTime.now();
		// 獲得當前月份的第一天
		LocalDateTime firstDayOfMonth = now.with(TemporalAdjusters.firstDayOfMonth());
		// 獲得取下個月的第一天
		LocalDateTime firstDayOfNextMonth = firstDayOfMonth.plusMonths(1);

		String hql = "FROM ArticleVO a WHERE a.issueTime >= :startDate AND a.issueTime < :endDate ORDER BY a.likeSum DESC";

		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<ArticleVO> articleVO = null;
		try {
			session.beginTransaction();
			Query<ArticleVO> query = session.createQuery(hql, ArticleVO.class);
			query.setParameter("startDate", firstDayOfMonth);
			query.setParameter("endDate", firstDayOfNextMonth);
			articleVO = query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}
		return articleVO;
	}

}
