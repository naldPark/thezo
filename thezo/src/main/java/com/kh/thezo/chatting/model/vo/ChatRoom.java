package com.kh.thezo.chatting.model.vo;

import java.util.ArrayList;

import com.kh.thezo.member.model.vo.Member;

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
	private String createDate;// 혹시모르니 전체 컬럼 값뽑은것 
	private String updateDate;// 혹시모르니 전체 컬럼 값뽑은것  
	private String groupStatus;
	// 아래는 추가되는 필드들 
	private String lastChatContent;
	private String lastChatDate;
	private int unreadChatCount;
	//private String colleaguePath;// 얘는 필요없어 MemberList에 담길거니
	
	// has many 관계로다가 안에는 member객체를 담을수있게 만들기  mem_no과 Path가 여기 들어갈것! 
	ArrayList<Member> memList = new ArrayList<>();
}