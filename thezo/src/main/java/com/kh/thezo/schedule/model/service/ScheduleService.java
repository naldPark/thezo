package com.kh.thezo.schedule.model.service;

import java.util.ArrayList;

import com.kh.thezo.schedule.model.vo.Schedule;

public interface ScheduleService {
	
	// 일정 조회
	ArrayList<Schedule> selectScheduleList();
	
	// 일정 추가/수정/삭제
	int insertSchedule(Schedule sc);
	int updateSchedule(Schedule sc);
	int deleteSchedule(int scNo);
	
	
}
