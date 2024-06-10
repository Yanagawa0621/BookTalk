package com.callcenter.model;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import util.JavaMail;

public class CallCenterService {
	CallCenterDAO CallCenterDAO = new CallCenterDAO();

	public HashMap<String, String> save(CallCenterVO vo) {
		HashMap<String, String> mapMessage =new HashMap<String, String>();
		boolean isSave = CallCenterDAO.save(vo);
		if(isSave) {
			mapMessage.put("ok", "感謝您抽出寶貴的時間提供寶貴的回饋意見。");
		}else {
			mapMessage.put("fail", "訊息傳送失敗 請再試一次。");
		}
		return mapMessage;
	}
	

	public List<CallCenterVO> createQuery(Integer orderNumber,String email,String problemType) {
		return CallCenterDAO.createQuery(orderNumber, email, problemType);
		
	}
	
	public CallCenterVO queryVoById(Integer id) {
		return CallCenterDAO.queryVoById(id);
	}
	
	public boolean updateVoById(Integer id,String responseDescription) {
		CallCenterVO vo = CallCenterDAO.queryVoById(id);//透過PK去找DAO 
		vo.setResponseDescription(responseDescription);
		vo.setResponseAt(new Timestamp(new Date().getTime()));
		vo.setProcessStatus("1");
		return CallCenterDAO.save(vo);
	}
	
	@SuppressWarnings("unlikely-arg-type")
	public void emailSend(Integer id) {
		CallCenterVO vo = CallCenterDAO.queryVoById(id);//透過PK去找DAO 
		 StringBuffer sb = new StringBuffer();
		  sb.append("<h2>先生/女士 您好 : </h4> </br>");
		  sb.append("<h4>你所申訴的問題及回覆內容如下: </h4> </br>");
		  if(!"".equals(vo.getOrderNumber())){
			  sb.append("<h4>訂單編號:"+vo.getOrderNumber()+" </h4> </br>");
		  }
		  sb.append("<h4>發問類型:"+vo.getProblemTypeName()+" </h4> </br>");
		  sb.append("<h4 style='color: red;'>問題描述: </h4> </br>");
		  sb.append("<h4>"+vo.getProblemDescription() +"</h4> </br>");
		  sb.append("<h4 style='color: red;'>回應內容: </h4> </br>");
		  sb.append("<h4>"+vo.getResponseDescription() +"</h4> </br>");
		  
		  JavaMail.SendMail(vo.getEmail(),sb.toString());
	}
	
	
}