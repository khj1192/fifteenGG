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

public class LeagueItem implements Serializable {

	private static final long serialVersionUID = 3987113536371700279L;

	private boolean freshBlood;
	private boolean hotStreak;
	private boolean inactive;
	private int leaguePoints;
	private int losses;
	private MiniSeries miniSeries;
	private String rank;
	private String summonerId;
	private String summonerName;
	private boolean veteran;
	private int wins;

	public int getLeaguePoints() {
		return leaguePoints;
	}

	public int getLosses() {
		return losses;
	}

	public MiniSeries getMiniSeries() {
		return miniSeries;
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

	@Override
	public String toString() {
		return getSummonerName();
	}
}