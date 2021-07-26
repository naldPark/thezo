package com.kh.thezo.approval.model.vo;

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
public class ApprovalAccept {
	
	private int lineNo;
	private int docNo;   
	private int memNo;  
	private int apprLevel;
	private String type;
	private String status;
	private String comment;
	private String read;
	private Date apprDate;
}
