/*
 * Copyright 2014 Taylor Caldwell
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.kh.fifteenGG.search.model.vo.league;

import java.io.Serializable;

public class LeagueEntry implements Serializable {

	private static final long serialVersionUID = 7672279635939129200L;

	private boolean freshBlood;
	private boolean hotStreak;
	private boolean inactive;
	private String leagueId;
	private int leaguePoints;
	private int losses;
	private MiniSeries miniSeries;
	private String queueType;
	private String rank;
	private String summonerId;
	private String summonerName;
	private String tier;
	private boolean veteran;
	private int wins;

	@Override
	public String toString() {
		return "LeagueEntry{" +
				"freshBlood=" + freshBlood +
				", hotStreak=" + hotStreak +
				", inactive=" + inactive +
				", leagueId='" + leagueId + '\'' +
				", leaguePoints=" + leaguePoints +
				", losses=" + losses +
				", miniSeries=" + miniSeries +
				", queueType='" + queueType + '\'' +
				", rank='" + rank + '\'' +
				", summonerId='" + summonerId + '\'' +
				", summonerName='" + summonerName + '\'' +
				", tier='" + tier + '\'' +
				", veteran=" + veteran +
				", wins=" + wins +
				'}';
	}

	public String getLeagueId() {
		return leagueId;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public void setFreshBlood(boolean freshBlood) {
		this.freshBlood = freshBlood;
	}

	public void setHotStreak(boolean hotStreak) {
		this.hotStreak = hotStreak;
	}

	public void setInactive(boolean inactive) {
		this.inactive = inactive;
	}

	public void setLeagueId(String leagueId) {
		this.leagueId = leagueId;
	}

	public void setLeaguePoints(int leaguePoints) {
		this.leaguePoints = leaguePoints;
	}

	public void setLosses(int losses) {
		this.losses = losses;
	}

	public void setMiniSeries(MiniSeries miniSeries) {
		this.miniSeries = miniSeries;
	}

	public void setQueueType(String queueType) {
		this.queueType = queueType;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public void setSummonerId(String summonerId) {
		this.summonerId = summonerId;
	}

	public void setSummonerName(String summonerName) {
		this.summonerName = summonerName;
	}

	public void setTier(String tier) {
		this.tier = tier;
	}

	public void setVeteran(boolean veteran) {
		this.veteran = veteran;
	}

	public void setWins(int wins) {
		this.wins = wins;
	}

	public int getLeaguePoints() {
		return leaguePoints;
	}

	public int getLosses() {
		return losses;
	}

	public MiniSeries getMiniSeries() {
		return miniSeries;
	}

	public String getQueueType() {
		return queueType;
	}

	public String getRank() {
		return rank;
	}

	public String getSummonerId() {
		return summonerId;
	}

	public String getSummonerName() {
		return summonerName;
	}

	public String getTier() {
		return tier;
	}

	public int getWins() {
		return wins;
	}

	public boolean isFreshBlood() {
		return freshBlood;
	}

	public boolean isHotStreak() {
		return hotStreak;
	}

	public boolean isInactive() {
		return inactive;
	}

	public boolean isVeteran() {
		return veteran;
	}

}