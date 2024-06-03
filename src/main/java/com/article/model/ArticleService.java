package com.article.model;

import java.time.LocalDateTime;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import com.forum.model.ForumVO;

public class ArticleService {
	public ArticleDAO_interface dao;

	public ArticleService() {
		dao = new ArticleDAO();
	}

	public List<ArticleVO> getPopularArticle() {
		return dao.findAllByOrderByLikeSumThisMonth();
	}

	public ArticleVO addArticle(String content, String title, Integer forumNumber,Integer userNumber) {
		ArticleVO articleVO = new ArticleVO();
		articleVO.setArticleState(1);
		articleVO.setContent(content);
		articleVO.setIssueTime(LocalDateTime.now());
		articleVO.setPageView(0);
		articleVO.setLikeSum(0);
		articleVO.setTitle(title);
		articleVO.setUserNumber(userNumber);
		ForumVO forumVO = new ForumVO();
		forumVO.setForumNumber(forumNumber);
		articleVO.setForumVO(forumVO);
		String pic = content;
		String summ = content;
		Document doc = Jsoup.parse(pic);
		Element link = doc.select("img").first();
		if (link == null) {
			articleVO.setArticleImage("<img src='/HibernateEx-Web/front-end/assets/img/blog/default.jpg' alt=''>");
		} else {
			articleVO.setArticleImage(link.outerHtml());
		}
		Document doc1 = Jsoup.parse(summ);
		String text = doc1.body().text();
		if (text.length() > 20) {
			String first20Chars = text.substring(0, 20);
			articleVO.setArticleSummary(first20Chars);
		} else if (0 < text.length() && text.length() <= 20) {
			articleVO.setArticleSummary(text);
		} else {
			articleVO.setArticleSummary("");
		}
		dao.insert(articleVO);

		return articleVO;
	}

	public List<ArticleVO> findForumsArticle(Integer forumNumber) {
		return dao.findByForumNumber(forumNumber);
	}

	public List<ArticleVO> findArticleByKeyWord(String title) {
		return dao.findByKeyWord(title);
	}
	public void updateArticle(ArticleVO articleVO) {
		dao.update(articleVO);
	}
	public ArticleVO getOneFromArticleNumber(Integer articleNumber) {
		return dao.findByArticleNumber(articleNumber);
	}
	public void delete (Integer articleNumber) {
		dao.updateArticleStatus(articleNumber);
	}
}
