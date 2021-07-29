package com.kh.thezo.schedule.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.thezo.schedule.model.vo.Schedule;

@Repository
public class ScheduleDao {
	
	public ArrayList<Schedule> selectScheduleList(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("scheduleMapper.selectScheduleList");
	}
	
	public int insertSchedule(SqlSession sqlSession, Schedule sc) {
		return sqlSession.insert("scheduleMapper.insertSchedule", sc);
	}
	
	public ArrayList<Schedule> selectScheduleData(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("scheduleMapper.selectScheduleData");
	}
}
