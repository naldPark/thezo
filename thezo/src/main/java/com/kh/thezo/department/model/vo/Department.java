package com.kh.thezo.department.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class Department {
	private String depNo;
	private String depName;
	private int depClass;
	private String parentDep;
	private int parDepclass;
	private String depStatus;
}
