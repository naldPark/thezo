package com.kh.thezo.statistic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.thezo.statistic.model.service.StatisticService;
import com.kh.thezo.statistic.model.vo.AdminLog;

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
	
}

