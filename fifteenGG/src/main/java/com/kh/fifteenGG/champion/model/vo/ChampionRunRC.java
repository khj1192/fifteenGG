package com.kh.fifteenGG.champion.model.vo;

public class ChampionRunRC {
	private int rnum;
	private String champName;
	private int perkPrimaryStyle;
	private int perk0, perk1, perk2, perk3;
	private int perkSubStyle;
	private int perk4, perk5;
	private int statPerk0, statPerk1, statPerk2;
	private double odds;
	private double PickRate;
	
	
	public ChampionRunRC() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ChampionRunRC(int rnum, String champName, int perkPrimaryStyle, int perk0, int perk1, int perk2, int perk3,
			int perkSubStyle, int perk4, int perk5, int statPerk0, int statPerk1, int statPerk2, double odds,
			double pickRate) {
		super();
		this.rnum = rnum;
		this.champName = champName;
		this.perkPrimaryStyle = perkPrimaryStyle;
		this.perk0 = perk0;
		this.perk1 = perk1;
		this.perk2 = perk2;
		this.perk3 = perk3;
		this.perkSubStyle = perkSubStyle;
		this.perk4 = perk4;
		this.perk5 = perk5;
		this.statPerk0 = statPerk0;
		this.statPerk1 = statPerk1;
		this.statPerk2 = statPerk2;
		this.odds = odds;
		PickRate = pickRate;
	}


	@Override
	public String toString() {
		return "ChampionRunRC [rnum=" + rnum + ", champName=" + champName + ", perkPrimaryStyle=" + perkPrimaryStyle
				+ ", perk0=" + perk0 + ", perk1=" + perk1 + ", perk2=" + perk2 + ", perk3=" + perk3 + ", perkSubStyle="
				+ perkSubStyle + ", perk4=" + perk4 + ", perk5=" + perk5 + ", statPerk0=" + statPerk0 + ", statPerk1="
				+ statPerk1 + ", statPerk2=" + statPerk2 + ", odds=" + odds + ", PickRate=" + PickRate + "]";
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


	public int getPerkPrimaryStyle() {
		return perkPrimaryStyle;
	}


	public void setPerkPrimaryStyle(int perkPrimaryStyle) {
		this.perkPrimaryStyle = perkPrimaryStyle;
	}


	public int getPerk0() {
		return perk0;
	}


	public void setPerk0(int perk0) {
		this.perk0 = perk0;
	}


	public int getPerk1() {
		return perk1;
	}


	public void setPerk1(int perk1) {
		this.perk1 = perk1;
	}


	public int getPerk2() {
		return perk2;
	}


	public void setPerk2(int perk2) {
		this.perk2 = perk2;
	}


	public int getPerk3() {
		return perk3;
	}


	public void setPerk3(int perk3) {
		this.perk3 = perk3;
	}


	public int getPerkSubStyle() {
		return perkSubStyle;
	}


	public void setPerkSubStyle(int perkSubStyle) {
		this.perkSubStyle = perkSubStyle;
	}


	public int getPerk4() {
		return perk4;
	}


	public void setPerk4(int perk4) {
		this.perk4 = perk4;
	}


	public int getPerk5() {
		return perk5;
	}


	public void setPerk5(int perk5) {
		this.perk5 = perk5;
	}


	public int getStatPerk0() {
		return statPerk0;
	}


	public void setStatPerk0(int statPerk0) {
		this.statPerk0 = statPerk0;
	}


	public int getStatPerk1() {
		return statPerk1;
	}


	public void setStatPerk1(int statPerk1) {
		this.statPerk1 = statPerk1;
	}


	public int getStatPerk2() {
		return statPerk2;
	}


	public void setStatPerk2(int statPerk2) {
		this.statPerk2 = statPerk2;
	}


	public double getOdds() {
		return odds;
	}


	public void setOdds(double odds) {
		this.odds = odds;
	}


	public double getPickRate() {
		return PickRate;
	}


	public void setPickRate(double pickRate) {
		PickRate = pickRate;
	}
	
	
	
	
	
	
	
	
	
}
