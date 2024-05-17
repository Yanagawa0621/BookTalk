package com.bookproducts.model;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.booksandpicture.model.BooksAndPictureVO;

import util.HibernateUtil;

public class BookProductsDAO implements BookProductsDAO_Impl {

	private SessionFactory factory;

	public BookProductsDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	// 查詢全部
	@Override
	public List<BookProductsVO> getAll() {
		List<BookProductsVO> list = getSession().createQuery("from BookProductsVO", BookProductsVO.class).list();
		return multipleConversions(list);
	}

	// 依金額查詢
	@Override
	public List<BookProductsVO> priceSearch(Double min, Double max) {
		List<BookProductsVO> list = getSession()
				.createQuery("from BookProductsVO where price between :min and :max", BookProductsVO.class)
				.setParameter("min", min).setParameter("max", max).list();
		return multipleConversions(list);
	}

	// 依上架的年月查詢
	@Override
	public List<BookProductsVO> npi(Integer year, Integer month) {
		List<BookProductsVO> list = getSession()
				.createQuery("from BookProductsVO where year(releaseDate)=:year and month(releaseDate)=:month",
						BookProductsVO.class)

				.setParameter("year", year).setParameter("month", month).list();
		return multipleConversions(list);
	}

	// 選擇欄位並模糊查詢
	@Override
	public List<BookProductsVO> keywordSearch(String searchMain, String keywords) {
		List<BookProductsVO> list = getSession()
				.createQuery("from BookProductsVO where " + searchMain + " like :keywords", BookProductsVO.class)
				.setParameter("keywords", "%" + keywords + "%").list();
		return multipleConversions(list);
	}

	// 單筆查詢
	@Override
	public BookProductsVO singleQuery(Integer bookNumber) {
		BookProductsVO bpVO = getSession().get(BookProductsVO.class, bookNumber);
		return singleConversion(bpVO);
	}
	
	//新增
	@Override
	public int increase(BookProductsVO bpVO) {
		try {
			getSession().save(bpVO);
			return bpVO.getBookNumber();
		} catch (Exception e) {
			return -1;
		}
	}
	
	//修改
	@Override
	public int update(BookProductsVO bpVO) {
		try {
			getSession().save(bpVO);
			return 0;
		} catch (Exception e) {
			return bpVO.getBookNumber();
		}
	}
	
//=================================以下做圖片處理用========================================

	// 單筆書籍資料的圖片轉換
	private BookProductsVO singleConversion(BookProductsVO bpVO) {
		List<String> base64 = new ArrayList<>();
		List<BooksAndPictureVO> imgs = bpVO.getBapVO();

		if (imgs != null) {
			for (BooksAndPictureVO img : imgs) {
				byte[] pictureFile = img.getPictureFile();
				String base64Encoded = Base64.getEncoder().encodeToString(pictureFile);
				base64.add(base64Encoded);
			}
			bpVO.setImg(base64);
		}
		return bpVO;
	}

	// 多筆書籍資料的圖片轉換
	private List<BookProductsVO> multipleConversions(List<BookProductsVO> list) {
		for (BookProductsVO myCollection : list) {
			List<String> base64 = new ArrayList<>();
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
		return list;
	}

//=================================以下是測試用的main方法========================================

	public static void main(String[] args) {
		BookProductsDAO bp = new BookProductsDAO();
		Session session = bp.getSession();
		Transaction transaction = session.beginTransaction();
		System.out.println(bp.getAll());

		int j = 0;
		for (BookProductsVO a : bp.getAll()) {
			if (j == 4) {
				System.out.println(a.getImg().get(4));
				break;
			}
			j++;
		}
		transaction.commit();
	}

}
