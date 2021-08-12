package com.kh.thezo.message.model.vo;
//@author Jaewon.s

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter	@Setter
@ToString
public class Message {

	private int msgNo;  // 쪽지 번호 
	private int recipientNo; // 받는 사람 번호
	private int senderNo;    // 보낸 사람 번호 
	private String msgStatus; // 기타|답장필요|답장불필요|긴급
	private String contentStatus; // 기타|회의|업무|행사|
	private String createDate;    // 보낸날짜나 받는날짜나 동일
	private String msgContent;    // 1000자로 제한함
	private String readStatus;    // 받은사람이 읽으면 Y
	private String toRecycleBin;   // Y기본값  N 휴지통이동
	private String fromRecycleBin; // Y기본값  N 휴지통이동
	private String toDelStatus;    // Y기본값 N 삭제처리
	private String fromDelStatus;  // Y기본값  N 삭제처리 
	private String recipientNameAndRank; 
	private String senderNameAndRank; 

}
