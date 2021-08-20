package com.kh.thezo.statistic.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.department.model.vo.Department;
import com.kh.thezo.statistic.model.dao.StatisticDao;
import com.kh.thezo.statistic.model.vo.AdminLog;
import com.kh.thezo.statistic.model.vo.Statistic;

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
	public ArrayList<Department> selectRightBottomChart() {
		return statDao.selectRightBottomChart(sqlSession);
	}


	/** table 형태의 표에 자료를 가져오는 서비스
	 */
	@Override
	public ArrayList<Department> selectTableAreaDate() {
		return statDao.selectTableAreaDate(sqlSession);
	}


	/** 바 차트로 입사 퇴사정보 가져오는 서비스
	 */
	@Override
	public ArrayList<Statistic> selectJoinAndResignDate(String curYear) {
		return statDao.selectJoinAndResignDate(sqlSession, curYear);
	}


	/** 메인차트 근태 정보 가져오는 서비스
	 */
	@Override
	public ArrayList<Statistic> selectAttendanceDate(String curYear) {
		return statDao.selectAttendanceDate(sqlSession, curYear);
	}

	
}
