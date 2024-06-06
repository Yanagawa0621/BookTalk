package com.cart.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		switch(action) {	//這裡有些用return，而不是break，是因為已經要回傳json的資料，不需要再往下進行，以免被導向別的頁面
			case "add":
				addItem(req, res);
				return; 
			case "update":
				updateItem(req, res);
				return;
			case "remove":
				removeOne(req, res);
				return;
			case "clear":
				cleanAll(req, res);
				return;
			case "getAll":
				getAllItems(req, res);
				return;	
			case "goToCheck":
				forwardPath = getCheckItems(req, res);
				break;
			default:
				forwardPath = "/index.jsp";
		}
		
		res.setContentType("text/html; charset=UTF-8");
		RequestDispatcher dispatcher = req.getRequestDispatcher(forwardPath);
		dispatcher.forward(req, res);
	}
	
	private void addItem(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String tempUserNumber = req.getParameter("userNumber");
		Integer userNumber = 0;
		
		if(tempUserNumber != null) {
			userNumber = Integer.valueOf(req.getParameter("userNumber"));
		}else {
			HttpSession session = req.getSession();
			userNumber = (Integer) session.getAttribute("userNumber");	
		}
		
		Integer bookNumber = Integer.valueOf(req.getParameter("bookNumber"));
		String bookTitle = req.getParameter("bookTitle");
		Double bookPrice = Double.valueOf(req.getParameter("bookPrice"));
		Integer quantity = Integer.valueOf(req.getParameter("quantity"));
		Integer bookStock = Integer.valueOf(req.getParameter("bookStock"));
		
		CartVO cartVO = new CartVO();
		cartVO.setUserNumber(userNumber);
		cartVO.setBookNumber(bookNumber);
		cartVO.setBookTitle(bookTitle);
		cartVO.setBookPrice(bookPrice);
		cartVO.setQuantity(quantity);
		cartVO.setBookStock(bookStock);
		cartVO.setSubtotal(bookPrice * quantity);
		
		cartVO = cartService.addItemToCart(cartVO);
		
		String jsonStr = new Gson().toJson(cartVO);
		
		res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");
        res.getWriter().write(jsonStr);

	}
	
	private void updateItem(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String tempUserNumber = req.getParameter("userNumber");
		Integer userNumber = 0;
		
		if(tempUserNumber != null) {
			userNumber = Integer.valueOf(req.getParameter("userNumber"));
		}else {
			HttpSession session = req.getSession();
			userNumber = (Integer) session.getAttribute("userNumber");	
		}
		
		Integer bookNumber = Integer.valueOf(req.getParameter("bookNumber"));
		Double bookPrice = Double.valueOf(req.getParameter("bookPrice"));
		Integer quantity = Integer.valueOf(req.getParameter("quantity"));

		
		CartVO cartVO = new CartVO();
		cartVO.setUserNumber(userNumber);
		cartVO.setBookNumber(bookNumber);
		cartVO.setBookPrice(bookPrice);
		cartVO.setQuantity(quantity);
		cartVO.setSubtotal(bookPrice * quantity);
		
		cartVO = cartService.updateItemQuantity(cartVO);
		
		String jsonStr = new Gson().toJson(cartVO);
		
		res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");
        res.getWriter().write(jsonStr);
	}

	private void getAllItems(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String userNumber = req.getParameter("userNumber");
		List<CartVO> cartList = new ArrayList<>();
		if(userNumber != null) {	//如果js檔有userNumber的話
			cartList = cartService.getCartItems(Integer.valueOf(userNumber));
		}else {		//沒有userNumber，直接抓session裡的
			HttpSession session = req.getSession();
			cartList = cartService.getCartItems((Integer) session.getAttribute("userNumber"));
		}	
		
		String jsonStr = new Gson().toJson(cartList);
		
		System.out.println(jsonStr);

        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");
        res.getWriter().write(jsonStr);
	}
	
	private void removeOne(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String tempUserNumber = req.getParameter("userNumber");
		Integer userNumber = 0;
		
		if(tempUserNumber != null) {
			userNumber = Integer.valueOf(req.getParameter("userNumber"));
		}else {
			HttpSession session = req.getSession();
			userNumber = (Integer) session.getAttribute("userNumber");	
		}
		
		Integer bookNumber = Integer.valueOf(req.getParameter("bookNumber"));
		String status = "";
		if(cartService.removeItemFromCart(userNumber, bookNumber) == 1) {
			status = "{\"msg\":\"remove success\"}";	//回傳json格式字串{"msg" : "remove success"}
		}
		
        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");
        res.getWriter().write(status);
	}
	
	private void cleanAll(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String tempUserNumber = req.getParameter("userNumber");
		Integer userNumber = 0;
		
		if(tempUserNumber != null) {
			userNumber = Integer.valueOf(req.getParameter("userNumber"));
		}else {
			HttpSession session = req.getSession();
			userNumber = (Integer) session.getAttribute("userNumber");	
		}

		String status = "";
		if(cartService.clearCart(userNumber) == 1) {
			status = "{\"msg\":\"clean success\"}";		//回傳json格式字串{"msg" : "clean success"}
		}
		
        res.setContentType("application/json");
        res.setCharacterEncoding("UTF-8");
        res.getWriter().write(status);
	}
	
	private String getCheckItems(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String userNumber = req.getParameter("userNumber");
		List<CartVO> cartList = new ArrayList<>();
		if(userNumber != null) {	//如果js檔有userNumber的話
			cartList = cartService.getCartItems(Integer.valueOf(userNumber));
		}else {		//沒有userNumber，直接抓session裡的
			HttpSession session = req.getSession();
			cartList = cartService.getCartItems((Integer) session.getAttribute("userNumber"));
		}		

		String subtotalSum = req.getParameter("subtotalSum");
        String deliveryFee = req.getParameter("deliveryFee");
        String total = req.getParameter("total");

        req.setAttribute("subtotalSum", subtotalSum);
        req.setAttribute("deliveryFee", deliveryFee);
        req.setAttribute("total", total);
        req.setAttribute("cartList", cartList);

		return "/front-end/checkout.jsp";
	
	}

}
