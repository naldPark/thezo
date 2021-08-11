package com.kh.thezo.note.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.common.template.Pagination;
import com.kh.thezo.note.model.service.NoteService;
import com.kh.thezo.note.model.vo.Note;
import com.kh.thezo.schedule.model.service.ScheduleService;
import com.kh.thezo.schedule.model.vo.Schedule;

@Controller
public class NoteController {
	
	@Autowired
	private NoteService ntService; 
	
	@Autowired
	private ScheduleService scService;
	
	/**
	 *  노트 리스트 목록 조회
	 */
	@RequestMapping("list.note")
	public String selectNoteList(Model model, int memNo,
			@RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		int listCount = ntService.selectListCount(memNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 4);
		ArrayList<Note> list = ntService.selectNoteList(pi, memNo);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "schedule/note/noteListView";
	}
	
	/**
	 *  노트 상세 조회
	 */
	@RequestMapping("detail.note")
	public String selectNoteDetail(int noteNo, Model model) {
		Note nt = ntService.selectNote(noteNo);
		Schedule sc = scService.selectScheduleDetail(nt.getScNo());
		
		sc.setStart(sc.getStart().replace("T"," "));
		sc.setEnd(sc.getEnd().replace("T"," "));
		
		model.addAttribute("sc", sc);
		model.addAttribute("nt", nt);
		return "schedule/note/noteDetailView";
	}
	
	/**
	 * 노트작성 양식 화면
	 */
	@RequestMapping("insertForm.note")
	public String noteInsertForm(String memNo, Model model) {
		HashMap map = new HashMap();
		int scWriter = Integer.parseInt(memNo);
		map.put("memNo", memNo);
		ArrayList<Schedule> scList = scService.selectScheduleList(map);
		for(int i=0; i<scList.size(); i++) {
			scList.get(i).setStart(scList.get(i).getStart().replace("T"," "));
			scList.get(i).setEnd(scList.get(i).getEnd().replace("T"," "));
		}
		model.addAttribute("scList", scList);
		return "schedule/note/noteInsertView";
	}
	
	/**
	 * 노트 작성
	 */
	@RequestMapping("insert.note")
	public String insertNote(Note nt, HttpSession session) {
		int result = ntService.insertNote(nt);
		if(result > 0) {
			session.setAttribute("alertMsg", "노트 작성이 완료되었습니다");
			return "redirect:/list.note?memNo=" + nt.getNoteWriter();
		}else {
			session.setAttribute("alertMsg", "노트 작성 실패! 다시 시도해주세요.");
			return "redirect:/list.note?memNo=" + nt.getNoteWriter();
		}
	}
	
	/**
	 *  노트 수정
	 */
	@RequestMapping("update.note")
	public String updateNote(Note nt, HttpSession session) {
		int result = ntService.updateNote(nt);
		session.setAttribute("alertMsg", "저장되었습니다.");
		return "redirect:/detail.note?noteNo=" + nt.getNoteNo();
	}
	
	/**
	 *  노트 삭제
	 */
	@RequestMapping("delete.note")
	public String deleteNote(int noteNo, int memNo, HttpSession session) {
		int result = ntService.deleteNote(noteNo);
		session.setAttribute("alertMsg", "삭제되었습니다.");
		return "redirect:/list.note?memNo=" + memNo;
	}
	
	@RequestMapping("search.note")
	public String searchNoteList(String condition, String keyword, String noteWriter, Model model,
			@RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		HashMap map = new HashMap();
		map.put("noteWriter", noteWriter);
		map.put("condition", condition);
		map.put("keyword", keyword);
		int listCount = ntService.searchListCount(map);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 4, 10);
		ArrayList<Note> list = ntService.searchNoteList(pi, map);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return "schedule/note/noteListView";
	}

}
