package com.kh.thezo.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.thezo.board.model.vo.Board;
import com.kh.thezo.board.model.vo.Report;
import com.kh.thezo.common.model.vo.PageInfo;

public interface BoardService {

		// 1. 사용자 : 공지사항 리스트 페이지 조회용
		int noticeListCount();
		ArrayList<Board> selectNoticeList(PageInfo pi);
		
		// 2. 사용자 : 공지사항 검색바 리스트 페이지 조회용
		public int noticeSearchListCount(HashMap<String, String> map);
		public ArrayList<Board> noticeSearchList(PageInfo pi, HashMap<String, String> map);
		
		// 3. 사용자 : 공지사항 상세조회용
		int increaseNoticeCount(int boardNo);
		Board selectNotice(int boardNo);
		
		// 4. 사용자 : 공지사항 등록용
		int insertNotice(Board b);
		
		// --------------- 사내게시판 영역 --------------------

		// 1. 사용자 : 사내게시판 리스트 페이지 조회용
		int boardListCount();
		ArrayList<Board> selectBoardList(PageInfo pi);
		
		// 2. 사용자 : 사내게시판 검색바 리스트 페이지 조회용
		public int boardSearchListCount(HashMap<String, String> map);
		public ArrayList<Board> boardSearchList(PageInfo pi, HashMap<String, String> map);
		
		// 3. 사용자 : 사내게시판 상세조회용
		int increaseBoardCount(int boardNo);
		Board selectBoard(int boardNo);
				
		
		
		// -------------------------관리자영역 ------------------------------

		// 1. 신고관리 : 신고관리 리스트 페이지 조회용
		int reportListCount();
		ArrayList<Report> selectReportList(PageInfo pi);
		
		// 2. 신고관리 : 신고관리 검색바 리스트 페이지 조회용
		public int reportSearchListCount(HashMap<String, String> map);
		public ArrayList<Report> reportSearchList(PageInfo pi, HashMap<String, String> map);
		
}