package com.publishinghouse.model;

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

public class PublishingHouseService {
	PublishingHouseDAO dao = new PublishingHouseDAO();
	OrderDetailsDAOHibernate odDAO = new OrderDetailsDAOHibernate();

	public int addPh(String name, String address, String personInCharge, String telephoneNumber) {
		PublishingHouseVO phVO = new PublishingHouseVO();
		phVO.setName(name);
		phVO.setAddress(address);
		phVO.setPersonInCharge(personInCharge);
		phVO.setTelephoneNumber(telephoneNumber);
		dao.increase(phVO);

		return 0;
	}

	public int updatePh(Integer publishingHouseNumber, String name, String address, String personInCharge,
			String telephoneNumber) {
		PublishingHouseVO phVO = new PublishingHouseVO();
		phVO.setPublishingHouseNumber(publishingHouseNumber);
		phVO.setName(name);
		phVO.setAddress(address);
		phVO.setPersonInCharge(personInCharge);
		phVO.setTelephoneNumber(telephoneNumber);
		dao.update(phVO);

		return 0;
	}

	public List<PublishingHouseVO> getAllPh() {
		List<PublishingHouseVO> list = dao.getAll();
		return multipleConversions(list);
	}

	public List<PublishingHouseVO> KeywordQueryPh(String Keywords) {
		List<PublishingHouseVO> list = dao.keywordQuery(Keywords);
		return multipleConversions(list);
	}

	public PublishingHouseVO singleQueryPh(Integer publishingHouseNumber) {
		PublishingHouseVO phVO = dao.singleQuery(publishingHouseNumber);
		return singleConversion(phVO);
	}

	// =================================以下做圖片處理用========================================

	// 單筆書籍資料的圖片轉換
	private PublishingHouseVO singleConversion(PublishingHouseVO phVO) {

		for (BookProductsVO bpVOs : phVO.getBpVO()) {
			bpVOs.setRatingScoreAvg(odDAO.ratingScoreAvg(bpVOs));
		}
		return phVO;
	}

	// 多筆書籍資料的圖片轉換
	private List<PublishingHouseVO> multipleConversions(List<PublishingHouseVO> list) {
		for (PublishingHouseVO phVOs : list) {
			for (BookProductsVO myCollection : phVOs.getBpVO()) {
				myCollection.setRatingScoreAvg(odDAO.ratingScoreAvg(myCollection));
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
		PublishingHouseService phSce = new PublishingHouseService();
		List<PublishingHouseVO> list = phSce.getAllPh();
		System.out.println(list.get(0).getBpVO());

		transaction.commit();
	}
}
