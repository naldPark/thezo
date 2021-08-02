package com.kh.thezo.contact.model.service;

import com.kh.thezo.contact.model.vo.CompanyInfo;

public interface CompanyInfoService {

	//회사정보 입력용
	int insertCompanyInfo(CompanyInfo ci);
	
	//회사정보 조회용
	CompanyInfo companyInfo(CompanyInfo ci);

}