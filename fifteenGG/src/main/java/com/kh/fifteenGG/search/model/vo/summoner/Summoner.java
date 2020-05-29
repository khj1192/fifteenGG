package com.kh.fifteenGG.search.model.vo.summoner;

import java.io.Serializable;

public class Summoner implements Serializable {

	private static final long serialVersionUID = -8213488199644701555L;

	private String accountId;
	private String id;
	private String puuid;
	private String name;
	private int profileIconId;
	private long revisionDate;
	private int summonerLevel;

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPuuid(String puuid) {
		this.puuid = puuid;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setProfileIconId(int profileIconId) {
		this.profileIconId = profileIconId;
	}

	public void setRevisionDate(long revisionDate) {
		this.revisionDate = revisionDate;
	}

	public void setSummonerLevel(int summonerLevel) {
		this.summonerLevel = summonerLevel;
	}

	public String getAccountId() {
		return accountId;
	}

	public String getId() {
		return id;
	}

	public String getPuuid() {
		return puuid;
	}

	public String getName() {
		return name;
	}

	public int getProfileIconId() {
		return profileIconId;
	}

	public long getRevisionDate() {
		return revisionDate;
	}

	public int getSummonerLevel() {
		return summonerLevel;
	}

	@Override
	public String toString() {
		return getId() + ": " + getName();
	}
}