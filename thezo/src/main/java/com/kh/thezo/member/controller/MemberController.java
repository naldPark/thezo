package com.kh.thezo.member.controller;

//@author Jaewon.s
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session){
		session.invalidate();
		return "redirect:/"; // 메인페이지로 재요청
	}
	
	// 회원정보관리(사원등록,수정):관리자 -이성경
	@RequestMapping("memberInfo.me")
	public String memberInfo() { // 나중에 수정
		return "member/memberListView";
	}
	
	// 회원 삭제(사원삭제) : 관리자 - 이성경
	@RequestMapping("memberDelete.me")
	public String memberDelete() {
		return "member/memberDelete";
	}
	
	// 사용자 내 정보 수정 페이지 응답 - 이성경
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/memberMyPage";
	}
	
	
	// 관리자 사원등록 페이지 
	@RequestMapping("enrollForm.me")
	public String memberEmrollForm() {
		return "member/memberEnrollForm";
	}
}
