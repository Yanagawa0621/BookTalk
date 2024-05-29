package com.bookclass.model;

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

public class BookClassService {
	BookClassDAO dao = new BookClassDAO();
	OrderDetailsDAOHibernate odDAO=new OrderDetailsDAOHibernate();
	public int increaseBc(String className) {
		BookClassVO bcVO = new BookClassVO();
		bcVO.setClassName(className);
		return dao.increase(bcVO);
	}

	public int updateBc(Integer classNumber, String className) {
		BookClassVO bcVO = new BookClassVO();
		bcVO.setClassNumber(classNumber);
		bcVO.setClassName(className);
		return dao.increase(bcVO);
	}

	public List<BookClassVO> getAllBc() {
		return multipleConversions(dao.getAll());
	}

	public List<BookClassVO> keywordsBc(String keywords) {
		return multipleConversions(dao.keywordQuery(keywords));
	}

	public BookClassVO singleQueryBc(Integer classNumber) {
		BookClassVO bcVO = dao.singleQuery(classNumber);
		return singleConversion(bcVO);
	}

	// =================================以下做圖片處理用========================================

	// 單筆書籍資料的圖片轉換
	private BookClassVO singleConversion(BookClassVO bcVO) {

		for (BookProductsVO bpVOs : bcVO.getBpVO()) {
			bpVOs.setRatingScoreAvg(odDAO.ratingScoreAvg(bpVOs));
		}
		return bcVO;
	}

	// 多筆書籍資料的圖片轉換
	private List<BookClassVO> multipleConversions(List<BookClassVO> list) {
		for (BookClassVO bcVOs : list) {
			for (BookProductsVO myCollection : bcVOs.getBpVO()) {
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
//		BookClassService bcSce = new BookClassService();
//		System.out.println(bcSce.getAllBc().get(0).getClassName());
//		transaction.commit();
//	}
}
