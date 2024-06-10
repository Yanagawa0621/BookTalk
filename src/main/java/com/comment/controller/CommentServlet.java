package com.comment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.comment.model.CommentService;
import com.comment.model.CommentVO;

@WebServlet("/comment/comment.do")
public class CommentServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if ("insert".equals(action)) {
			/*********************** 1.接收請求參數 *************************/
			String content = req.getParameter("content");
			String articleNumberStr = req.getParameter("articleNumber");
			HttpSession session = req.getSession();
			//String userNumberStr = (String) session.getAttribute("userNumber");
			Integer articleNumber = null;
			Integer userNumber = (Integer) session.getAttribute("userNumber");
			try {
				articleNumber = Integer.parseInt(articleNumberStr);
//				userNumber = Integer.parseInt(userNumberStr);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			CommentService commentSvc = new CommentService();
			CommentVO commentVO = commentSvc.addComment(content, articleNumber, userNumber);
			Integer commentNumber = commentVO.getCommentNumber();
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			JSONObject json = new JSONObject();
			 try {
	                if (commentNumber != null) {
	                    json.put("status", "success");
	                    json.put("commentNumber", commentNumber);
	                } else {
	                    json.put("status", "error");
	                }
	                res.getWriter().write(json.toString());
	            } catch (Exception e) {
	                e.printStackTrace();
	                res.getWriter().write("{\"status\":\"error\"}");
	            }

		}
		if ("delete".equals(action)) {
			/*********************** 1.接收請求參數 *************************/
			String commentNumberStr = req.getParameter("commentNumber");
			Integer commentNumber = null;
			try {
				commentNumber = Integer.parseInt(commentNumberStr);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			CommentService commentSvc = new CommentService();
			commentSvc.deleteComment(commentNumber);
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			res.getWriter().write("{\"status\":\"success\"}");

		}
		if ("update".equals(action)) {
			/*********************** 1.接收請求參數 *************************/
			String commentNumberStr = req.getParameter("commentNumber");
			String content = req.getParameter("content");
			Integer commentNumber = null;
			try {
				commentNumber = Integer.parseInt(commentNumberStr);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			CommentService commentSvc = new CommentService();
			CommentVO commentVO = commentSvc.findComment(commentNumber);
			commentVO.setContent(content);
			commentSvc.updateComment(commentVO);
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			res.getWriter().write("{\"status\":\"success\"}");

		}
	}
	
}
