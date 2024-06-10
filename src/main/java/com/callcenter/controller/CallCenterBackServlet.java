package com.callcenter.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;
import org.json.JSONObject;

import com.callcenter.model.CallCenterService;
import com.callcenter.model.CallCenterVO;
import com.google.gson.Gson;

@WebServlet("/callcenterBack.do")
public class CallCenterBackServlet extends HttpServlet {
	/**
	 * 
	 */
    private final int ARBITARY_SIZE = 1048;
    
	private static final long serialVersionUID = 1L;

	private CallCenterService ccSce;

	public void init() throws ServletException {
		ccSce = new CallCenterService();
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String id = req.getParameter("id");
		req.setCharacterEncoding("UTF-8");
		CallCenterVO vo = ccSce.queryVoById(Integer.valueOf(id));
		if(vo.getAttachedFile() != null) {
			res.setContentType("text/plain");
			res.setHeader("Content-disposition", "attachment; filename="+vo.getFileName());
		
	        try(
	          InputStream in = new ByteArrayInputStream(vo.getAttachedFile());
	          OutputStream out = res.getOutputStream()) {
	            byte[] buffer = new byte[ARBITARY_SIZE];
	            int numBytesRead;
	            while ((numBytesRead = in.read(buffer)) > 0) {
	                out.write(buffer, 0, numBytesRead);
	            }
	       }
	    }
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		//客訴案件列表 跳轉頁面 到修改頁面
		if("getOne_For_Update".equals(action)) { //如果action的字串是getOne_For_Update相等就執行大括弧裡面的程式碼
			String ccVOId = req.getParameter("ccVOId");// 獲取請求參數 ccVOId
			CallCenterVO vo = ccSce.queryVoById(Integer.valueOf(ccVOId));//根據 ccVOId 從數據庫獲取對應的資料
			req.setAttribute("vo", vo);//將資料設置為請求屬性
			RequestDispatcher failureView = req.getRequestDispatcher("/back-end/callCenter/updateCallCenter.jsp");//轉發請求到 updateCallCenter.jsp
			failureView.forward(req, res);// 轉發請求和響應
			return;
		//客訴案件列表修改頁面按下【回覆客戶】按鈕,update CallCenterVO 且發送mail 
		}else if("update".equals(action)){
			String ccVOId = req.getParameter("ccVOId");
			String responseDescription = req.getParameter("responseDescription");
			ccSce.updateVoById(Integer.valueOf(ccVOId),responseDescription);
			ccSce.emailSend(Integer.valueOf(ccVOId));
			res.sendRedirect(req.getContextPath() + "/back-end/callCenter/callCenter.jsp");
		//客訴案件列表 前端按下【搜尋】按鈕後執行
		}else {
			String orderNumber = req.getParameter("orderNumber");
			Integer orderNumber_ = null ;
			if(orderNumber != null && !"".equals(orderNumber)) {
				orderNumber_ = Integer.valueOf(orderNumber);
			}
			String email = req.getParameter("email");
			String problemType = req.getParameter("problemType");
			List<CallCenterVO> list = ccSce.createQuery(orderNumber_, email, problemType);
			// ===轉交資料===
			req.setAttribute("list", list);
			RequestDispatcher failureView = req.getRequestDispatcher("/back-end/callCenter/callCenter.jsp");
			failureView.forward(req, res);
			return;
		}
		
	}
	
	
}
