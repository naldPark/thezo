package com.kh.thezo.notification.model.service;

import java.util.ArrayList;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.common.template.Pagination;
import com.kh.thezo.notification.model.vo.Notification;

//@author Jaewon.s
public interface NotificationService {

	//알림 등록 서비스 
	int insertNotification(Notification nf);
	
	// 알림 전체 갯수 가져오는 메소드 
	int selectListCount();
	
	// 내가 설정한 알림 만큼 가져오는 메소드 
	ArrayList<Notification> SelectAndViewNotificationList(PageInfo pi);

}
