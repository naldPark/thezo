package com.kh.thezo.statistic.model.service;

import com.kh.thezo.statistic.model.vo.AdminLog;

//@author Jaewon.s
public interface StatisticService {

	// 관리자 기록 가져오는 서비스 
	AdminLog ajaxSelectAdminLog();

	// 관리자 기록 insert하는 서비스
	int ajaxInsertAdminLog(AdminLog adlog);

}
