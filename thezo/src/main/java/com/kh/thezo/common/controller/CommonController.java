package com.kh.thezo.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

	@RequestMapping("adminmain")
	public String moveToAdminMain(HttpSession session) {
		session.setAttribute("pageType", "AdminPage");
		return "redirect:/";
	}
	
	@RequestMapping("main")
	public String moveToMain(HttpSession session) {
		session.setAttribute("pageType", "UserPage");
		return "redirect:/";
	}


	
}
