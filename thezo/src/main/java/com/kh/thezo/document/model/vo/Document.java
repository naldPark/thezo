package com.kh.thezo.document.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


/**
 * @author 선영
 *
 */
@NoArgsConstructor
@Getter	@Setter
@ToString
public class Document {
	private int docNo;
	private String docWriter;
	private String docContent;
	private String docCategory;
	private Date createDate;
	private String originName;
	private String changeName;
	private String status;
}
