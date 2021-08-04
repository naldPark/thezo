package com.kh.thezo.message.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.message.model.dao.MessageDao;
import com.kh.thezo.message.model.vo.Message;

//@author Jaewon.s

@Service
public class MessageServiceImpl implements MessageService{
	@Autowired 
	private MessageDao msgDao;	
	@Autowired 
	private SqlSessionTemplate sqlSession;

	
	/** 받은 쪽지 list 조회해오는 service
	 */
	@Override
	public ArrayList<Message> ajaxSelectReceiveMsgList(int memNo) {
		return msgDao.ajaxSelectReceiveMsgList(sqlSession, memNo) ;
	}


	/** 휴지통으로 이동시키는 service
	 */
	@Override
	public int ajaxMoveToRB(HashMap<Object, Object> hm) {
		return msgDao.ajaxMoveToRB(sqlSession, hm);
	}


	@Override
	public ArrayList<Message> ajaxSelectSentMsgList(int memNo) {
		return msgDao.ajaxSelectSentMsgList(sqlSession, memNo) ;
	}


	@Override
	public ArrayList<Message> ajaxSelectRcRbList(int memNo) {
		return msgDao.ajaxSelectRcRbList(sqlSession, memNo) ;
	}


	@Override
	public ArrayList<Message> ajaxSelectRcStList(int memNo) {
		return msgDao.ajaxSelectRcStList(sqlSession, memNo) ;
	}



	/**  특이한놈으로 신고임에도 Message객체에 값을 담아오는 것으로 단순히 신고목록만을 가져오는  service
	 */
	/*@Override
	public ArrayList<Message> ajaxselectReportList(int memNo) {
		return msgDao.ajaxselectReportList(sqlSession, memNo) ;
	}*/
	// 정석적으로 Report VO로 받아와야하나.

	

	/** 읽지 않은 쪽지 갯수 가져오는 서비스 
	 */
	@Override
	public int ajaxCountUnreadedMsg(int memNo) {
		return msgDao.ajaxCountUnreadedMsg(sqlSession, memNo);
	}


	/** 메세지 상세조회하는 서비스   (여기서 비즈니스 로직 처리를 해줘야한다! MsgType을 가지고!!! 
	 */
	@Override
	public Message ajaxSelectDetailMsg(HashMap<String, Object> hm) {
			return msgDao.ajaxSelectDetailMsg(sqlSession, hm); 
	}

	

}
