package com.callcenter.model;

import java.util.HashMap;

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
}