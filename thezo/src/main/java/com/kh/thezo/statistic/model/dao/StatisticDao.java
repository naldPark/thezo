package com.kh.thezo.statistic.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.thezo.department.model.vo.Department;
import com.kh.thezo.statistic.model.vo.AdminLog;
import com.kh.thezo.statistic.model.vo.Statistic;

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
	public ArrayList<Department> selectRightBottomChart(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("statisticMapper.selectRightBottomChart");
	}

	/** table 형태의 표에 자료를 가져오는 DAO
	 * @param sqlSession
	 * @return
	 */
	public ArrayList<Department> selectTableAreaDate(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("statisticMapper.selectTableAreaDate");
	}

	/** 바 차트로 입사 퇴사정보 가져오는 DAO
	 * @param sqlSession
	 * @param year
	 * @return
	 */
	public ArrayList<Statistic> selectJoinAndResignDate(SqlSessionTemplate sqlSession, String curYear) {
		//System.out.println(curYear);
		return (ArrayList)sqlSession.selectList("statisticMapper.selectJoinAndResignDate", curYear); 
	}

	/** 메인페이지 근태 정보 가져오는 DAO
	 * @param sqlSession
	 * @param curYear
	 * @return
	 */
	public ArrayList<Statistic> selectAttendanceDate(SqlSessionTemplate sqlSession, String curYear) {
		//System.out.println(curYear);
		return (ArrayList)sqlSession.selectList("statisticMapper.selectAttendanceDate", curYear); 
	}

}
