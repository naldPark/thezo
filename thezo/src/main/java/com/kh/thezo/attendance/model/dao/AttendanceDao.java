package com.kh.thezo.attendance.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

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
	
	public ArrayList<Leave> leaveData(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("attendanceMapper.leaveData", m);
	}
	
	/* 차후
	public Leave selectLeaveData2(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("attendanceMapper.selectLeaveData2", memNo);
	}
	*/
	
	// (날드)관리자 : 근태조정신청내역 조회 카운트
	public int selectAdminFixRequestListCount(SqlSessionTemplate sqlSession, HashMap<String,String> searchDate){
		return sqlSession.selectOne("attendanceMapper.selectAdminFixRequestListCount",searchDate);
		}
	// (날드)관리자 : 근태조정신청내역 조회
	public ArrayList<Attendance> selectAdminFixRequestList(SqlSessionTemplate sqlSession, HashMap<String,String> searchDate, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("attendanceMapper.selectAdminFixRequestList", searchDate, rowBounds);
	}
	
	// (날드)관리자 : 근태조정신청내역 업데이트
	public int updateAdminFixRequest(SqlSessionTemplate sqlSession, Attendance a){
		return sqlSession.update("attendanceMapper.updateAdminFixRequest",a);
	}
	
	// (날드)관리자 : 근태조정신청내역 업데이트2
	public int updateAdminFixRequest2(SqlSessionTemplate sqlSession, Attendance a){
		return sqlSession.update("attendanceMapper.updateAdminFixRequest2",a);
	}
	
	// (날드)관리자 : 근태조정신청내역 업데이트3
		public int updateAdminFixRequest3(SqlSessionTemplate sqlSession, Attendance a){
			return sqlSession.update("attendanceMapper.updateAdminFixRequest3",a);
		}

	
}
