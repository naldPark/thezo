package com.kh.thezo.message.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.member.model.vo.Member;
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

	/** 보낸 쪽지 list 조회해오는 service
	 */
	@Override
	public ArrayList<Message> ajaxSelectSentMsgList(int memNo) {
		return msgDao.ajaxSelectSentMsgList(sqlSession, memNo) ;
	}
	
	/** 휴지통으로 이동시키는 service
	 */
	@Override
	public int ajaxMoveToRB(HashMap<Object, Object> hm) {
		return msgDao.ajaxMoveToRB(sqlSession, hm);
	}

	/** 휴지통으로 이동시킨 (받은) 쪽지리스트 조회해오는 service
	 */
	@Override
	public ArrayList<Message> ajaxSelectRcRbList(int memNo) {
		return msgDao.ajaxSelectRcRbList(sqlSession, memNo) ;
	}

	/** 휴지통으로 이동시킨 (보낸) 쪽지리스트 조회해오는 service
	 */
	@Override
	public ArrayList<Message> ajaxSelectStRbList(int memNo) {
		return msgDao.ajaxSelectStRbList(sqlSession, memNo) ;
	}

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
			//읽음 처리를 해줘야한다. 
			// 여기서 읽음 처리해주는것 해줘야한다! 
		    if(hm.get("msgType").equals("r")) {
		    	msgDao.ajaxUpdateReadStatusMsg(sqlSession, hm);
	    		return msgDao.ajaxSelectDetailMsg(sqlSession, hm); 		    		
		    }else {
	    		return msgDao.ajaxSelectDetailMsg(sqlSession, hm); 		    		
		    }
	}

	/**	 휴지통에 있는 쪽지들 복구하는 서비스 
	 */
	@Override
	public int ajaxRestoreToRcSt(HashMap<Object, Object> hm) {
		// 여기서!! 비즈니스 로직을 처리해야한다. 
		if(hm.get("rcMultiMsgNo") != null && hm.get("stMultiMsgNo") != null) {//둘다 넘겼을때 ! 
			if(msgDao.ajaxRestoreToRc(sqlSession,hm) > 0) {
				return msgDao.ajaxRestoreToSt(sqlSession,hm); 
			}else {
				return 0;
			}
		}else if(hm.get("rcMultiMsgNo") != null && hm.get("stMultiMsgNo") == null){ // 받은쪽지만 넘기고 보낸쪽지는 안넘겼을때
			return msgDao.ajaxRestoreToRc(sqlSession,hm);
		}else if(hm.get("rcMultiMsgNo") == null && hm.get("stMultiMsgNo") != null){ // 받은쪽지만 안넘기고 보낸쪽지는 넘겼을때
			return msgDao.ajaxRestoreToSt(sqlSession,hm);
		}else {
			return 0; // 화면단에서 해당 경우에수는 막았지만 혹시모를 오류를 방지하기 위함 
		}
	}

	/** 휴지통에있는 쪽지들 영구 삭제 서비스
	 */
	@Override
	public int ajaxDeleteMsg(HashMap<Object, Object> hm) {
		if(hm.get("rcMultiMsgNo") != null && hm.get("stMultiMsgNo") != null) {//둘다 넘겼을때 ! 
			if(msgDao.ajaxDeleteRcMsg(sqlSession,hm) > 0) {
				return msgDao.ajaxDeleteStMsg(sqlSession,hm); 
			}else {
				return 0;
			}
		}else if(hm.get("rcMultiMsgNo") != null && hm.get("stMultiMsgNo") == null){ // 받은쪽지만 넘기고 보낸쪽지는 안넘겼을때
			return msgDao.ajaxDeleteRcMsg(sqlSession,hm);
		}else if(hm.get("rcMultiMsgNo") == null && hm.get("stMultiMsgNo") != null){ // 받은쪽지만 안넘기고 보낸쪽지는 넘겼을때
			return msgDao.ajaxDeleteStMsg(sqlSession,hm);
		}else {
			return 0; // 화면단에서 해당 경우에수는 막았지만 혹시모를 오류를 방지하기 위함 
		}
	}


	
	//-------------------------------------------------------------------------------------------------------------
	//-------------------------------------------------------------------------------------------------------------
	
	
	/**  특이한놈으로 신고임에도 Message객체에 값을 담아오는 것으로 단순히 신고목록만을 가져오는  service
	 */
	/*@Override
	public ArrayList<Message> ajaxselectReportList(int memNo) {
		return msgDao.ajaxselectReportList(sqlSession, memNo) ;
	}*/
	// 정석적으로 Report VO로 받아와야하나.
	
	/**	 이름에 따른 전체 검색 결과 갯수 가져오는 서비스
	 */
	@Override
	public int selectListCount(String keyword) {
		return msgDao.selectListCount(sqlSession, keyword);
	}
	
	/** 팝업창 이름(키워드)로  맴버 목록 검색 해오는 서비스 
	 */
	@Override
	public ArrayList<Member> searchMemListByName(String keyword, PageInfo pi) {
		return msgDao.searchMemListByName(sqlSession, keyword, pi);
	}

	/** 부서에 따른 전체 검색 결과 갯수 가져오는 서비스
	 */
	@Override
	public int selectListCountByDept(String keyword) {
		return msgDao.selectListCountByDept(sqlSession, keyword);
	}

	/** 팝업창 이름(부서명)으로  맴버 목록 검색 해오는 서비스 
	 */
	@Override
	public ArrayList<Member> searchMemListByDept(String keyword, PageInfo pi) {
		return msgDao.searchMemListByDept(sqlSession, keyword, pi);
	}

	/** 직급에 따른 전체 검색 결과 갯수 가져오는 서비스
	 */
	@Override
	public int selectListCountByRank(HashMap<Object, Object> mapForCount) {
		return msgDao.selectListCountByRank(sqlSession, mapForCount);
	}

	/** 팝업창 이름(부서명과 직급)으로  맴버 목록 검색 해오는 서비스 
	 */
	@Override
	public ArrayList<Member> searchMemListByRank(HashMap<Object, Object> mapForCount, PageInfo pi) {
		return msgDao.searchMemListByRank(sqlSession, mapForCount, pi);
	}

	/** 쪽지 보내는 서비스 
	 */
	@Override
	public int insertMsg(HashMap<Object, Object> msgInfo) {
		return msgDao.insertMsg(sqlSession, msgInfo);
	}

	/** 쪽지 번호로 쪽지 보낸사람의 정보를 자져오는 서비스 
	 */
	@Override
	public HashMap<Object, Object> bringMemInfoByMsgNo(int msgNo) {
		return msgDao.bringMemInfoByMsgNo(sqlSession, msgNo);
	}



	

}
