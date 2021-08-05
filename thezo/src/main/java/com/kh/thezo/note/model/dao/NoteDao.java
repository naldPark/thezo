package com.kh.thezo.note.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.note.model.vo.Note;

@Repository
public class NoteDao {
	
	public int selectListCount(SqlSession sqlSession, int memNo) {
		return sqlSession.selectOne("noteMapper.selectListCount", memNo);
	}
	
	public ArrayList<Note> selectNoteList(SqlSession sqlSession, PageInfo pi, int memNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("noteMapper.selectNoteList", memNo, rowBounds);
	}
	
	public Note selectNote(SqlSession sqlSession, int noteNo) {
		return sqlSession.selectOne("noteMapper.selectNote", noteNo);
	}
	
	public int insertNote(SqlSession sqlSession, Note nt) {
		return sqlSession.insert("noteMapper.insertNote", nt);
	}
	
	public int updateNote(SqlSession sqlSession, Note nt) {
		return sqlSession.update("noteMapper.updateNote", nt);
	}
	
	public int deleteNote(SqlSession sqlSession, int noteNo) {
		return sqlSession.update("noteMapper.deleteNote", noteNo);
	}
	
	public int searchListCount(SqlSession sqlSession, HashMap map) {
		return sqlSession.selectOne("noteMapper.searchListCount", map);
	}
	
	public ArrayList<Note> searchNoteList(SqlSession sqlSession, PageInfo pi, HashMap map){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("noteMapper.searchNoteList", map, rowBounds);
	}
}
