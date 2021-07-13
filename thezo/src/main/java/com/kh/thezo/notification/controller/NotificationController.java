package com.kh.thezo.notification.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NotificationController {

	//★ ↓ AJAX 처리다!! 
	/*
	@ResponseBody
	@RequestMapping(value="confirm.nf", produces="application/json; charset=utf-8")
	public String ajaxConfirmNotification(HttpSession session) {
	*/

		//int result = 어떤 메소드 실행해서 !!! 알림 읽음으로 update처리하고 
		//session에서 !!! 알림쪽! 만료 시켜줘야한다!!! 
		//if(result>0) {
		//	session.removeAttribute("notification");
		//}

		//if(result>0) {//알림 읽음으로 update성공시 
		//	return "1";
		//}else {//실패시 
		//	retunr "0";
		//}
	//}


	//	일단은 나중에 생각해서 ModelAndView로 세팅 지금은 넘기기만 하자! 
	@RequestMapping("list.adnf")
	public ModelAndView selectBoard(ModelAndView mv) {

		mv.setViewName("notification/adminNotificationListView");

		return mv;
	}
}
