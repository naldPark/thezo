package com.kh.thezo.chatting.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter	@Setter
@ToString
public class ChatRoom {
	private int roomNo;
	private String roomName;
	private String createDate;
	private String updateDate;
	private String groupStatus;
}