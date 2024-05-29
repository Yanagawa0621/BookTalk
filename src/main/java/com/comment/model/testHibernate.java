package com.comment.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

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
      SessionFactory factory = HibernateUtil.getSessionFactory();
      Session session = factory.getCurrentSession();
      Transaction transaction = session.beginTransaction();

		List<CommentVO> co =dao.findByArticleNumber(1);
		for(CommentVO commentVO :co) {
			System.out.println(commentVO.getContent());
		}
		transaction.commit();
//		dao.updateCommentStatus(1, 0);
	}
}
