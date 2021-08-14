package com.kh.thezo.chatting.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.thezo.chatting.model.vo.ChatConnect;
import com.kh.thezo.chatting.model.vo.ChatDailyBasic;
import com.kh.thezo.chatting.model.vo.ChatLog;
import com.kh.thezo.chatting.model.vo.ChatRoom;
import com.kh.thezo.chatting.model.vo.Colleague;

//@author Jaewon.s
public interface ChattingService {

	// 채팅 나의 동료 리스트 가져오는 서비스 
	ArrayList<Colleague> ajaxSelectColleagueList(int memNo);

	// 이미 동료로 추가되어있는지 확인하는 서비스 
	int ajaxCheckColleague(Colleague colleague);

	// 동료 추가 서비스
	int ajaxAddColleague(Colleague colleague);
	
	// 동료창에서 동료 더블클릭시에 이미 채팅방이 존재하는지 확인하는 서비스 
	int ajaxCheckExistRoom(Colleague colleague);

	// 채팅방 만들어주고 또한 chat_connect까지 만들어주는 서비스
	int ajaxMakeRoomAndChatConnect(Colleague colleague);

	// 단체 채팅방에서 참여하지 않는 동료 목록 가져오는 서비스 
	ArrayList<Colleague> ajaxSelectExtraColleague(Colleague colleague);

	// 단체채팅방 이름 가져오는 서비스
	String ajaxSelectGroupName(int roomNo);

	// 단체 채팅방 이름 수정하는 서비스 
	int ajaxModifyGroupName(ChatRoom chatroom);

	// 단체 채팅방 만드는 Controller (서비스단에서 chat_connect까지 생성)
	int ajaxCreateGroupChat(HashMap<Object, Object> hm);

	// 나의 채팅방 목록 조회해오는 서비스
	ArrayList<ChatRoom> ajaxSelectMyChatList(int myMemNo);

	// 채팅방 머리부 정보 가져오는 서비스 
	ArrayList<ChatRoom> ajaxBringRoomHeaderList(ChatLog memAndRoomNo);

	// 채팅 목록들을 일단위로 has many형태로 가져오는 서비스 
	ArrayList<ChatDailyBasic> ajaxbringChatInfoList(int roomNo);

	// 단체 채팅방에서 동료를 추가하는 서비스
	int ajaxAddGroupChat(HashMap<Object, Object> hm);
	
	//----------------------------------------------------------------------
	//----------------------------------------------------------------------
	// 체팅 내용 넣는 서비스이다. 단순하게 채팅로그 insert시켜버리는 서비스
	//void InsertChatContent(HashMap<Object, Object> hm);

	

}
