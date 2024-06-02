package com.order.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.order.model.OrderService;
import com.order.model.OrderVO;
import com.orderdetails.model.OrderDetailsVO;

@WebServlet("/order/order.do")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService orderService;

    public OrderServlet() {
        super();
    }
    
    public void init() throws ServletException{
    	orderService = new OrderService();
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);	
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
//		System.out.println(action);
		
		/**************************** getOne_For_Display ****************************/
		
		if("getOne_For_Display".equals(action)){
			List<String> errorMsgs = new LinkedList<>();
			
			req.setAttribute("errorMsgs", errorMsgs);
		
			//接收請求參數 - 輸入格式錯誤處理
			String str = req.getParameter("orderNumber");
			if (str == null || (str.trim()).length() == 0) {
				errorMsgs.add("請輸入訂單編號");
			}
			
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/order/order.jsp");
				failureView.forward(req, res);
				return;
			}
			
			Integer orderNumber = null;
			try {
				orderNumber = Integer.valueOf(str);
			}catch(Exception e) {
				errorMsgs.add("訂單編號格式不正確");
			}
			
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/order/order.jsp");
				failureView.forward(req, res);
				return;
			}
			
			//查詢資料
//			OrderService orderSvc = new OrderService();
			OrderVO orderVO = orderService.getOneOrder(orderNumber);
			if(orderVO == null) {
				errorMsgs.add("查無資料");
			}
			
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/order/order.jsp");
				failureView.forward(req, res);
				return;
			}
			
			//查詢完成，準備轉交
			req.setAttribute("orderVO", orderVO);
			String url = "/back-end/order/listOneOrder.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneOrder.jsp
			successView.forward(req, res);
		}
		
		/****************************getOne_For_Update ****************************/
		
		if("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);
				
			Integer orderNumber = Integer.valueOf(req.getParameter("orderNumber"));
			
//			OrderService orderSvc = new OrderService();
			OrderVO orderVO = orderService.getOneOrder(orderNumber);
							
			req.setAttribute("orderVO", orderVO);         // 資料庫取出的orderVO物件，存入req
			String url = "/back-end/order/updateOrderInput.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 updateOrderInput.jsp
			successView.forward(req, res);
		}
		
		/**************************** update ****************************/
		
		if("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			Integer orderNumber = Integer.valueOf(req.getParameter("orderNumber"));
			Integer userNumber = Integer.valueOf(req.getParameter("userNumber"));
			Integer orderStatus = Integer.valueOf(req.getParameter("orderStatus"));
			Timestamp establishmentTime = Timestamp.valueOf(req.getParameter("establishmentTime"));
			
			String hasShippingTime = req.getParameter("shippingTime").trim();
			Timestamp shippingTime = null;
			if(!hasShippingTime.isEmpty()) {
				shippingTime = Timestamp.valueOf(req.getParameter("shippingTime")+":00");	//抓完的資料只到分鐘，加上:00以符合存入timestamp的格式
			}
			
			String receiver = req.getParameter("receiver").trim();
			if (receiver == null || receiver.trim().length() == 0) {
				errorMsgs.add("收件人請勿空白");
			}
			
			String shippingAddress = req.getParameter("shippingAddress").trim();
			if (shippingAddress == null || shippingAddress.trim().length() == 0) {
				errorMsgs.add("收件地址請勿空白 ");
			}
			
			BigDecimal deliveryFee;
			try {
				deliveryFee = new BigDecimal(req.getParameter("deliveryFee"));
			}catch(NumberFormatException e) {
				deliveryFee = new BigDecimal(0.0);
				errorMsgs.add("運費請填數字.");
			}
			
			BigDecimal total;
			try {
				total = new BigDecimal(req.getParameter("total"));
			}catch(NumberFormatException e) {
				total = new BigDecimal(0.0);
				errorMsgs.add("總金額請填數字.");
			}
			
			String note = req.getParameter("note").trim();
			
			OrderVO orderVO = new OrderVO();
			orderVO.setOrderNumber(orderNumber);
			orderVO.setUserNumber(userNumber);
			orderVO.setOrderStatus(orderStatus);
			orderVO.setEstablishmentTime(establishmentTime);
			orderVO.setShippingTime(shippingTime);
			orderVO.setReceiver(receiver);
			orderVO.setShippingAddress(shippingAddress);
			orderVO.setDeliveryFee(deliveryFee);
			orderVO.setTotal(total);
			orderVO.setNote(note);
			
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("orderVO", orderVO); // 含有輸入格式錯誤的orderVO物件，也存入req
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/order/updateOrderInput.jsp");
				failureView.forward(req, res);
				return; //程式中斷
			}
			
//			OrderService orderSvc = new OrderService();			
			orderVO = orderService.updateOrder(orderVO);
			
			req.setAttribute("orderVO", orderVO);	// 資料庫update成功後，正確的orderVO物件，存入req
			String url = "/back-end/order/listOneOrder.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後，轉交listOneOrder.jsp
			successView.forward(req, res);
		}
		
		/**************************** insert ****************************/
		
		if("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<>();			
			req.setAttribute("errorMsgs", errorMsgs);
			
			String receiver = req.getParameter("receiver").trim();
			if(receiver == null || receiver.length() == 0) {
				errorMsgs.add("收件人請勿空白");		
			}
			
			String shippingAddress = req.getParameter("shippingAddress").trim();
			if(shippingAddress == null || shippingAddress.length() == 0) {
				errorMsgs.add("收件地址請勿空白");		
			}
			
			BigDecimal deliveryFee;
			try {
				deliveryFee = new BigDecimal(req.getParameter("deliveryFee"));
			}catch(NumberFormatException e) {
				deliveryFee = new BigDecimal(0.0);
				errorMsgs.add("運費請填數字.");
			}
			
			BigDecimal total;
			try {
				total = new BigDecimal(req.getParameter("total"));
			}catch(NumberFormatException e) {
				total = new BigDecimal(0.0);
				errorMsgs.add("總金額請填數字.");
			}
			
			String note = req.getParameter("note").trim();
			
			Integer userNumber = 4;	//TODO 正常來說這裡是要抓登入者的會員編號，但目前還未寫到，先用寫死的方式
			
			OrderVO orderVO = new OrderVO();

			orderVO.setUserNumber(userNumber);
			orderVO.setReceiver(receiver);
			orderVO.setShippingAddress(shippingAddress);
			orderVO.setDeliveryFee(deliveryFee);
			orderVO.setTotal(total);
			orderVO.setNote(note);
			
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("orderVO", orderVO); // 含有輸入格式錯誤的orderVO物件，也存入req
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/order/addOrder.jsp");
				failureView.forward(req, res);
				return; //程式中斷
			}
			
//			OrderService orderSvc = new OrderService();
			orderVO = orderService.addOrder(orderVO);
			
			String url = "/back-end/order/order.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交order.jsp
			successView.forward(req, res);	
			
		}
		
		/**************************** getOneUserNumber_For_Display ****************************/
		
		if("getOneUserNumber_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<>();			
			req.setAttribute("errorMsgs", errorMsgs);
		
			String str = req.getParameter("userNumber");
			if (str == null || (str.trim()).length() == 0) {
				errorMsgs.add("請選擇會員編號");
			}
			
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/order/order.jsp");
				failureView.forward(req, res);
				return;
			}
	
			Integer userNumber = null;
			try {
				userNumber = Integer.valueOf(str);
			}catch(NumberFormatException e) {
				errorMsgs.add("會員編號格式不正確");
			}
			
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/order/order.jsp");
				failureView.forward(req, res);
				return;
			}
			
			//查詢某會員編號的訂單
//			OrderService orderSvc = new OrderService();
			List<OrderVO> listUserNumberVO = orderService.getOrderByUserNumber(userNumber);
			
//			for (OrderVO item : listUserNumberVO) {
//	            System.out.println(item.getOrderNumber());
//	            System.out.println(item.getUserNumber());
//	        }

			if(listUserNumberVO.size() == 0) {
				errorMsgs.add("查無資料");
			}
			
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/order/order.jsp");
				failureView.forward(req, res);
				return;
			}
			
			//查詢完成，準備轉交
			req.setAttribute("listUserNumberVO", listUserNumberVO);
			String url = "/back-end/order/listOneOrder.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneOrder.jsp
			successView.forward(req, res);
		}
		
		/**************************** getOneOrderStatus_For_Display ****************************/
		if("getOneOrderStatus_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<>();			
			req.setAttribute("errorMsgs", errorMsgs);
			
			String str = req.getParameter("orderStatus");
			if (str == null || (str.trim()).length() == 0) {
				errorMsgs.add("請選擇訂單狀態");
			}
			
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/order/order.jsp");
				failureView.forward(req, res);
				return;
			}
			
			Integer orderStatus = null;
			try {
				orderStatus = Integer.valueOf(str);
			}catch(NumberFormatException e) {
				errorMsgs.add("訂單狀態編號格式不正確");
			}
			
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/order/order.jsp");
				failureView.forward(req, res);
				return;
			}
			
//			OrderService orderSvc = new OrderService();
			List<OrderVO> listOrderStatueVO = orderService.getOrderByOrderStatus(orderStatus);
			
			if(listOrderStatueVO.size() == 0) {
				errorMsgs.add("查無資料");
			}
			
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/order/order.jsp");
				failureView.forward(req, res);
				return;
			}
			
			//查詢完成，準備轉交
			req.setAttribute("listOrderStatueVO", listOrderStatueVO);
			String url = "/back-end/order/listOneOrder.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneOrder.jsp
			successView.forward(req, res);
			
		}
		
		/**************************** checkout ****************************/
		if("checkout".equals(action)) {
			List<String> errorMsgs = new LinkedList<>();			
			req.setAttribute("errorMsgs", errorMsgs);
			
			String contextPath = req.getContextPath();	//取得專案名稱，給結帳時回傳網頁用

			String receiver = req.getParameter("receiver");	//取得收件人
			if(receiver == null || receiver.length() == 0) {
				errorMsgs.add("收件人請勿空白");		
			}else {
				receiver = receiver.trim();
			}
			
			String cityName = req.getParameter("cityName");	//取得縣市
			System.out.println("縣市" + cityName);
			if(cityName == null || cityName.length() == 0) {
				errorMsgs.add("縣市請勿空白");		
			}else {
				cityName = cityName.trim();
			}
			
			String districtName = req.getParameter("districtName");	//取得鄉鎮市區
			System.out.println("縣市" + districtName);
			if(districtName == null || districtName.length() == 0) {
				errorMsgs.add("鄉鎮市區請勿空白");		
			}else {
				districtName = districtName.trim();
			}
			
			String postalCode = req.getParameter("postalCode");	//取得郵遞區號
			
			if(postalCode == null || postalCode.length() == 0) {
				errorMsgs.add("郵遞區號請勿空白");		
			}else {
				postalCode = postalCode.trim();
			}
			
			String otherAddress = req.getParameter("otherAddress");	//取得除了縣市、鄉縝市區之外的地址
			
			if(otherAddress == null || otherAddress.length() == 0) {
				errorMsgs.add("地址請勿空白");		
			}else {
				otherAddress = otherAddress.trim();
			}
			
			String tel = req.getParameter("tel");	//取得電話號碼
			if(tel == null || tel.length() == 0) {
				errorMsgs.add("電話號碼請勿空白");		
			}else {
				tel = tel.trim();
			}
			
			String email = req.getParameter("email");	//取得email
			if(email == null || email.length() == 0) {
				errorMsgs.add("Email請勿空白");		
			}else {
				email = email.trim();
			}
			
			String note = req.getParameter("note");
			if(note != null) {
				note = note.trim();		
			}
			
			String userNumber = req.getParameter("userNumber");
			
			OrderVO orderVO = new OrderVO();

			orderVO.setUserNumber(Integer.valueOf(userNumber));
			orderVO.setReceiver(receiver);
			orderVO.setTelephoneNumber(tel);
			orderVO.setShippingAddress(postalCode + cityName + districtName + otherAddress);
			orderVO.setNote(note);
			System.out.println(orderVO);
			
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("orderVO", orderVO); // 含有輸入格式錯誤的orderVO物件，也存入req
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/checkout.jsp");
				failureView.forward(req, res);
				return; //程式中斷
			}
			
			String paymentForm = orderService.checkout(orderVO.getUserNumber(), orderVO, contextPath);
			
			if (paymentForm != null) {
                res.setContentType("text/html;charset=UTF-8");
                res.getWriter().write(paymentForm);
            } else {
                String url = "/front-end/checkout.jsp";
                errorMsgs.add("交易失敗");	
                RequestDispatcher failureView = req.getRequestDispatcher(url); // 如果沒有成功，再回到結帳畫面
                failureView.forward(req, res);
            }

		}
		
		/**************************** getUserAllOrder ****************************/
		
		if("getUserAllOrder".equals(action)) {
			Integer userNumber = Integer.valueOf(req.getParameter("userNumber"));
			List<OrderVO> listUserNumberVO = orderService.getOrderByUserNumber(userNumber);
			
			// excludeFieldsWithoutExposeAnnotation讓Gson轉成json過程中
			// 排除掉沒有@Expose的屬性, 就能避開雙向無限循環參考
			Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation()
										 .setDateFormat("yyyy-MM-dd HH:mm:ss")
										 .create();
			
			String jsonStr = gson.toJson(listUserNumberVO);

	        res.setContentType("application/json");
	        res.setCharacterEncoding("UTF-8");
	        res.getWriter().write(jsonStr);
		}
		
		
		/**************************** getUserOneOrderDetails ****************************/
		
		if("getUserOneOrderDetails".equals(action)) {
			Integer orderNumber = Integer.valueOf(req.getParameter("orderNumber"));
			OrderVO orderVO = orderService.getOneOrder(orderNumber);
			Set<OrderDetailsVO> orderDetailsVOs = orderService.getOrderDetailsVOsByOrderNumber(orderNumber);
			Integer subtotalSum = 0;
			
			for(OrderDetailsVO orderDetailsVO : orderDetailsVOs) {
				subtotalSum += orderDetailsVO.getSubtotal().intValue();
			}
			
			
//			System.out.println(orderVO);
//			System.out.println(orderDetailsVOs);
			
			//查詢完成，準備轉交
			req.setAttribute("orderVO", orderVO);
			req.setAttribute("orderDetailsVOs", orderDetailsVOs);
			req.setAttribute("subtotalSum", subtotalSum);
			String url = "/front-end/order-details.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 order-details.jsp
			successView.forward(req, res);
		}
		
		
		/**************************** getUserOneOrderDetailsJson ****************************/
		
		if("getUserOneOrderDetailsJson".equals(action)) {
			Integer orderNumber = Integer.valueOf(req.getParameter("orderNumber"));
			OrderVO orderVO = orderService.getOneOrder(orderNumber);

			
			// excludeFieldsWithoutExposeAnnotation讓Gson轉成json過程中
			// 排除掉沒有@Expose的屬性, 就能避開雙向無限循環參考
			Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation()
										 .setDateFormat("yyyy-MM-dd HH:mm:ss")
										 .create();
						
			String jsonStr = gson.toJson(orderVO);
			System.out.println(jsonStr);

			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			res.getWriter().write(jsonStr);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
