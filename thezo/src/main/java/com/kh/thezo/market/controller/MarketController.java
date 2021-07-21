package com.kh.thezo.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarketController {
	
	// 벼룩시장 리스트 페이지
	@RequestMapping("marketList.bo")
	public String selectMarketList() {
		return "market/marketListView";
	}
	
	// 벼룩시장 등록하기
	@RequestMapping("marketEnrollForm.bo")
	public String marketEnrollForm() {
		return "market/marketEnrollForm";
	}
}
