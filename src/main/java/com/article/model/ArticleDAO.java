package com.article.model;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.temporal.TemporalAdjusters;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
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
        String hql = "FROM ArticleVO WHERE forumVO.forumNumber = :forumNumber";
        Query<ArticleVO> query = getSession().createQuery(hql, ArticleVO.class);
        query.setParameter("forumNumber", forumNumber);
        return query.list();
    }

    @Override
    public List<ArticleVO> findByKeyWord(String keyword) {
        String hql = "FROM ArticleVO WHERE forumVO.name like :keyword";
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
    public List<ArticleVO> findByOrderByPageView() {
        String hql = "FROM ArticleVO ORDER BY pageView DESC";
        Query<ArticleVO> query = getSession().createQuery(hql, ArticleVO.class);
        return query.list();
    }

    @Override
    public List<ArticleVO> findByOrderByLikeSum() {
        String hql = "FROM ArticleVO ORDER BY likeSum DESC";
        Query<ArticleVO> query = getSession().createQuery(hql, ArticleVO.class);
        return query.list();
    }

    @Override
    public List<ArticleVO> findByOrderByPageViewThisMonth(String name) {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime firstDayOfMonth = now.with(TemporalAdjusters.firstDayOfMonth());
        LocalDateTime firstDayOfNextMonth = firstDayOfMonth.plusMonths(1);

        String hql = "FROM ArticleVO a WHERE a.forumVO.name = :forumName AND a.issueTime >= :startDate AND a.issueTime < :endDate ORDER BY a.pageView DESC";

        Query<ArticleVO> query = getSession().createQuery(hql, ArticleVO.class);
        query.setParameter("forumName", name);
        query.setParameter("startDate", firstDayOfMonth);
        query.setParameter("endDate", firstDayOfNextMonth);
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
    public List<ArticleVO> findByOrderByPageViewThisWeek(Integer forumNumber) {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime startOfWeek = now.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY)).withHour(0).withMinute(0).withSecond(0).withNano(0);
        LocalDateTime startOfNextWeek = startOfWeek.plusWeeks(1);

        String hql = "FROM ArticleVO a WHERE a.forumVO.forumNumber = :forumNumber AND a.issueTime >= :startOfWeek AND a.issueTime < :startOfNextWeek ORDER BY a.pageView DESC";

        Query<ArticleVO> query = getSession().createQuery(hql, ArticleVO.class);
        query.setParameter("forumNumber", forumNumber);
        query.setParameter("startOfWeek", startOfWeek);
        query.setParameter("startOfNextWeek", startOfNextWeek);
        return query.list();
    }

    @Override
    public boolean updateArticleStatus(Integer articleNumber, Integer articleState) {
        ArticleVO articleVO = getSession().get(ArticleVO.class, articleNumber);
        if (articleVO != null) {
            articleVO.setArticleState(articleState);
            getSession().update(articleVO);
            return true;
        }
        return false;
    }

    @Override
    public List<ArticleVO> findAllByOrderByPageViewThisMonth() {
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime firstDayOfMonth = now.with(TemporalAdjusters.firstDayOfMonth());
        LocalDateTime firstDayOfNextMonth = firstDayOfMonth.plusMonths(1);

        String hql = "FROM ArticleVO a WHERE a.issueTime >= :startDate AND a.issueTime < :endDate ORDER BY a.likeSum DESC";

        Query<ArticleVO> query = getSession().createQuery(hql, ArticleVO.class);
        query.setParameter("startDate", firstDayOfMonth);
        query.setParameter("endDate", firstDayOfNextMonth);
        return query.list();
    }
}
