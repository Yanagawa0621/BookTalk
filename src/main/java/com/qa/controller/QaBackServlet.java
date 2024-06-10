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

@WebServlet("/qaBack.do")
public class QaBackServlet extends HttpServlet {
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
		
		doPost(req, res);
		//Q&A列表 跳轉頁面 到修改頁面
		
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		/*
			String questionNo = req.getParameter("questionNo");
			Integer questionNo_ = null ;
			if(questionNo != null && !"".equals(questionNo)) {
				questionNo_ = Integer.valueOf(questionNo);
			}
			String question = req.getParameter("question");
			String way = req.getParameter("way");
			List<QaVO> list = qaSce.createQuery(questionNo_, question, way);
			// ===轉交資料===
			req.setAttribute("list", list);
			RequestDispatcher failureView = req.getRequestDispatcher("/back-end/qa/qa.jsp");
			failureView.forward(req, res);
			return;
		*/
		
		
		if ("getOne_For_Update".equals(action)) {
			String qaVOId = req.getParameter("qaVOId");
			QaVO vo = qaSce.queryVoById(Integer.valueOf(qaVOId));
			req.setAttribute("vo", vo);
			RequestDispatcher dispatcher = req.getRequestDispatcher("/back-end/qa/updateQa.jsp");
			dispatcher.forward(req, res);
		}else if ("keywords".equals(action)) {
			String questionNoStr = req.getParameter("questionNo");
            Integer questionNo = null;
            if (questionNoStr != null && !questionNoStr.trim().isEmpty()) {
                questionNo = Integer.valueOf(questionNoStr);
            }
            String question = req.getParameter("question");
            String way = req.getParameter("way");

            List<QaVO> list = qaSce.createQuery(questionNo, question, way);
            req.setAttribute("qalist", list);
            RequestDispatcher failureView = req.getRequestDispatcher("/back-end/qa/qa.jsp");
            failureView.forward(req, res);
		}else if ("update".equals(action)) {
			String questionNo = req.getParameter("questionNo");
			String question = req.getParameter("question");
			String answer = req.getParameter("answer");
			String way = req.getParameter("way");
			boolean success = qaSce.addQa(Integer.valueOf(questionNo), question, answer,way);
		    
		    if (success) {
		        // 如果新增成功，重新查詢最新的 Q&A 資料
		        List<QaVO> qalist = qaSce.getAll();
		        
		        // 將查詢結果存儲在 request 屬性中
		        req.setAttribute("qalist", qalist);
		    }
	        RequestDispatcher dispatcher = req.getRequestDispatcher("/back-end/qa/qa.jsp");
	        dispatcher.forward(req, res);
	    }else if ("add".equals(action)) {
	    	// 接收從表單提交的資料
	    	String questionNo = req.getParameter("questionNo");
	        String question = req.getParameter("question");
	        String answer = req.getParameter("answer");
	        String way = req.getParameter("way");
	        boolean success = qaSce.addVoById(Integer.valueOf(questionNo), question, answer,way);
	        if (success) {
		        // 如果新增成功，重新查詢最新的 Q&A 資料
		        List<QaVO> qalist = qaSce.getAll();
		        
		        // 將查詢結果存儲在 request 屬性中
		        req.setAttribute("qalist", qalist);
		    }
	        RequestDispatcher dispatcher = req.getRequestDispatcher("/back-end/qa/qa.jsp");
	        dispatcher.forward(req, res);
	    }
		
		
		
		
		
		
		
		
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
	
	}
}
