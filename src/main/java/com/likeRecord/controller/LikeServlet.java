package com.likeRecord.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.likeRecord.model.LikeService;

@WebServlet("/like/like.do")
public class LikeServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if ("insert".equals(action)) {
			String userNumberStr = req.getParameter("userNumber");
			String articleNumberStr = req.getParameter("articleNumber");
			Integer userNumber = null;
			Integer articleNumber = null;
			try {
				if (userNumberStr != null && !userNumberStr.isEmpty()) {
					userNumber = Integer.parseInt(userNumberStr);
				}
				if (articleNumberStr != null && !articleNumberStr.isEmpty()) {
					articleNumber = Integer.parseInt(articleNumberStr);
				}
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			LikeService likeSvc = new LikeService();
			likeSvc.addLike(userNumber, articleNumber);
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			res.getWriter().write("{\"status\":\"success\"}");
		}
		if ("delet".equals(action)) {
			String userNumberStr = req.getParameter("userNumber");
			String articleNumberStr = req.getParameter("articleNumber");
			Integer userNumber = null;
			Integer articleNumber = null;
			try {
				if (userNumberStr != null && !userNumberStr.isEmpty()) {
					userNumber = Integer.parseInt(userNumberStr);
				}
				if (articleNumberStr != null && !articleNumberStr.isEmpty()) {
					articleNumber = Integer.parseInt(articleNumberStr);
				}
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			System.out.println(userNumber + articleNumber);
			LikeService likeSvc = new LikeService();
			likeSvc.deleteLike(userNumber, articleNumber);
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			res.getWriter().write("{\"status\":\"success\"}");
		}
	}
}
