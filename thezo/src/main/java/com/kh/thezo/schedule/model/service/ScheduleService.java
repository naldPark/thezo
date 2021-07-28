package com.kh.thezo.schedule.model.service;

import java.util.ArrayList;

import com.kh.thezo.schedule.model.vo.Schedule;

public interface ScheduleService {
	
	// 일정 조회
	ArrayList<Schedule> selectScheduleList();
	
	// 일정 상세조회
	Schedule selectSchedule(int scNo);
	
	// 일정 추가
	int insertSchedule(Schedule sc);
	
	// 일정 수정
	int updateSchedule(Schedule sc);
	
	// 일정 삭제
	int deleteSchedule(int scNo);
	
}
