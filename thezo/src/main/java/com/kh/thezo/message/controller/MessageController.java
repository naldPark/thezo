package com.kh.thezo.message.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.thezo.message.model.service.MessageService;
import com.kh.thezo.message.model.vo.Message;

@Controller
public class MessageController {

	@Autowired
	private MessageService msgService;
	
	// 위는 기본 세팅 
	
	/** 관리자단 신고된 쪽지 목록 확인 페이지에 뿌려줄 값과 forward처리하는 controller 
	 * @param mv
	 * @return
	 */
	@RequestMapping("list.adms")
	public ModelAndView selectBoard(ModelAndView mv) {
		mv.addObject("subPage", "1");
		mv.setViewName("message/adminReportedMessageListView");
		return mv;
	}

	/** 팡업창 띄우는 Controller 부모창에서 자식창으로 넘길 값은 없고 자식창에서 부모창으로 값을 넘기는 것은 작업해둠
	 * @param mv
	 * @return
	 */
	@RequestMapping("search.me")
	public ModelAndView searchMemberWidow(ModelAndView mv) {
		mv.setViewName("common/jwMemberSearch");
		return mv;
	}
	//----------------------------------------------------------------------------------------
	
	/** 받은 쪽지 list 조회해오는 Controller
	 * @param memNo
	 * @return
	 * @throws ParseException
	 */
	@ResponseBody
	@RequestMapping(value="selectReceiveList.msg", produces="application/json; charset=utf-8")
	public String ajaxSelectReceiveMsgList(int memNo){
		ArrayList<Message> list = msgService.ajaxSelectReceiveMsgList(memNo);		
	    return new Gson().toJson(list);
	}
	
	/** 받은쪽지를 휴지통으로 보내는 Controller 보낸 쪽지도 마찬지이디 이 Controller를 바탕으로 만들면 된
	 * @param multiMsgNo
	 * @param memNo
	 * @param msgType
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="moveToRB.msg", produces="application/json; charset=utf-8")
	public String ajaxMoveToRB(int[] multiMsgNo, int memNo, String msgType) {
		HashMap<Object, Object> hm = new HashMap<Object, Object>();
		hm.put("memNo",  memNo);
		hm.put("multiMsgNo",  multiMsgNo);
		hm.put("msgType", msgType);
		int result = msgService.ajaxMoveToRB(hm);
		if(result > 0) {
			return new Gson().toJson("해당 쪽지들을 삭제하였습니다. \n휴지통을 확인해 주세요.");			
		}else {
			return new Gson().toJson("쪽지 삭제에 실패하였습니다. 개발자에게 문의해주세요");						
		}
	}

	
	/** 보낸쪽지함 리스트 조회해오는 Controller
	 * @param memNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectSentList.msg", produces="application/json; charset=utf-8")
	public String ajaxSelectSentMsgList(int memNo){
		ArrayList<Message> list = msgService.ajaxSelectSentMsgList(memNo);		
	    return new Gson().toJson(list);
	}

	
	/** 휴지통으로 이동한(받은 쪽지) 리스트 조회해오는 Controller
	 * @param memNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectRcRbList.msg", produces="application/json; charset=utf-8")
	public String ajaxSelectRcRbList(int memNo){
		ArrayList<Message> list = msgService.ajaxSelectRcRbList(memNo);		
	    return new Gson().toJson(list);
	}
	
	/** 휴지통으로 이동한(보낸 쪽지) 리스트 조회해오는 Controller
	 * @param memNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectRcStList.msg", produces="application/json; charset=utf-8")
	public String ajaxSelectRcStList(int memNo){
		ArrayList<Message> list = msgService.ajaxSelectRcStList(memNo);		
	    return new Gson().toJson(list);
	}


	/** 특이한 경우로서 얘는 신고 관련이지만 단순히 화면에 뿌려주는 용도 이기에 Message객체에 담아서 올것이다. (sql에서 컬럼명을 바꿔서 값을 담는형식으로)
	 * @param memNo
	 * @return
	 */
	/*
	@ResponseBody
	@RequestMapping(value="selectReportList.msg", produces="application/json; charset=utf-8")
	public String ajaxselectReportList(int memNo){
		ArrayList<Message> list = msgService.ajaxselectReportList(memNo);		
	    return new Gson().toJson(list);
	}*/
	// 정석적으로 Report VO로 받아와야한다.
	
	
	@ResponseBody
	@RequestMapping(value="countUnreadMsg.msg", produces="application/json; charset=utf-8")
	public String ajaxCountUnreadedMsg(int memNo){
		int count = msgService.ajaxCountUnreadedMsg(memNo);		
	    return new Gson().toJson(count);
	}

	
	
	/** message 상세 정보를 가져오는 것인데 여기서 !!! 일단은 바로 서비스단으로 넘겨서 서비스단에서 조건문으로 처리하면서 비즈니스 로직 처리한다. 
	 * @param memNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="Detail.msg", produces="application/json; charset=utf-8")
	public String ajaxSelectDetailMsg(int memNo, String MsgType){
		Message msgDetail = msgService.ajaxSelectDetailMsg(memNo, MsgType);		
	    return new Gson().toJson("큼");
	}

	
}
