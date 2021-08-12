package com.kh.thezo.chatting.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.thezo.chatting.model.service.ChattingService;

@Controller
public class ChattingController {
	@Autowired
	private ChattingService chatService;
	// 위는 기본 세팅 
	
	@RequestMapping("searchCol.me")
	public ModelAndView searchMemberWidow(ModelAndView mv) {
		mv.setViewName("common/jwColleagueSearch");
		return mv;
	}
	
	// 얘는 오직 insert만 하는 개념이라 AJAX 호출도 아니다 단순히 기록만 할뿐 나중을 위해서 보여지는 것은 다른 개념이다. 
	public void insertChatContent(int memNo, int roomNo, String msgContent) {
		// 가공처리하자. 
		HashMap<Object, Object> hm = new HashMap<Object, Object>();
		hm.put("memNo",memNo);		
		hm.put("roomNo",roomNo);
		hm.put("msgContent",msgContent);
		chatService.InsertChatContent(hm);
	}
	

}
