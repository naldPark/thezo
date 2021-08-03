package com.kh.thezo.board.controller;

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

import com.kh.thezo.board.model.service.BoardService;
import com.kh.thezo.board.model.vo.Board;
import com.kh.thezo.board.model.vo.BoardFile;
import com.kh.thezo.board.model.vo.Report;
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
			BoardFile bf = bService.selectNoticeFile(bno);
			Board b = bService.selectNotice(bno); 
			
			mv.addObject("b", b).addObject("bf", bf).setViewName("board/noticeDetailView");
			
		}else {
			mv.addObject("errorMsg", "상세조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	// 공지사항 작성하기 페이지 포워딩(사용자)
	@RequestMapping("noticeEnrollForm.bo")
	public String noticeEnrollForm() {
		return "board/noticeEnrollForm";
	}
	
	
	// 공지사항 등록하기(사용자)
	@RequestMapping("noticeInsert.bo")
	public String insertboard(int memNo, Board b, BoardFile bf, MultipartFile upfile, HttpSession session, Model model) {
	
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(session, upfile); 
			bf.setOriginName(upfile.getOriginalFilename());  
			bf.setChangeName(changeName); 
		}
		
		int result = bService.insertNotice(b);
		
		if(result > 0 ) {
				bService.insertNoticeFile(bf);
				session.setAttribute("alertMsg", "성공적으로 공지사항이 등록되었습니다.");
				return "redirect:noticeList.bo";
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
	
	// 사내게시판 상세조회(사용자)
	@RequestMapping("boardDetail.bo")
	public ModelAndView boardDetail(int bno, ModelAndView mv) {
		int result = bService.increaseBoardCount(bno);
		
		if(result>0) { 
			Board b = bService.selectBoard(bno); 
			mv.addObject("b", b).setViewName("board/boardDetailView");
			
		}else {
			mv.addObject("errorMsg", "상세조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	// 사내게시판 작성하기 페이지(사용자)
	@RequestMapping("boardEnrollForm.bo")
	public String boardEnrollForm() {
		return "board/boardEnrollForm";
	}
	
	
	
	
	
	// ----------------------- 관리자 영역 --------------------------------------
	// 게시판 신고관리(관리자)
	@RequestMapping("boardReport.bo")
	public String boardReportList(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = bService.reportListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Report> list = bService.selectReportList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "board/boardReport";
	}
	
	// 신고관리 리스트페이지 검색바 (관리자)
	@RequestMapping("reportSearch.bo")
	public ModelAndView reportSearchList(ModelAndView mv, @RequestParam(value="currentPage", defaultValue="1") int currentPage,
										 String condition, String keyword) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		
		int listCount = bService.reportSearchListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Report> list = bService.reportSearchList(pi, map);
		
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("condition", condition)
		  .setViewName("board/boardListView");
		
		return mv;
		
	}
	
}
