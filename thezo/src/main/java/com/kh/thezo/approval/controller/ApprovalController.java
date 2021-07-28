package com.kh.thezo.approval.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.thezo.approval.model.service.ApprovalService;
import com.kh.thezo.approval.model.vo.Approval;
import com.kh.thezo.approval.model.vo.OrgChartList;
import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.common.template.Pagination;
import com.kh.thezo.mail.model.vo.Attachment;
//@author YI


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
		Approval a = aService.enrollApproval(ano);
		ArrayList<OrgChartList> empList = aService.employeeList();
		mv.addObject("empList", empList)
			.addObject("a", a)
			.setViewName("approval/approvalEnrollForm");
		return mv;
	}
	
	// 첨부파일 저장을 위한 메소드 모듈화
	public String saveFile(HttpSession session, MultipartFile upfile) {
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/mail/");
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
	public ModelAndView insertApprovalDocument(Approval a,HttpSession session, MultipartFile[] upfile, ModelAndView mv ) {
//		System.out.println(summernote);
		if (!upfile[0].getOriginalFilename().equals("")) {
			ArrayList<Attachment> list = new ArrayList<>();

			for (int i = 0; i < upfile.length; i++) {
				Attachment at = new Attachment();
				String changeName = saveFile(session, upfile[i]); // "2021070217013023152.jpg"
				at.setOriginName(upfile[i].getOriginalFilename());
				at.setChangeName("resources/uploadFiles/mail/" + changeName);
				list.add(at);
			}
		}
		int result = aService.insertApprovalDocument(a);
		
//		  .setViewName("approval/approvalTemp");
		return mv;
	}
	
	
	
	@RequestMapping("leaveEnrollForm.appr")
	public String leaveEnrollApproval() {
		return "approval/approvalLeaveForm";
	}
	
	
	@RequestMapping("detailDocu.appr")
	public String detailApproval() {
		return "approval/apprDetailDocu";
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
