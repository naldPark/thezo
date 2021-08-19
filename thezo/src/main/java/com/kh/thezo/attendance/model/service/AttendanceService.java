package com.kh.thezo.attendance.model.service;

import java.util.ArrayList;

import com.kh.thezo.attendance.model.vo.Attendance;
import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.leave.model.vo.Leave;
import com.kh.thezo.member.model.vo.Member;

public interface AttendanceService {

	//출근 버튼 클릭시 현재시간 넣기
	int insertAtt(int memNo);
	
	//퇴근 버튼 클릭시 현재시간 넣기
	int insertfAtt(int memNo);
	
	//출퇴근 조회용
	Attendance attendanceData(int memNo);
	
	Attendance attendanceData2(Member m);

	// 회원 근태 관리 조회
	int memberListCount();
	ArrayList<Member> selectMember(PageInfo pi);
	ArrayList<Leave> selectLeaveData(PageInfo pi);
	
	// 휴가 정보 수정
	int setLeave(Member m);
	
	// 근태 관리 정보 조회
	ArrayList<Leave> leaveData(Member m);
	

	/* 회원 휴가 정보 조회(모달용 차후)
	Leave selectLeaveData2(int memNo);
	*/
}
