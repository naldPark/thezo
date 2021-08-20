package com.kh.thezo.attendance.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class Attendance {

	private int attNo;
	private int memNo;
	private String attDate;
	private String strTime;
	private String finTime;
	private int totalTime;
	private String status;
	// 근태조정신청내역 area
	private String attBoardStatus;
	private int attBoardNo;
	private String attStaContent;
}
