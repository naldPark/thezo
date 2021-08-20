package com.kh.thezo.statistic.model.vo;

import java.util.ArrayList;

import com.kh.thezo.attendance.model.vo.Attendance;
import com.kh.thezo.member.model.vo.Member;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//@author Jaewon.s
@NoArgsConstructor
@Getter	@Setter
@ToString
public class Statistic {
	private int months;
	
	ArrayList<Member> memStat = new ArrayList<>();
	ArrayList<Attendance> attendanceList = new ArrayList<>();

}
