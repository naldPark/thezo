package com.kh.thezo.schedule.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.thezo.schedule.model.vo.Schedule;

@Repository
public class ScheduleDao {
	
	public ArrayList<Schedule> selectScheduleList(SqlSession sqlSession, HashMap map){
		return (ArrayList)sqlSession.selectList("scheduleMapper.selectScheduleList", map);
	}
	
	public int insertSchedule(SqlSession sqlSession, Schedule sc) {
		return sqlSession.insert("scheduleMapper.insertSchedule", sc);
	}
	
	public Schedule selectScheduleDetail(SqlSession sqlSession, int scNo) {
		return sqlSession.selectOne("scheduleMapper.selectScheduleDetail", scNo);
	}
	
	public int deleteSchedule(SqlSession sqlSession, int scNo) {
		return sqlSession.delete("scheduleMapper.deleteSchedule", scNo);
	}
	
	public int updateSchedule(SqlSession sqlSession, Schedule sc) {
		return sqlSession.update("scheduleMapper.updateSchedule", sc);
	}
	
	public int updateBizReport(SqlSession sqlSession, Schedule sc) {
		return sqlSession.update("scheduleMapper.updateBizReport", sc);
	}
	
	public int insertBizReport(SqlSession sqlSession, Schedule sc) {
		return sqlSession.insert("scheduleMapper.insertBizReport", sc);
	}
	
	public int deleteBizReport(SqlSession sqlSession, int scNo) {
		return sqlSession.delete("scheduleMapper.deleteBizReport", scNo);
	}
	
	public Schedule selectBizReport(SqlSession sqlSession, int scNo) {
		return sqlSession.selectOne("scheduleMapper.selectBizReport", scNo);
	}
}
