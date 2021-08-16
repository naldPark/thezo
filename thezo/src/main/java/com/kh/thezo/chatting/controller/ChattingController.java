package com.kh.thezo.chatting.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.thezo.chatting.model.service.ChattingService;
import com.kh.thezo.chatting.model.vo.ChatDailyBasic;
import com.kh.thezo.chatting.model.vo.ChatLog;
import com.kh.thezo.chatting.model.vo.ChatRoom;
import com.kh.thezo.chatting.model.vo.Colleague;

@Controller
public class ChattingController {
	@Autowired
	private ChattingService chatService;
	// 위는 기본 세팅 

	/** 친구 추가하는 popUp창 여는 Controller 
	 * @param mv
	 * @return
	 */
	@RequestMapping("searchCol.me")
	public ModelAndView searchMemberWidow(ModelAndView mv) {
		mv.setViewName("common/jwColleagueSearch");
		return mv;
	}
	
	/** 채팅에서 나의 동료 리스트 불러 오는 Controller (채팅방번호 또한 가져와야한다.)
	 * @param memNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selsectCoList.cht", produces="application/json; charset=utf-8")
	public String ajaxSelectColleagueList(int memNo){
		ArrayList<Colleague> list = chatService.ajaxSelectColleagueList(memNo);	
	    return new Gson().toJson(list);
	}
	
	/** 이미 동료로 추가가 되어있는지 확인하는 controller 
	 * @param myMemNo
	 * @param coMemNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="checkColleague.cht", produces="application/json; charset=utf-8")
	public String ajaxCheckColleague(int myMemNo, int coMemNo){
		Colleague colleague = new Colleague();
		colleague.setMyMemNo(myMemNo);
		colleague.setCoMemNo(coMemNo);
		int result = chatService.ajaxCheckColleague(colleague);
		    return new Gson().toJson(result);
	}
	
	/** 동료 추가 Controller
	 * @param myMemNo
	 * @param coMemNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="addColleague.cht", produces="application/json; charset=utf-8")
	public String ajaxAddColleague(int myMemNo, int coMemNo){
		Colleague colleague = new Colleague();
		colleague.setMyMemNo(myMemNo);
		colleague.setCoMemNo(coMemNo);
		int result = chatService.ajaxAddColleague(colleague);
		    return new Gson().toJson(result);
	}
	
	/** 동료창에서 동료 더블클릭시에 이미 채팅방이 존재하는지 확인하는 Controller
	 * @param myMemNo
	 * @param coMemNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="checkExistRoom.cht", produces="application/json; charset=utf-8")
	public String ajaxCheckExistRoom(int myMemNo, int coMemNo){
		Colleague colleague = new Colleague();
		colleague.setMyMemNo(myMemNo);
		colleague.setCoMemNo(coMemNo);
		int result = chatService.ajaxCheckExistRoom(colleague);
		    return new Gson().toJson(result);
	}
	
	/** 1차 유효성 검사후에 채팅방이 존재하지 않는다면 !!! 채팅방 만들어주고 또한 chat_connect까지 만들어주는 Controller
	 * @param myMemNo
	 * @param coMemNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="makeRoomAndChatConnect.cht", produces="application/json; charset=utf-8")
	public String ajaxMakeRoomAndChatConnect(int myMemNo, int coMemNo){
		Colleague colleague = new Colleague();
		colleague.setMyMemNo(myMemNo);
		colleague.setCoMemNo(coMemNo);
		int result = chatService.ajaxMakeRoomAndChatConnect(colleague);
		    return new Gson().toJson(result);
	}
	
	
	/** 단채 채팅방에서 참여하지 않는 동료 목록 가져오는 Controller 
	 * @param memNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="showExtraColleague.cht", produces="application/json; charset=utf-8")
	public String ajaxSelectExtraColleague(int memNo ,int roomNo){
		Colleague colleague = new Colleague();
		colleague.setMyMemNo(memNo);
		colleague.setRoomNo(roomNo);
		ArrayList<Colleague> list = chatService.ajaxSelectExtraColleague(colleague);	
	    return new Gson().toJson(list);
	}

	/** 단체채팅방 이름 가져오는 controller
	 * @param memNo
	 * @param roomNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="bringGroupRoomName.cht", produces="application/json; charset=utf-8")
	public String ajaxSelectGroupName(int roomNo){
		String list = chatService.ajaxSelectGroupName(roomNo);	
	    return new Gson().toJson(list);
	}
	
	/** 단체 채팅방 이름 수정하는 Controller 
	 * @param roomNo
	 * @param roomName
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="modifyGroupRoomName.cht", produces="application/json; charset=utf-8")
	public String ajaxModifyGroupName(int roomNo, String roomName){
		ChatRoom chatroom = new ChatRoom();
		chatroom.setRoomNo(roomNo);
		chatroom.setRoomName(roomName);
		int result = chatService.ajaxModifyGroupName(chatroom);	
	    return new Gson().toJson(result);
	}

	/** 단체 채팅방 만드는 Controller (서비스단에서 chat_connect까지 생성)
	 * @param newGroupMemMultiVal
	 * @param roomName
	 * @param myMemNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="createGroupRoom.cht", produces="application/json; charset=utf-8")
	public String ajaxCreateGroupChat(int[] newGroupMemMultiVal, String roomName, int myMemNo) {
		HashMap<Object, Object> hm = new HashMap<Object, Object>();
		hm.put("newGroupMemMultiVal",  newGroupMemMultiVal);
		hm.put("roomName",  roomName);
		hm.put("myMemNo", myMemNo);
		hm.put("roomNo", "");
		//System.out.println(hm);
		int roomNo = chatService.ajaxCreateGroupChat(hm);
		//System.out.println("방번호가 넘어와야해 " + result);
		if(roomNo > 0) {
			return new Gson().toJson(roomNo);			
		}else {
			return new Gson().toJson(0);						
		}
	}
	
	/** 단체 채팅방에서 동료를 추가하는 controller 
	 * @param addGroupMemMultiVal
	 * @param roomNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="addGroupRoom.cht", produces="application/json; charset=utf-8")
	public String ajaxAddGroupChat(int[] addGroupMemMultiVal, int roomNo) {
		HashMap<Object, Object> hm = new HashMap<Object, Object>();
		hm.put("addGroupMemMultiVal",  addGroupMemMultiVal);
		hm.put("roomNo",  roomNo);
		int result = chatService.ajaxAddGroupChat(hm);
		if(result > 0) {
			return new Gson().toJson("선택하신 동료(들)을 단체채팅방에 초대하였습니다.");			
		}else {
			return new Gson().toJson("단체 채팅방 동료 초대에 실패하였습니다. \n개발자에게 문의해주세요");						
		}
	}
	
	/** 나의 채팅방 목록 조회해오는 Controller
	 * @param myMemNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="chatList.cht", produces="application/json; charset=utf-8")
	public String ajaxSelectMyChatList(int myMemNo){
		ArrayList<ChatRoom> list = chatService.ajaxSelectMyChatList(myMemNo);	
		//System.out.println(list);
	    return new Gson().toJson(list);
	}
	
	/** 채팅방 header 정보 가져오는 controller 
	 * @param myMemNo
	 * @param roomNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="bringRoomHeader.cht", produces="application/json; charset=utf-8")
	public String ajaxBringRoomHeaderList(int myMemNo, int roomNo, HttpSession session){
		session.setAttribute("roomNo", roomNo); // 방에 접속했다는 의미
		//System.out.println("Session에 담은값" + session.getAttribute("roomNo"));

		ChatLog memAndRoomNo = new ChatLog();
		memAndRoomNo.setMemNo(myMemNo);
		memAndRoomNo.setRoomNo(roomNo);
		ArrayList<ChatRoom> list = chatService.ajaxBringRoomHeaderList(memAndRoomNo);	
		//System.out.println(list);
	    return new Gson().toJson(list);
	}
	
	/** 채팅 목록들을 일단위로 has many형태로 가져오는 Controller 
	 * @param roomNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="bringChatInfo.cht", produces="application/json; charset=utf-8")
	public String ajaxbringPChatInfoList(int roomNo){
		ArrayList<ChatDailyBasic> list = chatService.ajaxbringChatInfoList(roomNo);	
		//System.out.println(list);
	    return new Gson().toJson(list);
	}

	/** 일단은 바로바로 세션에서 번호뽑아오기 위한 Controller
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="bringSessRoomNo.cht", produces="application/json; charset=utf-8")
	public String ajaxBringSessRoomNo(HttpSession session){
		//System.out.println("controller에서 실시간 방번호 뽑기" + session.getAttribute("roomNo"));
	    return new Gson().toJson(session.getAttribute("roomNo"));
	}
	
	//----------------------------------------------------------------------
	//----------------------------------------------------------------------
	/** 채팅을 기록하는 동시에 ! 해당 ! chatting 번호 가져오는 controller
	 * @param chatlog
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="bringChatlogNo.cht", produces="application/json; charset=utf-8")
	public int insertChatContent(int memNo, int roomNo, String chatContent) {
	    ChatLog chatlog = new ChatLog();
	    chatlog.setMemNo(memNo);
	    chatlog.setRoomNo(roomNo);
	    chatlog.setChatContent(chatContent);
		return chatService.InsertChatContent(chatlog);
	}

	/** 마지막으로 읽은 채팅 바꾸는 것으로 읽지않은 채팅 갯수도 0으로 만드는 Controller 
	 * @param memNo
	 * @param roomNo
	 * @param chatlogNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="updateConnLastChat.cht", produces="application/json; charset=utf-8")
	public int updateConnLastChat(int memNo, int roomNo, int chatlogNo) {
	    ChatLog chatlog = new ChatLog();
	    chatlog.setMemNo(memNo);
	    chatlog.setRoomNo(roomNo);
	    chatlog.setChatlogNo(chatlogNo);
		return chatService.updateConnLastChat(chatlog);
	}
	
	/** 읽지않은 채팅수 업데이트 하는 Controller 
	 * @param memNo
	 * @param roomNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="updateUnreadCount.cht", produces="application/json; charset=utf-8")
	public int updateUnreadCount(int memNo, int roomNo) {
	    ChatLog chatlog = new ChatLog();
	    chatlog.setMemNo(memNo);
	    chatlog.setRoomNo(roomNo);
		return chatService.updateUnreadCount(chatlog);
	}
	
	/** 화면쪽에 뿌려주기 위한 실시간 읽지않은 채팅 총갯수 가져오는 Controller 
	 * @param memNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="totalUnreadCount.cht", produces="application/json; charset=utf-8")
	public int totalUnreadCount(int memNo) {
		return chatService.totalUnreadCount(memNo);
	}
	
	/** 읽지않은 쪽지 채팅 총갯수 가져오는 Contorller 
	 * @param memNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="checkUnreadMsgAndChat.cht", produces="application/json; charset=utf-8")
	public int checkUnreadMsgAndChat(int memNo) {
		return chatService.checkUnreadMsgAndChat(memNo);
	}

}
