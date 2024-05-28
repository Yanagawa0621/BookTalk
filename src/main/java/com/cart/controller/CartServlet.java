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
				break;
			case "update":
				break;
			case "remove":
				break;
			case "clear":
				break;
			case "getAll":
				forwardPath = getAllItems(req, res);
				break;
			case "miniCartGetAll":
				getMiniCartAllItems(req, res);
				return;	//這裡用return是因為已經要回傳json的資料，不需要再往下進行，以免被導向別的頁面
			case "fullCartGetAll":
				getFullCartAllItems(req, res);
				return;
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
	
	private String getAllItems(HttpServletRequest req, HttpServletResponse res) {
		String userNubmer = req.getParameter("userNubmer");
		List<CartVO> cartVO = cartService.getCartItems(Integer.parseInt(userNubmer));
		
		req.setAttribute("cartVO", cartVO);
		
		
		return "/front-end/cart.jsp";
	}
	
	private void getMiniCartAllItems(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String userNumber = req.getParameter("userNumber");
		List<CartVO> cartList = cartService.getCartItems(Integer.valueOf(userNumber));
		String jsonStr = new Gson().toJson(cartList);
		
		System.out.println(jsonStr);

        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");
        res.getWriter().write(jsonStr);
	}

	private void getFullCartAllItems(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String userNumber = req.getParameter("userNumber");
		List<CartVO> cartList = cartService.getCartItems(Integer.valueOf(userNumber));
		String jsonStr = new Gson().toJson(cartList);
		
		System.out.println(jsonStr);

        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");
        res.getWriter().write(jsonStr);
	}
}
