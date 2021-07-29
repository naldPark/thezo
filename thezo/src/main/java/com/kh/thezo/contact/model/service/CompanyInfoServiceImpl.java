package com.kh.thezo.contact.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.contact.model.dao.CompanyInfoDao;
import com.kh.thezo.contact.model.vo.CompanyInfo;

@Service
public class CompanyInfoServiceImpl implements CompanyInfoService {

	@Autowired
	private CompanyInfoDao cDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertCompanyInfo(CompanyInfo ci) {
		return cDao.insertCompanyInfo(sqlSession, ci);
	}

}