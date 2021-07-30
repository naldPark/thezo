package com.kh.thezo.market.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.common.template.Pagination;
import com.kh.thezo.market.model.service.MarketService;
import com.kh.thezo.market.model.vo.Market;

@Controller
public class MarketController {
	
	@Autowired
	private MarketService mkService;
	
	// 벼룩시장 리스트 페이지
	@RequestMapping("marketList.bo")
	public String selectMarketList(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = mkService.marketListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 6);
		ArrayList<Market> list = mkService.selectMarketList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "market/marketListView";
	}
	
	// 벼룩시장 등록하기
	@RequestMapping("marketEnrollForm.bo")
	public String marketEnrollForm() {
		return "market/marketEnrollForm";
	}
}
