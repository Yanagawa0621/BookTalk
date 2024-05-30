package com.likeRecord.model;

import com.article.model.ArticleVO;

public class LikeService {
	public LikeDAO_interface dao;
	public LikeService() {
		dao = new LikeDAO();
	}
	public void addLike(Integer userNumber,Integer articleNumber) {
		LikeVO likeVO = new LikeVO();
		likeVO.setUserNumber(userNumber);
		ArticleVO articleVO = new ArticleVO();
		articleVO.setArticleNumber(articleNumber);
		likeVO.setArticleVO(articleVO);
		dao.insert(likeVO);
	}
	public void deleteLike(Integer userNumber,Integer articleNumber) {
		LikeVO likeVO = new LikeVO();
		likeVO.setUserNumber(userNumber);
		ArticleVO articleVO = new ArticleVO();
		articleVO.setArticleNumber(articleNumber);
		likeVO.setArticleVO(articleVO);
		dao.delete(likeVO);
	}
	public int getArticleLike(Integer userNumber, Integer articleNumber) {
		LikeVO record = dao.getUsersLike(userNumber, articleNumber);
		if(record == null) {
			System.out.println("沒有============================");
			return -1;
		}else {
			System.out.println("有============================");
			return 1;
		}
	}
}
