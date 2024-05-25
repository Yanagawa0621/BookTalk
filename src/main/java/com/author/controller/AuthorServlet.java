package com.author.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.author.model.AuthorService;

@WebServlet("/author.do")
public class AuthorServlet {
	private AuthorService authsce;
	
	public void init() throws ServletException {
		authsce=new AuthorService();
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
	}
}
