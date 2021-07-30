package com.kh.thezo.notification.model.service;

import java.util.ArrayList;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.notification.model.vo.Notification;

//@author Jaewon.s
public interface NotificationService {

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
}
