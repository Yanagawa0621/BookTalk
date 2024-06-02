package com.orderdetails.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.orderdetails.model.OrderDetailsService;


@WebServlet("/orderDetails/orderDetails.do")
public class OrderDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDetailsService orderDteailsService;

    public OrderDetailsServlet() {
       super();
    }

    public void init() throws ServletException{
    	orderDteailsService = new OrderDetailsService();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
	}

}
