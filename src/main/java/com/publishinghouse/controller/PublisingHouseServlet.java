package com.publishinghouse.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookproducts.model.BookProductsVO;
import com.publishinghouse.model.PublishingHouseService;
import com.publishinghouse.model.PublishingHouseVO;

@WebServlet("/publisingHouse.do")
public class PublisingHouseServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private PublishingHouseService phSce;

	public void inti() throws ServletException {
		phSce = new PublishingHouseService();
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
		
		if ("query_bar".equals(action)) {
			String searchMain = req.getParameter("searchMain");
			if ("author".equals(searchMain)) {
				// ===接受參數===
				String Keywords = req.getParameter("Keywords");
				// ===查詢資料===
				List<BookProductsVO> list = new ArrayList<>();
				List<PublishingHouseVO> phVOs = phSce.KeywordQueryPh(Keywords);
				if (!phVOs.isEmpty()) {
					for (PublishingHouseVO phVO : phVOs) {
						for (BookProductsVO bpVO : phVO.getBpVO()) {
							if (bpVO.getProductStatus() == 1) {
								list.add(bpVO);
							}
						}
					}
					if (list.isEmpty()) {
						String url = "/front-end/shop3.jsp";
						String message = "本平台暫無相關出版社的書籍";
						req.setAttribute("message", message);
						RequestDispatcher successView = req.getRequestDispatcher(url);
						successView.forward(req, res);
						return;
					}
				} else {
					String url = "/front-end/shop3.jsp";
					String message = "查無相關出版社";
					req.setAttribute("message", message);
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
					return;
				}
				// ===轉交資料===
				req.setAttribute("searchMain", "出版社");
				req.setAttribute("Keywords", Keywords);
				req.setAttribute("list", list);
				String url = "/front-end/shop3.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}
		}
	}
}
