package com.kh.thezo.statistic.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.department.model.vo.Department;
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


	/** 관리자페이지 메인 오른쪽 상단 부서별 인원현황 데이터 가져오는 서비스
	 */
	@Override
	public ArrayList<Department> ajaxSelectRightTopDept() {
		return statDao.ajaxSelectRightTopDept(sqlSession);
	}


	/** 관리자페이지 메인 오른쪽 하단 전체 인원수와 pie차트에 담은 데이터 조회용 서비스
	 */
	@Override
	public ArrayList<Department> aelectRightBottomChart() {
		return statDao.aelectRightBottomChart(sqlSession);
	}

	
}
