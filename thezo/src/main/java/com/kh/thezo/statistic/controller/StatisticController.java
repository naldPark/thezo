package com.kh.thezo.statistic.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.thezo.department.model.vo.Department;
import com.kh.thezo.statistic.model.service.StatisticService;
import com.kh.thezo.statistic.model.vo.AdminLog;
import com.kh.thezo.statistic.model.vo.Statistic;

@Controller
public class StatisticController {

	@Autowired
	private StatisticService statService;

	/** 관리자 기록 가져오는 Controller 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectDevLog.ad", produces="application/json; charset=utf-8")
	public String ajaxSelectAdminLog() {
		AdminLog adlog = statService.ajaxSelectAdminLog();		
		return new Gson().toJson(adlog);
	}

	/** 관리자 기록 insert하는 Controller
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="insertDevLog.ad", produces="application/json; charset=utf-8")
	public String ajaxInsertAdminLog(String developerName, String modificationContent) {
		AdminLog adlog = new AdminLog(); 
		adlog.setDeveloperName(developerName);
		adlog.setModificationContent(modificationContent);
		int result = statService.ajaxInsertAdminLog(adlog);		
		return new Gson().toJson(result);
	}

	/** 관리자페이지 메인 오른쪽 상단 부서별 인원현황 데이터 가져오는 controller 
	 * @param developerName
	 * @param modificationContent
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectRightTopDept.ad", produces="application/json; charset=utf-8")
	public String ajaxSelectRightTopDept() {
		ArrayList<Department> statistic = statService.ajaxSelectRightTopDept(); 
		return new Gson().toJson(statistic);
	}

	/** 관리자페이지 메인 오른쪽 하단 전체 인원수와 pie차트에 담은 데이터 조회용 controller
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectRightBottomChart.ad", produces="application/json; charset=utf-8")
	public String selectRightBottomChart() {
		ArrayList<Department> statistic = statService.selectRightBottomChart(); 
		return new Gson().toJson(statistic);
	}

	
	/** table 형태의 표에 자료를 가져오는 Controller
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectTableAreaDate.ad", produces="application/json; charset=utf-8")
	public String selectTableAreaDate() {
		ArrayList<Department> statistic = statService.selectTableAreaDate(); 
		return new Gson().toJson(statistic);
	}

	
	/** 바 차트로 입사 퇴사정보 가져오는 Controller
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectJoinAndResignDate.ad", produces="application/json; charset=utf-8")
	public String selectJoinAndResignDate(String curYear) {
		ArrayList<Statistic> chartList = statService.selectJoinAndResignDate(curYear); 
		return new Gson().toJson(chartList);
	}

	/** 메인차트 근태 정보 가져오는 Controller
	 * @param curYear
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="selectAttendanceDate.ad", produces="application/json; charset=utf-8")
	public String selectAttendanceDate(String curYear) {
		ArrayList<Statistic> chartList = statService.selectAttendanceDate(curYear); 
		return new Gson().toJson(chartList);
	}

	
}

