package com.kh.thezo.approval.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import com.kh.thezo.mail.model.vo.Attachment;

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
	private String memName;
	private String department;
	private int formNo;
	private int depClass; //유저의 부서코드
	private String docName;  //유저 작성 제목
	private String category; //(ex.일반,비용 등등)
	private String formName; //양식명(ex.시말서)
	private String formInfo; //양식에 대한 설명
	private String formContent; // 폼 양식내용
	private String content; //사용자가 입력한내용
	private String status; // 승인 반려
	private Date docDate;
	private String line; //결재선(ex.김말똥 차장, 김개똥 과장)
	private String refMemNo; // 참조자(컴마)
	private String[] refMemNoAry; // 참조자 insert시 어레이(컴마)
	private String sort; //현재 결재자(ex. 김말똥 차장)
	private ArrayList<ApprovalAccept> apAccept; 
	private ArrayList<Attachment> at; 
	private Date startDate;  // 연차 시작일
	private Date endDate;   // 연차 종료일
	private int leaveCount; // 연차 차감갯수
	private String leaveCategory; // 카테고리(연차/경조사)
	private String apprFolder; // 폴더명
}
