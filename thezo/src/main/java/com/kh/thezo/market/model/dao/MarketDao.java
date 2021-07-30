package com.kh.thezo.market.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
}
