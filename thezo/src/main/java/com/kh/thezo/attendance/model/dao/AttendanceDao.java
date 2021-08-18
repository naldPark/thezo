package com.kh.thezo.attendance.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.attendance.model.vo.Attendance;
import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.leave.model.vo.Leave;
import com.kh.thezo.member.model.vo.Member;

@Repository
public class AttendanceDao {
	
	// 사용자:출근 입력
	public int insertAtt(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.insert("attendanceMapper.insertAtt", memNo);
	}

	// 사용자:퇴근 입력
	public int insertfAtt(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.update("attendanceMapper.insertfAtt", memNo);
	}
	
	// 출퇴근 조회용
	public Attendance attendanceData(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("attendanceMapper.selectAttendance", memNo);
	}
	
	public Attendance attendanceData2(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("attendanceMapper.selectAttendance", m);
	}
	
	public int memberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("attendanceMapper.attendanceListCount");
	}
	
	public ArrayList<Member> selectMember(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectMember", null, rowBounds);
	}
	
	public ArrayList<Leave> selectLeaveData(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectLeaveData", null, rowBounds);
	}
	
	public int setLeave(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("attendanceMapper.setLeave", m);
	}
	
	/* 차후
	public Leave selectLeaveData2(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("attendanceMapper.selectLeaveData2", memNo);
	}
	*/
	
	
	
	
}
