package com.comment.model;

import java.time.LocalDateTime;
import java.util.List;

import com.article.model.ArticleVO;

public class testHibernate {
	public static void main (String[]args) {
		CommentDAO_interface dao = new CommentDAO();
		CommentVO c = new CommentVO();
//		c.setCommentNumber(1);
//		c.setCommentState(1);
//		c.setCommentTime(LocalDateTime.now());
//		c.setContent("不好看 我是留言一");
//		c.setLikeSum(1000);
//		c.setUserNumber(1);
//		ArticleVO a = new ArticleVO();
//		a.setArticleNumber(1);
//		c.setArticleVO(a);
//		dao.insert(c);
		List<CommentVO> co =dao.findByArticleNumber(1);
		for(CommentVO commentVO :co) {
			System.out.println(commentVO.getContent());
		}
//		dao.updateCommentStatus(1, 0);
	}
}
