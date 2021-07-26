package com.kh.thezo.message.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MessageController {

	//	일단은 나중에 생각해서 ModelAndView로 세팅 지금은 넘기기만 하자! 
	@RequestMapping("list.adms")
	public ModelAndView selectBoard(ModelAndView mv) {

		mv.addObject("subPage", "1");
		mv.setViewName("message/adminReportedMessageListView");

		return mv;
	}

	@RequestMapping("search.me")
	public ModelAndView searchMemberWidow(ModelAndView mv) {
		mv.setViewName("common/jwMemberSearch");
		return mv;
	}
}
