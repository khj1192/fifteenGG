package com.kh.fifteenGG.statisticsBoard.model.vo;

import java.io.Serializable;

public class DataTablePackageBoard implements Serializable{

	private int rnum;
	private String champName;
	private double FB;
	private double DK;
	private double TK;
	private double QK;
	private double PK;
    private double champKDA;
	private double highDamage;
	private double highDamageTaken;
	private double turretKill;	
	private double highMinionKill;	
	private double pastJungling;	
	private double healTop;	
	private double wardScore;
	private double wardKill;
	private double champWinPercent;	
	private double highGold;	
	private double banPercent;	
	private double pickPercent;	
	private int play;
	private String champIMG;
	
	public DataTablePackageBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DataTablePackageBoard(int rnum, String champName, double fB, double dK, double tK, double qK, double pK,
			double champKDA, double highDamage, double highDamageTaken, double turretKill, double highMinionKill,
			double pastJungling, double healTop, double wardScore, double wardKill, double champWinPercent,
			double highGold, double banPercent, double pickPercent, int play, String champIMG) {
		super();
		this.rnum = rnum;
		this.champName = champName;
		FB = fB;
		DK = dK;
		TK = tK;
		QK = qK;
		PK = pK;
		this.champKDA = champKDA;
		this.highDamage = highDamage;
		this.highDamageTaken = highDamageTaken;
		this.turretKill = turretKill;
		this.highMinionKill = highMinionKill;
		this.pastJungling = pastJungling;
		this.healTop = healTop;
		this.wardScore = wardScore;
		this.wardKill = wardKill;
		this.champWinPercent = champWinPercent;
		this.highGold = highGold;
		this.banPercent = banPercent;
		this.pickPercent = pickPercent;
		this.play = play;
		this.champIMG = champIMG;
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

	public double getFB() {
		return FB;
	}

	public void setFB(double fB) {
		FB = fB;
	}

	public double getDK() {
		return DK;
	}

	public void setDK(double dK) {
		DK = dK;
	}

	public double getTK() {
		return TK;
	}

	public void setTK(double tK) {
		TK = tK;
	}

	public double getQK() {
		return QK;
	}

	public void setQK(double qK) {
		QK = qK;
	}

	public double getPK() {
		return PK;
	}

	public void setPK(double pK) {
		PK = pK;
	}

	public double getChampKDA() {
		return champKDA;
	}

	public void setChampKDA(double champKDA) {
		this.champKDA = champKDA;
	}

	public double getHighDamage() {
		return highDamage;
	}

	public void setHighDamage(double highDamage) {
		this.highDamage = highDamage;
	}

	public double getHighDamageTaken() {
		return highDamageTaken;
	}

	public void setHighDamageTaken(double highDamageTaken) {
		this.highDamageTaken = highDamageTaken;
	}

	public double getTurretKill() {
		return turretKill;
	}

	public void setTurretKill(double turretKill) {
		this.turretKill = turretKill;
	}

	public double getHighMinionKill() {
		return highMinionKill;
	}

	public void setHighMinionKill(double highMinionKill) {
		this.highMinionKill = highMinionKill;
	}

	public double getPastJungling() {
		return pastJungling;
	}

	public void setPastJungling(double pastJungling) {
		this.pastJungling = pastJungling;
	}

	public double getHealTop() {
		return healTop;
	}

	public void setHealTop(double healTop) {
		this.healTop = healTop;
	}

	public double getWardScore() {
		return wardScore;
	}

	public void setWardScore(double wardScore) {
		this.wardScore = wardScore;
	}

	public double getWardKill() {
		return wardKill;
	}

	public void setWardKill(double wardKill) {
		this.wardKill = wardKill;
	}

	public double getChampWinPercent() {
		return champWinPercent;
	}

	public void setChampWinPercent(double champWinPercent) {
		this.champWinPercent = champWinPercent;
	}

	public double getHighGold() {
		return highGold;
	}

	public void setHighGold(double highGold) {
		this.highGold = highGold;
	}

	public double getBanPercent() {
		return banPercent;
	}

	public void setBanPercent(double banPercent) {
		this.banPercent = banPercent;
	}

	public double getPickPercent() {
		return pickPercent;
	}

	public void setPickPercent(double pickPercent) {
		this.pickPercent = pickPercent;
	}

	public int getPlay() {
		return play;
	}

	public void setPlay(int play) {
		this.play = play;
	}

	public String getChampIMG() {
		return champIMG;
	}

	public void setChampIMG(String champIMG) {
		this.champIMG = champIMG;
	}

	@Override
	public String toString() {
		return "DataTablePackageBoard [rnum=" + rnum + ", champName=" + champName + ", FB=" + FB + ", DK=" + DK
				+ ", TK=" + TK + ", QK=" + QK + ", PK=" + PK + ", champKDA=" + champKDA + ", highDamage=" + highDamage
				+ ", highDamageTaken=" + highDamageTaken + ", turretKill=" + turretKill + ", highMinionKill="
				+ highMinionKill + ", pastJungling=" + pastJungling + ", healTop=" + healTop + ", wardScore="
				+ wardScore + ", wardKill=" + wardKill + ", champWinPercent=" + champWinPercent + ", highGold="
				+ highGold + ", banPercent=" + banPercent + ", pickPercent=" + pickPercent + ", play=" + play
				+ ", champIMG=" + champIMG + "]";
	}
	
	
	
}
