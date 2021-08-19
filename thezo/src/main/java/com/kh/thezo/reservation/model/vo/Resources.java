package com.kh.thezo.reservation.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Resources {
	private int resourceNo;
	private int categoryNo;
	private String resourceName;
	private String categoryName;
}
