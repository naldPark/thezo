package com.kh.thezo.reservation.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.thezo.reservation.model.service.ReservationService;
import com.kh.thezo.reservation.model.vo.Resource;

@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService rService;
	
	@RequestMapping("con.rez")
	public String selectReservationList(Model model) {
		ArrayList<Resource> resourceList = rService.selectResourceList();
		//ArrayList<Reservation> list = rService.selectReservationList();
		model.addAttribute("resourceList", resourceList);
		return "schedule/reservation/conferenceRezView";
	}
	
	
}
