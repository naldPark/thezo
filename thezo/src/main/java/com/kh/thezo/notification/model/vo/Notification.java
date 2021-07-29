package com.kh.thezo.notification.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//@author Jaewon.s
@NoArgsConstructor
@Getter	@Setter
@ToString
public class Notification {

	// db단에서 가공해서 가져올것이기에 문제 없음 
	private int nfNo;
	private String nfDeptName;
	private String nfStartDate;
	private String nfEndDate;
	private String nfContent;
	private String nfEnrollDate;
	private String nfDelStatus;
	
}
