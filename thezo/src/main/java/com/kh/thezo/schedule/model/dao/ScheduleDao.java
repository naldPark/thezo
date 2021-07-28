package com.kh.thezo.schedule.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.thezo.schedule.model.vo.Schedule;

@Repository
public class ScheduleDao {
	
	
	public int insertSchedule(SqlSession sqlSession, Schedule sc) {
		return sqlSession.insert("scheduleMapper.insertSchedule", sc);
	}
	
}
