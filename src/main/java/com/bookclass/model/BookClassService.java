package com.bookclass.model;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.bookproducts.model.BookProductsVO;
import com.booksandpicture.model.BooksAndPictureVO;

import util.HibernateUtil;

public class BookClassService {
	BookClassDAO dao = new BookClassDAO();

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
		List<String> base64 = new ArrayList<>();
		
		for (BookProductsVO bpVOs : bcVO.getBpVO()) {
			List<BooksAndPictureVO> imgs = bpVOs.getBapVO();
			if (imgs != null) {
				for (BooksAndPictureVO img : imgs) {
					byte[] pictureFile = img.getPictureFile();
					String base64Encoded = Base64.getEncoder().encodeToString(pictureFile);
					base64.add(base64Encoded);
				}
				bpVOs.setImg(base64);
			}

		}
		return bcVO;
	}

	// 多筆書籍資料的圖片轉換
	private List<BookClassVO> multipleConversions(List<BookClassVO> list) {
		List<String> base64 = new ArrayList<>();
		for (BookClassVO bcVOs : list) {
			for (BookProductsVO myCollection : bcVOs.getBpVO()) {
				List<BooksAndPictureVO> imgs = myCollection.getBapVO();
				if (imgs != null) {
					for (BooksAndPictureVO img : imgs) {
						byte[] pictureFile = img.getPictureFile();
						String base64Encoded = Base64.getEncoder().encodeToString(pictureFile);
						base64.add(base64Encoded);
					}
					myCollection.setImg(base64);
				}
			}
		}
		return list;
	}
	// =================================以下是測試用的main方法========================================

	public static void main(String[] args) {
		SessionFactory factory;
		factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		BookClassService bcSce = new BookClassService();
		List<BookClassVO> list = bcSce.keywordsBc("文學");
		for(BookClassVO bcVOs:list) {
			for(BookProductsVO bpVOs:bcVOs.getBpVO()) {
				for(String img:bpVOs.getImg()) {
					System.out.println(img);
				}
			}
		}
		
		transaction.commit();
	}
}
