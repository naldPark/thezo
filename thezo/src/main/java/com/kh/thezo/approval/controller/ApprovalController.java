package com.kh.thezo.approval.controller;

//@author YI

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ApprovalController {

	@RequestMapping("main.appr")
	public String selectApprovalMain() {
		return "approval/approvalMain";
	}
	
	@RequestMapping("new.appr")
	public String newApproval() {
		return "approval/approvalNew";
	}
	
	@RequestMapping("enrollForm.appr")
	public String enrollApprolval() {
		return "approval/approvalEnrollForm";
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
	
	@RequestMapping("adminMain.appr")
	public String adminMainApproval() {
		return "approval/apprAdmin";
	}
	
	
	
	
	
}
