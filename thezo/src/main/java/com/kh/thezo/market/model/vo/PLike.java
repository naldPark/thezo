package com.kh.thezo.market.model.vo;

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
public class PLike {

	private int likeNo;
	private int marketNo;
	private String memId;
	private Date likeDate;
}
