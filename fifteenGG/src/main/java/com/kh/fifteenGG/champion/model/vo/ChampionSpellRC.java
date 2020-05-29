package com.kh.fifteenGG.champion.model.vo;

public class ChampionSpellRC {
	
	 private String champName;
	 private String spell1;
	 private String spell2;
	 private double odds;
	 private double pickRate;
	
	 
	 public ChampionSpellRC() {
		super();
		
	}


	public ChampionSpellRC(String champName, String spell1, String spell2, double odds, double pickRate) {
		super();
		this.champName = champName;
		this.spell1 = spell1;
		this.spell2 = spell2;
		this.odds = odds;
		this.pickRate = pickRate;
	}


	@Override
	public String toString() {
		return "DetailPercentage [champName=" + champName + ", spell1=" + spell1 + ", spell2=" + spell2 + ", odds="
				+ odds + ", pickRate=" + pickRate + "]";
	}


	
	public String getChampName() {
		return champName;
	}



	public void setChampName(String champName) {
		this.champName = champName;
	}


	
	public String getSpell1() {
		return spell1;
	}


	
	public void setSpell1(String spell1) {
		this.spell1 = spell1;
	}


	
	public String getSpell2() {
		return spell2;
	}



	public void setSpell2(String spell2) {
		this.spell2 = spell2;
	}



	public double getOdds() {
		return odds;
	}


	
	public void setOdds(double odds) {
		this.odds = odds;
	}



	public double getPickRate() {
		return pickRate;
	}


	
	public void setPickRate(double pickRate) {
		this.pickRate = pickRate;
	}




}
