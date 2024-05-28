package com.cart.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cart.model.CartService;
import com.cart.model.CartVO;
import com.google.gson.Gson;

@WebServlet("/cart/cart.do")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartService cartService;

    public CartServlet() {
        super();

    }
    
    public void init() throws ServletException{
    	cartService = new CartService();
    }
    
    protected void doDelete(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	doPost(req, res);
    }


	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String forwardPath = "";
		
		switch(action) {
			case "add":
				forwardPath = addItem(req, res);
				return;
			case "update":
				return;
			case "remove":
				removeOne(req, res);
				return;
			case "clear":
				cleanAll(req, res);
				return;
			case "getAll":
				getAllItems(req, res);
				return;	//這裡用return是因為已經要回傳json的資料，不需要再往下進行，以免被導向別的頁面
			default:
				forwardPath = "/index.jsp";
		}
		
		res.setContentType("text/html; charset=UTF-8");
		RequestDispatcher dispatcher = req.getRequestDispatcher(forwardPath);
		dispatcher.forward(req, res);
	}
	
	private String addItem(HttpServletRequest req, HttpServletResponse res) {
		
		
		
		return null;
	}
	
	private void getAllItems(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String userNumber = req.getParameter("userNumber");
		List<CartVO> cartList = cartService.getCartItems(Integer.valueOf(userNumber));
		String jsonStr = new Gson().toJson(cartList);
		
		System.out.println(jsonStr);

        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");
        res.getWriter().write(jsonStr);
	}
	
	private void removeOne(HttpServletRequest req, HttpServletResponse res) throws IOException {
		Integer userNumber = Integer.valueOf(req.getParameter("userNumber"));
		Integer bookNumber = Integer.valueOf(req.getParameter("bookNumber"));
		String status = "";
		if(cartService.removeItemFromCart(userNumber, bookNumber) == 1) {
			status = "{\"msg\":\"remove success\"}";
		}
		
        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");
        res.getWriter().write(status);
	}
	
	private void cleanAll(HttpServletRequest req, HttpServletResponse res) throws IOException {
		Integer userNumber = Integer.valueOf(req.getParameter("userNumber"));

		String status = "";
		if(cartService.clearCart(userNumber) == 1) {
			status = "{\"msg\":\"clean success\"}";
		}
		
        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");
        res.getWriter().write(status);
	}
	

}
