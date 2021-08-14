package com.kh.thezo.chatting.model.vo;
//@author Jaewon.s

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter	@Setter
@ToString
public class ChatConnect {
	private int roomNo;
	private int memNo;
	private int lastChatlog; 
	private int unreadCount;
	private String startDate;
	private String endDate;
	private String connStatus;
	private String roomName;	
}
