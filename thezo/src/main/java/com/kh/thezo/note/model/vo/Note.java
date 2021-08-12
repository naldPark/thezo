package com.kh.thezo.note.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Note {
	private int noteNo;
	private String noteSc;
	private String noteWriter;
	private String noteTitle;
	private String noteContent;
	private Date createDate;
	private String status;
	
	private int scNo;
}
