package com.kh.thezo.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.board.model.vo.Board;
import com.kh.thezo.board.model.vo.Report;
import com.kh.thezo.common.model.vo.PageInfo;

@Repository
public class BoardDao {

	
	// 사용자 : 공지사항 글 갯수 조회
	public int noticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.noticeListCount");
	}
	
	// 사용자 : 공지사항 리스트 조회
	public ArrayList<Board> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset =(pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectNoticeList", null , rowBounds );
	}
	
	// 사용자 : 공지사항 리스트 검색바 
	public int noticeSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.noticeSearchListCount", map);
	}
	
	// 사용자 : 공지사항 리스트 검색바 
	public ArrayList<Board> noticeSearchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.noticeSearchList", map, rowBounds);
	}
	
	// 사용자 : 공지사항 상세 조회용(조회수)
	public int increaseNoticeCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.increaseNoticeCount", boardNo);
	}
		
	// 사용자 : 공지사항 상세 조회
	public Board selectNotice(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectNotice", boardNo);
	}
	
	// 사용자 : 공지사항 등록 
	public int insertNotice(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertNotice", b);
	}
	
	
	
	// ------------------------  사내게시판 영역  ----------------------------
	
	// 사용자 : 사내게시판 글 총 갯수 
	public int boardListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.boardListCount");
	}
	
	// 사용자 : 사내게시판 리스트 조회
	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset =(pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectBoardList", null , rowBounds );
	}
	
	// 사용자 : 사내게시판 리스트 검색바 
	public int boardSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.boardSearchListCount", map);
	}
	
	// 사용자 : 사내게시판 리스트 검색바 
	public ArrayList<Board> boardSearchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.boardSearchList", map, rowBounds);
	}
	
	// 사용자 : 사내게시판 상세 조회용(조회수)
	public int increaseBoardCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.increaseBoardCount", boardNo);
	}
		
	// 사용자 : 사내게시판 상세 조회
	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
	}
	
	
	
	// ----------------------- 관리자 영역 ---------------------------
	
	// 신고관리 : 신고글 갯수 조회
	public int reportListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.reportListCount");
	}
	
	// 신고관리  : 신고글 리스트 조회 
	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset =(pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectReportList", null , rowBounds );
	}
	
	// 신고관리 : 신고글 리스트 검색바 
	public int reportSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("boardMapper.reportSearchListCount", map);
	}
	
	// 신고관리 : 신고글 리스트 검색바 
	public ArrayList<Report> reportSearchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.reportSearchList", map, rowBounds);
	}	
	
	
	
}
