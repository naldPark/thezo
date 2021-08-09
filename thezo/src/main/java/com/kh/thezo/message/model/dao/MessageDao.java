package com.kh.thezo.message.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.member.model.vo.Member;
import com.kh.thezo.message.model.vo.Message;

//@author Jaewon.s

/**
 * @author Jaewon.Shin
 *
 */
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
	
	/** 보낸 쪽지 list 조회해오는 service	
	 * @param sqlSession
	 * @param memNo
	 * @return
	 */
	public ArrayList<Message> ajaxSelectSentMsgList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("messageMapper.ajaxSelectSentMsgList", memNo);	
	}

	/** 휴지통으로 이동시키는 dao
	 * @param sqlSession
	 * @param hm
	 * @return
	 */
	public int ajaxMoveToRB(SqlSessionTemplate sqlSession, HashMap<Object, Object> hm) {
		return sqlSession.update("messageMapper.ajaxMoveToRB", hm);
	}

	/** 휴지통으로 이동시킨 (받은) 쪽지리스트 조회해오는 dao
	 * @param sqlSession
	 * @param memNo
	 * @return
	 */
	public ArrayList<Message> ajaxSelectRcRbList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("messageMapper.ajaxSelectRcRbList", memNo);
	}

	/** 휴지통으로 이동시킨 (보낸) 쪽지리스트 조회해오는 dao
	 * @param sqlSession
	 * @param memNo
	 * @return
	 */
	public ArrayList<Message> ajaxSelectStRbList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("messageMapper.ajaxSelectStRbList", memNo);
	}

	/** 읽지 않은 쪽지 갯수 가져오는 dao
	 * @param sqlSession
	 * @param memNo
	 * @return
	 */
	public int ajaxCountUnreadedMsg(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("messageMapper.ajaxCountUnreadedMsg", memNo);
	}

	/** 메세지 상세보기 정보 뽑아오는 DAO들 ! 총 4개임 (로직처리를 동적sql로 뽑아서  받은쪽지, 보낸쪽지, 휴지통에있는 받은 쪽지, 휴지통에 있는 보낸쪽지)를 가져온다
	 * @param sqlSession
	 * @param hm
	 * @return
	 */
	public Message ajaxSelectDetailMsg(SqlSessionTemplate sqlSession, HashMap<String, Object> hm) {
		return sqlSession.selectOne("messageMapper.ajaxSelectDetailMsg", hm);
	}

	/** 휴지통에서 받은 쪽지를 복구하는 dao
	 * @param sqlSession
	 * @param hm
	 * @return
	 */
	public int ajaxRestoreToRc(SqlSessionTemplate sqlSession, HashMap<Object, Object> hm) {
		return sqlSession.update("messageMapper.ajaxRestoreToRc", hm);
	}

	/** 휴지통에서 보낸 쪽지를 복구하는 dao
	 * @param sqlSession
	 * @param hm
	 * @return
	 */
	public int ajaxRestoreToSt(SqlSessionTemplate sqlSession, HashMap<Object, Object> hm) {
		return sqlSession.update("messageMapper.ajaxRestoreToSt", hm);
	}

	/** 휴지통에서 받은 쪽지 영구 삭제 처리 (status 변경으로 )하는 dao
	 * @param sqlSession
	 * @param hm
	 * @return
	 */
	public int ajaxDeleteRcMsg(SqlSessionTemplate sqlSession, HashMap<Object, Object> hm) {
		return sqlSession.update("messageMapper.ajaxDeleteRcMsg", hm);
	}

	/** 휴지통에서 보낸 쪽지 영구 삭제 처리 (status 변경으로 )하는 dao
	 * @param sqlSession
	 * @param hm
	 * @return
	 */
	public int ajaxDeleteStMsg(SqlSessionTemplate sqlSession, HashMap<Object, Object> hm) {
		return sqlSession.update("messageMapper.ajaxDeleteStMsg", hm);
	}

	/** 받은 쪽지에서 오직 상세보기시만 read_status update하는 dao
	 * @param sqlSession
	 * @param hm
	 * @return
	 */
	public int ajaxUpdateReadStatusMsg(SqlSessionTemplate sqlSession, HashMap<String, Object> hm) {
		return sqlSession.update("messageMapper.ajaxUpdateReadStatusMsg", hm);
	}

	
	//-------------------------------------------------------------------------------------------------------------
	//-------------------------------------------------------------------------------------------------------------
	
	/** 특이한놈으로 신고임에도 Message객체에 값을 담아오는 것으로 단순히 신고목록만을 가져오는  dao
	 * @param sqlSession
	 * @param memNo
	 * @return
	 */
	/*public ArrayList<Message> ajaxselectReportList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("messageMapper.ajaxselectReportList", memNo);
	}*/
	// 정석적으로 Report VO로 받아와야하나.

	//-------------------------------------------------------------------------------
	/** 이름에 따른 전체 검색 결과 갯수 가져오는 dao
	 * @param sqlSession
	 * @return
	 */
	public int selectListCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("messageMapper.selectListCount", keyword);
	}
	
	/** 팝업창 이름(키워드)로  맴버 목록 검색 해오는 서비스 
	 * @param sqlSession
	 * @param keyword
	 * @return
	 */
	public ArrayList<Member> searchMemListByName(SqlSessionTemplate sqlSession, String keyword, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSession.selectList("messageMapper.searchMemListByName", keyword, rowBounds);
	}

	/** 부서에 따른 전체 검색 결과 갯수 가져오는 dao
	 * @param sqlSession
	 * @param keyword
	 * @return
	 */
	public int selectListCountByDept(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("messageMapper.selectListCountByDept", keyword);
	}

	/** 팝업창 이름(부서)로  맴버 목록 검색 해오는 서비스 
	 * @param sqlSession
	 * @param keyword
	 * @param pi
	 * @return
	 */
	public ArrayList<Member> searchMemListByDept(SqlSessionTemplate sqlSession, String keyword, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSession.selectList("messageMapper.searchMemListByDept", keyword, rowBounds);
	}

	/** 직급에 따른 전체 검색 결과 갯수 가져오는 dao
	 * @param sqlSession
	 * @param mapForCount
	 * @return
	 */
	public int selectListCountByRank(SqlSessionTemplate sqlSession, HashMap<Object, Object> mapForCount) {
		return sqlSession.selectOne("messageMapper.selectListCountByRank", mapForCount);
	}

	/** 팝업창 이름(직급)로  맴버 목록 검색 해오는 서비스 
	 * @param sqlSession
	 * @param mapForCount
	 * @param pi
	 * @return
	 */
	public ArrayList<Member> searchMemListByRank(SqlSessionTemplate sqlSession, HashMap<Object, Object> mapForCount, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSession.selectList("messageMapper.searchMemListByRank", mapForCount, rowBounds);
	}

	/** 쪽지 보내는 Dao
	 * @param sqlSession
	 * @param msgInfo
	 * @return
	 */
	public int insertMsg(SqlSessionTemplate sqlSession, HashMap<Object, Object> msgInfo) {
		return sqlSession.insert("messageMapper.insertMsg", msgInfo);
	}

	public HashMap<Object, Object> bringMemInfoByMsgNo(SqlSessionTemplate sqlSession, int msgNo) {
		return sqlSession.selectOne("messageMapper.bringMemInfoByMsgNo", msgNo);
	}


}
