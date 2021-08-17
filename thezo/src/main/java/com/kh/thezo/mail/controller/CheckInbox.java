package com.kh.thezo.mail.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Flags;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.NoSuchProviderException;
import javax.mail.Part;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.internet.MimeBodyPart;
import org.springframework.stereotype.Controller;
import com.kh.thezo.mail.model.vo.Attachment;
import com.kh.thezo.mail.model.vo.Mail;
import com.sun.org.apache.xml.internal.security.exceptions.Base64DecodingException;
import com.sun.org.apache.xml.internal.security.utils.Base64;

@Controller
public class CheckInbox {


    public ArrayList<Mail> receiveMailAttachedFile(String savePath, int memNo, String user, String currentTime) throws MessagingException {
		ArrayList<Mail> mList = new ArrayList<>();
		
		if (user.equals("user05@thezo.site") || user.equals("user06@thezo.site")) {
			// 로그인에 필요한 계정 세팅
			String host = "pop.daum.net";
			String password = "skfem11!";

			try {
				// mail에 pop3 로 연결
				Properties prop = new Properties();
				prop.put("mail.pop3.host", host);
				prop.put("mail.pop3.port", 995);
				prop.put("mail.pop3.starttls.enable", "true");
				Session emailSession = Session.getDefaultInstance(prop);
				Store store = emailSession.getStore("pop3s");

				store.connect(host, user, password);

				// 받은편지함을 INBOX 라고 한다.
				Folder inbox = store.getFolder("INBOX");
				inbox.open(Folder.READ_WRITE);

				Message[] arrayMessages = inbox.getMessages();

				for (int i = arrayMessages.length; i > 0; i--) {

					// 메일객체를 생성해서 마지막에 arrayList에 담은 후 service에 넘길예정
					Mail mm = new Mail();
					mm.setMemNo(memNo);

					Message msg = arrayMessages[i - 1];
					if (msg != null) {
						// 메일 내용 변수에 담기(보낸사람)
						Address[] fromAddress = msg.getFrom();
						String from = fromAddress[0].toString();
						// 만약 꺽쇠로 되어있다면 꺽쇠 안의 내용만 가져옴
						if (from.indexOf(">") != -1) {
							mm.setSender(from.substring(from.indexOf("<") + 1, from.indexOf(">")));
						} else {
							mm.setSender(from);
						}
						// 메일 내용 변수에 담기(제목)
						String subject = msg.getSubject();
						mm.setMailTitle(subject);

						if (msg.getSentDate() != null) {
							mm.setSendDate(new SimpleDateFormat("yyyy-MM-dd").format(msg.getSentDate()));
							mm.setReceiveDate(new SimpleDateFormat("yyyy-MM-dd").format(msg.getSentDate()));

						} else {
							mm.setSendDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
							mm.setReceiveDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
						}

						mm.setFolder("받은");

						// 첨부파일이 있는지 확인하기 위해 contentType을 변수에 담음
						String contentType = msg.getContentType();

						// 디코딩 작업 이후에 담기위한 빈 변수 생성
						String messageContent = "";
						String attachFiles = "";

						String sendTo = "";
						if (msg.getRecipients(Message.RecipientType.TO) != null) {
							for (int j = 0; j < msg.getRecipients(Message.RecipientType.TO).length; j++) {
								String tempRecip = msg.getRecipients(Message.RecipientType.TO)[j].toString();
								if (tempRecip.indexOf(">") != -1) {
									int idx = tempRecip.indexOf("<") + 1;
									int idx2 = tempRecip.indexOf(">");
									sendTo += tempRecip.substring(idx, idx2) + ",";
								} else {
									sendTo += tempRecip + ",";
								}
							}
							mm.setReceiver(sendTo);
						} else {
							mm.setReceiver(user);
						}

						String refTo = "";
						if (msg.getRecipients(Message.RecipientType.CC) != null) {
							for (int j = 0; j < msg.getRecipients(Message.RecipientType.CC).length; j++) {
								String tempRefTo = msg.getRecipients(Message.RecipientType.CC)[j].toString();
								if (tempRefTo.indexOf(">") != -1) {
									int idx = tempRefTo.indexOf("<") + 1;
									int idx2 = tempRefTo.indexOf(">");
									refTo += tempRefTo.substring(idx, idx2) + ",";
								} else {
									refTo += tempRefTo + ",";
								}
							}
							mm.setRefReceiver(refTo);
						}

						// 첨부파일이 있는지 확인
						if (contentType.contains("multipart")) {
							// service에 넘겨주기위한 첨부 arrayList객체 생성
							ArrayList<Attachment> atList = new ArrayList<>();
							// multipart객체에 내용을 담고
							Multipart multiPart = (Multipart) msg.getContent();

							int numberOfParts = multiPart.getCount();

							// 첨부파일 있을 경우 지정 폴더로 저장
							int attachLevel = 1;
							for (int partCount = 0; partCount < numberOfParts; partCount++) {
								MimeBodyPart part = (MimeBodyPart) multiPart.getBodyPart(partCount);
								if (Part.ATTACHMENT.equalsIgnoreCase(part.getDisposition())) {

									// fileName을 우선 디코드 해준다
									String fileName = "";
									try {
										fileName = FilenameBase64Decode(part.getFileName());
									} catch (Base64DecodingException e) {
										e.printStackTrace();
									}

									// arrayList에 담기위한 첨부파일 객체를 생성하고
									Attachment at = new Attachment();

									// 저장경로를 생성

									int ranNum = (int) (Math.random() * 90000 + 10000);
									// 디코드 된 파일 이름을 originName에 담고
									String originName = fileName;
									at.setOriginName(fileName);
									// 새로운 파일 이름에 붙여줄 확장자 가져옴
									String ext = originName.substring(originName.lastIndexOf("."));
									// 랜덤함수를 이용해서 새로운 파일이름 설정
									String changeName = currentTime + ranNum + ext;

									// 파일 경로를 지정해주고
									at.setFileUrl("resources/uploadFiles/mail/" + changeName);
									// 파일이 여러개일경우 순차적으로 접근하기 위해 레벨을 설정
									at.setFileLevel(attachLevel);
									attachLevel++;
									at.setFileType("받은메일");

									// 폴더에 저장하는 메소드
									part.saveFile(savePath + File.separator + changeName);
									atList.add(at);
								}
								// 첨부파일이 아닌 메일 내용은 따로 저장
								if (part.getContentType().contains("multipart/alternative")
										|| part.getContentType().contains("text")) {
									try {
										messageContent = FilenameBase64Decode(getText(part));
									} catch (Base64DecodingException e) {
										e.printStackTrace();
									}
								}
							}
							if (attachFiles.length() > 1) {
								attachFiles = attachFiles.substring(0, attachFiles.length() - 2);
							}
							mm.setAt(atList);
							// 첨부파일이 없다면
						} else if (contentType.contains("text/plain") || contentType.contains("text/html")) {
							// 그냥 내용을 그대로 저장
							Object content = msg.getContent();
							if (content != null) {
								messageContent = content.toString();
							}
						}
						mm.setMailContent(messageContent);
						mList.add(mm);
						msg.setFlag(Flags.Flag.DELETED, true);
					}
				}
				// disconnect
				inbox.close(true);
				store.close();

			} catch (NoSuchProviderException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
		return mList;

    }
    
    
	    // 첨부파일이 담긴 메일 수신 시 내용 출력
    private String getText(Part p) throws MessagingException, IOException {

        boolean textIsHtml = false;
    	
        if (p.isMimeType("text/*")) {
            String s = (String)p.getContent();
            textIsHtml = p.isMimeType("text/html");
            return s;
        }
        if (p.isMimeType("multipart/alternative")) {
            Multipart mp = (Multipart)p.getContent();
            String text = null;
            for (int i = 0; i < mp.getCount(); i++) {
                Part bp = mp.getBodyPart(i);
                if (bp.isMimeType("text/plain")) {
                    if (text == null)
                        text = getText(bp);
                    continue;
                } else if (bp.isMimeType("text/html")) {
                    String s = getText(bp);
                    if (s != null)
                        return s;
                } else {
                    return getText(bp);
                }
            }
            return text;
        } else if (p.isMimeType("multipart/*")) {
            Multipart mp = (Multipart)p.getContent();
            for (int i = 0; i < mp.getCount(); i++) {
                String s = getText(mp.getBodyPart(i));
                if (s != null)
                    return s;
            }
        }
        return null;
    }
  
    //base64인코딩 된 내용 디코딩처리
    public static String FilenameBase64Decode(String fileName) 
    		throws UnsupportedEncodingException, Base64DecodingException { 
    	String result = ""; 
    	String tmpStr = ""; 
    	String[] decodeInfo; 
    	int startIndex = 0; 
    	int endIndex = 0; 
    	boolean decodingFlag = true; 
    	
    	//1. 문자열을 디코딩 해야 하는지 판단하고
    	if(fileName.indexOf("=?") == -1){
    		decodingFlag = false; 
    		result = fileName; 
    		} 
    	while (decodingFlag) {
    		if ((startIndex = fileName.indexOf("=?")) != -1) {
    			endIndex = fileName.indexOf("?="); 
    			//2. 문자열에서 구분자를 제거해주고 
    			tmpStr = fileName.substring(startIndex + "=?".length(), endIndex); 
    			//3. 인코딩 정보들을 분리한 후에 
    			decodeInfo = tmpStr.split("\\?"); 
    			//4. Base64로 디코딩 해준다 
    			result += new String(Base64.decode(decodeInfo[2]), decodeInfo[0]); 
    			fileName = fileName.substring(endIndex + "?=".length()); 
    			} else {
    				break; 
    				} 
    		} 
    	return result; 
    	} 


    
}