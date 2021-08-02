package com.kh.thezo.member.controller;
//@author Jaewon.s

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.thezo.member.model.vo.TestMember;
import com.kh.thezo.notification.model.service.NotificationService;

@Controller
public class TestController {

	@Autowired
	private NotificationService nfService;

	
	@RequestMapping("test.me")
	public String testLoginMember(TestMember loginUser, HttpSession session) {
		session.setAttribute("loginUser", loginUser);
		
		/*
		 *  ★ ★ ★ ★ ★ ★ 로그인이 겁나 중요하다!!! 여기서 !! session영역쪽에다가!!! 
		 *  알림 관련 한것들을 조회해오면서 session에 담아야한다!!! 
		 */
		
		//ArrayList<Notification> list = 알림 조회해오는 메소드 
		//session.setAttribute("notification", list);
		
		
		// ★★★★★★★★★★★★★ 나중에 성경님이 로그인 쪽 만들어주면 드떄 심어주면 되는 코드 이다!! ★★★★★★★★★★ 
		// 아래 부분은 !!!! 성경님이 만들어주시면 꼭꼭 적용을 해줘야하는 부분 이다!!!!!! 		 
		// 적용 후에는 ! header쪽에 작업 한것 지워 주자!! 
		
		int count = nfService.ajaxCountUnreadedNf(loginUser.getMemNo());		
		if(count != 0) {
			session.setAttribute("unreadNotification", count);
		}
		
		return "redirect:/";
	}
}
