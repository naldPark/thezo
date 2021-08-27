package com.kh.thezo.reservation.controller;

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

import com.google.gson.Gson;
import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.common.template.Pagination;
import com.kh.thezo.reservation.model.service.ReservationService;
import com.kh.thezo.reservation.model.vo.ReCategory;
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
	public String reservationMainView(Model model, int caNo) {
		ArrayList<Resources> reList = rService.selectResourceList(caNo);
		ArrayList<ReCategory> caList = rService.selectCategoryList();
		model.addAttribute("caList", caList);
		model.addAttribute("reList", reList);
		model.addAttribute("caNo", caNo);
		return "schedule/reservation/rezMainView";
	}
	
	/**
	 *  나의 예약 목록 조회
	 */
	@RequestMapping("myList.rez")
	public String reservationList(Model model, int memNo,
			@RequestParam(value="currentPage", defaultValue="1")int currentPage) {
		int caNo = 0;
		int listCount = rService.selectListCount(memNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<ReCategory> caList = rService.selectCategoryList();
		ArrayList<Reservation> myRezList = rService.selectMyReservationList(pi, memNo);
		ArrayList<Resources> reList = rService.selectResourceList(caNo);
		
		model.addAttribute("reList", reList);
		model.addAttribute("pi", pi);
		model.addAttribute("caList", caList);
		model.addAttribute("myRezList", myRezList);
		
		return "schedule/reservation/myReservationView";
	}
	
	
	/**
	 *  자원 전체 조회 ajax
	 */
	@ResponseBody
	@RequestMapping("select.re")
	public void selectResourceList(HttpServletResponse response, int caNo) throws IOException {
		ArrayList<Resources> reList = rService.selectResourceList(caNo);
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
		return "schedule/reservation/rezDetailView";
	}
	
	/**
	 *  자원예약 등록
	 */
	@RequestMapping("insert.rez")
	public String insertReservation(HttpSession session, Reservation rez, int caNo) {
		int result = rService.insertReservation(rez);
		if(result > 0) {
			session.setAttribute("alertMsg", "자원 예약이 완료되었습니다.");
			return "redirect:/main.rez?caNo=" + caNo;
		}else {
			session.setAttribute("alertMsg", "자원 예약이 실패했습니다. 다시 시도해주세요.");
			return "redirect:/main.rez?caNo="+ caNo;
		}
	}
	
	@RequestMapping("updateForm.rez")
	public String updateForm(int rezNo, Model model, int caNo) {
		Reservation rez = rService.selectReservationDetail(rezNo);
		ArrayList<Resources> reList = rService.selectResourceList(caNo);
		model.addAttribute("rez", rez);
		model.addAttribute("reList", reList);
		
		return "schedule/reservation/rezUpdateForm";
	}
	
	
	/**
	 *  자원예약 수정
	 */
	@RequestMapping("update.rez")
	public String updateReservation(Reservation rez, HttpSession session) {
		int result = rService.updateReservation(rez);
		session.setAttribute("alertMsg", "수정이 완료되었습니다.");
		return "schedule/quitView";
	}
	
	/**
	 *  자원예약 삭제
	 */
	@RequestMapping("delete.rez")
	public String deleteReservation(int rezNo, HttpSession session) {
		int result = rService.deleteReservation(rezNo);
		session.setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
		return "schedule/quitView";
	}
	
	/**
	 *  자원예약 삭제(예약 목록)
	 */
	@RequestMapping("delete2.rez")
	public String deleteReservation2(int rezNo, int memNo, HttpSession session) {
		int result = rService.deleteReservation(rezNo);
		session.setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
		return "redirect:/myList.rez?memNo=" + memNo;
	}
	
	/**
	 *  자원관리 페이지 (관리자메뉴)
	 */
	@RequestMapping("manage.rez")
	public String selectResourcesManage(Model model){
		ArrayList<ReCategory> caList = rService.selectCategoryList();
		//ArrayList<Resources> reList = rService.selectResourceList(caNo);
		model.addAttribute("caList", caList);
		//model.addAttribute("reList", reList);
		return "schedule/reservation/rezManagementView";
	}
	
	/**
	 *  자원관리 카테고리명/자원명 수정
	 */
	@RequestMapping("update.reca")
	public String updateReCategory(Resources re, String changeCaName, HttpSession session) {
		re.setCategoryName(changeCaName);
		int result = rService.updateReCategory(re);
		if(result > 0) {
			session.setAttribute("alertMsg", "이름을 변경했습니다.");
			return "redirect:/manage.rez";
		}else {
			session.setAttribute("alertMsg", "이름 변경을 실패했습니다.");
			return "redirect:/manage.rez";
		}
	}
	
	@RequestMapping("update.re")
	public String updateResource(Resources re, String changeReName, HttpSession session) {
		re.setResourceName(changeReName);
		int result = rService.updateResource(re);
		if(result > 0) {
			session.setAttribute("alertMsg", "이름을 변경했습니다.");
			return "redirect:/manage.rez";
		}else {
			session.setAttribute("alertMsg", "이름 변경을 실패했습니다.");
			return "redirect:/manage.rez";
		}
	}
	
	/**
	 *  카테고리/ 자원 추가
	 */
	@RequestMapping("insert.reca")
	public String insertReCategory(Resources re, HttpSession session) {
		int result = rService.insertReCategory(re);
		if(result > 0) {
			session.setAttribute("alertMsg", "카테고리를 추가했습니다.");
			return "redirect:/manage.rez";
		}else {
			session.setAttribute("alertMsg", "카테고리 추가를 실패했습니다.");
			return "redirect:/manage.rez";
		}
	}
	@RequestMapping("insert.re")
	public String insertResource(Resources re, HttpSession session) {
		int result = rService.insertResource(re);
		if(result > 0) {
			session.setAttribute("alertMsg", "자원을 추가했습니다.");
			return "redirect:/manage.rez";
		}else {
			session.setAttribute("alertMsg", "자원 추가를 실패했습니다.");
			return "redirect:/manage.rez";
		}
	}
	
	/**
	 *  카테고리/ 자원 삭제
	 */
	@RequestMapping("delete.reca")
	public String deleteReCategory(int caNo, HttpSession session) {
		int result = rService.deleteReCategory(caNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "카테고리를 삭제했습니다.");
			return "redirect:/manage.rez";
		}else {
			session.setAttribute("alertMsg", "카테고리 삭제 실패!!!");
			return "redirect:/manage.rez";
		}
	}
	
	@RequestMapping("delete.re")
	public String deleteResource(int reNo, HttpSession session) {
		int result = rService.deleteResource(reNo);
		if(result > 0) {
			session.setAttribute("alertMsg", "자원을 삭제했습니다.");
			return "redirect:/manage.rez";
		}else {
			session.setAttribute("alertMsg", "자원 삭제 실패!!!");
			return "redirect:/manage.rez";
		}
	}
	
	
	
	
}
