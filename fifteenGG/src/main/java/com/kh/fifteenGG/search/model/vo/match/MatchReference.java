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

package com.kh.fifteenGG.search.model.vo.match;

import java.io.Serializable;

public class MatchReference implements Serializable {

	private static final long serialVersionUID = 3975874858170021162L;

	private int champion;
	private long gameId;
	private String lane;
	private String platformId;
	private int queue;
	private String role;
	private int season;
	private long timestamp;
	private String summonerId;
	private String summonerName;

	public int getChampion() {
		return champion;
	}

	public String getSummonerId() {
		return summonerId;
	}

	public void setSummonerId(String summonerId) {
		this.summonerId = summonerId;
	}

	public String getSummonerName() {
		return summonerName;
	}

	public void setSummonerName(String summonerName) {
		this.summonerName = summonerName;
	}

	public long getGameId() {
		return gameId;
	}

	public String getLane() {
		return lane;
	}

	public String getPlatformId() {
		return platformId;
	}

	public int getQueue() {
		return queue;
	}

	public String getRole() {
		return role;
	}

	public int getSeason() {
		return season;
	}

	public long getTimestamp() {
		return timestamp;
	}

	@Override
	public String toString() {
		return "MatchReference{" +
				"champion=" + champion +
				", gameId=" + gameId +
				", lane='" + lane + '\'' +
				", platformId='" + platformId + '\'' +
				", queue=" + queue +
				", role='" + role + '\'' +
				", season=" + season +
				", timestamp=" + timestamp +
				'}';
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public void setChampion(int champion) {
		this.champion = champion;
	}

	public void setGameId(long gameId) {
		this.gameId = gameId;
	}

	public void setLane(String lane) {
		this.lane = lane;
	}

	public void setPlatformId(String platformId) {
		this.platformId = platformId;
	}

	public void setQueue(int queue) {
		this.queue = queue;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public void setSeason(int season) {
		this.season = season;
	}

	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}

}