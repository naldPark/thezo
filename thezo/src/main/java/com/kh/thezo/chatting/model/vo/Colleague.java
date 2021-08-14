package com.kh.thezo.chatting.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter	@Setter
@ToString
public class Colleague {
	
	private int myMemNo;
	private int coMemNo;
	private String delStatus;
	private String myImgPath;
	private String coImgPath;
	private String myNameAndRank; 
	private String coNameAndRank; 
	private int roomNo;
}