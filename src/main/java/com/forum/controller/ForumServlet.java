package com.forum.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.forum.model.ForumService;
import com.forum.model.ForumVO;

@WebServlet("/forum/forum.do")
public class ForumServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
//		System.out.println(action);
		if ("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			String str = req.getParameter("forumNumber");
			if (str == null || (str.trim()).length() == 0) {
				errorMsgs.add("請輸入看板編號");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/forum/selectForum.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			Integer forumNumber = null;
			try {
				forumNumber = Integer.valueOf(str);
			} catch (Exception e) {
				errorMsgs.add("看板編號格式不正確");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/forum/selectForum.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			/*************************** 2.開始查詢資料 *****************************************/
			ForumService forumSvc = new ForumService();
			ForumVO forumVO = forumSvc.getForumNumber(forumNumber);
			if (forumVO == null) {
				errorMsgs.add("查無資料");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/forum/selectForum.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
			req.setAttribute("forumVO", forumVO); // 資料庫取出的empVO物件,存入req
			String url = "/back-end/forum/listOneForum.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
			successView.forward(req, res);
		}
//=============================用名字搜尋=====================================
		if ("getName_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			String str = req.getParameter("name");
			if (str == null || (str.trim()).length() == 0) {
				errorMsgs.add("請輸入看板類別名稱");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/forum/selectForum.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			/*************************** 2.開始查詢資料 *****************************************/
			ForumService forumSvc = new ForumService();
			String name = str;
			List<ForumVO> list = forumSvc.getName(name);
			if (list.isEmpty()) {
				errorMsgs.add("查無資料");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/forum/selectForum.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
			req.setAttribute("list", list); // 資料庫取出的empVO物件,存入req
			String url = "/back-end/forum/listOneNameForum.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
			successView.forward(req, res);
		}
//=====================================修改===============================================
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ****************************************/
			Integer forumNumber = Integer.valueOf(req.getParameter("forumNumber"));

			/*************************** 2.開始查詢資料 ****************************************/
			ForumService forumSvc = new ForumService();
			ForumVO forumVO = forumSvc.getForumNumber(forumNumber);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			req.setAttribute("forumVO", forumVO); // 資料庫取出的empVO物件,存入req
			String url = "/back-end/forum/updateForumInput.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
			successView.forward(req, res);
		}

		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			Integer forumNumber = Integer.valueOf(req.getParameter("forumNumber").trim());

			String name = req.getParameter("name");
			String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			if (name == null || name.trim().length() == 0) {
				errorMsgs.add("看板名稱: 請勿空白");
			} else if (!name.trim().matches(nameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("看板名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
			}

			ForumVO forumVO = new ForumVO();
			forumVO.setForumNumber(forumNumber);
			forumVO.setName(name);

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("forumVO", forumVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/forum/updateForumInput.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}

			/*************************** 2.開始修改資料 *****************************************/
			ForumService forumSvc = new ForumService();
			forumVO = forumSvc.updateForum(forumNumber, name);

			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("forumVO", forumVO); // 資料庫update成功後,正確的的empVO物件,存入req
			String url = "/back-end/forum/listOneForum.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
			successView.forward(req, res);
		}
//=====================================新增=================================
        if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String name = req.getParameter("name");
				String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (name == null || name.trim().length() == 0) {
					errorMsgs.add("看板名稱: 請勿空白");
				} else if(!name.trim().matches(nameReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("看板名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
	            }
				ForumVO forumVO = new ForumVO();
				forumVO.setName(name);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("forumVO", forumVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/forum/addForum.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				ForumService forumSvc = new ForumService();
				forumVO = forumSvc.addForum(name);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/back-end/forum/listAllForum.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
		}
//=================================前端查詢===================================
        if ("getName_For_Front_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			String str = req.getParameter("name");
			if (str == null || (str.trim()).length() == 0) {
				errorMsgs.add("請輸入看板類別名稱");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/forum/PTT.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			/*************************** 2.開始查詢資料 *****************************************/
			ForumService forumSvc = new ForumService();
			String name = str;
			List<ForumVO> list = forumSvc.getName(name);
			if (list.isEmpty()) {
				errorMsgs.add("查無資料");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/forum/PTT.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
			req.setAttribute("list", list); // 資料庫取出的empVO物件,存入req
			String url = "/front-end/forum/listOneNameForumFront.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
			successView.forward(req, res);
		}
	}

}
