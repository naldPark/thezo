package com.kh.thezo.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.thezo.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {

	@RequestMapping("main.sc")
	public String scheduleMain() {
		return "schedule/scheduleMain";
	}
	
	@RequestMapping("insert.sc")
	public String insertSchedule(Schedule sc) {
		System.out.println(sc);
		return ":redirect:scheduleMain";
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
