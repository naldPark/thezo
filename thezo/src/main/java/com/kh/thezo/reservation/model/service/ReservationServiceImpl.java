package com.kh.thezo.reservation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.reservation.model.dao.ReservationDao;
import com.kh.thezo.reservation.model.vo.ReCategory;
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
	public int deleteReservation(int rezNo) {
		return rDao.deleteReservation(sqlSession, rezNo);
	}

	@Override
	public int updateReservation(Reservation rez) {
		return rDao.updateReservation(sqlSession, rez);
	}

	@Override
	public ArrayList<Resources> selectResourceList(int caNo) {
		return rDao.selectResourceList(sqlSession, caNo);
	}

	@Override
	public Reservation selectReservationDetail(int rezNo) {
		return rDao.selectReservationDetail(sqlSession, rezNo);
	}

	@Override
	public ArrayList<ReCategory> selectCategoryList() {
		return rDao.selectCategoryList(sqlSession);
	}

	@Override
	public ArrayList<Reservation> selectMyReservationList(PageInfo pi, int memNo) {
		return rDao.selectMyReservationList(sqlSession, pi, memNo);
	}

	@Override
	public int selectListCount(int memNo) {
		return rDao.selectListCount(sqlSession, memNo);
	}
	
	public ArrayList<Resources> selectResourcesManage(){
		return rDao.selectResourcesManage(sqlSession);
	}

	@Override
	public int updateReCategory(Resources re) {
		return rDao.updateReCategory(sqlSession, re);
	}

	@Override
	public int updateResource(Resources re) {
		return rDao.updateResource(sqlSession, re);
	}

	@Override
	public int insertReCategory(Resources re) {
		return rDao.insertReCategory(sqlSession, re);
	}

	@Override
	public int insertResource(Resources re) {
		return rDao.insertResource(sqlSession, re);
	}
	

}
