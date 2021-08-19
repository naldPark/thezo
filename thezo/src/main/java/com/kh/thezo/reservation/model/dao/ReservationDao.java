package com.kh.thezo.reservation.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.reservation.model.vo.ReCategory;
import com.kh.thezo.reservation.model.vo.Reservation;
import com.kh.thezo.reservation.model.vo.Resources;

@Repository
public class ReservationDao {
	public ArrayList<Resources> selectResourceList(SqlSession sqlSession, int caNo){
		return (ArrayList)sqlSession.selectList("reservationMapper.selectResourceList", caNo);
	}
	
	public int insertReservation(SqlSession sqlSession, Reservation rez) {
		return sqlSession.insert("reservationMapper.insertReservation", rez);
	}
	
	public ArrayList<Reservation> selectReservationList(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("reservationMapper.selectReservationList");
	}
	
	public Reservation selectReservationDetail(SqlSession sqlSession, int rezNo){
		return sqlSession.selectOne("reservationMapper.selectReservationDetail", rezNo);
	}
	
	public int updateReservation(SqlSession sqlSession, Reservation rez) {
		return sqlSession.update("reservationMapper.updateReservation", rez);
	}
	
	public int deleteReservation(SqlSession sqlSession, int rezNo) {
		return sqlSession.update("reservationMapper.deleteReservation", rezNo);
	}
	
	public ArrayList<ReCategory> selectCategoryList(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("reservationMapper.selectCategoryList");
	}
	
	public ArrayList<Reservation> selectMyReservationList(SqlSession sqlSession, PageInfo pi, int memNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("reservationMapper.selectMyReservationList", memNo);
	}
	
	public int selectListCount(SqlSession sqlSession, int memNo) {
		return sqlSession.selectOne("reservationMapper.selectListCount", memNo);
	}
	
	public ArrayList<Resources> selectResourcesManage(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("reservationMapper.selectResourcesManage");
	}
	
	public int updateReCategory(SqlSession sqlSession, Resources re) {
		return sqlSession.update("reservationMapper.updateReCategory", re);
	}
	
	public int updateResource(SqlSession sqlSession, Resources re) {
		return sqlSession.update("reservationMapper.updateResource", re);
	}
	
	public int insertReCategory(SqlSession sqlSession, Resources re) {
		return sqlSession.insert("reservationMapper.insertReCategory", re);
	}
	
	public int insertResource(SqlSession sqlSession, Resources re) {
		return sqlSession.insert("reservationMapper.insertResource", re);
	}
	
}
