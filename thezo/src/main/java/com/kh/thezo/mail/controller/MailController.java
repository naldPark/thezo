package com.kh.thezo.mail.controller;

//@author YI

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MailController {

	@RequestMapping("main.mail")
	public String selectMailMain() {
		return "mail/mailMain";
	}
	
	@RequestMapping("enrollForm.mail")
	public String enrollMail() {
		return "mail/mailEnrollForm";
	}
	
	
}
