package com.bookclass.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookclass.model.BookClassService;
import com.bookclass.model.BookClassVO;

@WebServlet("/bookClass.do")
public class BookClassServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private BookClassService bcSce;
	public void init() throws ServletException {
		bcSce=new BookClassService();
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("ClassNumberSearch".equals(action)) {
			// ===接受參數===
			Integer classNumber=Integer.valueOf(req.getParameter("classNumber"));
			// ===查詢資料===
			BookClassVO bcVO=bcSce.singleQueryBc(classNumber);
			// ===轉交資料===
			req.setAttribute("bcVO", bcVO);
			String url="/front-end/shop2.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		}
	}
}
