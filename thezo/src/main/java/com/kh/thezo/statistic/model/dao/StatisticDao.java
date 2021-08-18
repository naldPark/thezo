package com.kh.thezo.statistic.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.department.model.vo.Department;
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

	/** 관리자 기록 insert하는 dao
	 * @param sqlSession
	 * @param adlog
	 * @return
	 */
	public int ajaxInsertAdminLog(SqlSessionTemplate sqlSession, AdminLog adlog) {
		return sqlSession.insert("statisticMapper.ajaxInsertAdminLog", adlog);
	}

	/** 관리자페이지 메인 오른쪽 상단 부서별 인원현황 데이터 가져오는 DAO
	 * @param sqlSession
	 * @return
	 */
	public ArrayList<Department> ajaxSelectRightTopDept(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("statisticMapper.ajaxSelectRightTopDept");
	}

	/** 관리자페이지 메인 오른쪽 하단 전체 인원수와 pie차트에 담은 데이터 조회용 DAO
	 * @param sqlSession
	 * @return
	 */
	public ArrayList<Department> aelectRightBottomChart(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("statisticMapper.aelectRightBottomChart");
	}

}
