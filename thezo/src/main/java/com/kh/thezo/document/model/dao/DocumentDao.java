package com.kh.thezo.document.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.document.model.vo.DocCategory;
import com.kh.thezo.document.model.vo.Document;

@Repository
public class DocumentDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession, String docCategory) {
		return sqlSession.selectOne("documentMapper.selectListCount", docCategory);
	}
	
	public ArrayList<Document> selectDocumentList(SqlSessionTemplate sqlSession, PageInfo pi, String docCategory){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("documentMapper.selectDocumentList", docCategory, rowBounds);
	}
	
	public int insertDocument(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.insert("documentMapper.insertDocument", d);
	}
	
	public int deleteDocument(SqlSessionTemplate sqlSession, int[] arr) {
		return sqlSession.update("documentMapper.deleteDocument", arr);
	}
	
	public Document selectDocument(SqlSessionTemplate sqlSession, int docNo) {
		return sqlSession.selectOne("documentMapper.selectDocument", docNo);
	}
	
	public int updateDocument(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.update("documentMapper.updateDocument", d);
	}
	
	public int searchListCount(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.selectOne("documentMapper.searchListCount", map);
	}
	
	public ArrayList<Document> searchDocumentList(SqlSessionTemplate sqlSession, HashMap map, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("documentMapper.searchDocumentList", map, rowBounds);
	}
	
	public ArrayList<DocCategory> selectCategoryList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("documentMapper.selectCategoryList");
	}
	
}
