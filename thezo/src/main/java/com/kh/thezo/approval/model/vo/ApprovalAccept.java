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
	
	private int lineNo;  // 결재선번호(pk)
	private int docNo;   //문서번호
//	private int sender; //기안자 사번
	private int memNo;  	//승인자사번
	private String memName;  	//승인자이름
	private String deptNo;	//부서번호
	private String department;	// 부서
	private int depClass; //유저의 부서코드
	private int apprLevel;	//결재순번
	private String job;
	private String rank;
	private String email;	//이메일
	private String type;	//유형(결재/합의)
	private String status;	//결재상태(대기/승인/반려)
	private String memo;	//결재의견
	private String read;	//읽음여부
	private Date apprDate;	//결재일
}
