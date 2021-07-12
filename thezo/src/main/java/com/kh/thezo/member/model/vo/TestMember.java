package com.kh.thezo.member.model.vo;
//@author Jaewon.s

public class TestMember {

	private String userId;
	private String userPwd;

	public TestMember() {}
	
	public TestMember(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
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
		return "TestMember [userId=" + userId + ", userPwd=" + userPwd + "]";
	}
	

	
	
	
}
