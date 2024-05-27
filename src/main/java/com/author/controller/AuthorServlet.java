package com.author.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.author.model.AuthorService;
import com.author.model.AuthorVO;
import com.bookproducts.model.BookProductsVO;

@WebServlet("/author.do")
public class AuthorServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private AuthorService authsce;

	public void init() throws ServletException {
		authsce = new AuthorService();
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		// 首頁搜尋欄
		if ("query_bar".equals(action)) {
			String searchMain = req.getParameter("searchMain");
			if ("author".equals(searchMain)) {
				// ===接受參數===
				String Keywords = req.getParameter("Keywords");
				// ===查詢資料===
				List<BookProductsVO> list = new ArrayList<>();
				List<AuthorVO> AuthorVOs = authsce.keywordQuery(Keywords);
				if (!AuthorVOs.isEmpty()) {
					for (AuthorVO AuthorVO : AuthorVOs) {
						for (BookProductsVO bpVO : AuthorVO.getBpVO()) {
							if (bpVO.getProductStatus() == 1) {
								list.add(bpVO);
							}
						}
					}
					if (list.isEmpty()) {
						String url = "/front-end/shop3.jsp";
						String message = "本平台暫無相關作者的書籍";
						req.setAttribute("message", message);
						RequestDispatcher successView = req.getRequestDispatcher(url);
						successView.forward(req, res);
						return;
					}
				} else {
					String url ="/front-end/shop3.jsp";
					String message = "查無相關作者";
					req.setAttribute("message", message);
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
					return;
				}
				// ===轉交資料===
				req.setAttribute("list", list);
				String url = "/front-end/shop3.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}
		}
	}
}
