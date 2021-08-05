package com.kh.thezo.schedule.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.schedule.model.dao.ScheduleDao;
import com.kh.thezo.schedule.model.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	private ScheduleDao scDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Schedule> selectScheduleList(String scType) {
		return scDao.selectScheduleList(sqlSession, scType);
	}

	@Override
	public int insertSchedule(Schedule sc) {
		return scDao.insertSchedule(sqlSession, sc);
	}

	@Override
	public int updateSchedule(Schedule sc) {
		return scDao.updateSchedule(sqlSession, sc);
	}

	@Override
	public int deleteSchedule(int scNo) {
		return scDao.deleteSchedule(sqlSession, scNo);
	}

	@Override
	public Schedule selectScheduleDetail(int scNo) {
		return scDao.selectScheduleDetail(sqlSession, scNo);
	}

}
