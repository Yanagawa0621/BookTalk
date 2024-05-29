package com.author.model;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.bookproducts.model.BookProductsVO;
import com.booksandpicture.model.BooksAndPictureVO;
import com.orderdetails.model.OrderDetailsDAOHibernate;

import util.HibernateUtil;

public class AuthorService {
	AuthorDAO dao = new AuthorDAO();
	OrderDetailsDAOHibernate odDAO=new OrderDetailsDAOHibernate();
	public int addAuth(String authorName, String englishName) {
		AuthorVO authVO = new AuthorVO();
		authVO.setAuthorName(authorName);
		authVO.setEnglishName(englishName);
		return dao.increase(authVO);
	}

	public int updateAuth(Integer authorNumber, String authorName, String englishName) {
		AuthorVO authVO = new AuthorVO();
		authVO.setAuthorNumber(authorNumber);
		authVO.setAuthorName(authorName);
		authVO.setEnglishName(englishName);
		return dao.update(authVO);
	}

	public AuthorVO singleQueryArth(Integer authorNumber) {
		AuthorVO authVO = dao.singleQuery(authorNumber);
		return singleConversion(authVO);
	}

	public List<AuthorVO> getAllArth() {
		List<AuthorVO> list = dao.getAll();
		return multipleConversions(list);
	}

	public List<AuthorVO> keywordQuery(String zhAndenName) {
		List<AuthorVO> list = dao.keywordQuery(zhAndenName);
		return multipleConversions(list);
	}

	// =================================以下做圖片處理用========================================

	// 單筆書籍資料的圖片轉換
	private AuthorVO singleConversion(AuthorVO authVO) {
		for (BookProductsVO bpVOs : authVO.getBpVO()) {
			bpVOs.setRatingScoreAvg(odDAO.ratingScoreAvg(bpVOs));
		}
		return authVO;
	}

	// 多筆書籍資料的圖片轉換
	private List<AuthorVO> multipleConversions(List<AuthorVO> list) {
		for (AuthorVO authVOs : list) {
			for (BookProductsVO myCollection : authVOs.getBpVO()) {
				myCollection.setRatingScoreAvg(odDAO.ratingScoreAvg(myCollection));
			}
		}
		return list;
	}

	// =================================以下是測試用的main方法========================================

//	public static void main(String[] args) {
//		SessionFactory factory;
//		factory = HibernateUtil.getSessionFactory();
//		Session session = factory.getCurrentSession();
//		Transaction transaction = session.beginTransaction();
//		AuthorService authSce = new AuthorService();
//
////		System.out.println(authSce.getAllArth().get(4).getBpVO().get(0).getImg().size());
//
//		transaction.commit();
//	}
}
