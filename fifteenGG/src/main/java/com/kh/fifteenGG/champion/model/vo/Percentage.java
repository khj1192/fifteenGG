package com.kh.fifteenGG.champion.model.vo;

public class Percentage {

	private int rnum;
	private String champName;
	private double winPercent;
	private String position;
	private int pansoo;
	private double picPercent;
	private String champFullIMG;
	
	public Percentage() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Percentage(int rnum, String champName, double winPercent, String position, int pansoo, double picPercent,
			String champFullIMG) {
		super();
		this.rnum = rnum;
		this.champName = champName;
		this.winPercent = winPercent;
		this.position = position;
		this.pansoo = pansoo;
		this.picPercent = picPercent;
		this.champFullIMG = champFullIMG;
	}

	@Override
	public String toString() {
		return "Percentage [rnum=" + rnum + ", champName=" + champName + ", winPercent=" + winPercent + ", position="
				+ position + ", pansoo=" + pansoo + ", picPercent=" + picPercent + ", champFullIMG=" + champFullIMG
				+ "]";
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getChampName() {
		return champName;
	}

	public void setChampName(String champName) {
		this.champName = champName;
	}

	public double getWinPercent() {
		return winPercent;
	}

	public void setWinPercent(double winPercent) {
		this.winPercent = winPercent;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public int getPansoo() {
		return pansoo;
	}

	public void setPansoo(int pansoo) {
		this.pansoo = pansoo;
	}

	public double getPicPercent() {
		return picPercent;
	}

	public void setPicPercent(double picPercent) {
		this.picPercent = picPercent;
	}

	public String getChampFullIMG() {
		return champFullIMG;
	}

	public void setChampFullIMG(String champFullIMG) {
		this.champFullIMG = champFullIMG;
	}


	
	
	
	
	
	
	
}
