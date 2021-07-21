package com.kh.thezo.document.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DocumentController {
	
	@RequestMapping("list.doc")
	public String selectDocumentList() {
		return "document/documentListView";
	}
}
