package com.kh.thezo.note.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.note.model.vo.Note;

@Repository
public class NoteDao {
	
	public int selectListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("noteMapper.selectListCount");
	}
	
	public ArrayList<Note> selectNoteList(PageInfo pi, SqlSession sqlSession){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("noteMapper.selectNoteList", null, rowBounds);
	}
	
}
