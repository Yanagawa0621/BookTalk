package com.article.model;

import java.time.LocalDateTime;
import java.util.List;

import com.forum.model.ForumVO;

public class ArticleService {
	public ArticleDAO_interface dao;
	public ArticleService() {
		dao = new ArticleDAO();
	}
	public List<ArticleVO> getPopularArticle(){
		return dao.findAllByOrderByPageViewThisMonth();
	}
	public ArticleVO addArticle(String content,String title) {

		ArticleVO articleVO = new ArticleVO();
		articleVO.setArticleState(1);
		articleVO.setContent(content);
		articleVO.setIssueTime(LocalDateTime.now());
		articleVO.setLikeSum(0);
		articleVO.setPageView(1);
		articleVO.setTitle(title);
		articleVO.setUserNumber(1);
		ForumVO forumVO = new ForumVO();
		forumVO.setForumNumber(1);
		articleVO.setForumVO(forumVO);
		dao.insert(articleVO);
		
		return articleVO;
	}
	public List<ArticleVO> findForumsArticle(Integer forumNumber){
		return dao.findByForumNumber(forumNumber);
	}
}
