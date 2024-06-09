package com.bookproducts.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.author.model.AuthorService;
import com.author.model.AuthorVO;
import com.bookclass.model.BookClassVO;
import com.bookproducts.model.BookProductsService;
import com.bookproducts.model.BookProductsVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.publishinghouse.model.PublishingHouseVO;

import util.HibernateUtil;

@WebServlet("/bookproducts.do")
public class BookProductsServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private BookProductsService bpSce;

	public void init() throws ServletException {
		bpSce = new BookProductsService();
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
//		System.out.println(action);
		// 首頁搜尋欄
		if ("query_bar".equals(action)) {
//			System.out.println("關鍵字查詢");
			String searchMain = req.getParameter("searchMain");
			if ("bookTitle".equals(searchMain) || "isbn".equals(searchMain)) {
				// ===接受參數===
				String Keywords = req.getParameter("Keywords").trim();
				// ===查詢資料===
				List<BookProductsVO> list = bpSce.keywordSearchBp(searchMain, Keywords);
				Iterator<BookProductsVO> iterator = list.iterator();
				while (iterator.hasNext()) {
					BookProductsVO bpVO = iterator.next();
					if (bpVO.getProductStatus() != 1) {
						iterator.remove();
					}
				}

				if (list.isEmpty()) {

					String url = "/front-end/shop3.jsp";
					String message = "查無相關書籍";
					req.setAttribute("message", message);
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
					return;
				}
				// ===轉交資料===
				if ("bookTitle".equals(searchMain)) {
					req.setAttribute("searchMain", "書籍名稱");
				} else if ("isbn".equals(searchMain)) {
					req.setAttribute("searchMain", "國際書碼(ISBN)");
				}
				req.setAttribute("Keywords", Keywords);
				req.setAttribute("list", list);
				String url = "/front-end/shop3.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
//				System.out.println("關鍵字查詢");
				successView.forward(req, res);
			} else if ("author".equals(searchMain)) {
				// 直接將請求轉送給AuthorServlet處理
				RequestDispatcher successView = req.getRequestDispatcher("/author.do");
				successView.forward(req, res);
			} else if ("publishing_house".equals(searchMain)) {
				// 直接將請求轉送給PublisingHouseServlet處理
				RequestDispatcher successView = req.getRequestDispatcher("/publisingHouse.do");
				successView.forward(req, res);
			}
		}

		// 單一商品頁面請求及燈箱商品請求
		if ("product_page_ajax".equals(action) || "single_product_page".equals(action)) {
//			System.out.println("22");
			// ===接受參數===
			Integer bookNumber = Integer.valueOf(req.getParameter("bookNumber"));
			// ===查詢資料===
			BookProductsVO bpVO = bpSce.singleQueryBp(bookNumber);
			// ===轉交資料===
			if ("product_page_ajax".equals(action)) {
				List<String> auth = new ArrayList<>();
				for (AuthorVO auths : bpVO.getAuthorVO()) {
					if (auths.getAuthorName() != null) {
						auth.add(auths.getAuthorName());
					} else if (auths.getAuthorName() == null) {
						auth.add(auths.getEnglishName());
					}
				}

				HashMap<String, Object> bpMap = new HashMap<>();
				bpMap.put("bookNumber", bpVO.getBookNumber());
				bpMap.put("bookClassName", bpVO.getBcVO().getClassName());
				bpMap.put("publishingHouseName", bpVO.getPhVO().getName());
				bpMap.put("productStatus", bpVO.getProductStatus());
				bpMap.put("bookTitle", bpVO.getBookTitle());
				bpMap.put("isbn", bpVO.getIsbn());
				bpMap.put("price", bpVO.getPrice());
				bpMap.put("publicationDate", bpVO.getPublicationDate());
				bpMap.put("stock", bpVO.getStock());
				bpMap.put("introductionContent", bpVO.getIntroductionContent());
				bpMap.put("releaseDate", bpVO.getReleaseDate());
				bpMap.put("img", bpVO.getImg());
				bpMap.put("ratingScoreAvg", bpVO.getRatingScoreAvg());
				bpMap.put("AuthorVO", auth);

				Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd") // 設置日期格式
						.create();
				String book = gson.toJson(bpMap);
//				System.out.println(book);
				res.setContentType("application/json");
				res.setCharacterEncoding("UTF-8");
				res.getWriter().write(book);
			}

			if ("single_product_page".equals(action)) {
				// 額外提交相關書籍類別
				List<BookProductsVO> list = new ArrayList<>();
				for (BookProductsVO bp : bpVO.getBcVO().getBpVO()) {
					if (bp.getProductStatus() == 1 && bp.getBookNumber() != bookNumber) {
						list.add(bp);
					}
				}
				req.setAttribute("list", list);
				req.setAttribute("bpVO", bpVO);
				String url = "/front-end/product-details.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
//				System.out.println("aaa");
				successView.forward(req, res);
			}
		}

	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		HttpSession session = req.getSession();

		// ===搜尋欄===
		if ("book_search".equals(action)) {
			// ===接受參數===
			String searchMain = req.getParameter("searchMain");
			String Keywords = req.getParameter("Keywords");

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			if (!"bookTitle".equals(searchMain) && !"isbn".equals(searchMain) && !"bookNumber".equals(searchMain)
					&& !"productStatus".equals(searchMain)) {
				errorMsgs.add("你查詢的方法不存在");
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookProducts/bookQuery.jsp");
				failureView.forward(req, res);
				return;
			}

			// isbn的查詢
			if ("isbn".equals(searchMain)) {
				String reg = "^[0-9]{1,13}$";

				if (!Keywords.matches(reg)) {
					errorMsgs.add("請輸入數字");
				}

				// ===查詢資料===
				List<BookProductsVO> list = bpSce.keywordSearchBp(searchMain, Keywords);

				if (list.isEmpty()) {
					errorMsgs.add("找不到相關書籍(ISBN:" + Keywords + ")");
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookProducts/bookQuery.jsp");
					failureView.forward(req, res);
					return;
				}

				// ===轉交資料===
				req.setAttribute("list", list);
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookProducts/bookQuery.jsp");
				failureView.forward(req, res);
				return;
			}

			// 書籍名稱的查詢
			if ("bookTitle".equals(searchMain)) {
//				System.out.println("111");
				// ===查詢資料===
				List<BookProductsVO> list = bpSce.keywordSearchBp(searchMain, Keywords);

				if (list.isEmpty()) {
					errorMsgs.add("找不到相關書籍(書籍名稱:" + Keywords + ")");
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookProducts/bookQuery.jsp");
					failureView.forward(req, res);
					return;
				}
				// ===轉交資料===
				req.setAttribute("list", list);
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookProducts/bookQuery.jsp");
				failureView.forward(req, res);
				return;
			}

			// 書籍編號和書籍狀態的查詢
			if ("bookNumber".equals(searchMain) || "productStatus".equals(searchMain)) {
				Integer number;
				try {
					number = Integer.valueOf(Keywords);
				} catch (NumberFormatException e) {
					errorMsgs.add("請輸入正確的數字格式");
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookProducts/bookQuery.jsp");
					failureView.forward(req, res);
					return;
				}
				// ===查詢資料(狀態查詢)===
				if ("productStatus".equals(searchMain)) {
					List<BookProductsVO> list = bpSce.statusQueryBpNp(number);

					if (list.isEmpty()) {
						errorMsgs.add("找不到相關書籍");
						RequestDispatcher failureView = req
								.getRequestDispatcher("/back-end/bookProducts/bookQuery.jsp");
						failureView.forward(req, res);
						return;
					}
					// ===轉交資料===
					req.setAttribute("list", list);
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookProducts/bookQuery.jsp");
					failureView.forward(req, res);
					return;
				}

				// ===查詢資料(書籍編號查詢)===
				if ("bookNumber".equals(searchMain)) {
					List<BookProductsVO> list = new ArrayList<BookProductsVO>();
					list.add(bpSce.singleQueryBpNp(number));

					if (list.isEmpty()) {
						errorMsgs.add("找不到相關書籍(書籍編號:" + Keywords + ")");
						RequestDispatcher failureView = req
								.getRequestDispatcher("/back-end/bookProducts/bookQuery.jsp");
						failureView.forward(req, res);
						return;
					}
					// ===轉交資料===
					req.setAttribute("list", list);
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookProducts/bookQuery.jsp");
					failureView.forward(req, res);
					return;
				}
			}
		}

		// ===新增書籍===
//		System.out.println(action);
		if ("insert".equals(action)) {
//			System.out.println("新增書籍");
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			// ---接受參數和格式驗證相關---
			Integer bookClassNumber = Integer.valueOf(req.getParameter("bookClassNumber"));
			Integer publishiingHouseCode = Integer.valueOf(req.getParameter("publishiingHouseCode"));

			// ---書名---
			String bookTitle = req.getParameter("bookTitle");
			String reg1 = "^[(\u4e00-\u9fff),(a-zA-Z0-9),[^\n]]{1,30}$";
			if (bookTitle.trim().length() == 0 || bookTitle == null) {
				errorMsgs.add("請輸入書名");
			} else if (!bookTitle.trim().matches(reg1)) {
				errorMsgs.add("請輸入正確格式");
			}

			// ---sibn---
			String isbn = req.getParameter("isbn");
			String reg2 = "^[0-9]{10,13}$";
			if (isbn.trim().length() == 0 || isbn == null) {
				errorMsgs.add("國際書碼不可空白");
			} else if (!isbn.trim().matches(reg2)) {
				errorMsgs.add("國際書碼格式錯誤");
			}

			// ---出版日期---
			java.sql.Date publicationDate = null;
			try {
				publicationDate = java.sql.Date.valueOf(req.getParameter("publicationDate").trim());
			} catch (IllegalArgumentException e) {
				errorMsgs.add("輸入的日期格式錯誤");
			}

			// ---數量---
			Integer stock = null;
			try {
				stock = Integer.valueOf(req.getParameter("stock"));
			} catch (NumberFormatException e) {
				errorMsgs.add("請輸入正確的數量格式");
			}

			// ---價格---
			Double price = null;
			try {
				price = Double.valueOf(req.getParameter("price"));
			} catch (NumberFormatException e) {
				errorMsgs.add("請輸入正確的價格格式");
			}

			// ---書籍介紹---
			String introductionContent = req.getParameter("introductionContent");
			if (introductionContent.trim().length() == 0 || introductionContent == null) {
				errorMsgs.add("請輸入內容");
			}

			// ---作者---
			List<String> authorList;
			Gson gson = new Gson();
			String authorsJson = req.getParameter("authors");
			authorList = gson.fromJson(authorsJson, new TypeToken<List<String>>() {
			}.getType());
			for (String string : authorList) {
//				System.out.println(string);
			}

			if (!errorMsgs.isEmpty()) {
				BookProductsVO bpVO = new BookProductsVO();
				bpVO.setBookTitle(bookTitle);
				bpVO.setIsbn(isbn);
				bpVO.setPublicationDate(publicationDate);
				bpVO.setStock(stock);
				bpVO.setPrice(price);
				bpVO.setIntroductionContent(introductionContent);
				BookClassVO bcVO = new BookClassVO();
				bcVO.setClassNumber(bookClassNumber);
				bpVO.setBcVO(bcVO);
				PublishingHouseVO phVO = new PublishingHouseVO();
				phVO.setPublishingHouseNumber(publishiingHouseCode);
				bpVO.setPhVO(phVO);

				req.setAttribute("authorList", authorList);
				req.setAttribute("bpVO", bpVO);
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookProducts/addBookProducts.jsp");
				failureView.forward(req, res);
				return;
			}

			// ---先處理作者的部分---
			List<AuthorVO> authors = new ArrayList<>();
			for (String name : authorList) {
				AuthorService authorSce = new AuthorService();
				AuthorVO arthor = authorSce.findByName(name.trim());
				if (arthor == null) {
					String reg3 = "^[a-zA-Z\\\\s'-]+$";
					AuthorVO arthor2;
					if (name.trim().matches(reg3)) {
						authorSce.addAuth(null, name.trim());
					} else {
						authorSce.addAuth(name.trim(), null);
					}
					arthor2 = authorSce.findByName(name);
					authors.add(arthor2);
				} else {
					authors.add(arthor);
				}
			}
			// ---提交新增---
			int result = bpSce.addBp(bookClassNumber, publishiingHouseCode, 0, bookTitle, isbn, price, publicationDate,
					stock, introductionContent, authors);

			if (result == -2) {
				BookProductsVO bpVO = new BookProductsVO();
				bpVO.setBookTitle(bookTitle);
				bpVO.setIsbn(isbn);
				bpVO.setPublicationDate(publicationDate);
				bpVO.setStock(stock);
				bpVO.setPrice(price);
				bpVO.setIntroductionContent(introductionContent);
				BookClassVO bcVO = new BookClassVO();
				bcVO.setClassNumber(bookClassNumber);
				bpVO.setBcVO(bcVO);
				PublishingHouseVO phVO = new PublishingHouseVO();
				phVO.setPublishingHouseNumber(publishiingHouseCode);
				bpVO.setPhVO(phVO);

				errorMsgs.add("ISBN已重複");
				req.setAttribute("authorList", authorList);
				req.setAttribute("bpVO", bpVO);
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookProducts/addBookProducts.jsp");
				failureView.forward(req, res);
				return;
			}
			// ---轉交結果---

			if (result != -1 && result != -2) {
				req.setAttribute("bookNumber", result);
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookProducts/addImge.jsp");
				failureView.forward(req, res);
				return;
			}

		}

		// ===書籍上架===
		if ("book_shelving".equals(action)) {
			// ---接受參數---
			Integer bookNumber = Integer.valueOf(req.getParameter("bookNumber"));
			// ---提交上架---
			BookProductsVO bpVO = bpSce.singleQueryBpNp(bookNumber);

			LocalDate currentDate = LocalDate.now();
			Date sqlDate = Date.valueOf(currentDate);
			Integer productStatus = Integer.valueOf(1);
			bpVO.setProductStatus(productStatus);
			bpVO.setReleaseDate(sqlDate);

			bpSce.book_shelving(bpVO);
			// ---轉交結果---
			RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookProducts/bookProducts.jsp");
			failureView.forward(req, res);
			return;

		}

		// ===查詢單筆===
		if ("getOne_For_Update".equals(action)) {
			// ---接受參數---
			Integer bookNumber = Integer.valueOf(req.getParameter("bookNumber"));
			// ---提交查詢---
			BookProductsVO bpVO = bpSce.singleQueryBpNp(bookNumber);
			// ---轉交資料---
			req.setAttribute("bpVO", bpVO);
			session.setAttribute("updateBpVO", bpVO);
			RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookProducts/updateBookProducts.jsp");
			failureView.forward(req, res);
			return;
		}

		// ===修改資料===
		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			// ---接受參數和格式驗證相關---
			Integer bookNumber = Integer.valueOf(req.getParameter("bookNumber"));
			Integer bookClassNumber = Integer.valueOf(req.getParameter("bookClassNumber"));
			Integer publishiingHouseCode = Integer.valueOf(req.getParameter("publishiingHouseCode"));

			// ---書名---
			String bookTitle = req.getParameter("bookTitle");
			String reg1 = "^[(\u4e00-\u9fff),(a-zA-Z0-9),[^\n]]{1,30}$";
			if (bookTitle.trim().length() == 0 || bookTitle == null) {
				errorMsgs.add("請輸入書名");
			} else if (!bookTitle.trim().matches(reg1)) {
				errorMsgs.add("請輸入正確格式");
			}

			// ---sibn---
			String isbn = req.getParameter("isbn");
			String reg2 = "^[0-9]{10,13}$";
			if (isbn.trim().length() == 0 || isbn == null) {
				errorMsgs.add("國際書碼不可空白");
			} else if (!isbn.trim().matches(reg2)) {
				errorMsgs.add("國際書碼格式錯誤");
			}

			// ---書籍狀態---
			Integer productStatus = Integer.valueOf(req.getParameter("productStatus"));

			// ---上架日期---
			java.sql.Date releaseDate = null;
			try {
				String releaseDateParam = req.getParameter("releaseDate");
				if (releaseDateParam != null && !releaseDateParam.isEmpty()) {
					releaseDate = java.sql.Date.valueOf(releaseDateParam);
				}
			} catch (IllegalArgumentException e) {
				System.out.println("錯誤");
			}
			// ---出版日期---
			java.sql.Date publicationDate = null;
			try {
				publicationDate = java.sql.Date.valueOf(req.getParameter("publicationDate").trim());
			} catch (IllegalArgumentException e) {
				errorMsgs.add("輸入的日期格式錯誤");
			}

			// ---數量---
			Integer stock = null;
			try {
				stock = Integer.valueOf(req.getParameter("stock"));
			} catch (NumberFormatException e) {
				errorMsgs.add("請輸入正確的數量格式");
			}

			// ---價格---
			Double price = null;
			try {
				price = Double.valueOf(req.getParameter("price"));
			} catch (NumberFormatException e) {
				errorMsgs.add("請輸入正確的價格格式");
			}

			// ---書籍介紹---
			String introductionContent = req.getParameter("introductionContent");
			if (introductionContent.trim().length() == 0 || introductionContent == null) {
				errorMsgs.add("請輸入內容");
			}

			// ---原本已有作者---
			List<AuthorVO> author = (List<AuthorVO>) session.getAttribute("authorVOLsit");
//			System.out.println(author.size());
			// ---被刪除關聯的作者---
			String[] stringValues = req.getParameterValues("RemoveAuthor");
//			for (String strValue : stringValues) {
//                System.out.println(strValue);
//            }
			List<Integer> removeAuthor = new ArrayList<>();
			if (stringValues != null) {
				for (String strValue : stringValues) {
					// 分割包含逗號的字符串
					String[] splitValues = strValue.split(",");
					for (String value : splitValues) {
						String trimmedValue = value.trim();
						if (!trimmedValue.isEmpty()) {
							try {
								removeAuthor.add(Integer.parseInt(trimmedValue)); // 移除多餘空格並轉換為整數
							} catch (NumberFormatException e) {
								// 處理轉換異常，例如記錄日志
								System.err.println("Invalid number format: " + trimmedValue);
							}
						}
					}
				}
			}
			// 測試
//			for (Integer authorNumber : RemoveAuthor) {
//	            System.out.println(authorNumber);
//	        }

			// ---新增的作者---
			List<String> authorList;
			Gson gson = new Gson();
			String authorsJson = req.getParameter("authors");
			authorList = gson.fromJson(authorsJson, new TypeToken<List<String>>() {
			}.getType());
//			for (String string : authorList) {
//				System.out.println(string);
//			}

			if (!errorMsgs.isEmpty()) {
				errorMsgs.add("修改失敗");
				BookProductsVO bpVOEm = new BookProductsVO();
				bpVOEm.setBookNumber(bookNumber);
				bpVOEm.setBookTitle(bookTitle);
				bpVOEm.setIsbn(isbn);
				bpVOEm.setProductStatus(productStatus);
				bpVOEm.setPublicationDate(publicationDate);
				bpVOEm.setStock(stock);
				bpVOEm.setPrice(price);
				bpVOEm.setAuthorVO(author);
				bpVOEm.setIntroductionContent(introductionContent);
				bpVOEm.setReleaseDate(releaseDate);
				BookClassVO bcVOEm = new BookClassVO();
				bcVOEm.setClassNumber(bookClassNumber);
				bpVOEm.setBcVO(bcVOEm);
				PublishingHouseVO phVOEm = new PublishingHouseVO();
				phVOEm.setPublishingHouseNumber(publishiingHouseCode);
				bpVOEm.setPhVO(phVOEm);
//				System.out.println(bpVO.getAuthorVO().size());
				req.setAttribute("RemoveAuthor", stringValues);
				req.setAttribute("authorList", authorList);
				req.setAttribute("bpVO", bpVOEm);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/bookProducts/updateBookProducts.jsp");
				failureView.forward(req, res);
				return;
			}

			// ---書籍狀態的改變---
			String mark = null;
			BookProductsVO bpVOOriginal = (BookProductsVO) session.getAttribute("updateBpVO");
			if (bpVOOriginal.getProductStatus() != productStatus) {
				if (productStatus == 1) {
					mark = "書籍被改為上架";
				}
			}

			// ---先處理作者的部分---
			List<AuthorVO> authors = new ArrayList<>();
			for (String name : authorList) {
				AuthorService authorSce = new AuthorService();
				AuthorVO arthor = authorSce.findByName(name.trim());
				if (arthor == null) {
					String reg3 = "^[a-zA-Z\\\\s'-]+$";
					AuthorVO arthor2;
					if (name.trim().matches(reg3)) {
						authorSce.addAuth(null, name.trim());
					} else {
						authorSce.addAuth(name.trim(), null);
					}
					arthor2 = authorSce.findByName(name);
					authors.add(arthor2);
				} else {
					authors.add(arthor);
				}
			}

			authors.addAll(author);
			// ---將要被刪除關聯的作者裝進集合裡---
			List<AuthorVO> filteredAuthors = author.stream()
					.filter(authorVO -> removeAuthor.contains(authorVO.getAuthorNumber())).collect(Collectors.toList());
//			for(AuthorVO i:filteredAuthors) {
//				System.out.println(i.getAuthorName());
//			}
//			System.out.println("這裡是將要被刪除關聯的作者裝進集合後"+filteredAuthors.size());
			// ---提交修改---
			BookProductsVO bpVO = new BookProductsVO();
			bpVO.setBookNumber(bookNumber);
			bpVO.setBookTitle(bookTitle);
			bpVO.setIsbn(isbn);
			bpVO.setProductStatus(productStatus);
			bpVO.setPublicationDate(publicationDate);
			bpVO.setStock(stock);
			bpVO.setPrice(price);
			bpVO.setIntroductionContent(introductionContent);
			bpVO.setReleaseDate(releaseDate);
//			System.out.println(releaseDate);
			BookClassVO bcVO = new BookClassVO();
			bcVO.setClassNumber(bookClassNumber);
			bpVO.setBcVO(bcVO);
			PublishingHouseVO phVO = new PublishingHouseVO();
			phVO.setPublishingHouseNumber(publishiingHouseCode);
			bpVO.setPhVO(phVO);
			if ("書籍被改為上架".equals(mark)) {
				LocalDate currentDate = LocalDate.now();
				Date sqlDate = Date.valueOf(currentDate);
				bpVO.setReleaseDate(sqlDate);
			}
			if (authors != null && authors.size() != 0) {
//				System.out.println("這裡是提交資料作者部分"+authors.size());
				bpVO.setAuthorVO(authors);
			}

			// ---提交更改---
			int result = bpSce.updateBp(bpVO);
			System.out.println(result);
			if (result == -1) {
				errorMsgs.add("國際書已重複");
				BookProductsVO bpVOEm = new BookProductsVO();
				bpVOEm.setBookNumber(bookNumber);
				bpVOEm.setBookTitle(bookTitle);
				bpVOEm.setIsbn(isbn);
				bpVOEm.setProductStatus(productStatus);
				bpVOEm.setPublicationDate(publicationDate);
				bpVOEm.setStock(stock);
				bpVOEm.setPrice(price);
				bpVOEm.setAuthorVO(author);
				bpVOEm.setIntroductionContent(introductionContent);
				bpVOEm.setReleaseDate(releaseDate);
				BookClassVO bcVOEm = new BookClassVO();
				bcVOEm.setClassNumber(bookClassNumber);
				bpVOEm.setBcVO(bcVOEm);
				PublishingHouseVO phVOEm = new PublishingHouseVO();
				phVOEm.setPublishingHouseNumber(publishiingHouseCode);
				bpVOEm.setPhVO(phVOEm);
//				System.out.println(bpVO.getAuthorVO().size());
				req.setAttribute("RemoveAuthor", stringValues);
				req.setAttribute("authorList", authorList);
				req.setAttribute("bpVO", bpVOEm);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/bookProducts/updateBookProducts.jsp");
				failureView.forward(req, res);
				return;
			}

			// ---刪除作者關聯---
			if (filteredAuthors.size() != 0 && filteredAuthors != null) {
				SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
				Session sessionHibernate = sessionFactory.getCurrentSession();
				for (AuthorVO authorVO : filteredAuthors) {
//					System.out.println(authorVO.getAuthorNumber());
					sessionHibernate.createNativeQuery(
							"delete from book_author where bookNumber = :bookNumber and authorNumber = :authorNumber")
							.setParameter("bookNumber", bookNumber)
							.setParameter("authorNumber", authorVO.getAuthorNumber()).executeUpdate();
				}
			}

			// ---轉交結果---
			if (result == 1) {
//				System.out.println("1111");
				session.removeAttribute("authorVOLsit");
				req.setAttribute("bpVO", bpVOOriginal);// bpVOOriginal是上面處理書籍狀態時取得的
				req.setAttribute("bookNumber", bookNumber);
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookProducts/updateImge.jsp");
				failureView.forward(req, res);
				return;
			}
		}
	}

}
