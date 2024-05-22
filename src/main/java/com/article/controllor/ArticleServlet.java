package com.article.controllor;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.article.model.ArticleService;
import com.article.model.ArticleVO;
@WebServlet("/article/article.do")
public class ArticleServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String title = req.getParameter("title");
				if (title == null || title.trim().length() == 0) {
					errorMsgs.add("標題: 請勿空白");
				} 
				String content = req.getParameter("content");
				if (content == null || content.trim().length() == 0) {
					errorMsgs.add("內容: 請勿空白");
				} 
				ArticleVO articleVO = new ArticleVO();
				articleVO.setTitle(title);
				articleVO.setContent(content);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("articleVO", articleVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/article/ckEditor/sample/addArticle.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				ArticleService articleSvc = new ArticleService();
				
				articleVO = articleSvc.addArticle(content,title);	
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/front-end/article/popularArticle.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);				
		}
		
	}
}
