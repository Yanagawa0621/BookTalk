package com.comment.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.comment.model.CommentService;

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
			Integer articleNumber = null;

			try {
				articleNumber = Integer.parseInt(articleNumberStr);
			} catch (NumberFormatException e) {

				e.printStackTrace();
			}
			CommentService commentSvc = new CommentService();
			commentSvc.addComment(content, articleNumber);
			res.setContentType("application/json");
            res.setCharacterEncoding("UTF-8");
            res.getWriter().write("{\"status\":\"success\"}");

		}
	}
}
