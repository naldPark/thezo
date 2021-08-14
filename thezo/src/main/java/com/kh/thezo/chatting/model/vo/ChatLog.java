package com.kh.thezo.chatting.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter	@Setter
@ToString
public class ChatLog {
	private int chatlogNo;
	private int memNo;
	private String nameAndRank;
	private String path;
	private int roomNo;
	private String chatContent;
	private String chatDate;
	// 니머지 컬럼은 나중에 파이널 끝나고 구현해보고 얘는 일단 여기까지만 
}