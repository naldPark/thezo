package com.kh.thezo.leave.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Leave {
	private int docNo;
	private int memNo;
	private Date startDate;
	private Date endDate;
	private int leaveCount;
	private String leaveCate;
	private String leaveContent;
	private Date enrDate;
	private String leaveStatus;
}
