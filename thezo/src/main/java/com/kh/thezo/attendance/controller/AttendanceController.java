package com.kh.thezo.attendance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AttendanceController{
	
	@RequestMapping("attendance.ma")
	public String attendance() {
		return "attendance/attendanceView";
	}
	
	@RequestMapping("adminDept.ma")
	public String deptManage() {
		return "attendance/adminDeptManage";
	}
	
	@RequestMapping("adminAtt.ma")
	public String attManage() {
		return "attendance/adminAttManage";
	}
	
	
}
