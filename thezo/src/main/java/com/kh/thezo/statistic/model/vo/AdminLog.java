package com.kh.thezo.statistic.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter	@Setter
public class AdminLog {

	private int logNo;
	private String developerName;
	private String modificationContent;
	private String enrollDate;
}
