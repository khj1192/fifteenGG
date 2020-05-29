package com.kh.fifteenGG.partyBoard.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.GregorianCalendar;



public class PartyBoard  implements Serializable{
	
	Calendar cal = new GregorianCalendar();

	private long epoch = System.currentTimeMillis()/1000;	
	private int pbNo;
	private int pbTimer;
	private String pbRanktype;
	private String pbPosition;
	private String pbContent;
	private String pbUser;
    private char pbVoice;
    private String pbTier;
    private Date pbDate;

	public PartyBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PartyBoard(Calendar cal, long epoch, int pbNo, int pbTimer, String pbRanktype, String pbPosition,
			String pbContent, String pbUser, char pbVoice, String pbTier, Date pbDate) {
		super();
		this.cal = cal;
		this.epoch = epoch;
		this.pbNo = pbNo;
		this.pbTimer = pbTimer;
		this.pbRanktype = pbRanktype;
		this.pbPosition = pbPosition;
		this.pbContent = pbContent;
		this.pbUser = pbUser;
		this.pbVoice = pbVoice;
		this.pbTier = pbTier;
		this.pbDate = pbDate;
	}

	public Calendar getCal() {
		return cal;
	}

	public void setCal(Calendar cal) {
		this.cal = cal;
	}

	public long getEpoch() {
		return epoch;
	}

	public void setEpoch(long epoch) {
		this.epoch = epoch;
	}

	public int getPbNo() {
		return pbNo;
	}

	public void setPbNo(int pbNo) {
		this.pbNo = pbNo;
	}

	public int getPbTimer() {
		return pbTimer;
	}

	public void setPbTimer(int pbTimer) {
		this.pbTimer = pbTimer;
	}

	public String getPbRanktype() {
		return pbRanktype;
	}

	public void setPbRanktype(String pbRanktype) {
		this.pbRanktype = pbRanktype;
	}

	public String getPbPosition() {
		return pbPosition;
	}

	public void setPbPosition(String pbPosition) {
		this.pbPosition = pbPosition;
	}

	public String getPbContent() {
		return pbContent;
	}

	public void setPbContent(String pbContent) {
		this.pbContent = pbContent;
	}

	public String getPbUser() {
		return pbUser;
	}

	public void setPbUser(String pbUser) {
		this.pbUser = pbUser;
	}

	public char getPbVoice() {
		return pbVoice;
	}

	public void setPbVoice(char pbVoice) {
		this.pbVoice = pbVoice;
	}

	public String getPbTier() {
		return pbTier;
	}

	public void setPbTier(String pbTier) {
		this.pbTier = pbTier;
	}

	public Date getPbDate() {
		return pbDate;
	}

	public void setPbDate(Date pbDate) {
		this.pbDate = pbDate;
	}

	@Override
	public String toString() {
		return "PartyBoard [cal=" + cal + ", epoch=" + epoch + ", pbNo=" + pbNo + ", pbTimer=" + pbTimer
				+ ", pbRanktype=" + pbRanktype + ", pbPosition=" + pbPosition + ", pbContent=" + pbContent + ", pbUser="
				+ pbUser + ", pbVoice=" + pbVoice + ", pbTier=" + pbTier + ", pbDate=" + pbDate + "]";
	}

	
	
}   
