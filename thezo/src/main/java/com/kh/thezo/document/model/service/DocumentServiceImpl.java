package com.kh.thezo.document.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.document.model.dao.DocumentDao;
import com.kh.thezo.document.model.vo.Document;

@Service
public class DocumentServiceImpl implements DocumentService {
	
	@Autowired
	private DocumentDao dDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int selectListCount() {
		return dDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Document> selectDocumentList(PageInfo pi) {
		return dDao.selectDocumentList(sqlSession, pi);
	}

	@Override
	public int insertDocument(Document d) {
		return dDao.insertDocument(sqlSession, d);
	}

	@Override
	public int deleteDocument(int docNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateDocument(Document d) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int searchListCount(HashMap map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Document> searchList(HashMap map, PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

}
