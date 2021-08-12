package com.kh.thezo.message.model.vo;
//@author Jaewon.s

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter	@Setter
@ToString
public class MsgReport {
	private int msgReportNo;      // pk 신고번호
	private int msgNo;            // fk 쪽지번호 
	private int reporterNo;       // 신고한 사람 사원번호   
	private int reportedNo;       // 신고 당한 사람 사원번호
	private String reportType;    // 스챔|욕셜|비방|성희롱 등 
	private String reportContent; // 신고사유 100자 제한 
	private String reportDate;    // 신고시간 
	private String delStatus;     // 신고 철회시 사용하는 것으로 Y가 기본값 N이 신고철회
	private String handleStatus;  // 처리중| 처리완료 
	private String handleDate;    // 기본값없다 mapper에서 sysdate명시해줘야함 
	private String handleContent; // 신고 처리 내용 
	private String resultStatus;  // (쪽지)기능제한 | 생각해보기 
	private String senderNameAndRank; 
	private String recipientNameAndRank;
	private String contentStatus;   //상세보기 용
	private String withdrawalStatus; // 철회 가능 상태를 비교하기 위한 필드
}
