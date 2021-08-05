package com.kh.thezo.attendance.model.service;

import com.kh.thezo.attendance.model.vo.Attendance;
import com.kh.thezo.member.model.vo.Member;

public interface AttendanceService {

	//출근 버튼 클릭시 현재시간 넣기
	int insertAtt(int memNo);
	
	//퇴근 버튼 클릭시 현재시간 넣기
	int insertfAtt(int memNo);
	
	//출퇴근 조회용
	Attendance attendanceData(int memNo);
	
	Attendance attendanceData2(Member m);
	
}
