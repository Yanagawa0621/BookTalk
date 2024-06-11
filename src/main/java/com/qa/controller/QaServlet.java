package com.qa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.qa.model.QaService;
import com.qa.model.QaVO;

@WebServlet("/qa.do")
public class QaServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private QaService qaSce;

	public void init() throws ServletException {
		qaSce = new QaService();
//		System.out.println("intoQA init");
	}
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getAll".equals(action)) {
			List<QaVO> qaList = qaSce.getAll();
			req.setAttribute("qaList", qaList);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/back-end/qa/qa.jsp");
			dispatcher.forward(req, res);
		}
	}

//	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		req.setCharacterEncoding("UTF-8");
//		String action = req.getParameter("action");
//
//		// ===編號搜尋===
//		if ("getOne_For_Display".equals(action)) {
//			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//			// ---接受參數---
//			Integer classNumber = null;
//			try {
//				classNumber = Integer.valueOf(req.getParameter("classNumber"));
//			} catch (NumberFormatException e) {
//				errorMsgs.add("請輸入數字");
//				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookClass/bookClass.jsp");
//				failureView.forward(req, res);
//				return;
//			}
//			// ---查詢資料---
//			List<BookClassVO> list = new ArrayList<>();
//			BookClassVO bcVO = bcSce.singleQueryBcNp(classNumber);
////			System.out.println(bcVO);
//			if (bcVO == null) {
//				errorMsgs.add("查無資料");
//				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookClass/bookClass.jsp");
//				failureView.forward(req, res);
//				return;
//			}
//			// ===轉交資料===
//			list.add(bcVO);
//			req.setAttribute("list", list);
//			RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookClass/BookClassQuery.jsp");
//			failureView.forward(req, res);
//			return;
//		}
//
//		// ===關鍵字搜尋===
//		if ("keywords".equals(action)) {
//			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			// ---接受參數---
//			String keywords = req.getParameter("keywords");
//			// ---查詢資料---
//			List<BookClassVO> list = bcSce.keywordsBcNp(keywords);
//			if (list.size() == 0) {
//				errorMsgs.add("查無資料");
//				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookClass/bookClass.jsp");
//				failureView.forward(req, res);
//				return;
//			}
//			// ---轉交資料---
//			req.setAttribute("list", list);
//			RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookClass/BookClassQuery.jsp");
//			failureView.forward(req, res);
//			return;
//		}
//
//		// ===查詢單筆資料===
//		if ("getOne_For_Update".equals(action)) {
//			// ---接受參數---
//			Integer classNumber = Integer.valueOf(req.getParameter("classNumber"));
//			// ---查詢資料---
//			BookClassVO bcVO = bcSce.singleQueryBcNp(classNumber);
//			// ---轉交資料---
//			req.setAttribute("bcVO", bcVO);
//			RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookClass/updateBookClass.jsp");
//			failureView.forward(req, res);
//			return;
//		}
//
//		// ===修改資料===
//		if ("update".equals(action)) {
//			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//			// ---接受參數---
//			Integer classNumber = Integer.valueOf(req.getParameter("classNumber"));
//			String className = req.getParameter("className");
//			// ---提交修改---
//			int result = bcSce.updateBc(classNumber, className);
////			System.out.println(result);
//			if(result==-2) {
//				errorMsgs.add("此類別名稱已重複");
//				BookClassVO bcVO=new BookClassVO();
//				bcVO.setClassName(className);
//				req.setAttribute("bcVO", bcVO);
//				RequestDispatcher failureView=req.getRequestDispatcher("back-end/bookClass/updateBookClass.jsp");
//				failureView.forward(req, res);
//				return;
//			}
//			if (result == -1) {
//				BookClassVO bcVO = new BookClassVO();
//				errorMsgs.add("修改失敗");
//				bcVO.setClassName(className);
//				bcVO.setClassNumber(classNumber);
//				req.setAttribute("bcVO", bcVO);
//				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookClass/updateBookClass.jsp");
//				failureView.forward(req, res);
//				return;
//			}
//			
//			// ---修改完成---
//			if (result == 1) {
//				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookClass/bookClass.jsp");
//				failureView.forward(req, res);
//				return;
//			}
//		}
//
//		// ===新增類別===
//		if ("insert".equals(action)) {
//			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//			// ---接受參數---
//			String className = req.getParameter("className");
//			// ---提交新增---
//			int result=bcSce.increaseBc(className);
//			
//			if(result==-1) {
//				errorMsgs.add("新增失敗");
//				BookClassVO bcVO=new BookClassVO();
//				bcVO.setClassName(className);
//				req.setAttribute("bcVO", bcVO);
//				RequestDispatcher failureView=req.getRequestDispatcher("back-end/bookClass/addBookClass.jsp");
//				failureView.forward(req, res);
//				return;
//			}
//			if(result==-2) {
//				errorMsgs.add("此類別名稱已重複");
//				BookClassVO bcVO=new BookClassVO();
//				bcVO.setClassName(className);
//				req.setAttribute("bcVO", bcVO);
//				RequestDispatcher failureView=req.getRequestDispatcher("back-end/bookClass/addBookClass.jsp");
//				failureView.forward(req, res);
//				return;
//			}
//			// ---轉交結果---
//			if(result==1) {
//				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/bookClass/bookClass.jsp");
//				failureView.forward(req, res);
//				return;
//			}
//		}
//	}
}
