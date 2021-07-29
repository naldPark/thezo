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
public class Market {

	private int marketNo;
	private int memNo;
	private String marketWriter;
	private String marketTitle;
	private String marketContent;
	private Date marketDate;
	private String marketSection;
	private int price;
	private String productImg;
	private int productLike;
	private int count;
	private String status;
	
}
