package com.kh.thezo.mail.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.thezo.common.model.vo.PageInfo;
import com.kh.thezo.common.template.Pagination;
import com.kh.thezo.mail.model.service.MailService;
import com.kh.thezo.mail.model.vo.Attachment;
import com.kh.thezo.mail.model.vo.Mail;
import com.kh.thezo.member.model.vo.Member;


@Controller
public class MailController {
	
	@Autowired
	private MailService mmService;
	@Autowired
	private CheckInbox chkInbox;

	@RequestMapping("main.mail")
	public ModelAndView selectMailMain(ModelAndView mv, HttpSession session
			, @RequestParam(value = "folder", defaultValue = "받은") String folder, 
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		Member m = (Member) session.getAttribute("loginUser");
		
		if (m != null) {
			Mail mm = new Mail();
			mm.setMemNo(((Member) session.getAttribute("loginUser")).getMemNo());
			mm.setFolder(folder);
			ArrayList<Mail> mList = new ArrayList<>();
			
			
			
			
			// 받은편지함만 해당
			if (folder.equals("받은")) {
				// 해당 두 계정만 서버와 연동시켰기 때문에 조건처리했습니다.
				if (m.getEmail().equals("user05@thezo.site") || m.getEmail().equals("user06@thezo.site")) {
					try {
						// 외부에 새로들어온 메일이 있는지 체크
						mList = mailReceivecheck(m.getMemNo(), m.getEmail(), session);
						if (mList.size() != 0) {
							int result = mmService.insertPopList(mList);
						}
					} catch (MessagingException e) {
						e.printStackTrace();
					}
				}
			}
			// 받은편지함만 해당 끝
			
			ArrayList<Mail> list = new ArrayList<>();
			PageInfo pi = new PageInfo();
			
			if (folder.equals("스팸")) {
				int listCount = mmService.selectSpamMailListCount(mm);
				pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
				list = mmService.selectSpamMailList(mm, pi);
			} else {
				int listCount = mmService.selectMailListCount(mm);
				pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
				list = mmService.selectMailList(mm, pi);
			}
			ArrayList<Member> empList = mmService.employeeList();
			
			mv.addObject("list", list)
			.addObject("empList", empList) // 전사원 리스트
			.addObject("pi", pi)
			.addObject("folder", folder)
			.setViewName("mail/mailMain");
		} else {
			mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	@RequestMapping("sendInbox.mail")
	public ModelAndView selectSendMail(ModelAndView mv, HttpSession session
			,@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		Member m = (Member) session.getAttribute("loginUser");
		if (m != null) {
			int memNo = m.getMemNo();

			int listCount = mmService.selectSendListCount(memNo);
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
			ArrayList<Mail> list = mmService.selectSendList(memNo, pi);
			ArrayList<Member> empList = mmService.employeeList();// 전사원 리스트
			mv.addObject("list", list).addObject("empList", empList).addObject("pi", pi).addObject("folder", "보낸").setViewName("mail/sendInbox");
		} else {
			mv.addObject("errorMsg", "로그인 후 이용 해 주세요")
			  
			  .setViewName("common/errorPage");
		}
		return mv;
	}

	// 메인 메일페이지 접속시 실행되는 메소드 : 실제 mail서버에 있는 받은편지를 받아옴
	public ArrayList<Mail> mailReceivecheck(int memNo, String email, HttpSession session) throws MessagingException {
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/mail/");
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		ArrayList<Mail> mList = chkInbox.receiveMailAttachedFile(savePath, memNo, email, currentTime);
		return mList;

	}
	
	// main화면에서 이메일 새로고침기능
	public void mailReceivecheck(String email,  int memNo, HttpSession session) throws MessagingException {
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/mail/");
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		ArrayList<Mail> mList = chkInbox.receiveMailAttachedFile(savePath, memNo, email, currentTime);

	}

	
	@RequestMapping("mainBtn.mail")
	public ModelAndView MainBtn(HttpSession session, ModelAndView mv, String[] mailNo, String btnType) {
		
		int result = 0;
		Member m = (Member) session.getAttribute("loginUser");
		if (m != null) {
			ArrayList<String> mailNoAry = new ArrayList<>(Arrays.asList(mailNo));
			mv.setViewName("redirect:main.mail");
			switch (btnType) {
			case "readBtn": result = mmService.updateReadMail(mailNoAry); break;
			case "spamBtn": result = mmService.updateSpamMail(mailNoAry); break;
			case "unSpamBtn": result = mmService.updateUnSpamMail(mailNoAry);
				mv.setViewName("redirect:main.mail?folder=스팸"); break;
			case "deleteBtn": result = mmService.updateDeleteMail(mailNoAry); break;
			case "sendDeleteBtn": result = mmService.updateDeleteAllSendMail(mailNoAry);

				if (result > 0) {
					result = updateDeleteAllMailAt(session, mailNo, "보낸메일");
					mv.setViewName("redirect:sendInbox.mail");
				} break;
			case "deleteAllBtn": result = mmService.updateDeleteAllMail(mailNoAry);
				if (result > 0) {
					result = updateDeleteAllMailAt(session, mailNo, "받은메일");
					mv.setViewName("redirect:main.mail?folder=휴지");
				} break;
			}
			
			// 메일 항목에 변동이 있었기 때문에 세션값 재수정
			session.setAttribute("mainMailCount", mmService.mainMailCount(m.getMemNo()));

			if (result > 0) { // 성공
				session.setAttribute("alertMsg", "성공적으로 처리 되었습니다.");
			} else {
				mv.addObject("alertMsg", "처리할 항목이 없습니다");
			}
		} else {
			mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
			mv.setViewName("common/errorPage");
		}
		return mv;
	
	}

	// 첨부파일 완전 삭제 및 db delete실행 모듈화
	public int updateDeleteAllMailAt(HttpSession session, String[] mailNo, String folder) {
		String docNo = String.join(",", mailNo);
		int result = 1;
		// 셀렉트 해서 fileUrl을 먼저 가져와야하고
		HashMap<String, String> hs = new HashMap<>();
		hs.put("docNo", docNo);
		hs.put("folder", folder);
		
		// url값을 먼저 가지고 온다
		ArrayList<Attachment> fileUrlList = mmService.selectDeleteAllMailAt(hs);
		
		// 가져온 값을 server에서 삭제
		for (int i = 0; i < fileUrlList.size(); i++) {
			new File(session.getServletContext().getRealPath(fileUrlList.get(i).getFileUrl())).delete();
		}
		// db에도 삭제처리
		if(fileUrlList!=null) {
			result = mmService.updateDeleteAllMailAt(hs);
		}
		return result;
	}

	// 메인페이지 관련기능 끝
	
	
	// 글쓰기로 넘어감 (가면서 전사원리스트 조회함)
	@RequestMapping("enrollForm.mail")
	public ModelAndView enrollMail(HttpSession session, ModelAndView mv, String replyType) {
		Member m = (Member) session.getAttribute("loginUser");
		if (m != null) {
			ArrayList<Member> empList = mmService.employeeList();
			
			mv.addObject("empList", empList) // 전사원 리스트
			  .addObject("replyType", replyType)  
			  .setViewName("mail/mailEnrollForm");
		} else {
			mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 첨부파일 저장을 위한 메소드 모듈화
	public String saveFile(HttpSession session, MultipartFile upfile) {
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/mail/");
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime + ranNum + ext;
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
	// 전달메일 발송시 첨부파일 저장을 위한 메소드 모듈화
	public String saveFile(HttpSession session, File in, String originName) {
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/mail/");
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		return currentTime + ranNum + ext;
	}
	
	
	// 메일 발송시 인설트 및 서버에 전송(sendMailSmtp()) 처리
	@RequestMapping("send.mail")
	public ModelAndView sendMail(HttpServletRequest request,ModelAndView mv, HttpSession session, MultipartFile[] upfile, Mail mm, String[] originFile) {

		// 첨부파일을 전달해서 발송하는 경우 기존 파일 에서 꺼내와서 카피
		if(originFile!=null&&originFile.length!=0) {
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/mail/");
			ArrayList<Attachment> list = new ArrayList<>();
			for (int i = 0; i < originFile.length; i=i+2) {
				Attachment at = new Attachment();
				File in = new File(session.getServletContext().getRealPath(originFile[i]));
				String changeName =saveFile(session, in,originFile[i+1]);
				File out = new File(savePath+changeName);
				at.setChangeName(changeName);
				at.setOriginName(originFile[i+1]);
				at.setFileUrl("resources/uploadFiles/mail/" + at.getChangeName());
				at.setFileLevel((i + 2)/2);
				at.setFileType("보낸메일");
				list.add(at);
				try {
					FileCopyUtils.copy(in, out);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			mm.setAt(list);
		}
		
		Member m = (Member) session.getAttribute("loginUser");
		if (m != null) {
			mm.setMemNo(m.getMemNo());
			mm.setSender(m.getEmail());
			mm.setReceiver(String.join(", ", mm.getReceiveAry()));
			mm.setRefReceiver(String.join(", ", mm.getRefReceiveAry()));

			if (!upfile[0].getOriginalFilename().equals("")) {
				ArrayList<Attachment> list = new ArrayList<>();

				for (int i = 0; i < upfile.length; i++) {
					Attachment at = new Attachment();
					at.setChangeName(saveFile(session, upfile[i]));
					at.setOriginName(upfile[i].getOriginalFilename());
					at.setFileUrl("resources/uploadFiles/mail/" + at.getChangeName());
					at.setFileLevel(i + 1);
					at.setFileType("보낸메일");
					list.add(at);
				}
				mm.setAt(list);
			}
			// 해당 두 계정만 서버와 연동시켰기 때문에 조건처리했습니다.
			if (m.getEmail().equals("user05@thezo.site") || m.getEmail().equals("user06@thezo.site")) {
				sendMailSmtp(mm, request);
			}
			int result = mmService.sendMail(mm);

			if (result > 0) { // 성공
				session.setAttribute("alertMsg", "성공적으로 발송 되었습니다.");
				mv.setViewName("redirect:main.mail");
			} else {
				// 실패하면 첨부도 지우자
				mv.addObject("errorMsg", "작성에 실패했습니다");
				mv.setViewName("common/errorPage");
			}
		} else {
			mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	

	
	// 메일 서버에서 발송하는 기능
	public void sendMailSmtp(Mail mm,HttpServletRequest request) {
		String host = "smtp.daum.net";
		String user = mm.getSender();
		String password = "skfem11!";
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		 // SSL setting
		props.setProperty("mail.imap.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.imap.socketFactory.fallback", "false");
		props.setProperty("mail.imap.socketFactory.port",
                String.valueOf(993));

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			
			// 수신 및 참조			
			String receiver= setReceiversFunction(mm.getReceiver());
			String[] receiverAry = receiver.split(",");
			
			InternetAddress[] toAddr = new InternetAddress[receiverAry.length];
			for (int i = 0; i < toAddr.length; i++) {
				toAddr[i] = new InternetAddress (receiverAry[i]);
			}
			message.setRecipients(Message.RecipientType.TO, toAddr);
			
			if (!mm.getRefReceiver().equals("")) {

				String refReceiver = setReceiversFunction(mm.getRefReceiver());
				String[] refReceiverAry = refReceiver.split(",");

				InternetAddress[] refAddr = new InternetAddress[refReceiverAry.length];
				for (int i = 0; i < refAddr.length; i++) {
					refAddr[i] = new InternetAddress(refReceiverAry[i]);
				}
				message.setRecipients(Message.RecipientType.CC, refAddr);
			}
			// 메일 제목
			message.setSubject(mm.getMailTitle(), "utf-8");
			// 메일 내용
			
			
			String realPath =request.getSession().getServletContext().getRealPath("/resources/uploadFiles/mail/");
			
			MimeBodyPart mbp1 = new MimeBodyPart();
			Multipart mp = new MimeMultipart();
			// summernote내 내용을 담고 캐릭터셋 설정
			mbp1.setContent(mm.getMailContent(), "text/html;charset=euc-kr");
			mp.addBodyPart(mbp1);
			
			
			// 첨부파일 발송을 위한 세팅
			MimeBodyPart mbp2 = null;
			
			if (mm.getAt()!=null) {
				FileDataSource fds = new FileDataSource(realPath+mm.getAt().get(0).getChangeName());
            	for (int i = 0; i < mm.getAt().size(); i++) {
                	mbp2 = new MimeBodyPart();
                	mbp2.setDataHandler(new DataHandler(new FileDataSource(realPath+mm.getAt().get(i).getChangeName())));
                	mbp2.setFileName(mm.getAt().get(i).getOriginName());
                	mp.addBodyPart(mbp2);
                }
            	mp.addBodyPart(mbp2);
            }
			
			message.setContent(mp);
			// 메일발송
			Transport.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}

		
	}
	
	@RequestMapping("mailDetail.mail")
	public ModelAndView selectDetailMail(int mno, HttpSession session, ModelAndView mv) {
		Member m = (Member) session.getAttribute("loginUser");
		if (m != null) {
			int memNo = m.getMemNo();

			Mail mm = mmService.selectDetailMail(mno);
			ArrayList<Attachment> atList = mmService.selectDetailMailAt(mm);
			mm.setAt(atList);
			mm.setReceiver(setReceiversFunction(mm.getReceiver()));
			if (mm.getRefReceiver()!=null) {
				mm.setRefReceiver(setReceiversFunction(mm.getRefReceiver()));
			}
			if (mm.getMemNo() == memNo) {
				ArrayList<Member> empList = mmService.employeeList();// 전사원 리스트
				
				mmService.updateReadMailOne(mno);
				session.setAttribute("mainMailCount", mmService.mainMailCount(m.getMemNo()));
				mv.addObject("mm", mm)
				.addObject("empList", empList)
				.setViewName("mail/mailDetail");
			} else {
				mv.addObject("errorMsg", "오류가 발생했습니다");
				mv.setViewName("common/errorPage");
			}
		} else {
			mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("sendDetail.mail")
	public ModelAndView selectSendDetailMail(int mno, HttpSession session, ModelAndView mv) {
		Member m = (Member) session.getAttribute("loginUser");
		if (m != null) {
			int memNo = m.getMemNo();
			Mail mm = mmService.selectSendDetailMail(mno);
			ArrayList<Attachment> atList = mmService.selectDetailMailAt(mm);
			mm.setAt(atList);
			mm.setReceiver(setReceiversFunction(mm.getReceiver()));
			if (mm.getRefReceiver()!=null) {
				mm.setRefReceiver(setReceiversFunction(mm.getRefReceiver()));
			}
			if (mm.getMemNo() == memNo) {
				mv.addObject("mm", mm);
				mv.setViewName("mail/mailDetail");
			} else {
				mv.addObject("errorMsg", "오류가 발생했습니다");
				mv.setViewName("common/errorPage");
			}
		} else {
			mv.addObject("errorMsg", "로그인 후 이용 해 주세요");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// db에 여러 수신,참조자가 컴마로 둘러싸여있는데 빈칸 및 맨 앞 맨 뒤 ,제거 하는 메소드
	public String setReceiversFunction(String receiver) {
		receiver = receiver.replace(" ",""); // 빈칸을 없앰
		// 첫번째글자가 ,이면 ,뺴고 출력
		if(receiver.substring(0, 1).matches(",")) {
			receiver=receiver.substring(1);
		}		
		// 맨뒤 글자가 ,이면 ,뺴고 출력
		if(receiver.substring(receiver.length()-1, receiver.length()).matches(",")) {
			receiver=receiver.substring(0,receiver.length()-1);
		}
		
		return receiver;
		
	}
	
	// ------------------ admin 영역 -------------------------------------
	
	

	
}
