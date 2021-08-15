package com.kh.thezo.reservation.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Resource {
	private int resourceNo;
	private String category;
	private String resourceName;
}
