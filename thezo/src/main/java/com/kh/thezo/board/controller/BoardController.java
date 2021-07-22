package com.kh.thezo.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	// 공지사항 리스트 페이지(사용자)
	@RequestMapping("noticeList.bo")
	public String selectNoticeList() {
		return "board/noticeListView";
	}
	
	// 공지사항 작성하기 페이지(사용자)
	@RequestMapping("noticeEnrollForm.bo")
	public String noticeEnrollForm() {
		return "board/noticeEnrollForm";
	}
	
	// 사내게시판 리스트 페이지(사용자)
	@RequestMapping("boardList.bo")
	public String selectBoardList() {
		return "board/boardListView";
	}
	
	// 공지사항 작성하기 페이지(사용자)
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
