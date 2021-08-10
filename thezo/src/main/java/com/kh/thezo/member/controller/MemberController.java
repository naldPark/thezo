package com.kh.thezo.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

//@author Jaewon.s
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.thezo.approval.model.service.ApprovalService;
import com.kh.thezo.attendance.model.service.AttendanceService;
import com.kh.thezo.attendance.model.vo.Attendance;
import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.common.template.Pagination;
import com.kh.thezo.member.model.service.MemberService;
import com.kh.thezo.member.model.vo.Member;
import com.kh.thezo.message.model.service.MessageService;
import com.kh.thezo.notification.model.service.NotificationService;

@Controller
public class MemberController {
	
	@Autowired
	private ApprovalService apprService;
	@Autowired
	private MemberService mService;
	@Autowired
	private AttendanceService atService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	@Autowired
	private NotificationService nfService;
	@Autowired
	private MessageService msgService;

	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session){
		session.invalidate();
		return "redirect:/"; // 메인페이지로 재요청
	}
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = mService.loginMember(m);
		Attendance attData = atService.attendanceData2(m); //메인화면 출퇴근 조회용
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) { // 로그인 성공
			loginUser.setUserId(loginUser.getMemId()); //userId임시로 넣은 jsp오류방지용
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("attData", attData);
			
			// 전자결재 파트 시작
			HashMap<String, Integer> mainApprCount= apprService.mainApprCount(loginUser.getMemNo());
			session.setAttribute("mainApprCount", mainApprCount);
			System.out.println(mainApprCount);
			// 전자결재 파트 끝

			mv.setViewName("redirect:/");
			
		}else {// 로그인 실패
			mv.addObject("errorMsg", "로그인에 실패했습니다");
			mv.setViewName("common/errorPage");
		}
		
		
		// @Author: Jaewon.s 
		// 읽지않은 알림 갯수 가져오는 용도 
		int nfCount = nfService.ajaxCountUnreadedNf(loginUser.getMemNo());		
		if(nfCount != 0) {
			session.setAttribute("unreadNotification", nfCount);
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
	
	
	// 사용자 : 내 정보 수정 페이지 응답 - 이성경
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/memberMyPage";
	}
	
	// 사용자 : 내 정보 수정하기 - 이성경
	@RequestMapping("myPageUpdate.me")
	public String updateMember(String add1, String add2, String add3, Member m, MultipartFile reupfile,HttpSession session, Model model) {
		
		String address = add1 + add2 + add3;
		m.setAddress(address);
		
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		m.setMemPwd(encPwd);
		
		// 새로 넘어온 첨부파일이 있을 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			// 기본에 첨부파일이 있었을 경우 => 기존의 첨부파일 지우기
			if(m.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(m.getOriginName())).delete();
				// 새로 넘어온 첨부파일 서버 업로드 시키기
				String changeName = saveFile(session, reupfile); 
				m.setOriginName("resources/uploadFiles/" + changeName);
			}else {
				String changeName = saveFile(session, reupfile); 
				m.setOriginName("resources/uploadFiles/" + changeName);
			}
		}
	
		int result = mService.updateMember(m);
		
		if(result > 0) {
			
			session.setAttribute("loginUser", mService.loginMember(m));
			session.setAttribute("alertMsg", "성공적으로 정보 수정되었습니다.");
			
			return "redirect:myPage.me";
			
		}else { 
			model.addAttribute("errorMsg", "내 정보 수정 실패");
			return "common/erroPage";
		}
	}
	
	// 관리자 : 사원등록 페이지 포워딩
	@RequestMapping("enrollForm.me")
	public String memberEmrollForm() {
		return "member/memberEnrollForm";
	}
	

	// 관리자 사원등록 아이디 중복체크 - 이성경
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String ajaxIdCheck(String checkId) {
		
		int count = mService.idCheck(checkId);
		
		return count > 0 ? "NNNNN" : "NNNNY";
		
	}
	
	/*
	// 관리자 : 사원등록하기 - 이성경
	@RequestMapping("memberEnroll.me")
	public String insertMember(Member m, MultipartFile upfile, HttpSession session, Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(session, upfile); 
			m.setOriginName(changeName);
		}
		
		int result = mService.insertMember(m);
		
		if(result > 0 ) {
			
			session.setAttribute("alertMsg", "성공적으로 사원이 등록되었습니다.");
			return "redirect:memberInfo.me";
		}else { 
			model.addAttribute("errorMsg", "사원 등록 실패");
			return "common/errorPage";
		}
					
	}
	
	*/
	
	

	
	// 서버에 업로드 시키는 것(파일저장)을 메소드로 작성
	public String saveFile(HttpSession session, MultipartFile upfile) {
		// 경로
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
							
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // Date : java.util import
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
							
		String changeName = currentTime + ranNum + ext;
							
		try {
			upfile.transferTo(new File(savePath + changeName));   // File : java.io import
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
				
		return changeName;
	}
		
	
}
