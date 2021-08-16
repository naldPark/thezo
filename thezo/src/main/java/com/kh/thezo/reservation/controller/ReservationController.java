package com.kh.thezo.reservation.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.thezo.reservation.model.service.ReservationService;
import com.kh.thezo.reservation.model.vo.Reservation;
import com.kh.thezo.reservation.model.vo.Resources;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService rService;
	
	/**
	 * 자원예약 페이지 (풀캘린더)
	 */
	@RequestMapping("main.rez")
	public String reservationMainView(Model model) {
		ArrayList<Resources> reList = rService.selectResourceList();
		model.addAttribute("reList", reList);
		return "schedule/reservation/conferenceRezView";
	}
	
	/**
	 *  나의 예약 목록 조회
	 */
	@RequestMapping("myList.rez")
	public String reservationList() {
		return "schedule/reservation/myReservationView";
	}
	
	
	/**
	 *  자원 전체 조회 ajax
	 */
	@ResponseBody
	@RequestMapping("select.re")
	public void selectResourceList(HttpServletResponse response) throws IOException {
		ArrayList<Resources> reList = rService.selectResourceList();
		response.setContentType("text/html; charset=utf-8");
		String result = new Gson().toJson(reList);
		response.getWriter().print(result);
	}
	
	/**
	 *  자원예약 전체 조회 ajax
	 */
	@ResponseBody
	@RequestMapping("select.rez")
	public void selectReservation(HttpServletResponse response) throws IOException {
		ArrayList<Reservation> rezList = rService.selectReservationList();
		response.setContentType("text/html; charset=utf-8");
		String result = new Gson().toJson(rezList);
		response.getWriter().print(result);
	}
	
	/**
	 *  자원예약 상세 조회
	 */
	@RequestMapping("detail.rez")
	public String selectReservationDetail(Model model, int rezNo) {
		Reservation rez = rService.selectReservationDetail(rezNo);
		model.addAttribute("rez", rez);
		System.out.println(rez);
		return "schedule/reservation/rezDetailView";
	}
	
	/**
	 *  자원예약 등록
	 */
	@RequestMapping("insert.rez")
	public String insertReservation(HttpSession session, Reservation rez) {
		int result = rService.insertReservation(rez);
		if(result > 0) {
			session.setAttribute("alertMsg", "자원 예약이 완료되었습니다.");
			return "redirect:/main.rez";
		}else {
			session.setAttribute("alertMsg", "자원 예약이 실패했습니다. 다시 시도해주세요.");
			return "redirect:/main.rez";
		}
	}
	
	@RequestMapping("updateForm.rez")
	public String updateForm(int rezNo, Model model) {
		Reservation rez = rService.selectReservationDetail(rezNo);
		ArrayList<Resources> reList = rService.selectResourceList();
		model.addAttribute("rez", rez);
		model.addAttribute("reList", reList);
		
		return "schedule/reservation/rezUpdateForm";
	}
	
	
	/**
	 *  자원예약 수정
	 */
	@RequestMapping("update.rez")
	public String updateReservation() {
		return "";
	}
	
	/**
	 *  자원예약 삭제
	 */
	@RequestMapping("delete.rez")
	public String deleteReservation() {
		return "";
	}
	
	
	
	
}
