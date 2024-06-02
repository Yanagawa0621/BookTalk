package com.publishinghouse.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookproducts.model.BookProductsVO;
import com.publishinghouse.model.PublishingHouseService;
import com.publishinghouse.model.PublishingHouseVO;

@WebServlet("/publisingHouse.do")
public class PublisingHouseServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private PublishingHouseService phSce;

	public void init() throws ServletException {
		phSce = new PublishingHouseService();
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("query_bar".equals(action)) {
			String searchMain = req.getParameter("searchMain");
			if ("author".equals(searchMain)) {
				// ===接受參數===
				String Keywords = req.getParameter("Keywords");
				// ===查詢資料===
				List<BookProductsVO> list = new ArrayList<>();
				List<PublishingHouseVO> phVOs = phSce.KeywordQueryPh(Keywords);
				if (!phVOs.isEmpty()) {
					for (PublishingHouseVO phVO : phVOs) {
						for (BookProductsVO bpVO : phVO.getBpVO()) {
							if (bpVO.getProductStatus() == 1) {
								list.add(bpVO);
							}
						}
					}
					if (list.isEmpty()) {
						String url = "/front-end/shop3.jsp";
						String message = "本平台暫無相關出版社的書籍";
						req.setAttribute("message", message);
						RequestDispatcher successView = req.getRequestDispatcher(url);
						successView.forward(req, res);
						return;
					}
				} else {
					String url = "/front-end/shop3.jsp";
					String message = "查無相關出版社";
					req.setAttribute("message", message);
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);
					return;
				}
				// ===轉交資料===
				req.setAttribute("searchMain", "出版社");
				req.setAttribute("Keywords", Keywords);
				req.setAttribute("list", list);
				String url = "/front-end/shop3.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}
		}
	}
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		// ===關鍵字查詢===
		if("keywords".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			// ---接受參數---
			String keywords=req.getParameter("keywords");
			System.out.println(keywords);
			// ---查詢資料---
			List<PublishingHouseVO> list=phSce.KeywordQueryPhNp(keywords);
			if(list.size()==0) {
				errorMsgs.add("查無資料");
				RequestDispatcher failureView=req.getRequestDispatcher("/back-end/publishingHouse/publishingHouse.jsp");
				failureView.forward(req, res);
				return;
			}
			// ---轉交資料---
			req.setAttribute("list", list);
			RequestDispatcher failureView=req.getRequestDispatcher("/back-end/publishingHouse/publishingHouseQuery.jsp");
			failureView.forward(req, res);
			return;
		}
		
		// ===單筆編號請求===
		if("getOne_For_Update".equals(action)) {
			// ---接受參數---
			Integer publishingHouseNumber=Integer.valueOf(req.getParameter("publishingHouseNumber"));
			// ---查詢資料---
			PublishingHouseVO phVO=phSce.singleQueryPhNp(publishingHouseNumber);
			// ---轉交資料---
			req.setAttribute("phVO", phVO);
			RequestDispatcher failureView=req.getRequestDispatcher("/back-end/publishingHouse/updatePublishingHouse.jsp");
			failureView.forward(req, res);
			return;
		}
		
		// ===修改請求===
		if("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			// ---接受參數---
			Integer publishingHouseNumber=Integer.valueOf(req.getParameter("publishingHouseNumber"));
			String name=req.getParameter("name");
			String address=req.getParameter("address");
			String personInCharge=req.getParameter("personInCharge");
			String telephoneNumber=req.getParameter("telephoneNumber");
			String reg="^(09\\d{8}|0\\d{1,2}-?\\d{6,8}(?:-\\d{1,5})?)$";
			if(name==null||name.trim().length()==0) {
				errorMsgs.add("名字不可空白");
			}
			if(address==null||address.trim().length()==0) {
				errorMsgs.add("地址不可空白");
			}
			if(personInCharge==null||personInCharge.trim().length()==0) {
				errorMsgs.add("負責人不可空白");
			}
			if(telephoneNumber==null||telephoneNumber.trim().length()==0) {
				errorMsgs.add("電話不可空白");
			}else if(!telephoneNumber.trim().matches(reg)) {
				errorMsgs.add("電話格式不對");
			}
			
			if(!errorMsgs.isEmpty()) {
				PublishingHouseVO phVO=new PublishingHouseVO();
				phVO.setPublishingHouseNumber(publishingHouseNumber);
				phVO.setAddress(address);
				phVO.setName(name);
				phVO.setPersonInCharge(personInCharge);
				phVO.setTelephoneNumber(telephoneNumber);
				req.setAttribute("phVO", phVO);
				RequestDispatcher failureView=req.getRequestDispatcher("/back-end/publishingHouse/updatePublishingHouse.jsp");
				failureView.forward(req, res);
				return; 
			}
			
			
			// ---提交修改---
			int result=phSce.updatePh(publishingHouseNumber, name, address, personInCharge, telephoneNumber);
			System.out.println(result);
			if(result==-1) {
				errorMsgs.add("修改失敗");
				
				PublishingHouseVO phVO=new PublishingHouseVO();
				phVO.setPublishingHouseNumber(publishingHouseNumber);
				phVO.setAddress(address);
				phVO.setName(name);
				phVO.setPersonInCharge(personInCharge);
				phVO.setTelephoneNumber(telephoneNumber);
				req.setAttribute("phVO", phVO);
				RequestDispatcher failureView=req.getRequestDispatcher("/back-end/publishingHouse/updatePublishingHouse.jsp");
				failureView.forward(req, res);
				return;
			}
			// ---轉交結果---
			if(result==1) {
				RequestDispatcher failureView=req.getRequestDispatcher("/back-end/publishingHouse/publishingHouse.jsp");
				failureView.forward(req, res);
				return;
			}
		}
		
		// ===新增請求===
		if("insert".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			// ---接受參數---
			String name=req.getParameter("name");
			String address=req.getParameter("address");
			String personInCharge=req.getParameter("personInCharge");
			String telephoneNumber=req.getParameter("telephoneNumber");
			String reg="^(09\\d{8}|0\\d{1,2}-?\\d{6,8}(?:-\\d{1,5})?)$";
			if(name==null||name.trim().length()==0) {
				errorMsgs.add("名字不可空白");
			}
			if(address==null||address.trim().length()==0) {
				errorMsgs.add("地址不可空白");
			}
			if(personInCharge==null||personInCharge.trim().length()==0) {
				errorMsgs.add("負責人不可空白");
			}
			if(telephoneNumber==null||telephoneNumber.trim().length()==0) {
				errorMsgs.add("電話不可空白");
			}else if(!telephoneNumber.trim().matches(reg)) {
				errorMsgs.add("電話格式不對");
			}
			
			if(!errorMsgs.isEmpty()) {
				PublishingHouseVO phVO=new PublishingHouseVO();
				phVO.setAddress(address);
				phVO.setName(name);
				phVO.setPersonInCharge(personInCharge);
				phVO.setTelephoneNumber(telephoneNumber);
				req.setAttribute("phVO", phVO);
				RequestDispatcher failureView=req.getRequestDispatcher("/back-end/publishingHouse/addPublishingHouse.jsp");
				failureView.forward(req, res);
				return; 
			}
			
			
			// ---提交新增---
			int result=phSce.addPh(name, address, personInCharge, telephoneNumber);
			
//			System.out.println(result);
			if(result==-1) {
				errorMsgs.add("修改失敗");
				
				PublishingHouseVO phVO=new PublishingHouseVO();
				phVO.setAddress(address);
				phVO.setName(name);
				phVO.setPersonInCharge(personInCharge);
				phVO.setTelephoneNumber(telephoneNumber);
				req.setAttribute("phVO", phVO);
				RequestDispatcher failureView=req.getRequestDispatcher("/back-end/publishingHouse/addPublishingHouse.jsp");
				failureView.forward(req, res);
				return;
			}
			// ---轉交結果---
			if(result==1) {
				RequestDispatcher failureView=req.getRequestDispatcher("/back-end/publishingHouse/publishingHouse.jsp");
				failureView.forward(req, res);
				return;
			}
		}
	}
}
