package com.kh.thezo.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.mail.MessagingException;
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
import com.kh.thezo.approval.model.vo.Approval;
import com.kh.thezo.attendance.model.service.AttendanceService;
import com.kh.thezo.attendance.model.vo.Attendance;
import com.kh.thezo.chatting.model.service.ChattingService;
import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.common.template.Pagination;
import com.kh.thezo.leave.model.vo.Leave;
import com.kh.thezo.mail.controller.MailController;
import com.kh.thezo.mail.model.service.MailService;
import com.kh.thezo.mail.model.vo.Mail;
import com.kh.thezo.member.model.service.MemberService;
import com.kh.thezo.member.model.vo.Member;
import com.kh.thezo.notification.model.service.NotificationService;

@Controller
public class MemberController {
	
	@Autowired
	private ApprovalService apprService;
	@Autowired
	private MailService mailService;
	@Autowired
	private MailController mailController;
	@Autowired
	private MemberService mService;
	@Autowired
	private AttendanceService atService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	@Autowired
	private NotificationService nfService;
	@Autowired
	private ChattingService chatService;
	@Autowired
	private AttendanceService aService;

	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session){
		session.invalidate();
		return "redirect:/"; // 메인페이지로 재요청
	}
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = mService.loginMember(m);
		Attendance attData = atService.attendanceData2(loginUser); //메인화면 출퇴근 조회용
		ArrayList<Leave> lData = atService.leaveData(loginUser); //근태정보 조회용
		//System.out.println(loginUser);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) { // 로그인 성공
			loginUser.setUserId(loginUser.getMemId()); //userId임시로 넣은 jsp오류방지용
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("attData", attData);
			session.setAttribute("lData", lData);
			

			// 전자결재 파트 시작 (DB 확정되고 테스트 단계에서 주석 지우겠습니다)
				HashMap<String, Integer> mainApprCount= apprService.mainApprCount(loginUser.getMemNo());
				Approval appr = new Approval();
				appr.setStatus("");
				appr.setMemNo(loginUser.getMemNo());
				appr.setApprFolder("main");
				ArrayList<Approval> apprList = apprService.selectApprovalMain(appr);
				session.setAttribute("apprList", apprList);
				session.setAttribute("mainApprCount", mainApprCount);
			// 전자결재 파트 끝
			
			// 이메일 파트 시작 (DB 확정되고 테스트 단계에서 주석 지우겠습니다)
				// 해당 두 계정만 서버와 연동시켰기 때문에 조건처리했습니다.
				if (loginUser.getEmail().equals("user05@thezo.site") || loginUser.getEmail().equals("user06@thezo.site")) {
					try {
						ArrayList<Mail> mList = new ArrayList<>();
						// 외부에 새로들어온 메일이 있는지 체크
						mList = mailController.mailReceivecheck(loginUser.getMemNo(), loginUser.getEmail(), session);
						if (mList.size() != 0) {
							mailService.insertPopList(mList);
						}
					} catch (MessagingException e) {
						e.printStackTrace();
					}
				}				
				int mainMailCount= mailService.mainMailCount(loginUser.getMemNo());
				session.setAttribute("mainMailCount", mainMailCount);
				// 이메일 파트 끝	

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
		// 일단 로그인 해서 
		// 로그인 하자마자 읽직안은 채팅들 update하는 용도 
		chatService.updateMyUnreadChatCount(loginUser.getMemNo());
		
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
	
	
	// 회원정보관리(사원등록,수정):관리자 -이성경
	// 회원 정보 수정
	@RequestMapping("adMemberUpdate.me")
	public String adMemberUpdate(Member m, MultipartFile reupfile,HttpSession session, Model model) {
		
		// 새로 넘어온 첨부파일이 있을 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			// 기본에 첨부파일이 있었을 경우 => 기존의 첨부파일 지우기
			if(m.getPath() != null) {
				new File(session.getServletContext().getRealPath(m.getOriginName())).delete();
				// 새로 넘어온 첨부파일 서버 업로드 시키기
				String changeName = saveFile(session, reupfile);
				m.setPath(reupfile.getOriginalFilename());
				m.setOriginName("resources/uploadFiles/" + changeName);
			}else {
				String changeName = saveFile(session, reupfile); 
				m.setPath(reupfile.getOriginalFilename());
				m.setOriginName("resources/uploadFiles/" + changeName);
			}
		}
	
		int result = mService.adMemberUpdate(m);
		
		if(result > 0) {
			
			//session.setAttribute("loginUser", mService.loginMember(m));
			session.setAttribute("alertMsg", "성공적으로 정보 수정되었습니다.");
			
			return "redirect:memberInfo.me";
			
		}else { 
			model.addAttribute("errorMsg", "내 정보 수정 실패");
			return "common/erroPage";
		}
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
	
	// 관리자 : 회원 삭제하기 화면 포워딩
	@RequestMapping("memDeleteForm.me")
	public ModelAndView memDeleteForm(int mno, ModelAndView mv) {
		Member m = mService.selectMember(mno);
		
		if( m != null) {
			mv.addObject("m", m).setViewName("member/memDeleteDetail");
		}else {
			mv.addObject("errorMsg", "상세조회 실패");
		}
		return mv;
	}
	
	// 관리자 : 회원 삭제
	@RequestMapping("adminMemDelete.me")
	public String adDeleteMember(int mno, Model model, HttpSession session) {
		
		//System.out.println(mno);
		int result = mService.deleteMember(mno);
		
		if(result > 0) { // 성공 => 리스트 페이지
			
			session.setAttribute("alertMsg", "성공적으로 회원 정보가 삭제되었습니다.");
			return "redirect:memberDelete.me";
		}else { // 실패
			model.addAttribute("errorPage", "회원 정보 삭제 실패");
			return "common/errorPage";
		}
	}
	
	
	// 사용자 : 내 정보 수정 페이지 응답 - 이성경
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/memberMyPage";
	}
	
	// 사용자 : 내 정보 수정하기 - 이성경
	@RequestMapping("myPageUpdate.me")
	public String updateMember(Member m, MultipartFile reupfile,HttpSession session, Model model) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		m.setMemPwd(encPwd);
		
		// 새로 넘어온 첨부파일이 있을 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			// 기본에 첨부파일이 있었을 경우 => 기존의 첨부파일 지우기
			if(m.getPath() != null) {
				new File(session.getServletContext().getRealPath(m.getOriginName())).delete();
				// 새로 넘어온 첨부파일 서버 업로드 시키기
				String changeName = saveFile(session, reupfile); 
				m.setPath(reupfile.getOriginalFilename());
				m.setOriginName("resources/uploadFiles/" + changeName);
			}else {
				String changeName = saveFile(session, reupfile); 
				m.setPath(reupfile.getOriginalFilename());
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
	
	
	// 관리자 : 사원등록하기 - 이성경
	@RequestMapping("memberEnroll.me")
	public String insertMember(Member m, MultipartFile upfile, HttpSession session, Model model) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		m.setMemPwd(encPwd);
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(session, upfile);
			m.setPath(upfile.getOriginalFilename());
			m.setOriginName("resources/uploadFiles/" + changeName);
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
	
	
	
	// 날드:  조직도(연락처) 
	@RequestMapping("contactInfo.me")
	public ModelAndView memberContactInfo(ModelAndView mv, HttpSession session) {
		ArrayList<Member> empList = apprService.employeeList();
		mv.addObject("empList", empList); // 전사원 리스트
		mv.setViewName("member/memberContactInfo");
		return mv;
	}

	
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
