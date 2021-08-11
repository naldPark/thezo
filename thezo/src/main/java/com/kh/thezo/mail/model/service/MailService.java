package com.kh.thezo.mail.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.mail.model.vo.Attachment;
import com.kh.thezo.mail.model.vo.Mail;
import com.kh.thezo.member.model.vo.Member;

public interface MailService {
	
	// 조직트리에서 사원을 조회하기 위한 메소드
	ArrayList<Member> employeeList();
	
	// 메인페이지 안읽은 메일 갯수 조회
	int mainMailCount(int memNo);
	
	// 해당되는 폴더의 메일갯수 카운트 
	int selectMailListCount(Mail mm);
	
	// 해당되는 폴더의 메일리스트
	ArrayList<Mail> selectMailList(Mail mm, PageInfo pi);
	
	// 스팸 메일갯수 카운트 
	int selectSpamMailListCount(Mail mm);
		
	// 스팸 메일리스트
	ArrayList<Mail> selectSpamMailList(Mail mm, PageInfo pi);
		
	
	// 보낸편지함 메일 갯수 카운트
	int selectSendListCount(int memNo);
	
	// 보낸편지함 메일 리스트
	ArrayList<Mail> selectSendList(int memNo, PageInfo pi);

	// 서버에서 받아온 받은 메일 인설트
	int insertPopList(ArrayList<Mail> mm);
	
	// 발송메일 인설트
	int sendMail(Mail mm);
	
	// 메일 세부내용 페이지
	Mail selectDetailMail(int mno);
	
	// 메일(발신포함) 세부내용 조회시 첨부파일 조회
	ArrayList<Attachment> selectDetailMailAt(Mail mm);
	
	// 세부페이지 이동시 읽음 업데이트
	int updateReadMailOne(int mno);

	// 메일리스트에서 버튼을 통해 읽음 처리
	int updateReadMail(ArrayList<String> reMailNoAry);

	// 메일리스트에서 버튼을 통해 스팸 처리
	int updateSpamMail(ArrayList<String> reMailNoAry);
	
	// 메일리스트에서 버튼을 통해 스팸해제 처리
	int updateUnSpamMail(ArrayList<String> reMailNoAry);

	// 메일리스트에서 버튼을 통해 삭제 처리
	int updateDeleteMail(ArrayList<String> reMailNoAry);
	
	// 발신 메일리스트에서 버튼을 통해 삭제 처리
	int updateDeleteSendMail(ArrayList<String> seMailNoAry);
	
	// 발신메일 세부내용 페이지
	Mail selectSendDetailMail(int mno);
}
