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
	
	private int lineNo;  //결재선번호
	private int docNo;   //문서번호
	private int memNo;  	//승인자사번
	private int apprLevel;	//결재순번
	private String type;	//유형(결재/합의)
	private String status;	//결재상태(대기/승인/반려)
	private String comment;	//결재의견
	private String read;	//읽음여부
	private Date apprDate;	//결재일
}
