package com.kh.thezo.market.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.board.model.vo.Board;
import com.kh.thezo.board.model.vo.BoardFile;
import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.market.model.vo.Market;

@Repository
public class MarketDao {

	// 사용자 : 벼룩시장 글 갯수 조회
	public int marketListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("marketMapper.marketListCount");
	}
	
	// 사용자 : 벼룩시장 리스트 조회
	public ArrayList<Market> selectMarketList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset =(pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("marketMapper.selectMarketList", null , rowBounds );
	}
	
	// 사용자 : 벼룩시장 검색바 글 갯수 조회
	public int marketSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("marketMapper.marketSearchListCount", map);
	}
	
	// 사용자 : 벼룩시장 검색바 리스트 조회
	public ArrayList<Market> marketSearchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("marketMapper.marketSearchList", map, rowBounds);
	}
	
	// 사용자 : 벼룩시장 상세 조회용(조회수)
	public int increaseMarketCount(SqlSessionTemplate sqlSession, int marketNo) {
		return sqlSession.update("marketMapper.increaseMarketCount", marketNo);
	}
		
	// 사용자 : 벼룩시장 상세 조회
	public Market selectMarket(SqlSessionTemplate sqlSession, int marketNo) {
		return sqlSession.selectOne("marketMapper.selectMarket", marketNo);
	}
	
	// 사용자 : 벼룩시장 글 등록 
	public int insertMarket(SqlSessionTemplate sqlSession, Market mk) {
		return sqlSession.insert("marketMapper.insertMarket", mk);
	}
		
	
		
}
