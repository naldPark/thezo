package com.kh.thezo.notification.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.notification.model.vo.Notification;

//@author Jaewon.s
public interface NotificationService {

	// 관리자단  service Interface들 ------------------------------------------------------
	//알림 등록 서비스 
	int insertNotification(Notification nf);
	
	// 알림 전체 갯수 가져오는 서비스
	int selectListCount();
	
	// 내가 설정한 알림 만큼 가져오는 서비스
	ArrayList<Notification> SelectAndViewNotificationList(PageInfo pi);

	// AJAX로 하나의 알림정보를 가져오는 서비스 
	Notification selectNotification(int nfNo);
	
	// 선택한 알림 삭제처리 (update문으로 del_status변경)하는 서비스 
	int deleteNotification(int nfNo);
	
	// 사용자의 선택 사항에 따라서 달라지는 서비스로 기존 알림을 업데이트 할떄의 서비스 
	int updateNotification(Notification nf, String originNdDeptName, String reNotify); 
	
	// 사용자단  service Interface들 ------------------------------------------------------
	//  자신의 memNo에 해당하는 모든 (읽은, 읽지 않은 알림 조회해오는) 서비스 
	ArrayList<Notification> ajaxSelectListNf(int memNo);
	
	//단순히 읽지 않은 알림 갯수 조회해오는 ajax 서비스
	int ajaxCountUnreadedNf(int memNo);
	
	// 읽지않은 알림 리스트 가져오는 ajax 서비스 
	ArrayList<Notification> ajaxSelectUnreadedNf(int memNo);
	
	// 받은 알림을 읽음 처리하는 서비스
	int ajaxUpdateUserNf(HashMap<Object, Object> nfNoList);
	
}
