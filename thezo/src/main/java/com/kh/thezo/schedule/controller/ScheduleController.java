package com.kh.thezo.schedule.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	public void selectScheduleList(HttpServletResponse response,
			@RequestParam(value="scType") String scType, String memNo) throws IOException {
		HashMap map = new HashMap();
		map.put("scType", scType);
		if(memNo != null && !memNo.isEmpty()) { // =>개인일정
			int scWriter = Integer.parseInt(memNo);
			map.put("scWriter", scWriter);
		}
		ArrayList<Schedule> list = scService.selectScheduleList(map);
		response.setContentType("text/html; charset=utf-8");
		String result = new Gson().toJson(list);
		response.getWriter().print(result);
	}
	
	
	/**
	 *  일정 추가
	 */
	@RequestMapping("insert.sc")
	public String insertSchedule(Schedule sc, HttpSession session) {
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
			return "schedule/quitView";
		} else {
			return "schedule/quitView";
		}
		
	}
	
	/**
	 *  일정 수정하기
	 */
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
		int result1 = scService.updateSchedule(sc);
		int result2 = scService.updateBizReport(sc);
		
		if(result1 > 0) {
			session.setAttribute("alertMsg", "일정을 수정했습니다.");
			return "schedule/quitView";
		}else {
			session.setAttribute("alertMsg", "일정 수정에 실패했습니다. 다시 시도해주세요.");
			return "schedule/quitView";
		}
	}
	
	/**
	 *  업무 보고하기 팝업창
	 */
	@RequestMapping("insertForm.bizRep")
	public String insertFormBizReport(int scNo, Model model) {
		model.addAttribute("scNo", scNo);
		return "schedule/bizReportInsertView";
	}
	
	/**
	 *  업무보고 작성하기
	 */
	@RequestMapping("insert.bizRep")
	public String insertBizReport(Schedule sc, int memNo, HttpSession session, MultipartFile upfile) {
		String reportWriter = String.valueOf(memNo);
		sc.setReportWriter(reportWriter);
		if(!upfile.isEmpty()) {
			String changeName = saveFile(session, upfile);
			sc.setOriginName(upfile.getOriginalFilename());
			sc.setChangeName("resources/uploadFiles/" + changeName);
		}
		int result = scService.insertBizReport(sc);
		if(result > 0) {
			session.setAttribute("alertMsg", "업무 보고를 등록했습니다.");
			return "schedule/quitView";
		
		}else {
			session.setAttribute("alertMsg", "등록하지 못했습니다. 다시 시도해주세요!!");
			return "schedule/quitView";
		}
	}
		
	
	
	// 파일 등록 메소드
	public String saveFile(HttpSession session, MultipartFile upfile) {
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000); // 10000 ~ 99999 랜덤값
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	
}
