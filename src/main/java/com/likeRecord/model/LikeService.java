package com.likeRecord.model;

import com.article.model.ArticleVO;
import com.comment.model.CommentVO;

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
		System.out.println("============1");
		dao.insert(likeVO);
	}
	public void deleteLike(Integer userNumber,Integer articleNumber) {
		dao.delete(dao.getUsersLike(userNumber,articleNumber));
	}
	public void addLikeCom(Integer userNumber,Integer commentNumber) {
		LikeVO likeVO = new LikeVO();
		likeVO.setUserNumber(userNumber);
		CommentVO commentVO = new CommentVO();
		commentVO.setCommentNumber(commentNumber);
		likeVO.setCommentVO(commentVO);
		dao.insert(likeVO);
	}
	public void deleteLikeCom(Integer userNumber,Integer commentNumber) {
		dao.delete(dao.getUsersLikeCom(userNumber,commentNumber));
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
	public int getCommentLike(Integer userNumber, Integer commentNumber) {
		LikeVO record = dao.getUsersLikeCom(userNumber, commentNumber);
		if(record == null) {
			System.out.println("沒有留言============================");
			return -1;
		}else {
			System.out.println("有留言============================");
			return 1;
		}
	}
}
