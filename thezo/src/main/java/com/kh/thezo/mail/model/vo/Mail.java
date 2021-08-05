package com.kh.thezo.mail.model.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Mail {
	
	private int seMailNo; //SEQ_RMNO
	private int reMailNo; //SEQ_SMNO
	private String mailTitle;
	private String mailContent;
	private String sender; //이메일형태
	private String receiver; //이메일형태
	private String read;//Y/N
	private Date sendDate;
	private String tempSave;//Y/N
	private String seStatus;//Y/N
	private String reStatus;//Y/N
	private String spam; //Y/N
	private String folder; //받은/보낸/참조/휴지/개인/임시
}
