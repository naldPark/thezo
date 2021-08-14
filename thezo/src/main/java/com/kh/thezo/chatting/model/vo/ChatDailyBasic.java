package com.kh.thezo.chatting.model.vo;

import java.util.ArrayList;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter	@Setter
@ToString
public class ChatDailyBasic {
	private String dailyBasic; // 일단위로 끊어 버릴것 
	private String formattedDate; // 일단위끊어졌을때 보여주게하기위한 문구 
	
	ArrayList<ChatLog> chatList = new ArrayList<>(); // 실제 채팅들 담겨있는 곳 
}
