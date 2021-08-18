package com.kh.thezo.attendance.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.thezo.attendance.model.service.AttendanceService;
import com.kh.thezo.attendance.model.vo.Attendance;
import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.common.template.Pagination;
import com.kh.thezo.department.model.service.DepartmentService;
import com.kh.thezo.department.model.vo.Department;
import com.kh.thezo.leave.model.vo.Leave;
import com.kh.thezo.member.model.vo.Member;

@Controller
public class AttendanceController{
	
	@Autowired
	private AttendanceService aService;
	@Autowired
	private DepartmentService dService;
	
	@RequestMapping("attendance.ma")
	public String attendance() {
		return "attendance/attendanceView";
	}
	
	//부서관리 페이지(관리자)
	@RequestMapping("adminDept.ma")
	public String deptManage(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		int listCount = dService.departmentListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Department> list = dService.selectDepartment(pi);
	
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "attendance/adminDeptManage";
	}
	
	//근태관리 페이지(관리자)
	@RequestMapping("adminAtt.ma")
	public String attManage(Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		int listCount = aService.memberListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Member> list = aService.selectMember(pi);
		ArrayList<Leave> lData = aService.selectLeaveData(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("lData", lData);
		
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
	
	// 휴가 내역 수정
	@RequestMapping("leaveSet.att")
	public String leaveSet(Member m, HttpSession session) {
		int result = aService.setLeave(m);
		System.out.println(m);
		System.out.println(result);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다");
			return "redirect:adminAtt.ma";
		}else {
			session.setAttribute("errorMsg", "수정 실패");
			return "redirect:adminAtt.ma";
		}
	}
	
	
	/*휴가 내역 조회(차후)
	@ResponseBody
	@RequestMapping(value="history.att", produces="application/json; charset=utf-8")
	public String attHistory(int memNo, HttpSession session) {
		int listCount = aService.leaveListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Member> list = aService.selectMember(pi);
		ArrayList<Leave> lData = aService.selectLeaveData(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("lData", lData);
		
		return "attendance/adminAttManage";
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		Leave lData = aService.selectLeaveData2(memNo);
		session.setAttribute("lData", lData);
		return new Gson().toJson(lData);
	}
	*/
	
	
	
	
}
