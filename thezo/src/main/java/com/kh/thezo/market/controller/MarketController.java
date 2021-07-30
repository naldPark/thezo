package com.kh.thezo.market.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


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
	
	
	// 벼룩시장 리스트페이지 검색바 (사용자)
	@RequestMapping("marketSearch.bo")
	public ModelAndView marketSearchList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
										 String condition, String keyword) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = mkService.marketSearchListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 6);
		ArrayList<Market> list = mkService.marketSearchList(pi, map);
		
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("market/marketListView");
		
		return mv;
		
	}
	
	// 벼룩시장 등록하기
	@RequestMapping("marketEnrollForm.bo")
	public String marketEnrollForm() {
		return "market/marketEnrollForm";
	}
}
