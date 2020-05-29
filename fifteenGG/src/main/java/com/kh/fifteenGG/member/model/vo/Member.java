package com.kh.fifteenGG.member.model.vo;

import java.io.Serializable;

public class Member implements Serializable {
	
	private int userNo;
	private String email;
	private String nickName;
	private String password;
	
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Member(int userNo, String email, String nickName, String password) {
		super();
		this.userNo = userNo;
		this.email = email;
		this.nickName = nickName;
		this.password = password;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", email=" + email + ", nickName=" + nickName + ", password=" + password
				+ "]";
	}
	
	
	
}
