package com.kh.thezo.message.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.member.model.vo.Member;
import com.kh.thezo.message.model.vo.Message;
import com.kh.thezo.message.model.vo.MsgReport;

//@author Jaewon.s
public interface MessageService {
	
	// 받은 쪽지 list 조회해오는 service
	ArrayList<Message> ajaxSelectReceiveMsgList(int memNo);

	// 보낸 쪽지 list 조회해오는 service	
	ArrayList<Message> ajaxSelectSentMsgList(int memNo);
	
	// 휴지통으로 이동 시키는 service
	int ajaxMoveToRB(HashMap<Object, Object> hm);
	
	// 휴지통으로 이동시킨 (받은) 쪽지리스트 조회해오는 service
	ArrayList<Message> ajaxSelectRcRbList(int memNo);

	// 휴지통으로 이동시킨 (보낸) 쪽지리스트 조회해오는 service
	ArrayList<Message> ajaxSelectStRbList(int memNo);
	
	// 읽지 않은 쪽지 갯수 가져오는 서비스 
	int ajaxCountUnreadedMsg(int memNo);

	// 메세지 상세조회하는 서비스 
	Message ajaxSelectDetailMsg(HashMap<String, Object> hm);
	
	// 휴지통에 있는 쪽지들 복구하는 서비스 
	int ajaxRestoreToRcSt(HashMap<Object, Object> hm);
	
	// 휴지통에있는 쪽지들 영구 삭제 서비스
	int ajaxDeleteMsg(HashMap<Object, Object> hm);
	
	// 이름에 따른 전체 검색 결과 갯수 가져오는 서비스
	int selectListCount(String keyword);
	
	// 팝업창 이름으로 맴버 검색 서비스
	ArrayList<Member> searchMemListByName(String keyword, PageInfo pi);		

	
	// 부서에 따른 전체 검색 결과 갯수 가져오는 서비스
	int selectListCountByDept(String keyword);

	// 팝업창 부서로 맴버 검색 서비스
	ArrayList<Member> searchMemListByDept(String keyword, PageInfo pi);		

	// 직급에 따른 전체 검색 결과 갯수 가져오는 서비스
	int selectListCountByRank(HashMap<Object, Object> mapForCount);

	// 팝업창 직급으로 맴버 검색 서비스
	ArrayList<Member> searchMemListByRank(HashMap<Object, Object> mapForCount, PageInfo pi);		

	// 쪽지 보내는 서비스 
	int insertMsg(HashMap<Object, Object> msgInfo);
	
	// 쪽지 번호로 쪽지 보낸사람의 정보를 자져오는 서비스 
	HashMap<Object, Object> bringMemInfoByMsgNo(int msgNo);
	
	//--------------------------------------------------------------------------------------
	//-------------------------- 쪽지 신고 관련 -------------------------------------------------
	// 쪽지 신고 접수 서비스 
	int insertMsgReport(MsgReport mr);
	
	// 내가 신고한 쪽지 목록 조회하는 서비스 
	ArrayList<MsgReport> ajaxselectReportList(int memNo);	
	
	// msgReportNo을 가지고 신고 상세조회하는 서비스 
	MsgReport ajaxSelectReport(int msgReportNo);		

	// 쪽지 신고철회하는 서비스
	int ajaxWithdrawalReport(int msgReportNo);		

	
}


