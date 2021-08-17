package com.kh.thezo.attendance.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.attendance.model.dao.AttendanceDao;
import com.kh.thezo.attendance.model.vo.Attendance;
import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.leave.model.vo.Leave;
import com.kh.thezo.member.model.vo.Member;

@Service
public class AttendanceServiceImpl implements AttendanceService{

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
	

	// 근태 관리 페이지네이션
	@Override
	public int memberListCount() {
		return aDao.memberListCount(sqlSession);
	}

	// 관리자 : 회원 정보 근태 관리 조회
	@Override
	public ArrayList<Member> selectMember(PageInfo pi) {
		return aDao.selectMember(sqlSession, pi);
	}

	// 관리자 : 회원 정보 휴가 정보 조회
	@Override
	public ArrayList<Leave> selectLeaveData(PageInfo pi) {
		return aDao.selectLeaveData(sqlSession, pi);
	}
	
	// (날드)관리자 : 근태조정신청내역 조회 카운트
	@Override
	public int selectAdminFixRequestListCount(HashMap<String,String> searchDate) {
		return aDao.selectAdminFixRequestListCount(sqlSession,searchDate);
	}
		
	// (날드)관리자 : 근태조정신청내역 조회
	@Override
	public ArrayList<Attendance> selectAdminFixRequestList(HashMap<String,String> searchDate, PageInfo pi) {
		return aDao.selectAdminFixRequestList(sqlSession, searchDate,pi);
	}
	
	// (날드)관리자 : 근태조정신청내역 업데이트
	@Override
	public int updateAdminFixRequest(Attendance a) {
		int result= 0;
		result = aDao.updateAdminFixRequest(sqlSession, a);
		result = result*aDao.updateAdminFixRequest2(sqlSession, a);
		result = result*aDao.updateAdminFixRequest3(sqlSession, a);
		return result;
	}
	
	

}
