package com.kh.thezo.attendance.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.thezo.attendance.model.service.AttendanceService;
import com.kh.thezo.attendance.model.vo.Attendance;

@Controller
public class AttendanceController{
	
	@Autowired
	private AttendanceService aService;
	
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
	
	/*
	//출근 입력
	@RequestMapping("start.att")
	public ModelAndView attStart(int memNo, HttpSession session, ModelAndView mv) {
		
		int result = aService.insertAtt(memNo);
		Attendance attData = aService.attendanceData(memNo);
		if(result > 0) {
			session.setAttribute("attData", attData);
			mv.setViewName("redirect:/");
		}else {
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	*/
	
	//main페이지 조회용
	@ResponseBody
	@RequestMapping(value="startPage.att", produces="application/json; charset=utf-8")
	public String startPage(int memNo, HttpSession session) {
		Attendance attData = aService.attendanceData(memNo);
		session.setAttribute("attData", attData);
		return new Gson().toJson(attData);			
	};
	
	
	//출근 입력
	@ResponseBody
	@RequestMapping(value="start.att", produces="application/json; charset=utf-8")
	public String attStart(int memNo, HttpSession session) {		
		aService.insertAtt(memNo);
		Attendance attData = aService.attendanceData(memNo);
		session.setAttribute("attData", attData);
		return new Gson().toJson(attData);			
	}
	
	//퇴근 입력
	@ResponseBody
	@RequestMapping(value="finish.att", produces="application/json; charset=utf-8")
	public String attFinish(int memNo, HttpSession session) {		
		aService.insertfAtt(memNo);
		Attendance attData = aService.attendanceData(memNo);		
		session.setAttribute("attData", attData);
		return new Gson().toJson(attData);			
	}
	
}
