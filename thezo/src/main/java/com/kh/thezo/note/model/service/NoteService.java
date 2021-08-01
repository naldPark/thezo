package com.kh.thezo.note.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.note.model.vo.Note;

@Service
public interface NoteService {
	
	// 노트 조회
	int selectListCount();
	ArrayList<Note> selectNoteList(PageInfo pi);
	Note selectNote();
	
	// 노트 추가
	int insertNote();
	
	// 노트 수정
	int updateNote();
	
	// 노트 삭제
	int deleteNote();
	
	
}
