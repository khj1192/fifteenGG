package com.kh.fifteenGG.humorBoard.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class humorBoard implements Serializable{
	
	private int humorbNo;
	private int userNo;
	private String humorTitle;
	private String humorWriter;
	private String humorContent;
	private Date humorDate;
	private int humorBoardCount;

	public humorBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public humorBoard(int humorbNo, int userNo, String humorTitle, String humorWriter, String humorContent,
			Date humorDate, int humorBoardCount) {
		super();
		this.humorbNo = humorbNo;
		this.userNo = userNo;
		this.humorTitle = humorTitle;
		this.humorWriter = humorWriter;
		this.humorContent = humorContent;
		this.humorDate = humorDate;
		this.humorBoardCount = humorBoardCount;
		
	}



	@Override
	public String toString() {
		return "humorBoard [humorbNo=" + humorbNo + ", userNo=" + userNo + ", humorTitle=" + humorTitle
				+ ", humorWriter=" + humorWriter + ", humorContent=" + humorContent + ", humorDate=" + humorDate
				+ ", humorBoardCount=" + humorBoardCount  + "]";
	}



	public int getHumorbNo() {
		return humorbNo;
	}

	public void setHumorbNo(int humorbNo) {
		this.humorbNo = humorbNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getHumorTitle() {
		return humorTitle;
	}

	public void setHumorTitle(String humorTitle) {
		this.humorTitle = humorTitle;
	}

	public String getHumorWriter() {
		return humorWriter;
	}

	public void setHumorWriter(String humorWriter) {
		this.humorWriter = humorWriter;
	}

	public String getHumorContent() {
		return humorContent;
	}

	public void setHumorContent(String humorContent) {
		this.humorContent = humorContent;
	}


	public Date getHumorDate() {
		return humorDate;
	}

	public void setHumorDate(Date humorDate) {
		this.humorDate = humorDate;
	}

	public int getHumorBoardCount() {
		return humorBoardCount;
	}

	public void setHumorBoardCount(int humorBoardCount) {
		this.humorBoardCount = humorBoardCount;
	}

	
	
}