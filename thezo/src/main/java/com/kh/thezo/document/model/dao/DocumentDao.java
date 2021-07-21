package com.kh.thezo.document.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.document.model.vo.Document;

@Repository
public class DocumentDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("documentMapper.selectListCount");
	}
	
	public ArrayList<Document> selectDocumentList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("documentMapper.selectDocumentList", null, rowBounds);
	}
	
	public int insertDocument(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.insert("documentMapper.insertDocument", d);
	}
	
	
	
}
