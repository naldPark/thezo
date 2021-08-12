package com.kh.thezo.chatting.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.thezo.chatting.model.service.ChattingService;
import com.kh.thezo.chatting.model.vo.ChatRoom;
import com.kh.thezo.chatting.model.vo.Colleague;

@Controller
public class ChattingController {
	@Autowired
	private ChattingService chatService;
	// 위는 기본 세팅 
	
	// 얘는 오직 insert만 하는 개념이라 AJAX 호출도 아니다 단순히 기록만 할뿐 나중을 위해서 보여지는 것은 다른 개념이다.
	/*
	public void insertChatContent(int memNo, int roomNo, String msgContent) {
		// 가공처리하자. 
		HashMap<Object, Object> hm = new HashMap<Object, Object>();
		hm.put("memNo",memNo);		
		hm.put("roomNo",roomNo);
		hm.put("msgContent",msgContent);
		chatService.InsertChatContent(hm);
	}
	*/
	//----------------------------------------------------------------------
	// ----------------------------부수적인 채팅 작업 -----------------------------
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
	
	
	//--------------------------------------모달 시작 -------------------------------------------
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
	
	/** 동료 추가 
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
		System.out.println(hm);
		int result = chatService.ajaxCreateGroupChat(hm);
		System.out.println("방번호가 넘어와야해 " + result);
		if(result > 0) {
			return new Gson().toJson("단체 채팅방을 성공적으로 생성하였습니다.");			
		}else {
			return new Gson().toJson("단체 채팅방을 생성에 실패하였습니다. \n개발자에게 문의해주세요");						
		}
	}

	
	
	
}
