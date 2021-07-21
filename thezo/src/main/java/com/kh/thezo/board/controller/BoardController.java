package com.kh.thezo.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	// 공지사항 리스트 페이지
	@RequestMapping("noticeList.bo")
	public String selectNoticeList() {
		return "board/noticeListView";
	}
	
	// 공지사항 작성하기 페이지
	@RequestMapping("noticeEnrollForm.bo")
	public String noticeEnrollForm() {
		return "board/noticeEnrollForm";
	}
	
	// 사내게시판 리스트 페이지
	@RequestMapping("boardList.bo")
	public String selectBoardList() {
		return "board/boardListView";
	}
	
	// 공지사항 작성하기 페이지
	@RequestMapping("boardEnrollForm.bo")
	public String boardEnrollForm() {
		return "board/boardEnrollForm";
	}
	
}
