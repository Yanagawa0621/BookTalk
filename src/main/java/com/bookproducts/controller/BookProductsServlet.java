package com.bookproducts.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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

		// 首頁搜尋欄
		if ("query_bar".equals(action)) {
			String searchMain = req.getParameter("searchMain");
			if ("bookTitle".equals(searchMain)) {

			} else if ("author".equals(searchMain)) {

			} else if ("publishing_house".equals(searchMain)) {

			} else if ("isbn".equals(searchMain)) {

			}
		}

		// 單一商品頁面請求
		if ("product_page_ajax".equals(action)||"single_product_page".equals(action)) {
			System.out.println("22");
			// ===接受參數===
			Integer bookNumberReq = Integer.valueOf(req.getParameter("bookNumber"));
			// ===查詢資料===
			BookProductsVO bpVO = bpSce.singleQueryBp(bookNumberReq);
			// ===轉交資料===
			if ("product_page_ajax".equals(action)) {
				List<String> auth=new ArrayList<>();
				for(AuthorVO auths:bpVO.getAuthorVO()) {
					auth.add(auths.getAuthorName());
				}
				
				HashMap<String, Object> bpMap=new HashMap<>();
				bpMap.put("bookNumber", bpVO.getBookNumber());
				bpMap.put("bookClassName",bpVO.getBcVO().getClassName());
				bpMap.put("publishingHouseName",bpVO.getPhVO().getName());
				bpMap.put("productStatus",bpVO.getProductStatus());
				bpMap.put("bookTitle",bpVO.getBookTitle());
				bpMap.put("isbn",bpVO.getIsbn());
				bpMap.put("price",bpVO.getPrice());
				bpMap.put("publicationDate",bpVO.getPublicationDate());
				bpMap.put("stock",bpVO.getStock());
				bpMap.put("introductionContent",bpVO.getIntroductionContent());
				bpMap.put("releaseDate",bpVO.getReleaseDate());
				bpMap.put("img",bpVO.getImg());
				bpMap.put("ratingScoreAvg",bpVO.getRatingScoreAvg());
				bpMap.put("AuthorVO", auth);
				
				Gson gson = new GsonBuilder()
						.setDateFormat("yyyy-MM-dd") // 設置日期格式
				        .create();
				String book = gson.toJson(bpMap);
//				System.out.println(book);
				res.setContentType("application/json");
		        res.setCharacterEncoding("UTF-8");
		        res.getWriter().write(book);
		        }
			
			if("single_product_page".equals(action)) {
				req.setAttribute("bpVO", bpVO);
				String url="/front-end/product-details.jsp";
				RequestDispatcher successView=req.getRequestDispatcher(url);
				System.out.println("aaa");
				successView.forward(req, res);
			}
		}

	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
	}
}
