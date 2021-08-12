package com.kh.thezo.chatting.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.chatting.model.vo.ChatRoom;
import com.kh.thezo.chatting.model.vo.Colleague;

//@author Jaewon.s
@Repository 
public class ChattingDao {

	//public void InsertChatContent(SqlSessionTemplate sqlSession, HashMap<Object, Object> hm) {
		//if(sqlSession.insert("chattingMapper.InsertChatContent", hm)>0) {
		//	System.out.println("성공적으로 채팅 로그 기록했어");
		//}else {
		//	System.out.println("채팅 기록에 실패함 ");
		//}
	//	System.out.println(hm);
	//}
	
	
	//----------------------------------------------------------------------
	// ----------------------------부수적인 채팅 작업 -----------------------------

	/** 채팅 나의 동료 리스트 가져오는 controller 
	 * @param sqlSession
	 * @param memNo
	 * @return
	 */
	public ArrayList<Colleague> ajaxSelectColleagueList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("chattingMapper.ajaxSelectColleagueList", memNo);
	}

	/** 이미 동료로 추가되어있는지 확인하는 dao 
	 * @param sqlSession
	 * @param colleague
	 * @return
	 */
	public int ajaxCheckColleague(SqlSessionTemplate sqlSession, Colleague colleague) {
		return sqlSession.selectOne("chattingMapper.ajaxCheckColleague", colleague);
	}

	
	/** 친구 추가하는 dao
	 * @param sqlSession
	 * @param colleague
	 * @return
	 */
	public int ajaxAddColleague(SqlSessionTemplate sqlSession, Colleague colleague) {
		return sqlSession.insert("chattingMapper.ajaxAddColleague", colleague);
	}

	/** 동료창에서 동료 더블클릭시에 이미 채팅방이 존재하는지 확인하는 dao 
	 * @param sqlSession
	 * @param colleague
	 * @return
	 */
	public int ajaxCheckExistRoom(SqlSessionTemplate sqlSession, Colleague colleague) {
		String nullCheckRoomNo = sqlSession.selectOne("chattingMapper.ajaxCheckExistRoom", colleague); 
		if(nullCheckRoomNo == null) {
			return 0;
		}else {
			return Integer.parseInt(nullCheckRoomNo);
		}
	}

	/** 채팅방 만드는 Dao
	 * @param sqlSession
	 * @param colleague
	 * @return
	 */
	public int ajaxMakeRoom(SqlSessionTemplate sqlSession, Colleague colleague) {
		return sqlSession.insert("chattingMapper.ajaxMakeRoom", colleague);
	}

	/** 채팅방 만들어서 roomNo이 반환되면 이를 가지고 chat_connect만드는 Dao
	 * @param sqlSession
	 * @param colleague
	 * @return
	 */
	public int ajaxMakeChatConnect(SqlSessionTemplate sqlSession, Colleague colleague) {
		System.out.println(colleague);
		return sqlSession.insert("chattingMapper.ajaxMakeChatConnect", colleague);
	}

	/** 단체 채팅방에서 참여하지 않는 동료 목록 가져오는 Dao
	 * @param sqlSession
	 * @param colleague
	 * @return
	 */
	public ArrayList<Colleague> ajaxSelectExtraColleague(SqlSessionTemplate sqlSession, Colleague colleague) {
		return (ArrayList)sqlSession.selectList("chattingMapper.ajaxSelectExtraColleague", colleague);
	}

	/** 단체채팅방 이름 가져오는 dao
	 * @param sqlSession
	 * @param roomNo
	 * @return
	 */
	public String ajaxSelectGroupName(SqlSessionTemplate sqlSession, int roomNo) {
		return sqlSession.selectOne("chattingMapper.ajaxSelectGroupName", roomNo);
	}

	/** 단체 채팅방 이름 수정하는 Dao
	 * @param sqlSession
	 * @param chatroom
	 * @return
	 */
	public int ajaxModifyGroupName(SqlSessionTemplate sqlSession, ChatRoom chatroom) {
		return sqlSession.update("chattingMapper.ajaxModifyGroupName", chatroom);
	}

	/** 단체 채팅방을 chatroom을 만드는 Dao
	 * @param sqlSession
	 * @param hm
	 * @return
	 */
	public int ajaxMakeGroupRoom(SqlSessionTemplate sqlSession, HashMap<Object, Object> hm) {
		return sqlSession.insert("chattingMapper.ajaxMakeGroupRoom", hm);
	}

	/** 단채채팅방 ChatRoom이 만들어지고 나면 !! 후에 chat_connect에 해당 방에 초대된 사람들의 번로를 기준으로 insert시키는 dao
	 * @param sqlSession
	 * @param hm
	 * @return
	 */
	public int ajaxMakeGroupChatConnect(SqlSessionTemplate sqlSession, HashMap<Object, Object> hm) {
		return sqlSession.update("chattingMapper.ajaxMakeGroupChatConnect", hm);
	}


}
