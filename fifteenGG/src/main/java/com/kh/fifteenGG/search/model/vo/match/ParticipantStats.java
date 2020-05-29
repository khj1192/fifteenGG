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

public class ParticipantStats implements Serializable {

    private static final long serialVersionUID = 7907342025148370788L;

    private long gameId;
    private int altarsCaptured;
    private int altarsNeutralized;
    private int assists;
    private int champLevel;
    private int combatPlayerScore;
    private long damageDealtToObjectives;
    private long damageDealtToTurrets;
    private long damageSelfMitigated;
    private int deaths;
    private int doubleKills;
    private boolean firstBloodAssist;
    private boolean firstBloodKill;
    private boolean firstInhibitorAssist;
    private boolean firstInhibitorKill;
    private boolean firstTowerAssist;
    private boolean firstTowerKill;
    private int goldEarned;
    private int goldSpent;
    private int inhibitorKills; //
    private int item0;
    private int item1;
    private int item2;
    private int item3;
    private int item4;
    private int item5;
    private int item6;
    private int killingSprees;
    private int kills;
    private int largestCriticalStrike;
    private int largestKillingSpree;
    private int largestMultiKill;
    private int longestTimeSpentLiving;
    private long magicDamageDealt;
    private long magicDamageDealtToChampions; //
    private long magicalDamageTaken;
    private int neutralMinionsKilled;
    private int neutralMinionsKilledEnemyJungle;
    private int neutralMinionsKilledTeamJungle;
    private int nodeCapture;
    private int nodeCaptureAssist;
    private int nodeNeutralize;
    private int nodeNeutralizeAssist;
    private int objectivePlayerScore;
    private int participantId;
    private int pentaKills;
    private long physicalDamageDealt;
    private long physicalDamageDealtToChampions;
    private long physicalDamageTaken;
    private int quadraKills; //
    private int sightWardsBoughtInGame;
    private int teamObjective;
    private int timeCCingOthers;
    private long totalDamageDealt;
    private long totalDamageDealtToChampions;
    private long totalDamageTaken;
    private long totalHeal;
    private int totalMinionsKilled;
    private int totalPlayerScore;
    private int totalScoreRank; //
    private int totalTimeCrowdControlDealt;
    private int totalUnitsHealed;
    private int tripleKills;
    private long trueDamageDealt;
    private long trueDamageDealtToChampions;
    private long trueDamageTaken;
    private int turretKills;
    private int unrealKills;
    private long visionScore;
    private int visionWardsBoughtInGame;
    private int wardsKilled;
    private int wardsPlaced;
    private boolean win;
    private int perk0;
    private int perk1; //
    private int perk2;
    private int perk3;
    private int perk4;
    private int perk5;
    private long perk0Var1;
    private long perk0Var2;
    private long perk0Var3;
    private long perk1Var1;
    private long perk1Var2;
    private long perk1Var3;
    private long perk2Var1;
    private long perk2Var2;
    private long perk2Var3;
    private long perk3Var1;
    private long perk3Var2;
    private long perk3Var3;
    private long perk4Var1;
    private long perk4Var2;
    private long perk4Var3;
    private long perk5Var1; //
    private long perk5Var2;
    private long perk5Var3;
    private long playerScore0;
    private long playerScore1;
    private long playerScore2;
    private long playerScore3;
    private long playerScore4;
    private long playerScore5;
    private long playerScore6;
    private long playerScore7;
    private long playerScore8;
    private long playerScore9;
    private int perkPrimaryStyle;
    private int perkSubStyle;
    private int statPerk0;
    private int statPerk1;
    private int statPerk2;
    private int position;

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }



    public int getAltarsCaptured() {
        return altarsCaptured;
    }

    public int getAltarsNeutralized() {
        return altarsNeutralized;
    }

    public int getAssists() {
        return assists;
    }

    public int getChampLevel() {
        return champLevel;
    }

    public int getCombatPlayerScore() {
        return combatPlayerScore;
    }

    public long getDamageDealtToObjectives() {
        return damageDealtToObjectives;
    }

    public long getDamageDealtToTurrets() {
        return damageDealtToTurrets;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public long getGameId() {
        return gameId;
    }

    public void setGameId(long gameId) {
        this.gameId = gameId;
    }

    public void setAltarsCaptured(int altarsCaptured) {
        this.altarsCaptured = altarsCaptured;
    }

    public void setAltarsNeutralized(int altarsNeutralized) {
        this.altarsNeutralized = altarsNeutralized;
    }

    public void setAssists(int assists) {
        this.assists = assists;
    }

    public void setChampLevel(int champLevel) {
        this.champLevel = champLevel;
    }

    public void setCombatPlayerScore(int combatPlayerScore) {
        this.combatPlayerScore = combatPlayerScore;
    }

    public void setDamageDealtToObjectives(long damageDealtToObjectives) {
        this.damageDealtToObjectives = damageDealtToObjectives;
    }

    public void setDamageDealtToTurrets(long damageDealtToTurrets) {
        this.damageDealtToTurrets = damageDealtToTurrets;
    }

    public void setDamageSelfMitigated(long damageSelfMitigated) {
        this.damageSelfMitigated = damageSelfMitigated;
    }

    public void setDeaths(int deaths) {
        this.deaths = deaths;
    }

    public void setDoubleKills(int doubleKills) {
        this.doubleKills = doubleKills;
    }

    public void setFirstBloodAssist(boolean firstBloodAssist) {
        this.firstBloodAssist = firstBloodAssist;
    }

    public void setFirstBloodKill(boolean firstBloodKill) {
        this.firstBloodKill = firstBloodKill;
    }

    public void setFirstInhibitorAssist(boolean firstInhibitorAssist) {
        this.firstInhibitorAssist = firstInhibitorAssist;
    }

    public void setFirstInhibitorKill(boolean firstInhibitorKill) {
        this.firstInhibitorKill = firstInhibitorKill;
    }

    public void setFirstTowerAssist(boolean firstTowerAssist) {
        this.firstTowerAssist = firstTowerAssist;
    }

    public void setFirstTowerKill(boolean firstTowerKill) {
        this.firstTowerKill = firstTowerKill;
    }

    public void setGoldEarned(int goldEarned) {
        this.goldEarned = goldEarned;
    }

    public void setGoldSpent(int goldSpent) {
        this.goldSpent = goldSpent;
    }

    public void setInhibitorKills(int inhibitorKills) {
        this.inhibitorKills = inhibitorKills;
    }

    public void setItem0(int item0) {
        this.item0 = item0;
    }

    public void setItem1(int item1) {
        this.item1 = item1;
    }

    public void setItem2(int item2) {
        this.item2 = item2;
    }

    public void setItem3(int item3) {
        this.item3 = item3;
    }

    public void setItem4(int item4) {
        this.item4 = item4;
    }

    public void setItem5(int item5) {
        this.item5 = item5;
    }

    public void setItem6(int item6) {
        this.item6 = item6;
    }

    public void setKillingSprees(int killingSprees) {
        this.killingSprees = killingSprees;
    }

    public void setKills(int kills) {
        this.kills = kills;
    }

    public void setLargestCriticalStrike(int largestCriticalStrike) {
        this.largestCriticalStrike = largestCriticalStrike;
    }

    public void setLargestKillingSpree(int largestKillingSpree) {
        this.largestKillingSpree = largestKillingSpree;
    }

    public void setLargestMultiKill(int largestMultiKill) {
        this.largestMultiKill = largestMultiKill;
    }

    public void setLongestTimeSpentLiving(int longestTimeSpentLiving) {
        this.longestTimeSpentLiving = longestTimeSpentLiving;
    }

    public void setMagicDamageDealt(long magicDamageDealt) {
        this.magicDamageDealt = magicDamageDealt;
    }

    public void setMagicDamageDealtToChampions(long magicDamageDealtToChampions) {
        this.magicDamageDealtToChampions = magicDamageDealtToChampions;
    }

    public void setMagicalDamageTaken(long magicalDamageTaken) {
        this.magicalDamageTaken = magicalDamageTaken;
    }

    public void setNeutralMinionsKilled(int neutralMinionsKilled) {
        this.neutralMinionsKilled = neutralMinionsKilled;
    }

    public void setNeutralMinionsKilledEnemyJungle(int neutralMinionsKilledEnemyJungle) {
        this.neutralMinionsKilledEnemyJungle = neutralMinionsKilledEnemyJungle;
    }

    public void setNeutralMinionsKilledTeamJungle(int neutralMinionsKilledTeamJungle) {
        this.neutralMinionsKilledTeamJungle = neutralMinionsKilledTeamJungle;
    }

    public void setNodeCapture(int nodeCapture) {
        this.nodeCapture = nodeCapture;
    }

    public void setNodeCaptureAssist(int nodeCaptureAssist) {
        this.nodeCaptureAssist = nodeCaptureAssist;
    }

    public void setNodeNeutralize(int nodeNeutralize) {
        this.nodeNeutralize = nodeNeutralize;
    }

    public void setNodeNeutralizeAssist(int nodeNeutralizeAssist) {
        this.nodeNeutralizeAssist = nodeNeutralizeAssist;
    }

    public void setObjectivePlayerScore(int objectivePlayerScore) {
        this.objectivePlayerScore = objectivePlayerScore;
    }

    public void setParticipantId(int participantId) {
        this.participantId = participantId;
    }

    public void setPentaKills(int pentaKills) {
        this.pentaKills = pentaKills;
    }

    public void setPhysicalDamageDealt(long physicalDamageDealt) {
        this.physicalDamageDealt = physicalDamageDealt;
    }

    public void setPhysicalDamageDealtToChampions(long physicalDamageDealtToChampions) {
        this.physicalDamageDealtToChampions = physicalDamageDealtToChampions;
    }

    public void setPhysicalDamageTaken(long physicalDamageTaken) {
        this.physicalDamageTaken = physicalDamageTaken;
    }

    public void setQuadraKills(int quadraKills) {
        this.quadraKills = quadraKills;
    }

    public void setSightWardsBoughtInGame(int sightWardsBoughtInGame) {
        this.sightWardsBoughtInGame = sightWardsBoughtInGame;
    }

    public void setTeamObjective(int teamObjective) {
        this.teamObjective = teamObjective;
    }

    public void setTimeCCingOthers(int timeCCingOthers) {
        this.timeCCingOthers = timeCCingOthers;
    }

    public void setTotalDamageDealt(long totalDamageDealt) {
        this.totalDamageDealt = totalDamageDealt;
    }

    public void setTotalDamageDealtToChampions(long totalDamageDealtToChampions) {
        this.totalDamageDealtToChampions = totalDamageDealtToChampions;
    }

    public void setTotalDamageTaken(long totalDamageTaken) {
        this.totalDamageTaken = totalDamageTaken;
    }

    public void setTotalHeal(long totalHeal) {
        this.totalHeal = totalHeal;
    }

    public void setTotalMinionsKilled(int totalMinionsKilled) {
        this.totalMinionsKilled = totalMinionsKilled;
    }

    public void setTotalPlayerScore(int totalPlayerScore) {
        this.totalPlayerScore = totalPlayerScore;
    }

    public void setTotalScoreRank(int totalScoreRank) {
        this.totalScoreRank = totalScoreRank;
    }

    public void setTotalTimeCrowdControlDealt(int totalTimeCrowdControlDealt) {
        this.totalTimeCrowdControlDealt = totalTimeCrowdControlDealt;
    }

    public void setTotalUnitsHealed(int totalUnitsHealed) {
        this.totalUnitsHealed = totalUnitsHealed;
    }

    public void setTripleKills(int tripleKills) {
        this.tripleKills = tripleKills;
    }

    public void setTrueDamageDealt(long trueDamageDealt) {
        this.trueDamageDealt = trueDamageDealt;
    }

    public void setTrueDamageDealtToChampions(long trueDamageDealtToChampions) {
        this.trueDamageDealtToChampions = trueDamageDealtToChampions;
    }

    public void setTrueDamageTaken(long trueDamageTaken) {
        this.trueDamageTaken = trueDamageTaken;
    }

    public void setTurretKills(int turretKills) {
        this.turretKills = turretKills;
    }

    public void setUnrealKills(int unrealKills) {
        this.unrealKills = unrealKills;
    }

    public void setVisionScore(long visionScore) {
        this.visionScore = visionScore;
    }

    public void setVisionWardsBoughtInGame(int visionWardsBoughtInGame) {
        this.visionWardsBoughtInGame = visionWardsBoughtInGame;
    }

    public void setWardsKilled(int wardsKilled) {
        this.wardsKilled = wardsKilled;
    }

    public void setWardsPlaced(int wardsPlaced) {
        this.wardsPlaced = wardsPlaced;
    }

    public void setWin(boolean win) {
        this.win = win;
    }

    public void setPerk0(int perk0) {
        this.perk0 = perk0;
    }

    public void setPerk1(int perk1) {
        this.perk1 = perk1;
    }

    public void setPerk2(int perk2) {
        this.perk2 = perk2;
    }

    public void setPerk3(int perk3) {
        this.perk3 = perk3;
    }

    public void setPerk4(int perk4) {
        this.perk4 = perk4;
    }

    public void setPerk5(int perk5) {
        this.perk5 = perk5;
    }

    public void setPerk0Var1(long perk0Var1) {
        this.perk0Var1 = perk0Var1;
    }

    public void setPerk0Var2(long perk0Var2) {
        this.perk0Var2 = perk0Var2;
    }

    public void setPerk0Var3(long perk0Var3) {
        this.perk0Var3 = perk0Var3;
    }

    public void setPerk1Var1(long perk1Var1) {
        this.perk1Var1 = perk1Var1;
    }

    public void setPerk1Var2(long perk1Var2) {
        this.perk1Var2 = perk1Var2;
    }

    public void setPerk1Var3(long perk1Var3) {
        this.perk1Var3 = perk1Var3;
    }

    public void setPerk2Var1(long perk2Var1) {
        this.perk2Var1 = perk2Var1;
    }

    public void setPerk2Var2(long perk2Var2) {
        this.perk2Var2 = perk2Var2;
    }

    public void setPerk2Var3(long perk2Var3) {
        this.perk2Var3 = perk2Var3;
    }

    public void setPerk3Var1(long perk3Var1) {
        this.perk3Var1 = perk3Var1;
    }

    public void setPerk3Var2(long perk3Var2) {
        this.perk3Var2 = perk3Var2;
    }

    public void setPerk3Var3(long perk3Var3) {
        this.perk3Var3 = perk3Var3;
    }

    public void setPerk4Var1(long perk4Var1) {
        this.perk4Var1 = perk4Var1;
    }

    public void setPerk4Var2(long perk4Var2) {
        this.perk4Var2 = perk4Var2;
    }

    public void setPerk4Var3(long perk4Var3) {
        this.perk4Var3 = perk4Var3;
    }

    public void setPerk5Var1(long perk5Var1) {
        this.perk5Var1 = perk5Var1;
    }

    public void setPerk5Var2(long perk5Var2) {
        this.perk5Var2 = perk5Var2;
    }

    public void setPerk5Var3(long perk5Var3) {
        this.perk5Var3 = perk5Var3;
    }

    public void setPlayerScore0(long playerScore0) {
        this.playerScore0 = playerScore0;
    }

    public void setPlayerScore1(long playerScore1) {
        this.playerScore1 = playerScore1;
    }

    public void setPlayerScore2(long playerScore2) {
        this.playerScore2 = playerScore2;
    }

    public void setPlayerScore3(long playerScore3) {
        this.playerScore3 = playerScore3;
    }

    public void setPlayerScore4(long playerScore4) {
        this.playerScore4 = playerScore4;
    }

    public void setPlayerScore5(long playerScore5) {
        this.playerScore5 = playerScore5;
    }

    public void setPlayerScore6(long playerScore6) {
        this.playerScore6 = playerScore6;
    }

    public void setPlayerScore7(long playerScore7) {
        this.playerScore7 = playerScore7;
    }

    public void setPlayerScore8(long playerScore8) {
        this.playerScore8 = playerScore8;
    }

    public void setPlayerScore9(long playerScore9) {
        this.playerScore9 = playerScore9;
    }

    public void setPerkPrimaryStyle(int perkPrimaryStyle) {
        this.perkPrimaryStyle = perkPrimaryStyle;
    }

    public void setPerkSubStyle(int perkSubStyle) {
        this.perkSubStyle = perkSubStyle;
    }

    public void setStatPerk0(int statPerk0) {
        this.statPerk0 = statPerk0;
    }

    public void setStatPerk1(int statPerk1) {
        this.statPerk1 = statPerk1;
    }

    public void setStatPerk2(int statPerk2) {
        this.statPerk2 = statPerk2;
    }

    public long getDamageSelfMitigated() {
        return damageSelfMitigated;
    }

    public int getDeaths() {
        return deaths;
    }

    public int getDoubleKills() {
        return doubleKills;
    }

    public int getGoldEarned() {
        return goldEarned;
    }

    public int getGoldSpent() {
        return goldSpent;
    }

    public int getInhibitorKills() {
        return inhibitorKills;
    }

    public int getItem0() {
        return item0;
    }

    public int getItem1() {
        return item1;
    }

    public int getItem2() {
        return item2;
    }

    public int getItem3() {
        return item3;
    }

    public int getItem4() {
        return item4;
    }

    public int getItem5() {
        return item5;
    }

    public int getItem6() {
        return item6;
    }

    public int getKillingSprees() {
        return killingSprees;
    }

    public int getKills() {
        return kills;
    }

    public int getLargestCriticalStrike() {
        return largestCriticalStrike;
    }

    public int getLargestKillingSpree() {
        return largestKillingSpree;
    }

    public int getLargestMultiKill() {
        return largestMultiKill;
    }

    public int getLongestTimeSpentLiving() {
        return longestTimeSpentLiving;
    }

    public long getMagicDamageDealt() {
        return magicDamageDealt;
    }

    public long getMagicDamageDealtToChampions() {
        return magicDamageDealtToChampions;
    }

    public long getMagicalDamageTaken() {
        return magicalDamageTaken;
    }

    public int getNeutralMinionsKilled() {
        return neutralMinionsKilled;
    }

    public int getNeutralMinionsKilledEnemyJungle() {
        return neutralMinionsKilledEnemyJungle;
    }

    public int getNeutralMinionsKilledTeamJungle() {
        return neutralMinionsKilledTeamJungle;
    }

    public int getNodeCapture() {
        return nodeCapture;
    }

    public int getNodeCaptureAssist() {
        return nodeCaptureAssist;
    }

    public int getNodeNeutralize() {
        return nodeNeutralize;
    }

    public int getNodeNeutralizeAssist() {
        return nodeNeutralizeAssist;
    }

    public int getObjectivePlayerScore() {
        return objectivePlayerScore;
    }

    public int getParticipantId() {
        return participantId;
    }

    public int getPentaKills() {
        return pentaKills;
    }

    public long getPhysicalDamageDealt() {
        return physicalDamageDealt;
    }

    public long getPhysicalDamageDealtToChampions() {
        return physicalDamageDealtToChampions;
    }

    public long getPhysicalDamageTaken() {
        return physicalDamageTaken;
    }

    public int getQuadraKills() {
        return quadraKills;
    }

    public int getSightWardsBoughtInGame() {
        return sightWardsBoughtInGame;
    }

    public int getTeamObjective() {
        return teamObjective;
    }

    public int getTimeCCingOthers() {
        return timeCCingOthers;
    }

    public long getTotalDamageDealt() {
        return totalDamageDealt;
    }

    public long getTotalDamageDealtToChampions() {
        return totalDamageDealtToChampions;
    }

    public long getTotalDamageTaken() {
        return totalDamageTaken;
    }

    public long getTotalHeal() {
        return totalHeal;
    }

    public int getTotalMinionsKilled() {
        return totalMinionsKilled;
    }

    public int getTotalPlayerScore() {
        return totalPlayerScore;
    }

    public int getTotalScoreRank() {
        return totalScoreRank;
    }

    public int getTotalTimeCrowdControlDealt() {
        return totalTimeCrowdControlDealt;
    }

    public int getTotalUnitsHealed() {
        return totalUnitsHealed;
    }

    public int getTripleKills() {
        return tripleKills;
    }

    public long getTrueDamageDealt() {
        return trueDamageDealt;
    }

    public long getTrueDamageDealtToChampions() {
        return trueDamageDealtToChampions;
    }

    public long getTrueDamageTaken() {
        return trueDamageTaken;
    }

    public int getTurretKills() {
        return turretKills;
    }

    public int getUnrealKills() {
        return unrealKills;
    }

    public long getVisionScore() {
        return visionScore;
    }

    public int getVisionWardsBoughtInGame() {
        return visionWardsBoughtInGame;
    }

    public int getWardsKilled() {
        return wardsKilled;
    }

    public int getWardsPlaced() {
        return wardsPlaced;
    }

    public boolean isFirstBloodAssist() {
        return firstBloodAssist;
    }

    public boolean isFirstBloodKill() {
        return firstBloodKill;
    }

    public boolean isFirstInhibitorAssist() {
        return firstInhibitorAssist;
    }

    public boolean isFirstInhibitorKill() {
        return firstInhibitorKill;
    }

    public boolean isFirstTowerAssist() {
        return firstTowerAssist;
    }

    public boolean isFirstTowerKill() {
        return firstTowerKill;
    }

    public boolean isWin() {
        return win;
    }

    public int getPerk0() {
        return perk0;
    }

    public int getPerk1() {
        return perk1;
    }

    public int getPerk2() {
        return perk2;
    }

    public int getPerk3() {
        return perk3;
    }

    public int getPerk4() {
        return perk4;
    }

    public int getPerk5() {
        return perk5;
    }

    public long getPerk0Var1() {
        return perk0Var1;
    }

    public long getPerk0Var2() {
        return perk0Var2;
    }

    public long getPerk0Var3() {
        return perk0Var3;
    }

    public long getPerk1Var1() {
        return perk1Var1;
    }

    public long getPerk1Var2() {
        return perk1Var2;
    }

    public long getPerk1Var3() {
        return perk1Var3;
    }

    public long getPerk2Var1() {
        return perk2Var1;
    }

    public long getPerk2Var2() {
        return perk2Var2;
    }

    public long getPerk2Var3() {
        return perk2Var3;
    }

    public long getPerk3Var1() {
        return perk3Var1;
    }

    public long getPerk3Var2() {
        return perk3Var2;
    }

    public long getPerk3Var3() {
        return perk3Var3;
    }

    public long getPerk4Var1() {
        return perk4Var1;
    }

    public long getPerk4Var2() {
        return perk4Var2;
    }

    public long getPerk4Var3() {
        return perk4Var3;
    }

    public long getPerk5Var1() {
        return perk5Var1;
    }

    public long getPerk5Var2() {
        return perk5Var2;
    }

    public long getPerk5Var3() {
        return perk5Var3;
    }

    public long getPlayerScore0() {
        return playerScore0;
    }

    public long getPlayerScore1() {
        return playerScore1;
    }

    public long getPlayerScore2() {
        return playerScore2;
    }

    public long getPlayerScore3() {
        return playerScore3;
    }

    public long getPlayerScore4() {
        return playerScore4;
    }

    public long getPlayerScore5() {
        return playerScore5;
    }

    public long getPlayerScore6() {
        return playerScore6;
    }

    public long getPlayerScore7() {
        return playerScore7;
    }

    public long getPlayerScore8() {
        return playerScore8;
    }

    public long getPlayerScore9() {
        return playerScore9;
    }

    public int getPerkPrimaryStyle() {
        return perkPrimaryStyle;
    }

    public int getPerkSubStyle() {
        return perkSubStyle;
    }

    public int getStatPerk0() {
        return statPerk0;
    }

    public int getStatPerk1() {
        return statPerk1;
    }

    public int getStatPerk2() {
        return statPerk2;
    }

    @Override
    public String toString() {
        return "ParticipantStats{" +
                "altarsCaptured=" + altarsCaptured +
                ", altarsNeutralized=" + altarsNeutralized +
                ", assists=" + assists +
                ", champLevel=" + champLevel +
                ", combatPlayerScore=" + combatPlayerScore +
                ", damageDealtToObjectives=" + damageDealtToObjectives +
                ", damageDealtToTurrets=" + damageDealtToTurrets +
                ", damageSelfMitigated=" + damageSelfMitigated +
                ", deaths=" + deaths +
                ", doubleKills=" + doubleKills +
                ", firstBloodAssist=" + firstBloodAssist +
                ", firstBloodKill=" + firstBloodKill +
                ", firstInhibitorAssist=" + firstInhibitorAssist +
                ", firstInhibitorKill=" + firstInhibitorKill +
                ", firstTowerAssist=" + firstTowerAssist +
                ", firstTowerKill=" + firstTowerKill +
                ", goldEarned=" + goldEarned +
                ", goldSpent=" + goldSpent +
                ", inhibitorKills=" + inhibitorKills +
                ", item0=" + item0 +
                ", item1=" + item1 +
                ", item2=" + item2 +
                ", item3=" + item3 +
                ", item4=" + item4 +
                ", item5=" + item5 +
                ", item6=" + item6 +
                ", killingSprees=" + killingSprees +
                ", kills=" + kills +
                ", largestCriticalStrike=" + largestCriticalStrike +
                ", largestKillingSpree=" + largestKillingSpree +
                ", largestMultiKill=" + largestMultiKill +
                ", longestTimeSpentLiving=" + longestTimeSpentLiving +
                ", magicDamageDealt=" + magicDamageDealt +
                ", magicDamageDealtToChampions=" + magicDamageDealtToChampions +
                ", magicalDamageTaken=" + magicalDamageTaken +
                ", neutralMinionsKilled=" + neutralMinionsKilled +
                ", neutralMinionsKilledEnemyJungle=" + neutralMinionsKilledEnemyJungle +
                ", neutralMinionsKilledTeamJungle=" + neutralMinionsKilledTeamJungle +
                ", nodeCapture=" + nodeCapture +
                ", nodeCaptureAssist=" + nodeCaptureAssist +
                ", nodeNeutralize=" + nodeNeutralize +
                ", nodeNeutralizeAssist=" + nodeNeutralizeAssist +
                ", objectivePlayerScore=" + objectivePlayerScore +
                ", participantId=" + participantId +
                ", pentaKills=" + pentaKills +
                ", physicalDamageDealt=" + physicalDamageDealt +
                ", physicalDamageDealtToChampions=" + physicalDamageDealtToChampions +
                ", physicalDamageTaken=" + physicalDamageTaken +
                ", quadraKills=" + quadraKills +
                ", sightWardsBoughtInGame=" + sightWardsBoughtInGame +
                ", teamObjective=" + teamObjective +
                ", timeCCingOthers=" + timeCCingOthers +
                ", totalDamageDealt=" + totalDamageDealt +
                ", totalDamageDealtToChampions=" + totalDamageDealtToChampions +
                ", totalDamageTaken=" + totalDamageTaken +
                ", totalHeal=" + totalHeal +
                ", totalMinionsKilled=" + totalMinionsKilled +
                ", totalPlayerScore=" + totalPlayerScore +
                ", totalScoreRank=" + totalScoreRank +
                ", totalTimeCrowdControlDealt=" + totalTimeCrowdControlDealt +
                ", totalUnitsHealed=" + totalUnitsHealed +
                ", tripleKills=" + tripleKills +
                ", trueDamageDealt=" + trueDamageDealt +
                ", trueDamageDealtToChampions=" + trueDamageDealtToChampions +
                ", trueDamageTaken=" + trueDamageTaken +
                ", turretKills=" + turretKills +
                ", unrealKills=" + unrealKills +
                ", visionScore=" + visionScore +
                ", visionWardsBoughtInGame=" + visionWardsBoughtInGame +
                ", wardsKilled=" + wardsKilled +
                ", wardsPlaced=" + wardsPlaced +
                ", win=" + win +
                ", perk0=" + perk0 +
                ", perk1=" + perk1 +
                ", perk2=" + perk2 +
                ", perk3=" + perk3 +
                ", perk4=" + perk4 +
                ", perk5=" + perk5 +
                ", perk0Var1=" + perk0Var1 +
                ", perk0Var2=" + perk0Var2 +
                ", perk0Var3=" + perk0Var3 +
                ", perk1Var1=" + perk1Var1 +
                ", perk1Var2=" + perk1Var2 +
                ", perk1Var3=" + perk1Var3 +
                ", perk2Var1=" + perk2Var1 +
                ", perk2Var2=" + perk2Var2 +
                ", perk2Var3=" + perk2Var3 +
                ", perk3Var1=" + perk3Var1 +
                ", perk3Var2=" + perk3Var2 +
                ", perk3Var3=" + perk3Var3 +
                ", perk4Var1=" + perk4Var1 +
                ", perk4Var2=" + perk4Var2 +
                ", perk4Var3=" + perk4Var3 +
                ", perk5Var1=" + perk5Var1 +
                ", perk5Var2=" + perk5Var2 +
                ", perk5Var3=" + perk5Var3 +
                ", playerScore0=" + playerScore0 +
                ", playerScore1=" + playerScore1 +
                ", playerScore2=" + playerScore2 +
                ", playerScore3=" + playerScore3 +
                ", playerScore4=" + playerScore4 +
                ", playerScore5=" + playerScore5 +
                ", playerScore6=" + playerScore6 +
                ", playerScore7=" + playerScore7 +
                ", playerScore8=" + playerScore8 +
                ", playerScore9=" + playerScore9 +
                ", perkPrimaryStyle=" + perkPrimaryStyle +
                ", perkSubStyle=" + perkSubStyle +
                ", statPerk0=" + statPerk0 +
                ", statPerk1=" + statPerk1 +
                ", statPerk2=" + statPerk2 +
                '}';
    }
}