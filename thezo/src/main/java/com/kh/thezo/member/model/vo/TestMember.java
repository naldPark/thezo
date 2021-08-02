package com.kh.thezo.member.model.vo;
//@author Jaewon.s

public class TestMember {

	private int memNo;
	private String userId;
	private String userPwd;

	public TestMember() {}
	
	public TestMember(int memNo, String userId, String userPwd) {
		super();
		this.memNo = memNo;
		this.userId = userId;
		this.userPwd = userPwd;
	}

	public int getMemNo() {
		return memNo;
	}
		
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	@Override
	public String toString() {
		return "TestMember [memNo=" + memNo + ", userId=" + userId + ", userPwd=" + userPwd + "]";
	}

	

	
	
	
}
