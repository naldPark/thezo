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
public class Report {

	private int rpCode;
	private String rpId;
	private Date rpDate;
	private int boardType; 
	private int rpType;
	private int rpNo;
	private String rpSection;
	private String rpContent;
	private Date handlingDate;
	private String status;
}
