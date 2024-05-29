package com.bookproducts.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.author.model.AuthorVO;
import com.bookproducts.model.BookProductsService;
import com.bookproducts.model.BookProductsVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

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
					auth.add(auths.getAuthorName());
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
				System.out.println("111");
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
				if("productStatus".equals(searchMain)) {
				List<BookProductsVO> list = bpSce.statusQueryBpNp(number);

				if (list.isEmpty()) {
					errorMsgs.add("找不到相關書籍");
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
				
				// ===查詢資料(書籍編號查詢)===
				if("bookNumber".equals(searchMain)) {
					List<BookProductsVO> list = new ArrayList<BookProductsVO>();
					list.add(bpSce.singleQueryBpNp(number));

				if (list.isEmpty()) {
					errorMsgs.add("找不到相關書籍(書籍編號:" + Keywords + ")");
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
			}
		}
	}
}
