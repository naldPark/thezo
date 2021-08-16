package com.kh.thezo.reservation.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.thezo.reservation.model.vo.Reservation;
import com.kh.thezo.reservation.model.vo.Resources;

@Repository
public class ReservationDao {
	public ArrayList<Resources> selectResourceList(SqlSession sqlSession){
		return (ArrayList)sqlSession.selectList("reservationMapper.selectResourceList");
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
	
}
