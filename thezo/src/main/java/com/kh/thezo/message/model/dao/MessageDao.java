package com.kh.thezo.message.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.message.model.vo.Message;

//@author Jaewon.s

@Repository //DB와 접근하는 클래스이다! 
public class MessageDao {

	/** 받은 쪽지 list 조회해오는 dao
	 * @param sqlSession
	 * @param memNo
	 * @return
	 */
	public ArrayList<Message> ajaxSelectReceiveMsgList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("messageMapper.ajaxSelectReceiveMsgList", memNo);
	}

	
	/** 휴지통으로 이동시키는 dao
	 * @param sqlSession
	 * @param hm
	 * @return
	 */
	public int ajaxMoveToRB(SqlSessionTemplate sqlSession, HashMap<Object, Object> hm) {
		return sqlSession.update("messageMapper.ajaxMoveToRB", hm);
	}


	public ArrayList<Message> ajaxSelectSentMsgList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("messageMapper.ajaxSelectSentMsgList", memNo);	
	}


	public ArrayList<Message> ajaxSelectRcRbList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("messageMapper.ajaxSelectRcRbList", memNo);
	}


	public ArrayList<Message> ajaxSelectRcStList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("messageMapper.ajaxSelectRcStList", memNo);
	}


	/** 특이한놈으로 신고임에도 Message객체에 값을 담아오는 것으로 단순히 신고목록만을 가져오는  dao
	 * @param sqlSession
	 * @param memNo
	 * @return
	 */
	/*public ArrayList<Message> ajaxselectReportList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("messageMapper.ajaxselectReportList", memNo);
	}*/
	// 정석적으로 Report VO로 받아와야하나.

	
	
	/** 읽지 않은 쪽지 갯수 가져오는 dao
	 * @param sqlSession
	 * @param memNo
	 * @return
	 */
	public int ajaxCountUnreadedMsg(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("messageMapper.ajaxCountUnreadedMsg", memNo);
	}

}
