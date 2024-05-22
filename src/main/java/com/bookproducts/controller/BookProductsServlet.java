package com.bookproducts.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bookproducts.do")
public class BookProductsServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action=req.getParameter("action");
		
		//首頁搜尋欄
		if("query_bar".equals(action)) {
			String searchMain=req.getParameter("searchMain");
			if("bookTitle".equals(searchMain)) {
				
			}else if("author".equals(searchMain)) {
				
			}else if("publishing_house".equals(searchMain)) {
				
			}else if("isbn".equals(searchMain)) {
				
			}
		}
		
		//單一商品頁面請求
		if("product_page".equals(action)) {
			
		}
		
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action=req.getParameter("action");
	}
}
