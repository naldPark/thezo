package com.kh.thezo.approval.controller;

//@author YI

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ApprovalController {

	@RequestMapping("main.appr")
	public String selectApprolvalMain() {

		return "approval/approvalMain";
	}
	
}
