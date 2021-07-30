package com.kh.thezo.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.board.model.dao.BoardDao;
import com.kh.thezo.board.model.vo.Board;
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

	
}
