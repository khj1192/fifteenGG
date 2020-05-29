package com.kh.fifteenGG.search.model.vo.view;

import java.io.Serializable;

public class TeamView implements Serializable {

    private String summonerName, position, champion, champName, ChampFullImg;
    private String spell1Id, spell2Id, teamId, item0, item1, item2, item3, item4, item5, item6;
    private int kills, deaths, assists;
    private float totalMinionKilled;
    private boolean win;
    private String perk0, perkSubStyle;
    private long gameDuration, gameCreation;
    private String queueName;

    public TeamView() {
    }

    public TeamView(String summonerName, String position, String champion, String champName, String champFullImg, String spell1Id, String spell2Id, String teamId, String item0, String item1, String item2, String item3, String item4, String item5, String item6, int kills, int deaths, int assists, float totalMinionKilled, boolean win, String perk0, String perkSubStyle, long gameDuration, long gameCreation, String queueName) {
        this.summonerName = summonerName;
        this.position = position;
        this.champion = champion;
        this.champName = champName;
        ChampFullImg = champFullImg;
        this.spell1Id = spell1Id;
        this.spell2Id = spell2Id;
        this.teamId = teamId;
        this.item0 = item0;
        this.item1 = item1;
        this.item2 = item2;
        this.item3 = item3;
        this.item4 = item4;
        this.item5 = item5;
        this.item6 = item6;
        this.kills = kills;
        this.deaths = deaths;
        this.assists = assists;
        this.totalMinionKilled = totalMinionKilled;
        this.win = win;
        this.perk0 = perk0;
        this.perkSubStyle = perkSubStyle;
        this.gameDuration = gameDuration;
        this.gameCreation = gameCreation;
        this.queueName = queueName;
    }

    @Override
    public String toString() {
        return "TeamView{" +
                "summonerName='" + summonerName + '\'' +
                ", position='" + position + '\'' +
                ", champion='" + champion + '\'' +
                ", champName='" + champName + '\'' +
                ", ChampFullImg='" + ChampFullImg + '\'' +
                ", spell1Id='" + spell1Id + '\'' +
                ", spell2Id='" + spell2Id + '\'' +
                ", teamId='" + teamId + '\'' +
                ", item0='" + item0 + '\'' +
                ", item1='" + item1 + '\'' +
                ", item2='" + item2 + '\'' +
                ", item3='" + item3 + '\'' +
                ", item4='" + item4 + '\'' +
                ", item5='" + item5 + '\'' +
                ", item6='" + item6 + '\'' +
                ", kills=" + kills +
                ", deaths=" + deaths +
                ", assists=" + assists +
                ", totalMinionKilled=" + totalMinionKilled +
                ", win=" + win +
                ", perk0='" + perk0 + '\'' +
                ", perkSubStyle='" + perkSubStyle + '\'' +
                ", gameDuration=" + gameDuration +
                ", gameCreation=" + gameCreation +
                ", queueName='" + queueName + '\'' +
                '}';
    }

    public String getQueueName() {
        return queueName;
    }

    public void setQueueName(String queueName) {
        this.queueName = queueName;
    }

    public String getSummonerName() {
        return summonerName;
    }

    public void setSummonerName(String summonerName) {
        this.summonerName = summonerName;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getChampion() {
        return champion;
    }

    public void setChampion(String champion) {
        this.champion = champion;
    }

    public String getChampName() {
        return champName;
    }

    public void setChampName(String champName) {
        this.champName = champName;
    }

    public String getChampFullImg() {
        return ChampFullImg;
    }

    public void setChampFullImg(String champFullImg) {
        ChampFullImg = champFullImg;
    }

    public String getSpell1Id() {
        return spell1Id;
    }

    public void setSpell1Id(String spell1Id) {
        this.spell1Id = spell1Id;
    }

    public String getSpell2Id() {
        return spell2Id;
    }

    public void setSpell2Id(String spell2Id) {
        this.spell2Id = spell2Id;
    }

    public String getTeamId() {
        return teamId;
    }

    public void setTeamId(String teamId) {
        this.teamId = teamId;
    }

    public String getItem0() {
        return item0;
    }

    public void setItem0(String item0) {
        this.item0 = item0;
    }

    public String getItem1() {
        return item1;
    }

    public void setItem1(String item1) {
        this.item1 = item1;
    }

    public String getItem2() {
        return item2;
    }

    public void setItem2(String item2) {
        this.item2 = item2;
    }

    public String getItem3() {
        return item3;
    }

    public void setItem3(String item3) {
        this.item3 = item3;
    }

    public String getItem4() {
        return item4;
    }

    public void setItem4(String item4) {
        this.item4 = item4;
    }

    public String getItem5() {
        return item5;
    }

    public void setItem5(String item5) {
        this.item5 = item5;
    }

    public String getItem6() {
        return item6;
    }

    public void setItem6(String item6) {
        this.item6 = item6;
    }

    public int getKills() {
        return kills;
    }

    public void setKills(int kills) {
        this.kills = kills;
    }

    public int getDeaths() {
        return deaths;
    }

    public void setDeaths(int deaths) {
        this.deaths = deaths;
    }

    public int getAssists() {
        return assists;
    }

    public void setAssists(int assists) {
        this.assists = assists;
    }

    public float getTotalMinionKilled() {
        return totalMinionKilled;
    }

    public void setTotalMinionKilled(float totalMinionKilled) {
        this.totalMinionKilled = totalMinionKilled;
    }

    public boolean isWin() {
        return win;
    }

    public void setWin(boolean win) {
        this.win = win;
    }

    public String getPerk0() {
        return perk0;
    }

    public void setPerk0(String perk0) {
        this.perk0 = perk0;
    }

    public String getPerkSubStyle() {
        return perkSubStyle;
    }

    public void setPerkSubStyle(String perkSubStyle) {
        this.perkSubStyle = perkSubStyle;
    }

    public long getGameDuration() {
        return gameDuration;
    }

    public void setGameDuration(long gameDuration) {
        this.gameDuration = gameDuration;
    }

    public long getGameCreation() {
        return gameCreation;
    }

    public void setGameCreation(long gameCreation) {
        this.gameCreation = gameCreation;
    }
}
