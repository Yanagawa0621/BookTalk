package com.article.model;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.temporal.TemporalAdjusters;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.forum.model.ForumVO;

import util.HibernateUtil;

public class ArticleDAO implements ArticleDAO_interface {
	private SessionFactory factory;
	
    public ArticleDAO() {
    	factory = HibernateUtil.getSessionFactory();
	}

    private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
    public void insert(ArticleVO articleVO) {
        getSession().save(articleVO);
    }


	@Override
    public void update(ArticleVO articleVO) {
		getSession().update(articleVO);
    }

    @Override
    public List<ArticleVO> findByForumNumber(Integer forumNumber) {
        String hql = "FROM ArticleVO WHERE forumVO.forumNumber = :forumNumber AND articleState = 1";
        Query<ArticleVO> query = getSession().createQuery(hql, ArticleVO.class);
        query.setParameter("forumNumber", forumNumber);
        return query.list();
    }

    @Override
    public List<ArticleVO> findByKeyWord(String keyword) {
        String hql = "FROM ArticleVO a WHERE a.title like :keyword AND a.articleState = 1";
        Query<ArticleVO> query = getSession().createQuery(hql, ArticleVO.class);
        query.setParameter("keyword", "%" + keyword + "%");
        return query.list();
    }

    @Override
    public List<ArticleVO> findByUserName(String userName) {
        String hql = "FROM ArticleVO WHERE userName = :userName";
        Query<ArticleVO> query = getSession().createQuery(hql, ArticleVO.class);
        query.setParameter("userName", userName);
        return query.list();
    }

    @Override
    public List<ArticleVO> findByOrderByLikeSum() {
        String hql = "FROM ArticleVO ORDER BY likeSum DESC";
        Query<ArticleVO> query = getSession().createQuery(hql, ArticleVO.class);
        return query.list();
    }


    @Override
    public List<ArticleVO> findByOrderByLikeSumThisMont(String name) {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime firstDayOfMonth = now.with(TemporalAdjusters.firstDayOfMonth());
        LocalDateTime firstDayOfNextMonth = firstDayOfMonth.plusMonths(1);

        String hql = "FROM ArticleVO a WHERE a.forumVO.name = :forumName AND a.issueTime >= :startDate AND a.issueTime < :endDate ORDER BY a.likeSum DESC";

        Query<ArticleVO> query = getSession().createQuery(hql, ArticleVO.class);
        query.setParameter("forumName", name);
        query.setParameter("startDate", firstDayOfMonth);
        query.setParameter("endDate", firstDayOfNextMonth);
        return query.list();
    }

    @Override
    public boolean updateArticleStatus(Integer articleNumber) {
        ArticleVO articleVO = getSession().get(ArticleVO.class, articleNumber);
        if (articleVO != null) {
            articleVO.setArticleState(0);
            getSession().update(articleVO);
            return true;
        }
        return false;
    }

    @Override
    public List<ArticleVO> findAllByOrderByLikeSumThisMonth() {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime firstDayOfMonth = now.with(TemporalAdjusters.firstDayOfMonth());
        LocalDateTime firstDayOfNextMonth = firstDayOfMonth.plusMonths(1);

        String hql = "FROM ArticleVO a WHERE a.issueTime >= :startDate AND a.issueTime < :endDate AND a.articleState = 1 ORDER BY a.likeSum DESC";

        Query<ArticleVO> query = getSession().createQuery(hql, ArticleVO.class);
        query.setParameter("startDate", firstDayOfMonth);
        query.setParameter("endDate", firstDayOfNextMonth);
        return query.list();
    }

	@Override
	public ArticleVO findByArticleNumber(Integer articleNumber) {
		// TODO Auto-generated method stub
		String hql = "FROM ArticleVO a WHERE a.articleNumber = :articleNumber AND a.articleState = 1";
        Query<ArticleVO> query = getSession().createQuery(hql, ArticleVO.class);
        query.setParameter("articleNumber", articleNumber);
        return query.uniqueResult();
	}
}
