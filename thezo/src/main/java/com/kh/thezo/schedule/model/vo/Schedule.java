package com.kh.thezo.schedule.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Schedule {
	
	private int scNo;
	private String scWriter;
	private String scTitle;
	private String scContent;
	private String scType;
	private String startDate;
	private String endDate;
	private String allday;
	private String status;
	
}
