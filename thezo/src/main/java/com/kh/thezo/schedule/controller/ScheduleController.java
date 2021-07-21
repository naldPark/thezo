package com.kh.thezo.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheduleController {

	@RequestMapping("main.sc")
	public String scheduleMain() {
		return "schedule/scheduleMain";
	}
	
	@RequestMapping("list.nt")
	public String noteList() {
		return "schedule/note/noteListView";
	}
	
	@RequestMapping("myList.rez")
	public String reservationList() {
		return "schedule/reservation/myReservationView";
		
		
	}
	
	@RequestMapping("con.rez")
	public String conferenceRoom() {
		return "schedule/reservation/conferenceRezView";
	}
	
	
}
