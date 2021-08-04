package com.kh.thezo.message.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.thezo.message.model.vo.Message;

//@author Jaewon.s
public interface MessageService {
	
	// 받은 쪽지 list 조회해오는 service
	ArrayList<Message> ajaxSelectReceiveMsgList(int memNo);

	// 휴지통으로 이동 시키는 service
	int ajaxMoveToRB(HashMap<Object, Object> hm);
	
	// 받은 쪽지 list 조회해오는 service
	ArrayList<Message> ajaxSelectSentMsgList(int memNo);

	
	// 휴지통으로 이동시킨 (받은) 쪽지리스트 조회해오는 service
	ArrayList<Message> ajaxSelectRcRbList(int memNo);

	// 휴지통으로 이동시킨 (보낸) 쪽지리스트 조회해오는 service
	ArrayList<Message> ajaxSelectRcStList(int memNo);
	
	// 특이한놈으로 신고임에도 Message객체에 값을 담아오는 것으로 단순히 신고목록만을 가져오는  service
	//ArrayList<Message> ajaxselectReportList(int memNo);
	// 정석적으로 Report VO로 받아와야한다.
	
	// 읽지 않은 쪽지 갯수 가져오는 서비스 
	int ajaxCountUnreadedMsg(int memNo);
	
}
