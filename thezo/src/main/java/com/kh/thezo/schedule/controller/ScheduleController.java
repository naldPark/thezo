package com.kh.thezo.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.thezo.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {
	
	
	
	// 일정관리 기능
	@RequestMapping("main.sc")
	public String scheduleMain() {
		return "schedule/scheduleMain";
	}
	
	@RequestMapping("insert.sc")
	public String insertSchedule(Schedule sc) {
		System.out.println(sc);
		return ":redirect:scheduleMain";
	}
	
	
	
	
	// 노트관리 기능
	@RequestMapping("list.note")
	public String noteList() {
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
	
	
	
	// 자원예약 기능
	@RequestMapping("myList.rez")
	public String reservationList() {
		return "schedule/reservation/myReservationView";
	}
	
	@RequestMapping("con.rez")
	public String conferenceRoom() {
		return "schedule/reservation/conferenceRezView";
	}
	
	
}
