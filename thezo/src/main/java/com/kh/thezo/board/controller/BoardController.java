package com.kh.thezo.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.thezo.board.model.service.BoardService;
import com.kh.thezo.board.model.vo.Board;
import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.common.template.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	
	// 공지사항 리스트 페이지(사용자)
	@RequestMapping("noticeList.bo")
	public String selectNoticeList(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = bService.noticeListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Board> list = bService.selectNoticeList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "board/noticeListView";
	}
	
	// 공지사항 리스트페이지 검색바 (사용자)
	@RequestMapping("noticeSearch.bo")
	public ModelAndView noticeSearchList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
										 String condition, String keyword) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = bService.noticeSearchListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Board> list = bService.noticeSearchList(pi, map);
		
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("board/noticeListView");
		
		return mv;
		
	}
	
	// 공지사항 상세조회(사용자)
	@RequestMapping("noticeDetail.bo")
	public ModelAndView noticeDetail(int bno, ModelAndView mv) {
		int result = bService.increaseNoticeCount(bno);
		
		if(result>0) { 
			Board b = bService.selectNotice(bno); 
			mv.addObject("b", b).setViewName("board/noticeDetailView");
			
		}else {
			mv.addObject("errorMsg", "상세조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	
	// 공지사항 작성하기 페이지(사용자)
	@RequestMapping("noticeEnrollForm.bo")
	public String noticeEnrollForm() {
		return "board/noticeEnrollForm";
	}
	
	
	// -------------------- 사내게시판 영역 --------------------------
	// 사내게시판 리스트 페이지(사용자)
	@RequestMapping("boardList.bo")
	public String selectBoardList(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = bService.boardListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Board> list = bService.selectBoardList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "board/boardListView";
	}
	
	
	// 사내게시판 리스트페이지 검색바 (사용자)
	@RequestMapping("boardSearch.bo")
	public ModelAndView boardSearchList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
										 String condition, String keyword) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = bService.boardSearchListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Board> list = bService.boardSearchList(pi, map);
		
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("board/boardListView");
		
		return mv;
		
	}
	
	
	// 사내게시판 작성하기 페이지(사용자)
	@RequestMapping("boardEnrollForm.bo")
	public String boardEnrollForm() {
		return "board/boardEnrollForm";
	}
	
	// 게시판 신고관리(관리자)
	@RequestMapping("boardReport.bo")
	public String boardReportList() {
		return "board/boardReport";
	}
	
}
