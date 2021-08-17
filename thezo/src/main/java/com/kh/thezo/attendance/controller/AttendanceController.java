package com.kh.thezo.attendance.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	// (날드)관리자 : 근태조정신청내역 조회
		@RequestMapping("adminAttFixRequest.ma")
		public ModelAndView selectAdminFixRequestList(HttpSession session,ModelAndView mv
				, @RequestParam(value="currentPage", defaultValue="1") int currentPage
				, @RequestParam(value="startDate", defaultValue="1999-01-01") String startDate
				, @RequestParam(value="endDate", defaultValue="2999-12-31") String endDate) {
			Member m = (Member) session.getAttribute("loginUser");
			if (m != null) {
				HashMap<String,String> searchDate = new HashMap<>();
				searchDate.put("startDate", startDate);
				searchDate.put("endDate", endDate);
				int requestCount = aService.selectAdminFixRequestListCount(searchDate);
				PageInfo requestPi = Pagination.getPageInfo(requestCount, currentPage, 10, 5);
				ArrayList<Attendance> requestList = aService.selectAdminFixRequestList(searchDate, requestPi);
				mv.addObject("requestList", requestList)
				.addObject("pi", requestPi)
				.setViewName("attendance/adminAttMngRequestFix");
			} else {
				mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
	
		// (날드)관리자 : 근태조정신청 insert
		@RequestMapping("updateAdminFixRequest.ma")
		public ModelAndView updateAdminFixRequest(HttpSession session,ModelAndView mv
				, Attendance a) {
			Member m = (Member) session.getAttribute("loginUser");
			if (m != null) {
				int result = aService.updateAdminFixRequest(a);
				if (result > 0) { // 성공
					session.setAttribute("alertMsg", "성공적으로 등록 되었습니다.");
					mv.setViewName("redirect:adminAttFixRequest.ma");
				} else {
					mv.addObject("errorMsg", "작성에 실패했습니다");
					mv.setViewName("common/errorPage");
				}
			} else {
				mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
				mv.setViewName("common/errorPage");
			}
			return mv;

		}
	
	
}
