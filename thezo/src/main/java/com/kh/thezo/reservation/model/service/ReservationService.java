package com.kh.thezo.reservation.model.service;

import java.util.ArrayList;

import com.kh.thezo.reservation.model.vo.Reservation;
import com.kh.thezo.reservation.model.vo.Resource;

public interface ReservationService {
	
	// 1. 조회
	// 자원 예약 전체 조회
	//int selectListCount();
	ArrayList<Reservation> selectReservationList();
	ArrayList<Resource> selectResourceList();
	
	// 예약 상세조회
	
	// 자원 카테고리 조회(RE_CATEGORY)
	//ArrayList<ReCategory> selectCategoryList();
	
	
	// 2. 예약 등록
	int insertReservation();
	
	// 3. 예약 삭제
	int deleteReservation();
	
	// 4. 예약 수정
	int updateReservation();
	
	
	
	
	
}
