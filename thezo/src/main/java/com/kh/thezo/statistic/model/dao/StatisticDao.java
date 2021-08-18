package com.kh.thezo.statistic.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.statistic.model.vo.AdminLog;

//@author Jaewon.s
@Repository
public class StatisticDao {

	/** 관리자 기록 정보 가져오는 DAO
	 * @param sqlSession
	 * @return
	 */
	public AdminLog ajaxSelectAdminLog(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("statisticMapper.ajaxSelectAdminLog");
	}

	public int ajaxInsertAdminLog(SqlSessionTemplate sqlSession, AdminLog adlog) {
		return sqlSession.insert("statisticMapper.ajaxInsertAdminLog", adlog);
	}

}
