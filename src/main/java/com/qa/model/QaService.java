package com.qa.model;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.callcenter.model.CallCenterVO;


public class QaService {
	QaDAO qaDAO = new QaDAO();
	
	public List<QaVO> getAll() {
		List<QaVO> vo = qaDAO.getAll() ;
		return vo;
 	}
	
	public List<QaVO> createQuery(Integer questionNo,String question,String way) {
		return qaDAO.createQuery(questionNo, question, way);
		
	}
	
	
	public QaVO queryVoById(Integer questionNo) {
		return qaDAO.queryVoById(questionNo);
	}

	public boolean updateVoById(Integer questionNo,String question,String answer) {
		QaVO vo = qaDAO.queryVoById(questionNo);//透過PK去找DAO 
		vo.setQuestionNo(questionNo);
		vo.setQuestion(question);
		vo.setAnswer(answer);
		return qaDAO.save(vo);
	}
	
	
	public void updateQa(QaVO qaVO) {
		// TODO Auto-generated method stub
		qaDAO.update(qaVO);
	}
	
	public boolean addQa(Integer questionNo, String question, String answer,String way) {
        /*// 創建一個新的 QaVO 物件
        QaVO qaVO = new QaVO();
        qaVO.setQuestionNo(questionNo);
        qaVO.setQuestion(question);
        qaVO.setAnswer(answer);
        qaVO.setWay(way);
        // 調用 QaDAO 的方法將新建的 QaVO 物件新增到資料庫
        return qaDAO.save(qaVO);*/
        QaVO vo = qaDAO.findById(questionNo);
        if (vo != null) {
            vo.setQuestion(question);
            vo.setAnswer(answer);
            vo.setWay(way);
            vo.setCreateDate(new Timestamp(new Date().getTime()));
            qaDAO.update(vo);
            return true;
        }
        return false;
    }
	
	public boolean addVoById(Integer questionNo,String question,String answer,String way) {
		QaVO vo = new QaVO();
		vo.setQuestionNo(questionNo);
		vo.setQuestion(question);
		vo.setAnswer(answer);
		vo.setWay(way);
		vo.setCreateDate(new Timestamp(new Date().getTime()));
		return qaDAO.save(vo);
	}
	
}