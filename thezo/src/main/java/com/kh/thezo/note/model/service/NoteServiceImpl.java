package com.kh.thezo.note.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.note.model.dao.NoteDao;
import com.kh.thezo.note.model.vo.Note;

@Service
public class NoteServiceImpl implements NoteService{
	
	@Autowired
	private NoteDao nDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount(int memNo) {
		return nDao.selectListCount(sqlSession, memNo);
	}
	@Override
	public ArrayList<Note> selectNoteList(PageInfo pi, int memNo) {
		return nDao.selectNoteList(sqlSession, pi, memNo);
	}
	@Override
	public Note selectNote(int noteNo) {
		return nDao.selectNote(sqlSession, noteNo);
	}
	@Override
	public int insertNote(Note nt) {
		return nDao.insertNote(sqlSession, nt);
	}
	@Override
	public int updateNote(Note nt) {
		return nDao.updateNote(sqlSession, nt);
	}
	@Override
	public int deleteNote(int noteNo) {
		return nDao.deleteNote(sqlSession, noteNo);
	}
	@Override
	public int searchListCount(HashMap map) {
		return nDao.searchListCount(sqlSession, map);
	}
	@Override
	public ArrayList<Note> searchNoteList(PageInfo pi, HashMap map) {
		return nDao.searchNoteList(sqlSession, pi, map);
	}
}
