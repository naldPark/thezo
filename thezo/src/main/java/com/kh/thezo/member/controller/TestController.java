package com.kh.thezo.member.controller;
//@author Jaewon.s

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.thezo.member.model.vo.TestMember;

@Controller
public class TestController {

	@RequestMapping("test.me")
	public String testLoginMember(TestMember loginUser, HttpSession session) {
		session.setAttribute("loginUser", loginUser);
		
		/*
		 *  ★ ★ ★ ★ ★ ★ 로그인이 겁나 중요하다!!! 여기서 !! session영역쪽에다가!!! 
		 *  알림 관련 한것들을 조회해오면서 session에 담아야한다!!! 
		 */
		
		//ArrayList<Notification> list = 알림 조회해오는 메소드 
		//session.setAttribute("notification", list);
		
		return "redirect:/";
	}
}
