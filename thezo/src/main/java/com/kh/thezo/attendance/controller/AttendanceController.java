package com.kh.thezo.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AttendanceController{
	
	@RequestMapping("attendance.ma")
	public String attendanceMonthly() {
		return "attendance/attendanceMonthly";
	}
	
}
