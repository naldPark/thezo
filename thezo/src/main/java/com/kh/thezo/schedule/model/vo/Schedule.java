package com.kh.thezo.schedule.model.vo;

import java.sql.Date;

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
	private String title;
	private String scContent;
	private String scType;		// sc_type
	private String start;
	private String end;
	private String allday;
	private String status;
	
	private String reportTitle;
	private String reportWriter;
	private String reportContent;
	private String originName;
	private String changeName;
	private Date createDate;
	
}
