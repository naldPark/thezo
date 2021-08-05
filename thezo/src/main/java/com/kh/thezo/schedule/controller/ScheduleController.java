package com.kh.thezo.schedule.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.thezo.schedule.model.service.ScheduleService;
import com.kh.thezo.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService scService;
	
	// 일정관리 기능
	@RequestMapping("main.sc")
	public String scheduleMain() {
		return "schedule/scheduleMain";
	}
	
	@ResponseBody
	@RequestMapping("list.sc")
	public void selectScheduleList(HttpServletResponse response) throws IOException {
		ArrayList<Schedule> list = scService.selectScheduleList();
		//System.out.println(list);
		response.setContentType("text/html; charset=utf-8");
		String result = new Gson().toJson(list);
		//System.out.println(result);
		response.getWriter().print(result);
	}
	
	/**
	 *  풀캘린더-DB 일정 조회 (화면 출력용)
	 * @throws IOException
	 */
	/*
	@ResponseBody
	@RequestMapping("scList.sc")
	public void selectScheduleList(HttpServletResponse response) throws IOException {
		ArrayList<Schedule> list = scService.selectScheduleData();
		response.setContentType("text/html; charset=utf-8");
		String result = new Gson().toJson(list);
		//System.out.println(result);
		response.getWriter().print(result);
	}
	*/
	
	/**
	 *  일정 추가
	 */
	@RequestMapping("insert.sc")
	public String insertSchedule(Schedule sc, HttpSession session) {
		System.out.println(sc);
		if(sc.getStart().contains(":")) { 
			// 날짜에 시간이 포함되어있다면 => 풀캘린더식의 하나의 문자열로 합쳐줌
			String[] startArr = sc.getStart().split(",");
			String[] endArr = sc.getEnd().split(",");
			sc.setStart(startArr[0] + "T" + startArr[1]); 
			sc.setEnd(endArr[0] + "T" + endArr[1]); 
		}else {
			// 시간이 포함되어 있지 않다면 
			// => 하루종일이 무조건 Y가 되도록 설정함
			// => 날짜뒤에 붙어있는 "," 문자를 지워주기
			sc.setAllday("Y");
			sc.setStart(sc.getStart().replace(",", ""));
			sc.setEnd(sc.getEnd().replace(",", ""));
		}
		//System.out.println(sc);
		
		int result = scService.insertSchedule(sc);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "일정이 등록되었습니다.");
			return "redirect:/main.sc";
		}else {
			session.setAttribute("alertMsg", "일정 등록에 실패했습니다.");
			return "schedule/scheduleMain";
		}
		
	}
	
	/**
	 *  일정 상세 조회
	 */
	@RequestMapping("detail.sc")
	public String selectScheduleDetail(Model model, int scNo) {
		Schedule sc = scService.selectScheduleDetail(scNo);
		model.addAttribute("sc", sc);
		return "schedule/scheduleDetailView";
	}
	
	/**
	 * 	일정 수정 양식 화면
	 */
	@RequestMapping("updateForm.sc")
	public String ScheduleUpdateForm(Model model, @RequestParam(value="scNo") int scNo) {
		Schedule sc = scService.selectScheduleDetail(scNo);
		model.addAttribute("sc", sc);
		return "schedule/scheduleUpdateForm";
	}
	
	/**
	 *  일정 삭제
	 */
	@RequestMapping("delete.sc")
	public String deleteSchedule(@RequestParam(value="scNo") int scNo, HttpSession session) {
		int result = scService.deleteSchedule(scNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "해당 일정이 삭제되었습니다.");
			return "schedule/scheduleMain";
		} else {
			return "schedule/scheduleMain";
		}
		
	}
	
	@RequestMapping("update.sc")
	public String updateSchedule(Schedule sc, HttpSession session) {
		if(sc.getStart().contains(":")) { 
			// 날짜에 시간이 포함되어있다면 => 풀캘린더식의 하나의 문자열로 합쳐줌
			String[] startArr = sc.getStart().split(",");
			String[] endArr = sc.getEnd().split(",");
			sc.setStart(startArr[0] + "T" + startArr[1]); 
			sc.setEnd(endArr[0] + "T" + endArr[1]); 
		}else {
			// 시간이 포함되어 있지 않다면 
			// => 하루종일이 무조건 Y가 되도록 설정함
			// => 날짜뒤에 붙어있는 "," 문자를 지워주기
			sc.setAllday("Y");
			sc.setStart(sc.getStart().replace(",", ""));
			sc.setEnd(sc.getEnd().replace(",", ""));
		}
		System.out.println(sc);
		int result = scService.updateSchedule(sc);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "일정이 수정되었습니다.");
			return "schedule/scheduleMain";
		}else {
			session.setAttribute("alertMsg", "일정 수정에 실패했습니다. 다시 시도해주세요.");
			return "schedule/scheduleMain";
		}
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
