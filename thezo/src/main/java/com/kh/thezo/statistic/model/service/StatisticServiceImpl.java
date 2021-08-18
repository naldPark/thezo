package com.kh.thezo.statistic.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.notification.model.service.NotificationService;
import com.kh.thezo.statistic.model.dao.StatisticDao;
import com.kh.thezo.statistic.model.vo.AdminLog;

//@author Jaewon.s

@Service
public class StatisticServiceImpl implements StatisticService{

	@Autowired 
	private StatisticDao statDao;	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	
	/** 관리자 기록 가져오는 서비스 
	 */
	@Override
	public AdminLog ajaxSelectAdminLog() {
		return statDao.ajaxSelectAdminLog(sqlSession);
	}


	/** 관리자 기록 insert하는 서비스
	 */
	@Override
	public int ajaxInsertAdminLog(AdminLog adlog) {
		return statDao.ajaxInsertAdminLog(sqlSession, adlog);
	}

	
}
