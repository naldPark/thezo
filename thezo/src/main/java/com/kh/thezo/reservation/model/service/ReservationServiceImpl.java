package com.kh.thezo.reservation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.reservation.model.dao.ReservationDao;
import com.kh.thezo.reservation.model.vo.Reservation;
import com.kh.thezo.reservation.model.vo.Resources;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationDao rDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Reservation> selectReservationList() {
		return rDao.selectReservationList(sqlSession);
	}

	@Override
	public int insertReservation(Reservation rez) {
		return rDao.insertReservation(sqlSession, rez);
	}

	@Override
	public int deleteReservation() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReservation() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Resources> selectResourceList() {
		return rDao.selectResourceList(sqlSession);
	}

	@Override
	public Reservation selectReservationDetail(int rezNo) {
		return rDao.selectReservationDetail(sqlSession, rezNo);
	}

}
