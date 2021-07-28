package com.kh.thezo.contact.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.contact.model.vo.CompanyInfo;

@Repository
public class CompanyInfoDao {

	public int insertCompanyInfo(SqlSessionTemplate sqlSession, CompanyInfo ci) {
		return sqlSession.insert("companyMapper.insertCompany", ci);
	}
	
}
