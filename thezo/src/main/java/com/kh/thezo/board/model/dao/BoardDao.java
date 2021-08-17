package com.kh.thezo.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.board.model.vo.Board;
import com.kh.thezo.board.model.vo.BoardFile;
import com.kh.thezo.board.model.vo.Reply;
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
	
	// 사용자 : 공지사항 상세조회(첨부파일)
	public BoardFile selectNoticeFile(SqlSessionTemplate sqlSession, int refBno) {
		return sqlSession.selectOne("boardMapper.selectNoticeFile", refBno);
	}
	
	// 사용자 : 공지사항 등록 
	public int insertNotice(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertNotice", b);
	}
	
	// 사용자 : 공지사항 첨부파일 등록
	public int insertNoticeFile(SqlSessionTemplate sqlSession, BoardFile bf) {
		return sqlSession.insert("boardMapper.insertNoticeFile", bf);
	}
	
	// 사용자 : 공지사항, 사내게시판 글 삭제 
	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.deleteBoard", boardNo);
	}
	
	// 사용자 : 공지사항, 사내게시판 글 수정
	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	} 
	
	// 사용자 : 공지사항, 사내게시판 글 수정(첨부파일)
	public int updateBoardFile(SqlSessionTemplate sqlSession, BoardFile bf) {
		return sqlSession.update("boardMapper.updateBoardFile", bf);
	} 
	
	// 사용자 : 공지사항 수정하기 첨부파일 재업로드용
	public int insertNoticeRefile(SqlSessionTemplate sqlSession, BoardFile bf) {
		return sqlSession.insert("boardMapper.insertNoticeRefile", bf);
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
	
	// 사용자 : 사내게시판 상세조회(첨부파일)
	public BoardFile selectBoardFile(SqlSessionTemplate sqlSession, int refBno) {
		return sqlSession.selectOne("boardMapper.selectBoardFile", refBno);
	}
		
	
	// 사용자 : 사내게시판 등록 
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}
	
	// 사용자 : 사내게시판 첨부파일 등록
	public int insertBoardFile(SqlSessionTemplate sqlSession, BoardFile bf) {
		return sqlSession.insert("boardMapper.insertBoardFile", bf);
	}

	// 사용자 : 사내게시판 첨부파일(reupfile) 등록
	public int insertBoardRefile(SqlSessionTemplate sqlSession, BoardFile bf) {
		return sqlSession.insert("boardMapper.insertBoardRefile", bf);
	}
	
	// 사용자 : 사내게시판 댓글 조회
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo){
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", boardNo);
	}
	
	// 사용자 : 사내게시판 댓글 작성
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
		}
	
	// 사용자 : 사내게시글, 댓글 신고
	public int boardReport(SqlSessionTemplate sqlSession, Report rp) {
		return sqlSession.insert("boardMapper.boardReport", rp);
	}
	
	// 사용자 : 댓글 삭제
	public int deleteBoardReply(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("boardMapper.deleteBoardReply", replyNo);
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
	
	// 신고관리 : 신고글 상세조회
	public Report selectReport(SqlSessionTemplate sqlSession, int rpCode) {
		return sqlSession.selectOne("boardMapper.selectReport", rpCode);
	}
	
	// 신고관리 : 신고글 status => Y(처리완료)
	public int reportBoardUpdate(SqlSessionTemplate sqlSession, Report r) {
		return sqlSession.update("boardMapper.reportBoardUpdate", r);
	}

	// 신고관리 : 신고 참조글 상태 N으로 변경
	public int updateBoardStatus(SqlSessionTemplate sqlSession, int rpNo) {
		return sqlSession.update("boardMapper.updateBoardStatus", rpNo);
	}
	
}
