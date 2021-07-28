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
	public int selectListCount(String docCategory) {
		return dDao.selectListCount(sqlSession, docCategory);
	}

	@Override
	public ArrayList<Document> selectDocumentList(PageInfo pi, String docCategory) {
		return dDao.selectDocumentList(sqlSession, pi, docCategory);
	}

	@Override
	public int insertDocument(Document d) {
		return dDao.insertDocument(sqlSession, d);
	}

	@Override
	public int deleteDocument(int[] arr) {
		return dDao.deleteDocument(sqlSession, arr);
	}

	@Override
	public int updateDocument(Document d) {
		return dDao.updateDocument(sqlSession, d);
	}

	@Override
	public int searchListCount(HashMap map) {
		return dDao.searchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<Document> searchDocumentList(HashMap map, PageInfo pi) {
		return dDao.searchDocumentList(sqlSession, map, pi);
	}

	@Override
	public Document selectDocument(int docNo) {
		return dDao.selectDocument(sqlSession, docNo);
	}

}
