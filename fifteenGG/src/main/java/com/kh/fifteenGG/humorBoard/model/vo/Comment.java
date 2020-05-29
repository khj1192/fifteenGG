package com.kh.fifteenGG.humorBoard.model.vo;

import java.sql.Date;

public class Comment {
	 private int cmtNo;
	 private int humorBno;
	 private int userNo;
	 private String nickName;
	 private String cmtContent;
	 private Date cmtDate;
	 
	 
	public Comment() {
		super();
	}
	public Comment(int cmtNo, int humorBno, int userNo, String nickName, String cmtContent, Date cmtDate) {
		super();
		this.cmtNo = cmtNo;
		this.humorBno = humorBno;
		this.userNo = userNo;
		this.nickName = nickName;
		this.cmtContent = cmtContent;
		this.cmtDate = cmtDate;
	}
	public int getCmtNo() {
		return cmtNo;
	}
	public void setCmtNo(int cmtNo) {
		this.cmtNo = cmtNo;
	}
	public int getHumorBno() {
		return humorBno;
	}
	public void setHumorBno(int humorBno) {
		this.humorBno = humorBno;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getCmtContent() {
		return cmtContent;
	}
	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}
	public Date getCmtDate() {
		return cmtDate;
	}
	public void setCmtDate(Date cmtDate) {
		this.cmtDate = cmtDate;
	}
	@Override
	public String toString() {
		return "Comment [cmtNo=" + cmtNo + ", humorBno=" + humorBno + ", userNo=" + userNo + ", nickName=" + nickName
				+ ", cmtContent=" + cmtContent + ", cmtDate=" + cmtDate + "]";
	}
	 
	 
	 
	 
}
