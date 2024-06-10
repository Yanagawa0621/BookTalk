package com.callcenter.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.sql.Timestamp;    
import java.util.Date;    
import org.apache.commons.io.IOUtils;
import org.json.JSONObject;

import com.callcenter.model.CallCenterService;
import com.callcenter.model.CallCenterVO;
import com.google.gson.Gson;

@WebServlet("/callcenter.do")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*10)   // 10MB
public class CallCenterServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private CallCenterService ccSce;

	public void init() throws ServletException {
		//System.out.println("intoCallCenter init");
		ccSce = new CallCenterService();
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//System.out.println("intoCallCenter doGet");
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		   
		   req.setCharacterEncoding("UTF-8");	
		   HashMap<String, String> mapMessage =new HashMap<String, String>();
    	   JSONObject json = null ;
		   //前端提供的資料
		   String orderNumber = req.getParameter("orderNumber"); 
		   String problemType = req.getParameter("problemType");
		   String problemDescription = req.getParameter("problemDescription");
		   String email = req.getParameter("email");
	       Part part = req.getPart("attachedFile");
	       
	       InputStream is = part.getInputStream();
	       byte[] bytes = IOUtils.toByteArray(is);
	       String fileName = getFileName(part);
	       
	       //前端提供資料，需做資料驗證檢核
	       mapMessage = this.voValidation(mapMessage,orderNumber,problemDescription,email,bytes,fileName);
	       //若前端提供資料驗證失敗,回傳json錯誤訊息給前端
	       if(mapMessage != null) {
	    	   json = new JSONObject(mapMessage);
	       }else {
		       //建立VO提供給service
		       CallCenterVO vo = new CallCenterVO();
		       if(!"".equals(orderNumber)) {
		    	   vo.setOrderNumber(Integer.valueOf(orderNumber) );
		       }
		       vo.setProblemType(problemType);
		       vo.setProblemDescription(problemDescription);
		       vo.setEmail(email);
		       vo.setAttachedFile(bytes);
		       vo.setProcessStatus("0");
		       vo.setCreatedAt(new Timestamp(new Date().getTime()));
		       vo.setFileName(fileName);
		       //呼叫service=>Dao=>將資料寫入至table callcenter
		       mapMessage = ccSce.save(vo);
		       //寫入table狀況(成功/失敗)回傳Json物件給前端
	    	   json = new JSONObject(mapMessage);
	       }
	      // System.out.println(json);
		   res.setContentType("application/json");
	       res.setCharacterEncoding("UTF-8");
           res.getWriter().println(json);
	}
	
	private HashMap<String, String> voValidation(HashMap<String, String> mapMessage ,String orderNumber,
			String problemDescription,String email,byte[] bytes,String fileName) {
       if(!"".equals(orderNumber)) {
	       Pattern pattern = Pattern.compile("[0-9]*");
	       Matcher number = pattern.matcher(orderNumber);
	       if (!number.matches()) {
	    	   mapMessage.put("fail", "【訂單編號】請輸入數字！");
			   return mapMessage ;
	       }
       }
       if("".equals(problemDescription)) {
    	   mapMessage.put("fail", "【我的問題】不得為空");
		   return mapMessage ;
       }
       
       if(bytes != null && !"".equals(fileName) && bytes.length >= 1024*1024*2) {
    	   mapMessage.put("fail", "【附加檔案(Attached file)】不得大於2MB");
    	   return mapMessage ;
       }
	   return null ;
	}
	
	private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "";
    }
}
