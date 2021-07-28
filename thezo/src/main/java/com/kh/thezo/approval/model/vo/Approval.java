package com.kh.thezo.approval.model.vo;

import java.sql.Date;
import java.util.ArrayList;

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
public class Approval {
	
	private int docNo;
	private int memNo;
	private int formNo;
	private String docName;  //유저 작성 제목
	private String category; //(ex.일반,비용 등등)
	private String formName; //양식명(ex.시말서)
	private String formInfo; //양식에 대한 설명
	private String formContent;
	private String content;
	private String status;
	private String docType;
	private Date docDate;
	private String line; //결재선(ex.김말똥 차장, 김개똥 과장)
	private String sort; //현재 결재자(ex. 김말똥 차장)
	private ArrayList<ApprovalAccept> apAccept; 

}
