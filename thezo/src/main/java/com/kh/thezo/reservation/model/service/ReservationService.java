package com.kh.thezo.reservation.model.service;

import java.util.ArrayList;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.reservation.model.vo.ReCategory;
import com.kh.thezo.reservation.model.vo.Reservation;
import com.kh.thezo.reservation.model.vo.Resources;

public interface ReservationService {
	
	// 1. 조회
	// 자원 예약 전체 조회
	// 자원 조회
	int selectListCount(int memNo);
	ArrayList<Reservation> selectReservationList();
	ArrayList<Resources> selectResourceList(int caNo);
	
	// 나의 예약 목록 조회
	ArrayList<Reservation> selectMyReservationList(PageInfo pi, int memNo);
	
	// 예약 상세조회
	Reservation selectReservationDetail(int rezNo);
	
	// 자원 카테고리 조회(RE_CATEGORY)
	ArrayList<ReCategory> selectCategoryList();
	
	
	// 2. 예약 등록
	int insertReservation(Reservation rez);
	
	// 3. 예약 삭제
	int deleteReservation(int rezNo);
	
	// 4. 예약 수정
	int updateReservation(Reservation rez);
	
	// 5. 관리자메뉴
	// 자원 관리 조회
	ArrayList<Resources> selectResourcesManage();
	
	// 카테고리/자원명 수정
	int updateReCategory(Resources re);
	int updateResource(Resources re);
	
	// 카테고리/자원 추가
	int insertReCategory(Resources re);
	int insertResource(Resources re);
	
	// 카테고리/자원 삭제
	int deleteReCategory(int caNo);
	int deleteResource(int reNo);
	
	
}
