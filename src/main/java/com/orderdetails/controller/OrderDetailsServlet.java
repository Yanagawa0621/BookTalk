package com.orderdetails.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.orderdetails.model.OrderDetailsService;
import com.orderdetails.model.OrderDetailsVO;


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
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
//		String forwardPath = "";
		
		switch(action) {
			case "evaluate":
				addEvaluate(req, res);
				return;	
		}
	}
	
	
	private void addEvaluate(HttpServletRequest req, HttpServletResponse res) throws IOException {
		List<OrderDetailsVO> details = new ArrayList<>();
		OrderDetailsVO orderDetailsVO = null;
		Gson gson = new GsonBuilder()
						.setDateFormat("yyyy-MM-dd HH:mm:ss")
						.create();
		
		Integer orderNumber = Integer.valueOf(req.getParameter("orderNumber"));
		JsonArray jsonArray = gson.fromJson(req.getParameter("orderDetails"), JsonArray.class);
		
		for(JsonElement element : jsonArray) {
			JsonObject object = element.getAsJsonObject();
			Integer orderDetailsNumber = object.get("orderDetailsNumber").getAsInt();
			Integer bookNumber = object.get("bookNumber").getAsInt();
			Integer ratingScore = object.get("ratingScore").getAsInt();
			String evaluateContent = object.get("evaluateContent").getAsString();
			orderDetailsVO = orderDteailsService.getByOrderDetailsNumberBookNumber(orderDetailsNumber, bookNumber);
			orderDetailsVO.setRatingScore(ratingScore);
			orderDetailsVO.setEvaluateContent(evaluateContent);
			details.add(orderDetailsVO);		
		}
		
		int messageCode = orderDteailsService.updateEvaluateRatingScore(orderNumber, details);
		
		if(messageCode == 1) {
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			res.getWriter().write("{\"message\": \"evaluate success\"}");
		}
	}

}
