package com.kh.thezo.mail.model.vo;

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
public class Attachment {
	
	private int fileNo;
	private int docNo;
	private String fileType;
	private String originName;
	private String fileUrl;
	private int fileLevel;
	
	
	
}
