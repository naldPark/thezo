package com.kh.thezo.contact.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CompanyInfoController {

	@RequestMapping("company.info")
	public String companyInfo() {
		return "contact/companyInfo";
	}
	
	@RequestMapping("adminCompanyInfo.st")
	public String companyInfoManage() {
		return "contact/adminInfoManage";
	}
	
}
