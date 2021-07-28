package com.kh.thezo.document.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.document.model.vo.Document;

public interface DocumentService {
	
	// 1. 게시판 리스트 페이지 조회용 (페이징)
	int selectListCount();
	ArrayList<Document> selectDocumentList(PageInfo pi);
	
	// 2. 게시글 작성하기용
	int insertDocument(Document d);
	
	// 3. 게시글 삭제용
	int deleteDocument(int[] arr);
	
	// 4. 게시글 수정용
	int updateDocument(Document d);
	// 게시글 조회
	Document selectDocument(int docNo);
	
	// 5. 게시글 검색용
	int searchListCount(HashMap map);
	ArrayList<Document> searchList(HashMap map, PageInfo pi);
	
}
