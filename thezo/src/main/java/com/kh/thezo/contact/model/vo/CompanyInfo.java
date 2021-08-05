package com.kh.thezo.contact.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class CompanyInfo {

	private int companyNo;
	private String companyName;
	private String ceoName;
	private String regNo;
	private String email;
	private String bussStatus;
	private String bussKind;
	private String phone;
	private String homePage;
	private String corNo;
	private String fax;
	private String estDate;
	private String address;
	private String ceoEng;
	private String cnameEng;
	private String addressEng;
	private String originName;
	private String changeName;

	private ArrayList<CompanyInfo> cInfoList;
}