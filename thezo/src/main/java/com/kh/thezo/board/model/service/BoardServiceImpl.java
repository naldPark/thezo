package com.kh.thezo.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.board.model.dao.BoardDao;
import com.kh.thezo.board.model.vo.Board;
import com.kh.thezo.board.model.vo.Report;
import com.kh.thezo.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao bDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 사용자 : 공지사항 글 갯수 조회
	@Override
	public int noticeListCount() {
		return bDao.noticeListCount(sqlSession);
	}

	// 사용자 : 공지사항 리스트 조회
	@Override
	public ArrayList<Board> selectNoticeList(PageInfo pi) {
		return bDao.selectNoticeList(sqlSession, pi);
	}

	// 사용자 : 공지사항 리스트 검색바 
	@Override
	public int noticeSearchListCount(HashMap<String, String> map) {
		return bDao.noticeSearchListCount(sqlSession, map);
	}

	// 사용자 : 공지사항 리스트 검색바 
	@Override
	public ArrayList<Board> noticeSearchList(PageInfo pi, HashMap<String, String> map) {
		return bDao.noticeSearchList(sqlSession, pi, map);
	}

	// 사용자 : 공지사항 상세 조회용(조회수)
	@Override
	public int increaseNoticeCount(int boardNo) {
		return bDao.increaseNoticeCount(sqlSession,boardNo);
	}

	// 사용자 : 공지사항 상세 조회
	@Override
	public Board selectNotice(int boardNo) {
		return bDao.selectNotice(sqlSession, boardNo);
	}
	
	// 사용자 : 공지사항 등록 
	@Override
	public int insertNotice(Board b) {
		return bDao.insertNotice(sqlSession, b);
	}

	
	// --------------- 사내게시판 영역 --------------------
	
	// 사용자 : 사내게시판 글 갯수 조회
	@Override
	public int boardListCount() {
		return bDao.boardListCount(sqlSession);
	}

	// 사용자 : 사내게시판 리스트 조회
	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi) {
		return bDao.selectBoardList(sqlSession, pi);
	}

	// 사용자 : 사내게시판  리스트 검색바 
	@Override
	public int boardSearchListCount(HashMap<String, String> map) {
		return bDao.boardSearchListCount(sqlSession, map);
	}

	// 사용자 : 사내게시판  리스트 검색바 
	@Override
	public ArrayList<Board> boardSearchList(PageInfo pi, HashMap<String, String> map) {
		return bDao.boardSearchList(sqlSession, pi, map);
	}

	// 사용자 : 사내게시판 상세 조회용(조회수)
	@Override
	public int increaseBoardCount(int boardNo) {
		return bDao.increaseBoardCount(sqlSession, boardNo);
	}

	// 사용자 : 사내게시판 상세 조회
	@Override
	public Board selectBoard(int boardNo) {
		return bDao.selectBoard(sqlSession, boardNo);
	}
	
	
	// ----------------------- 관리자 영역 ---------------------------
	
	// 신고관리 : 신고글 갯수 조회
	@Override
	public int reportListCount() {
		return bDao.reportListCount(sqlSession);
	}

	// 신고관리  : 신고글 리스트 조회 
	@Override
	public ArrayList<Report> selectReportList(PageInfo pi) {
		return bDao.selectReportList(sqlSession, pi);
	}
	
	// 신고관리 : 신고글 리스트 검색바 
	@Override
	public int reportSearchListCount(HashMap<String, String> map) {
		return bDao.reportSearchListCount(sqlSession, map);
	}

	// 신고관리 : 신고글 리스트 검색바
	@Override
	public ArrayList<Report> reportSearchList(PageInfo pi, HashMap<String, String> map) {
		return bDao.reportSearchList(sqlSession, pi, map);
	}

	
}
