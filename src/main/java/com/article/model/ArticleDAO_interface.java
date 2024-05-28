package com.article.model;

import java.util.List;

public interface ArticleDAO_interface {
	public void insert(ArticleVO articleVO);
	public void update(ArticleVO articleVO);
	public List<ArticleVO> findByForumNumber(Integer forumNumber);
	public List<ArticleVO> findByKeyWord(String keyword);
	public List<ArticleVO> findByUserName(String userName);
	public List<ArticleVO> findByOrderByPageView();
	public List<ArticleVO> findByOrderByLikeSum();
	public List<ArticleVO> findByOrderByPageViewThisMonth(String name);
	public List<ArticleVO> findByOrderByLikeSumThisMont(String name);
	public List<ArticleVO> findByOrderByPageViewThisWeek(Integer forumNumber);
	public boolean updateArticleStatus(Integer articleNumber, Integer articleState);
	public List<ArticleVO> findAllByOrderByPageViewThisMonth();
}