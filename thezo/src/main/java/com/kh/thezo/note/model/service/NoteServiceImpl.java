package com.kh.thezo.note.model.service;

import java.util.ArrayList;

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
	public int selectListCount() {
		return nDao.selectListCount(sqlSession);
	}
	@Override
	public ArrayList<Note> selectNoteList(PageInfo pi) {
		return nDao.selectNoteList(pi, sqlSession);
	}
	@Override
	public Note selectNote() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int insertNote() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int updateNote() {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteNote() {
		// TODO Auto-generated method stub
		return 0;
	}
}
