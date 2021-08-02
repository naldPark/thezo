package com.kh.thezo.member.model.vo;

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
public class Member {

	private int memNo;
	private String memId;
	private String userId; //header쪽 수정 후 삭제 해주세용
	private String memPwd;
	private String memName;
	private String gender;
	private String phone;
	private String email;
	private String birth;
	private String zipCode;
	private String address;
	private int depNo;
	private String department;
	private String job;
	private String rank;
	private String extensionNo;
	private Date enrollDate;
	private Date resignDate;
	private String originName;
	private String path;
	private int memVacDate;
	private int memUsedDate;
	private int memTotalDate;
	private String messageFunc;
	private String noticeAuth;
	private String status;
	
	
}
