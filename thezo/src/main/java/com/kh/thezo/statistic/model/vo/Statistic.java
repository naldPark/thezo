package com.kh.thezo.statistic.model.vo;

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
	private String months; //0부터 집어 넣어줘야한다. 그래야 값뽑기가 수월해진다.  	
	private double avgTotalWorkHour;
	private int joinMem;
	private int resignMem;
}
