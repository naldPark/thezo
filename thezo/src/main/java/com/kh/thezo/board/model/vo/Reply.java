package com.kh.thezo.board.model.vo;

import java.sql.Date;

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
public class Reply {

	private int replyNo;
	private int memNo;
	private String refSection;
	private int refNo;
	private String replyContent;
	private String replyWriter;
	private Date createDate;
	private String status;
	
}
