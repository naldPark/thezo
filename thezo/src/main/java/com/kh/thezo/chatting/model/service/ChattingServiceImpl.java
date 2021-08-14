package com.kh.thezo.chatting.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.chatting.model.dao.ChattingDao;
import com.kh.thezo.chatting.model.vo.ChatConnect;
import com.kh.thezo.chatting.model.vo.ChatDailyBasic;
import com.kh.thezo.chatting.model.vo.ChatLog;
import com.kh.thezo.chatting.model.vo.ChatRoom;
import com.kh.thezo.chatting.model.vo.Colleague;

//@author Jaewon.s

@Service
public class ChattingServiceImpl implements ChattingService{
	@Autowired 
	private ChattingDao chatDao;	
	@Autowired 
	private SqlSessionTemplate sqlSession;

	/** 채팅 나의 동료 리스트 가져오는 서비스 
	 */
	@Override
	public ArrayList<Colleague> ajaxSelectColleagueList(int memNo) {
		return chatDao.ajaxSelectColleagueList(sqlSession, memNo) ;
	}

	/** 이미 동료로 추가되어있는지 확인하는 서비스 
	 */
	@Override
	public int ajaxCheckColleague(Colleague colleague) {
		return chatDao.ajaxCheckColleague(sqlSession, colleague) ;
	}

	/** 동료 추가하는 서비스
	 */
	@Override
	public int ajaxAddColleague(Colleague colleague) {
		return chatDao.ajaxAddColleague(sqlSession, colleague) ;
	}

	/** 동료창에서 동료 더블클릭시에 이미 채팅방이 존재하는지 확인하는 서비스 
	 */
	@Override
	public int ajaxCheckExistRoom(Colleague colleague) {
		return chatDao.ajaxCheckExistRoom(sqlSession, colleague) ;
	}

	/** 채팅방 만들어주고 또한 chat_connect까지 만들어주는 서비스
	 */
	@Override
	public int ajaxMakeRoomAndChatConnect(Colleague colleague) {
		// 비즈니스 로직 짜는 구간 이다.  (여기서 selectKey쓴다.)
		if(chatDao.ajaxMakeRoom(sqlSession, colleague) > 0) {
			// 로직처리하고 selectKey로다가 colleageu에 roomNo에 담아서 다시가져왔다.  
			// 이제 2개의 행을 Chat_connect에 insert해줘야한다
			if(chatDao.ajaxMakeChatConnect(sqlSession, colleague) > 0) {
				return colleague.getRoomNo();
			}else {
				return 0;
			}
		}else {// 존재하지 않을때 
			return 0;
		}
	}

	/** 단체 채팅방에서 참여하지 않는 동료 목록 가져오는 서비스 
	 */
	@Override
	public ArrayList<Colleague> ajaxSelectExtraColleague(Colleague colleague) {
		return chatDao.ajaxSelectExtraColleague(sqlSession, colleague) ;
	}

	/** 단체채팅방 이름 가져오는 서비스
	 */
	@Override
	public String ajaxSelectGroupName(int roomNo) {
		return chatDao.ajaxSelectGroupName(sqlSession, roomNo) ;
	}

	/** 단체 채팅방 이름 수정하는 서비스 
	 */
	@Override
	public int ajaxModifyGroupName(ChatRoom chatroom) {
		return chatDao.ajaxModifyGroupName(sqlSession, chatroom) ;
	}

	/** 단체 채팅방 만드는 Controller (서비스단에서 chat_connect까지 생성)
	 */
	@Override
	public int ajaxCreateGroupChat(HashMap<Object, Object> hm) {
		if(chatDao.ajaxMakeGroupRoom(sqlSession, hm) > 0) {
			// 일부러 HashMap에 roomNo키값으로 빈문자열을 담아뒀다.   
			 //System.out.println((hm.get("roomNo").get("CURRVAL"));
			if(chatDao.ajaxMakeGroupChatConnect(sqlSession, hm) > 0) {
				return (int)hm.get("roomNo");
			}else {
				return 0;
			}
		}else {// 존재하지 않을때 
			return 0;
		}
	}

	/** 단체 채팅방에서 동료를 추가하는 서비스
	 */
	@Override
	public int ajaxAddGroupChat(HashMap<Object, Object> hm) {
		return chatDao.ajaxAddGroupChat(sqlSession, hm);
	}

	/** 나의 채팅방 목록 조회해오는 서비스
	 */
	@Override
	public ArrayList<ChatRoom> ajaxSelectMyChatList(int myMemNo) {
		return chatDao.ajaxSelectMyChatList(sqlSession, myMemNo);
	}

	/** 채팅방 머리부 정보 가져오는 서비스 
	 */
	@Override
	public ArrayList<ChatRoom> ajaxBringRoomHeaderList(ChatLog memAndRoomNo) {
		return chatDao.ajaxBringRoomHeaderList(sqlSession, memAndRoomNo);
	}

	/** 채팅 목록들을 일단위로 has many형태로 가져오는 서비스 
	 */
	@Override
	public ArrayList<ChatDailyBasic> ajaxbringChatInfoList(int roomNo) {
		return chatDao.ajaxbringChatInfoList(sqlSession, roomNo);
	}

	//----------------------------------------------------------------------
	// ----------------------------------------------------------------------
	/** 단순하게 채팅로그 insert시켜버리는 서비스
	 */
	//@Override
	//public void InsertChatContent(HashMap<Object, Object> hm) {
	//	chatDao.InsertChatContent(sqlSession, hm) ;
	//}

	


}
