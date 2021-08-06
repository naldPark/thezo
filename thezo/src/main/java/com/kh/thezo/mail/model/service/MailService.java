package com.kh.thezo.mail.model.service;

import java.util.ArrayList;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.mail.model.vo.Mail;
import com.kh.thezo.member.model.vo.Member;

public interface MailService {
	
	// 조직트리에서 사원을 조회하기 위한 메소드
	ArrayList<Member> employeeList();
	
	int selectReceiveCount(Member m);
	
	ArrayList<Mail> selectReceive(Member m, PageInfo pi);

	int sendMail(Mail mm);

}
