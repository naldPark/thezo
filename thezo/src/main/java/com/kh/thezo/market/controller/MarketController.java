package com.kh.thezo.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarketController {

	@RequestMapping("marketList.bo")
	public String selectNoticeList() {
		return "market/marketListView";
	}
	
	
	@RequestMapping("marketEnrollForm.bo")
	public String noticeEnrollForm() {
		return "market/marketEnrollForm";
	}
}
