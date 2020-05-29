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
import java.util.List;

public class TeamStats implements Serializable {

    private static final long serialVersionUID = -3414402914522684688L;

    private long gameId;
    private List<TeamBans> bans;
    private int baronKills;
    private int dominionVictoryScore;
    private int dragonKills;
    private boolean firstBaron;
    private boolean firstBlood;
    private boolean firstDragon;
    private boolean firstInhibitor;
    private boolean firstRiftHerald;
    private boolean firstTower;
    private int inhibitorKills;
    private int riftHeraldKills;
    private int teamId;
    private int towerKills;
    private int vilemawKills;
    private String win;

    public long getGameId() {
        return gameId;
    }

    public void setGameId(long gameId) {
        this.gameId = gameId;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public void setBans(List<TeamBans> bans) {
        this.bans = bans;
    }

    public void setBaronKills(int baronKills) {
        this.baronKills = baronKills;
    }

    public void setDominionVictoryScore(int dominionVictoryScore) {
        this.dominionVictoryScore = dominionVictoryScore;
    }

    public void setDragonKills(int dragonKills) {
        this.dragonKills = dragonKills;
    }

    public void setFirstBaron(boolean firstBaron) {
        this.firstBaron = firstBaron;
    }

    public void setFirstBlood(boolean firstBlood) {
        this.firstBlood = firstBlood;
    }

    public void setFirstDragon(boolean firstDragon) {
        this.firstDragon = firstDragon;
    }

    public void setFirstInhibitor(boolean firstInhibitor) {
        this.firstInhibitor = firstInhibitor;
    }

    public void setFirstRiftHerald(boolean firstRiftHerald) {
        this.firstRiftHerald = firstRiftHerald;
    }

    public void setFirstTower(boolean firstTower) {
        this.firstTower = firstTower;
    }

    public void setInhibitorKills(int inhibitorKills) {
        this.inhibitorKills = inhibitorKills;
    }

    public void setRiftHeraldKills(int riftHeraldKills) {
        this.riftHeraldKills = riftHeraldKills;
    }

    public void setTeamId(int teamId) {
        this.teamId = teamId;
    }

    public void setTowerKills(int towerKills) {
        this.towerKills = towerKills;
    }

    public void setVilemawKills(int vilemawKills) {
        this.vilemawKills = vilemawKills;
    }

    public void setWin(String win) {
        this.win = win;
    }

    public List<TeamBans> getBans() {
        return bans;
    }

    public int getBaronKills() {
        return baronKills;
    }

    public int getDominionVictoryScore() {
        return dominionVictoryScore;
    }

    public int getDragonKills() {
        return dragonKills;
    }

    public int getInhibitorKills() {
        return inhibitorKills;
    }

    public int getRiftHeraldKills() {
        return riftHeraldKills;
    }

    public int getTeamId() {
        return teamId;
    }

    public int getTowerKills() {
        return towerKills;
    }

    public int getVilemawKills() {
        return vilemawKills;
    }

    public String getWin() {
        return win;
    }

    public boolean isFirstBaron() {
        return firstBaron;
    }

    public boolean isFirstBlood() {
        return firstBlood;
    }

    public boolean isFirstDragon() {
        return firstDragon;
    }

    public boolean isFirstInhibitor() {
        return firstInhibitor;
    }

    public boolean isFirstRiftHerald() {
        return firstRiftHerald;
    }

    public boolean isFirstTower() {
        return firstTower;
    }

    @Override
    public String toString() {
        return "TeamStats{" +
                "bans=" + bans +
                ", baronKills=" + baronKills +
                ", dominionVictoryScore=" + dominionVictoryScore +
                ", dragonKills=" + dragonKills +
                ", firstBaron=" + firstBaron +
                ", firstBlood=" + firstBlood +
                ", firstDragon=" + firstDragon +
                ", firstInhibitor=" + firstInhibitor +
                ", firstRiftHerald=" + firstRiftHerald +
                ", firstTower=" + firstTower +
                ", inhibitorKills=" + inhibitorKills +
                ", riftHeraldKills=" + riftHeraldKills +
                ", teamId=" + teamId +
                ", towerKills=" + towerKills +
                ", vilemawKills=" + vilemawKills +
                ", win='" + win + '\'' +
                '}';
    }
}