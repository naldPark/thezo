package com.kh.thezo.schedule.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.thezo.schedule.model.vo.Schedule;

public interface ScheduleService {
	
	// 일정 조회
	ArrayList<Schedule> selectScheduleList(HashMap map);
	
	// 일정 상세조회
	Schedule selectScheduleDetail(int scNo);
	
	// 일정 추가
	int insertSchedule(Schedule sc);
	
	// 일정 수정
	int updateSchedule(Schedule sc);
	int updateBizReport(Schedule sc);
	
	// 일정 삭제
	int deleteSchedule(int scNo);
	
	int insertBizReport(Schedule sc);
	
}
