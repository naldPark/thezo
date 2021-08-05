package com.kh.thezo.attendance.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.attendance.model.dao.AttendanceDao;
import com.kh.thezo.attendance.model.vo.Attendance;
import com.kh.thezo.member.model.vo.Member;

@Service
public class AttendanceImpl implements AttendanceService{

	@Autowired
	private AttendanceDao aDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertAtt(int memNo) {
		return aDao.insertAtt(sqlSession, memNo);
	}

	@Override
	public int insertfAtt(int memNo) {
		return aDao.insertfAtt(sqlSession, memNo);
	}

	@Override
	public Attendance attendanceData(int memNo) {
		return aDao.attendanceData(sqlSession, memNo);
	}

	@Override
	public Attendance attendanceData2(Member m) {
		return aDao.attendanceData2(sqlSession, m);
	}

}
