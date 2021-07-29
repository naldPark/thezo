package com.kh.thezo.notification.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.thezo.notification.model.service.NotificationService;
import com.kh.thezo.notification.model.vo.Notification;

@Controller
public class NotificationController {
	
	@Autowired
	private NotificationService nfService;


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
	public ModelAndView SelectAndViewNotificationList(ModelAndView mv) {

		mv.addObject("subPage", "2");
		mv.setViewName("notification/adminNotificationListView");

		return mv;
	}
	
	
		
	/** 관리자단에서 알림 등록 controller
	 * @author Jaewon.s
	 * @param nf 알림등록시 사용자가 입력한 값을 받는 인자
	 * @param session 
	 * @param mv
	 * @return
	 */
	@RequestMapping("insert.adnf")
	public ModelAndView insertNotification(Notification nf, HttpSession session, ModelAndView mv) {		
		int result = nfService.insertNotification(nf);
		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 알림을 등록하였습니다");
			mv.setViewName("redirect:list.adnf");
		}else {
			mv.addObject("errorMsg", "알림등록 실패 <br> 기존에 동일한 부서, 시작일, 종료일, 알림내용의 <br> 알림이 존재 할 수 있습니다. <br> 확인해주세요").setViewName("common/errorPage");
		}

		return mv;
	}
}
