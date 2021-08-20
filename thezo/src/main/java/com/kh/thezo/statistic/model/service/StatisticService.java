package com.kh.thezo.statistic.model.service;

import java.util.ArrayList;

import com.kh.thezo.department.model.vo.Department;
import com.kh.thezo.statistic.model.vo.AdminLog;
import com.kh.thezo.statistic.model.vo.Statistic;

//@author Jaewon.s
public interface StatisticService {

	// 관리자 기록 가져오는 서비스 
	AdminLog ajaxSelectAdminLog();

	// 관리자 기록 insert하는 서비스
	int ajaxInsertAdminLog(AdminLog adlog);

	// 관리자페이지 메인 오른쪽 상단 부서별 인원현황 데이터 가져오는 서비스
	ArrayList<Department> ajaxSelectRightTopDept();

	// 관리자페이지 메인 오른쪽 하단 전체 인원수와 pie차트에 담은 데이터 조회용 서비스
	ArrayList<Department> selectRightBottomChart();

	//table 형태의 표에 자료를 가져오는 서비스 
	ArrayList<Department> selectTableAreaDate();

	// 바 차트로 입사 퇴사정보 가져오는 서비스 
	ArrayList<Statistic> selectJoinAndResignDate(String curYear);

	// 메인차트 근태 정보 가져오는 서비스
	ArrayList<Statistic> selectAttendanceDate(String curYear);

}
