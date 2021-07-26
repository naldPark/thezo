package com.kh.thezo.approval.model.vo;

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
public class Approval {
	
	private int docNo;
	private int memNo;
	private int formNo;
	private String docName;
	private String content;
	private String status;
	private String docType;
	private Date docDate;

}
