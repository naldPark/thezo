package com.kh.thezo.note.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.common.template.Pagination;
import com.kh.thezo.note.model.service.NoteService;
import com.kh.thezo.note.model.vo.Note;

@Controller
public class NoteController {
	
	@Autowired
	private NoteService ntService; 
	
	/**
	 *  노트 리스트 목록 조회
	 */
	@RequestMapping("list.note")
	public String selectNoteList(Model model,
			@RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		int listCount = ntService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 4);
		ArrayList<Note> list = ntService.selectNoteList(pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "schedule/note/noteListView";
	}
	
	@RequestMapping("insertForm.note")
	public String noteInsertForm() {
		return "schedule/note/noteInsertView";
	}
	
	@RequestMapping("insert.note")
	public String insertNote() {
		return "";
	}
	
	@RequestMapping("detail.note")
	public String selectNoteDetail() {
		return "schedule/note/noteDetailView";
	}
	
	@RequestMapping("update.note")
	public String updateNote() {
		return ":redirect:noteDetailView";
	}
}
