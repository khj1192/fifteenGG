package com.kh.fifteenGG.search.model.vo.view;

public class MatchKDA {
	
	private String summonerName;
	private String gameId;
	private double kda;
	private int cs;
	private int gameDuration;
	private int win;
	
	
	public MatchKDA() {
		super();

	}

	@Override
	public String toString() {
		return "MatchKDA [summonerName=" + summonerName + ", gameId=" + gameId + ", kda=" + kda + ", cs=" + cs
				+ ", gameDuration=" + gameDuration + ", win=" + win + "]";
	}



	public MatchKDA(String summonerName, String gameId, double kda, int cs, int gameDuration, int win) {
		super();
		this.summonerName = summonerName;
		this.gameId = gameId;
		this.kda = kda;
		this.cs = cs;
		this.gameDuration = gameDuration;
		this.win = win;
	}



	public String getSummonerName() {
		return summonerName;
	}


	public void setSummonerName(String summonerName) {
		this.summonerName = summonerName;
	}


	public String getGameId() {
		return gameId;
	}


	public void setGameId(String gameId) {
		this.gameId = gameId;
	}


	public double getKda() {
		return kda;
	}


	public void setKda(double kda) {
		this.kda = kda;
	}


	public int getCs() {
		return cs;
	}


	public void setCs(int cs) {
		this.cs = cs;
	}


	public int getGameDuration() {
		return gameDuration;
	}



	public void setGameDuration(int gameDuration) {
		this.gameDuration = gameDuration;
	}


	public int getWin() {
		return win;
	}


	public void setWin(int win) {
		this.win = win;
	}

	
	
	
}
