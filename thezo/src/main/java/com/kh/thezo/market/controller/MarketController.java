package com.kh.thezo.market.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.thezo.board.model.vo.Board;
import com.kh.thezo.board.model.vo.BoardFile;
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
	
	// 벼룩시장 상세조회(사용자)
	@RequestMapping("marketDetail.bo")
	public ModelAndView marketDetail(int mkno, ModelAndView mv) {
		int result = mkService.increaseMarketCount(mkno);
			
		if(result>0) { 
			Market mk = mkService.selectMarket(mkno); 
			mv.addObject("mk", mk).setViewName("market/marketDetailView");
				
		}else {
			mv.addObject("errorMsg", "상세조회 실패").setViewName("common/errorPage");
		}
			
		return mv;
	}
	
	
	
	
	// 벼룩시장 등록하기 포워딩
	@RequestMapping("marketEnrollForm.bo")
	public String marketEnrollForm() {
		return "market/marketEnrollForm";
	}
	
	

	// 공지사항 등록하기(사용자)
	@RequestMapping("marketInsert.bo")
	public String insertMarket(Market mk, BoardFile bf, MultipartFile upfile, HttpSession session, Model model) {
	
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(session, upfile); 
			bf.setOriginName(upfile.getOriginalFilename());  
			bf.setChangeName(changeName); 
			mk.setProductImg(changeName);
		}
		
		int result = mkService.insertMarket(mk);
		
		if(result > 0 ) {
			if(bf.getOriginName() != null) {
				mkService.insertMarketFile(bf);
			}
			session.setAttribute("alertMsg", "성공적으로 공지사항이 등록되었습니다.");
			return "redirect:marketList.bo";
		}else { 
			model.addAttribute("errorMsg", "공지사항 등록 실패");
			return "common/errorPage";
		}
					
	}
	
	
	// 서버에 업로드 시키는 것(파일저장)을 메소드로 작성
		public String saveFile(HttpSession session, MultipartFile upfile) {
			// 경로
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
							
			String originName = upfile.getOriginalFilename();
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // Date : java.util import
			int ranNum = (int)(Math.random() * 90000 + 10000);
			String ext = originName.substring(originName.lastIndexOf("."));
							
			String changeName = currentTime + ranNum + ext;
							
			try {
				upfile.transferTo(new File(savePath + changeName));   // File : java.io import
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
				
			return changeName;
		}
		
	
	
	
	
}
