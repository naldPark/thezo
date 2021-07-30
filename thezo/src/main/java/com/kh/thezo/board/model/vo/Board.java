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
public class Board {

	private int boardNo;
	private int memNo;
	private String boardWriter;
	private int boardType;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private int count;
	private String status;
	
	private String originName;
	private String changeName;
	
}
