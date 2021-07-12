package com.kh.thezo.notification.controller;
//@author Jaewon.s
import org.springframework.stereotype.Controller;

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
}
