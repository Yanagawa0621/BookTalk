package com.bookproducts.model;

import java.sql.Date;
import java.text.ParseException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.bookclass.model.BookClassVO;
import com.booksandpicture.model.BooksAndPictureVO;
import com.orderdetails.model.OrderDetailsDAOHibernate;
import com.publishinghouse.model.PublishingHouseVO;

import util.HibernateUtil;

public class BookProductsService {
	BookProductsDAO bpDAO = new BookProductsDAO();
	OrderDetailsDAOHibernate odDAO=new OrderDetailsDAOHibernate();
	public int addBp(Integer classNumber, Integer publishingHouseNumber, Integer productStatus, String bookTitle,
			String isbn, Double price, java.sql.Date publicationDate, Integer stock, String introductionContent,
			Date releaseDate) {
		BookClassVO bcVO = new BookClassVO();
		bcVO.setClassNumber(classNumber);

		PublishingHouseVO phVO = new PublishingHouseVO();
		phVO.setPublishingHouseNumber(publishingHouseNumber);

		BookProductsVO bpVO = new BookProductsVO();
		bpVO.setBcVO(bcVO);
		bpVO.setPhVO(phVO);
		bpVO.setProductStatus(productStatus);
		bpVO.setBookTitle(bookTitle);
		bpVO.setIsbn(isbn);
		bpVO.setPrice(price);
		bpVO.setPublicationDate(publicationDate);
		bpVO.setStock(stock);
		bpVO.setIntroductionContent(introductionContent);
		bpVO.setReleaseDate(releaseDate);

		return bpDAO.increase(bpVO);
	}

	public int updateBp(Integer bookNumber, Integer classNumber, Integer publishingHouseNumber, Integer productStatus,
			String bookTitle, String isbn, Double price, java.sql.Date publicationDate, Integer stock,
			String introductionContent, Date releaseDate) {
		BookClassVO bcVO = new BookClassVO();
		bcVO.setClassNumber(classNumber);

		PublishingHouseVO phVO = new PublishingHouseVO();
		phVO.setPublishingHouseNumber(publishingHouseNumber);

		BookProductsVO bpVO = new BookProductsVO();
		bpVO.setBookNumber(bookNumber);
		bpVO.setBcVO(bcVO);
		bpVO.setPhVO(phVO);
		bpVO.setProductStatus(productStatus);
		bpVO.setBookTitle(bookTitle);
		bpVO.setIsbn(isbn);
		bpVO.setPrice(price);
		bpVO.setPublicationDate(publicationDate);
		bpVO.setStock(stock);
		bpVO.setIntroductionContent(introductionContent);
		bpVO.setReleaseDate(releaseDate);

		return bpDAO.update(bpVO);
	}

	public List<BookProductsVO> getAllBp() {

		return multipleConversions(bpDAO.getAll());
	}

	public List<BookProductsVO> priceSearchBp(Double min, Double max) {
		return multipleConversions(bpDAO.priceQuery(min, max));
	}

	public List<BookProductsVO> npiBp() {
		LocalDate today = LocalDate.now();
		int year = today.getYear();
		int month = today.getMonthValue();
		return multipleConversions(bpDAO.npi(year, month));
	}

	public List<BookProductsVO> keywordSearchBp(String searchMain, String keywords) {
		return multipleConversions(bpDAO.keywordQuery(searchMain, keywords));
	}

	public BookProductsVO singleQueryBp(Integer bookNumber) {
		return singleConversion(bpDAO.singleQuery(bookNumber));
	}

	// =================================以下做圖片處理用========================================

	// 單筆書籍資料的圖片轉換
	private BookProductsVO singleConversion(BookProductsVO bpVO) {
		List<BooksAndPictureVO> imgs = bpVO.getBapVO();
		bpVO.setRatingScoreAvg(odDAO.ratingScoreAvg(bpVO));
		if (imgs != null) {
			List<String> base64 = new ArrayList<>();
			for (BooksAndPictureVO img : imgs) {
				byte[] pictureFile = img.getPictureFile();
				if (pictureFile != null) {
					String base64Encoded = Base64.getEncoder().encodeToString(pictureFile);
					base64.add(base64Encoded);
				}
			}
			bpVO.setImg(base64);
		}
		return bpVO;
	}

	// 多筆書籍資料的圖片轉換
	private List<BookProductsVO> multipleConversions(List<BookProductsVO> list) {
		for (BookProductsVO myCollection : list) {
			myCollection.setRatingScoreAvg(odDAO.ratingScoreAvg(myCollection));
		}
		return list;
	}
	
	// =================================以下是測試用的main方法========================================
	public static void main(String[] args) throws ParseException {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		BookProductsService bp = new BookProductsService();
		System.out.println(bp.singleQueryBp(1).getReleaseDate().getTime());

		transaction.commit();

	}
}
