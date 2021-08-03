package com.kh.thezo.note.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.note.model.vo.Note;

@Service
public interface NoteService {
	
	// 노트 조회
	int selectListCount(int memNo);
	ArrayList<Note> selectNoteList(PageInfo pi, int memNo);
	Note selectNote(int noteNo);
	
	// 노트 추가
	int insertNote(Note nt);
	
	// 노트 수정
	int updateNote(Note nt);
	
	// 노트 삭제
	int deleteNote(int noteNo);
	
	// 노트 검색
	int searchListCount(HashMap map);
	ArrayList<Note> searchNoteList(PageInfo pi, HashMap map);
	
	
}
