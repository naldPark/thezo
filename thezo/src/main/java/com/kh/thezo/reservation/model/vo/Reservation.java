package com.kh.thezo.reservation.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Reservation {
	private int rezNo;
	private int resourceNo;
	private String resourceName;
	private int memNo;
	private String rezWriter;
	private String useFor;
	private String rezDate;
	private String startTime;
	private String endTime;
	private Date applyDate;
	private String status;
}
