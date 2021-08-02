package com.kh.thezo.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

//@author Jaewon.s
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.common.template.Pagination;
import com.kh.thezo.member.model.service.MemberService;
import com.kh.thezo.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session){
		session.invalidate();
		return "redirect:/"; // 메인페이지로 재요청
	}
	// 담당자가 없는거같아서 제가 그냥 작성했어요(영익)
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = mService.loginMember(m);
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) { // 로그인 성공
			loginUser.setUserId(loginUser.getMemId()); //userId임시로 넣은 jsp오류방지용
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}else {// 로그인 실패
			mv.addObject("errorMsg", "로그인에 실패했습니다");
			mv.setViewName("common/errorPage");
		}
		
		return mv;		
		
	}
	
	
	// 회원정보관리(사원등록,수정):관리자 -이성경
	// 1) 리스트 조회 페이지
	@RequestMapping("memberInfo.me")
	public String memberInfoList(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) { 
		
		int listCount = mService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Member> list = mService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "member/memberListView";
	}
	
	// 회원정보관리(사원등록,수정):관리자 -이성경
	// 2) 검색바
	@RequestMapping("admemberSearch.me")
	public ModelAndView memberSearchList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
										 String condition, String keyword) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = mService.memSearchListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Member> list = mService.memSearchList(pi, map);
		
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("member/memberListView");
		
		return mv;
		
	}
	
	
	// 회원정보관리(사원등록,수정):관리자 -이성경
	// 회원정보 상세조회 
	@RequestMapping("adMemDetail.me")
	public ModelAndView adMemDetail(int mno, ModelAndView mv) {
		Member m = mService.selectMember(mno);
		// 일단 수정하기 !!!!!!
		if( m != null) {
			mv.addObject("m", m).setViewName("member/adminMemberUpdate");
		}else {
			mv.addObject("errorMsg", "상세조회 실패");
		}
		return mv;
	}
	
	
	
	// 회원 삭제(사원삭제) : 관리자 - 이성경
	// 1) 리스트 페이지 조회
	@RequestMapping("memberDelete.me")
	public String memberDelete(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		int listCount = mService.memDeleteListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Member> list = mService.memDeleteList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "member/memberDelete";
	}
	
	// 회원 삭제(사원삭제) : 관리자 - 이성경
	// 2) 검색바
	@RequestMapping("deleteSearch.me")
	public ModelAndView deleteSearchList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
										 String condition, String keyword) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = mService.memDeleteSearchListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Member> list = mService.deleteSearchList(pi, map);
		
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("member/memberDelete");
		
		return mv;
		
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
