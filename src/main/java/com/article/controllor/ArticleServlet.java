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
import javax.servlet.http.HttpSession;

import com.article.model.ArticleService;
import com.article.model.ArticleVO;
import com.comment.model.CommentService;

@WebServlet("/article/article.do")
public class ArticleServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
//**********************新增文章*******************************
		if ("insert".equals(action)) { 
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String forumNumberStr = req.getParameter("forumNumber");
			HttpSession session = req.getSession();
			String userNumberStr = (String) session.getAttribute("userNumber");
			Integer forumNumber = null;
			Integer userNumber = null;
			try {
				forumNumber = Integer.parseInt(forumNumberStr);
				userNumber = Integer.parseInt(userNumberStr);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			/*************************** 2.開始新增資料 ***************************************/
			ArticleService articleSvc = new ArticleService();
			articleSvc.addArticle(content, title, forumNumber,userNumber);
			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			String url = "/front-end/article/popularArticle.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}
		// =========================假登入================================
//		if ("loginVerification".equals(action)) {
//			HttpSession session = req.getSession();
//			Object user = session.getAttribute("userNumber");
//			if(user == null) {
//				String url = "/front-end/fakeLogin/login.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//				successView.forward(req, res);
//			}
//			else {
//				String str = req.getParameter("forumNumber");
//				Integer forumNumber = null;
//				if (str != null && !str.isEmpty()) {
//					try{
//						forumNumber = Integer.parseInt(str);
//						
//					}catch (NumberFormatException e){
//						e.printStackTrace();
//					}
//				}
//				else{
//					forumNumber = 0;
//				}
//			
//				if (user instanceof String) {
//				    // 将 String 类型转换为 Integer 类型
//				    String userString = (String) user;
//				    Integer userNumber = Integer.parseInt(userString);
//					ArticleVO articleVO = new ArticleVO();
//					articleVO.setUserNumber(userNumber);
//					ForumVO forumVO = new ForumVO();
//					ForumService svc = new ForumService();
//					forumVO = svc.getForumNumber(forumNumber);
//					articleVO.setForumVO(forumVO);
//					req.setAttribute("articleVO", articleVO);
//					String url = "/front-end/article/ckEditor/sample/addArticle.jsp";
//					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
//					successView.forward(req, res);
//				
//				}
//			}
//		}
//***********************假登入*************************************
		if ("fakeID".equals(action)) {
			String str = req.getParameter("userNumber");
			HttpSession session = req.getSession();
			session.setAttribute("userNumber", str);
			String url = "/front-end/article/popularArticle.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}
//************************模糊搜尋文章標題*****************************
		if ("getName_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			String title = req.getParameter("title");
			ArticleService articleSvc = new ArticleService();
			List<ArticleVO> list = articleSvc.findArticleByKeyWord(title);
            //***************錯誤處理********************
			if (list.isEmpty()) {
				errorMsgs.add("查無資料");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/article/searchArticle.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}
			//***************送出資料*********************		
			String url = "/front-end/article/searchArticle.jsp";
			req.setAttribute("list", list);
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}
//**********************更新文章*****************************
		if("update".equals(action)) {
			String articleNumberStr = req.getParameter("articleNumber");
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			Integer articleNumber = null;
			try {
				articleNumber = Integer.parseInt(articleNumberStr);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			ArticleService articleSvc = new ArticleService();
			ArticleVO articleVO = articleSvc.getOneFromArticleNumber(articleNumber);
			articleVO.setTitle(title);
			articleVO.setContent(content);
			ArticleService articleSvc1 = new ArticleService();
			articleSvc1.updateArticle(articleVO);			
			String url = "/front-end/article/forumsArticle.jsp?forumNumber="+articleVO.getForumVO().getForumNumber();
			System.out.println(articleVO.getForumVO().getForumNumber());
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
			
		}
		if ("delete".equals(action)) {
			/*********************** 1.接收請求參數 *************************/
			String articleNumberStr = req.getParameter("articleNumber");
			Integer articleNumber = null;
			try {
				articleNumber = Integer.parseInt(articleNumberStr);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			ArticleService articleSvc = new ArticleService();
			articleSvc.delete(articleNumber);
			String url = "/front-end/article/popularArticle.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}
	}
}
