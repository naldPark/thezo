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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.thezo.board.model.vo.Reply;
import com.kh.thezo.board.model.vo.Report;
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
	
	// 벼룩시장 등록하기(사용자)
	@RequestMapping("marketInsert.bo")
	public String insertMarket(Market mk, MultipartFile upfile, HttpSession session, Model model) {
	
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(session, upfile); 
			mk.setProductImg("resources/uploadFiles/" + changeName);
		}
		
		int result = mkService.insertMarket(mk);
		
		if(result > 0 ) {
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "redirect:marketList.bo";
		}else { 
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
					
	}
	
	// 벼룩시장 삭제하기 (사용자)  
	@RequestMapping("marketDelete.bo")
	public String deleteMarket(int mkno, String filePath, Model model, HttpSession session) {
			
		int result = mkService.deleteMarket(mkno);
			
		if(result > 0) { // 성공 => 리스트 페이지
				
			if(!filePath.equals("")) { // 첨부파일이 있었을 경우 => 파일 삭제
				String removeFilePath = session.getServletContext().getRealPath(filePath);
				new File(removeFilePath).delete();
			}
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			return "redirect:marketList.bo";
				
		}else { // 실패
			model.addAttribute("errorPage", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
		

	// 벼룩시장 수정하기 페이지 포워딩 (사용자)
	@RequestMapping("marketUpdateForm.bo")
	public String updateForm(int mkno, Model model) {
		model.addAttribute("mk", mkService.selectMarket(mkno));
		return "market/marketUpdateForm";
	}
		
	
	
	// 벼룩시장 수정하기 (사용자) 
	@RequestMapping("marketUpdate.bo")
	public String updateNotice(Market mk, MultipartFile reupfile, HttpSession session, Model model) {
		
		// 새로 넘어온 첨부파일이 있을 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			// 기본에 첨부파일이 있었을 경우 => 기존의 첨부파일 지우기
			if(mk.getProductImg() != null) {
				new File(session.getServletContext().getRealPath(mk.getProductImg())).delete();
				// 새로 넘어온 첨부파일 서버 업로드 시키기
				String changeName = saveFile(session, reupfile);
				mk.setProductImg("resources/uploadFiles/" + changeName);
			}else {
				String changeName = saveFile(session, reupfile);
				mk.setProductImg("resources/uploadFiles/" + changeName);
			}
		}
	
		// update문 실행하러 service 호출  
		int result = mkService.updateMarket(mk);
		
		if(result > 0) { // 성공
			
			session.setAttribute("alertMsg", "게시글 수정 성공");
			return "redirect:marketDetail.bo?mkno=" + mk.getMarketNo();
		}else { // 실패
			model.addAttribute("errorMsg", "게시글 수정 실패");
			return "common/errorPage";
		}
	}
	
	
	// 사용자 : 벼룩시장 댓글 조회
	@ResponseBody
	@RequestMapping(value="mkRlist.bo", produces="application/json; charset=utf-8")
	public String marketReplyList(int bno){
		
		ArrayList<Reply> list = mkService.marketReplyList(bno);
		//System.out.println(list);
		return new Gson().toJson(list);
		
	}
	
	
	// 사용자 : 벼룩시장 댓글 입력
	@ResponseBody
	@RequestMapping("marketReplyinsert.bo")
	public String insertMarketReply(Reply r) {
		
		int result = mkService.insertMarketReply(r);
		
		return result>0?"success":"fail";
	}
	
	
	// 사용자 : 벼룩시장 게시글 신고하기 
	@RequestMapping("memMarketReport.bo")
		public String marketReport(Report rp, HttpSession session, Model model) {
			
			int result = mkService.marketReport(rp);
			
			if(result>0) {
				session.setAttribute("alertMsg", "성공적으로 게시글이 신고되었습니다.");
				return "redirect:marketList.bo";
			}else {
				model.addAttribute("errorMsg", "게시글 신고 실패");
				return "common/errorPage";
			}
		}
		
		// 사용자 : 벼룩시장 댓글 신고하기 
		@RequestMapping("marketReplyReport.bo")
		public String BoardReplyReport(Report rp, HttpSession session, Model model) {
				
			int result = mkService.marketReport(rp);
				
			if(result>0) {
				session.setAttribute("alertMsg", "성공적으로 댓글이 신고되었습니다.");
				return "redirect:marketList.bo";
			}else {
				model.addAttribute("errorMsg", "댓글 신고 실패");
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
