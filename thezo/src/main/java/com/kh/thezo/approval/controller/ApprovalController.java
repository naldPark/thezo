package com.kh.thezo.approval.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.thezo.approval.model.service.ApprovalService;
import com.kh.thezo.approval.model.vo.Approval;
import com.kh.thezo.approval.model.vo.ApprovalAccept;
import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.common.template.Pagination;
import com.kh.thezo.mail.model.vo.Attachment;
//@author YI
import com.kh.thezo.member.model.vo.Member;


@Controller
public class ApprovalController {
	
	
	@Autowired
	private ApprovalService aService;
	

	//전자결재 메인페이지로 관련있는 결재리스트 불러오기
	@RequestMapping("main.appr")
	public ModelAndView selectApprovalMain(ModelAndView mv, HttpSession session, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		// 일단 member 객체 생성되고 login구현될떄까지 임시로 넣는 값
//		int memNo = Integer.parseInt(((TestMember) session.getAttribute("loginUser")).getUserId());
		int memNo = 1;
		
		// 페이징 확인
		Approval a = new Approval();
		a.setStatus("");
		a.setMemNo(memNo);
		int listCount = aService.selectListCount(a);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Approval> list = aService.selectApprovalMain(memNo, pi);
//		System.out.println(list);
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("approval/approvalMain");
		return mv;
	}
	
	
	// 문서양식 리스트 불러오기
	@RequestMapping("new.appr")
	public ModelAndView newApprList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		int listCount = aService.newApprListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Approval> list = aService.newApprList(pi);
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("approval/approvalNew");
		return mv;
	}
	
	// 문서 작성하는 페이지 
	@RequestMapping("enrollForm.appr")
	public ModelAndView enrollApproval(ModelAndView mv, int ano) {
		Approval aTemp = new Approval();
		aTemp.setMemNo(1); aTemp.setDeptNo(3);	aTemp.setFormNo(ano);
		// 사용자 session 셋팅될떄까지의 임시값
		
		Approval a = aService.enrollApproval(aTemp);
		ArrayList<Member> empList = aService.employeeList();
		ArrayList<ApprovalAccept> cLine = aService.selectformLineList(aTemp);
		Member leaveCount = aService.selectLeave(aTemp.getMemNo());
		
		mv.addObject("a", a) // 문서 포맷
			.addObject("empList", empList) // 전사원 리스트 
			.addObject("cLine", cLine);  // 해당 양식의 결재선
		
		//연차신청인 경우 다른 페이지로 이동
		if(a.getFormNo()==5) {
			mv.addObject("leaveCount", leaveCount) // 연차 잔여갯수 
			.setViewName("approval/approvalLeaveForm");
		} else {
			mv.setViewName("approval/approvalEnrollForm");
		}
		
		return mv;
	}
	
	// 첨부파일 저장을 위한 메소드 모듈화
	public String saveFile(HttpSession session, MultipartFile upfile) {
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/approval/");
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
	
	@ResponseBody
	@RequestMapping("insertDocu.appr")
	public ModelAndView insertApprovalDocument(Approval a,HttpSession session, MultipartFile[] upfile, ModelAndView mv) {
		a.setMemNo(1);

		if (!upfile[0].getOriginalFilename().equals("")) {
			ArrayList<Attachment> list = new ArrayList<>();

			for (int i = 0; i < upfile.length; i++) {
				Attachment at = new Attachment();
				String changeName = saveFile(session, upfile[i]); 
				at.setOriginName(upfile[i].getOriginalFilename());
				at.setFileUrl("resources/uploadFiles/approval/" + changeName);
				at.setFileLevel(i+1);
				list.add(at);
			}
			a.setAt(list);
		}
		int result = aService.insertApprovalDocument(a);
		if(result > 0) { // 성공
			session.setAttribute("alertMsg", "성공적으로 등록 되었습니다.");
			mv.setViewName("redirect:main.appr");
		}else {
			mv.addObject("errorMsg", "기안에 실패했습니다");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	@RequestMapping("detailDocu.appr")
	public ModelAndView detailApproval(int docNo, ModelAndView mv) {
		Approval a = aService.detailApproval(docNo);
		ArrayList<ApprovalAccept> aLine = aService.detailApprovalLine(docNo);
		mv.addObject("a", a) // 연차 잔여갯수 
		.addObject("aLine", aLine) // 연차 잔여갯수 
		.setViewName("approval/apprDetailDocu");
		return mv;
	}
	
	
	@RequestMapping("reportDocu.appr")
	public String reportApproval() {
		return "approval/apprReportDocu";
	}
	
	@RequestMapping("reportFinDocu.appr")
	public String reportFinApproval() {
		return "approval/apprReportFinDocu";
	}
	
	
	@RequestMapping("tempDocu.appr")
	public String tempApproval() {
		return "approval/apprTempDocu";
	}

	
	@RequestMapping("waiting.appr")
	public String waitingApproval() {
		return "approval/apprWaiting";
	}
	
	@RequestMapping("approved.appr")
	public String approvedApproval() {
		return "approval/apprApproved";
	}
	
	@RequestMapping("reference.appr")
	public String referenceApproval() {
		return "approval/apprReference";
	}
	
	@RequestMapping("adminMain.appr") //관리자 페이지 메인
	public String adminMainApproval() {
		return "approval/apprAdmin";
	}
	
	@RequestMapping("editForm.appr")  //관리자 페이지에서 양식 수정 매핑
	public String adminEditFormApproval() {
		return "approval/apprAdminEditForm";
	}
	
	
}
