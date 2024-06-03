package com.author.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
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
				req.setAttribute("searchMain", "作者");
				req.setAttribute("Keywords", Keywords);
				req.setAttribute("list", list);
				String url = "/front-end/shop3.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}
		}
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		// ===關鍵字收尋===
		if("keywords".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			// ---接受參數---
			String keywords=req.getParameter("keywords");
			// ---查詢資料---
			List<AuthorVO> list=authsce.keywordQueryNp(keywords);
			
			if(list.isEmpty()) {
				errorMsgs.add("查無資料");
				RequestDispatcher failureView=req.getRequestDispatcher("/back-end/author/author.jsp");
				failureView.forward(req, res);
				return;
			}
			
			// ---轉交資料---
			req.setAttribute("list", list);
			RequestDispatcher failureView=req.getRequestDispatcher("/back-end/author/AuthorQuery.jsp");
			failureView.forward(req, res);
			return;
		}
		
		// ===查詢單筆資料===
		if("getOne_For_Update".equals(action)) {
			// ---接受參數---
			Integer authorNumber=Integer.valueOf(req.getParameter("authorNumber"));
			// ---查詢資料---
			AuthorVO authorVO=authsce.singleQueryArthNp(authorNumber);
			// ---轉交資料---
			req.setAttribute("authorVO", authorVO);
			RequestDispatcher failureView=req.getRequestDispatcher("/back-end/author/updateAuthor.jsp");
			failureView.forward(req, res);
			return;
		}
		
		// ===修改資料===
		if("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			// ---接受參數---
			Integer authorNumber=Integer.valueOf(req.getParameter("authorNumber"));
			String authorName=req.getParameter("authorName");
			String englishName=req.getParameter("englishName");
			
			if((authorName==null||authorName.trim().length()==0)&&(englishName==null||englishName.trim().length()==0)) {
				errorMsgs.add("名稱和英文名稱不可皆為空白");
				RequestDispatcher failureView=req.getRequestDispatcher("/back-end/author/updateAuthor.jsp");
				failureView.forward(req, res);
				return;
			}
			
			// ---提交修改---
			int result=authsce.updateAuth(authorNumber, authorName, englishName);
			
			if(result==-1) {
				errorMsgs.add("修改失敗");
				RequestDispatcher failureView=req.getRequestDispatcher("/back-end/author/updateAuthor.jsp");
				failureView.forward(req, res);
				return;
			}
			
			// ---轉交資料---
			if(result==1) {
				RequestDispatcher failureView=req.getRequestDispatcher("/back-end/author/author.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		
		// ===新增資料===
		if("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			// ---接受參數---
			String authorName=req.getParameter("authorName");
			String englishName=req.getParameter("englishName");
			
			if((authorName==null||authorName.trim().length()==0)&&(englishName==null||englishName.trim().length()==0)) {
				errorMsgs.add("名稱和英文名稱不可皆為空白");
				RequestDispatcher failureView=req.getRequestDispatcher("/back-end/author/addAuthor.jsp");
				failureView.forward(req, res);
				return;
			}
			
			// ---提交修改---
			int result=authsce.addAuth(authorName, englishName);
			
			if(result==-1) {
				errorMsgs.add("修改失敗");
				RequestDispatcher failureView=req.getRequestDispatcher("/back-end/author/addAuthor.jsp");
				failureView.forward(req, res);
				return;
			}
			
			// ---轉交資料---
			if(result==1) {
				RequestDispatcher failureView=req.getRequestDispatcher("/back-end/author/author.jsp");
				failureView.forward(req, res);
				return;
			}
		}
	}	
}
