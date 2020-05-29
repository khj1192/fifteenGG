package com.kh.fifteenGG.search.model.dao;

import com.kh.fifteenGG.search.model.vo.league.LeagueEntry;
import com.kh.fifteenGG.search.model.vo.match.*;
import com.kh.fifteenGG.search.model.vo.view.MatchKDA;
import com.kh.fifteenGG.search.model.vo.view.TeamView;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class SearchDAO {

    @Autowired
    SqlSessionTemplate sqlSession;

    public int insertMatch(Match match) {
        return sqlSession.insert("match-mapper.insertMatch", match);
    }

    public int insertTeamStats(TeamStats t) {
        return sqlSession.insert("match-mapper.insertTeamStats", t);
    }

    public int insertTeamBans(TeamBans tb) {
        return sqlSession.insert("match-mapper.insertTeamBans", tb);
    }

    public int insertParticipantIdentity(ParticipantIdentity p) {
        return sqlSession.insert("match-mapper.insertParticipantIdentity", p);
    }

    public int insertPlayer(Player player) {
        return sqlSession.insert("match-mapper.insertPlayer", player);
    }

    public int insertParticipant(Participant p) {
        return sqlSession.insert("match-mapper.insertParticipant", p);
    }

    public int insertParticipantStats(ParticipantStats stats) {
        return sqlSession.insert("match-mapper.insertParticipantStats", stats);
    }

    public int insertParticipantTimeline(ParticipantTimeline timeline) {
        return sqlSession.insert("match-mapper.insertParticipantTimeline", timeline);
    }

    public int checkMatch(HashMap<String, Object> hmap) {
        sqlSession.selectOne("match-mapper.checkMatch", hmap);
        return (int) hmap.get("result");
    }

    public List<String> selectMatchList(String summonerName, int cPage, int endPage) {

        HashMap<String, Object> hmap = new HashMap<>();

        hmap.put("summonerName", summonerName);
        hmap.put("cPage", cPage);
        hmap.put("endPage", endPage);

        return sqlSession.selectList("match-mapper.selectMatchList", hmap);
    }

    public int insertTimeLine(MatchPosition position) {
        return sqlSession.insert("match-mapper.insertTimeLine", position);
    }

    public List<TeamView> selectTeam(String gameid) {
        return sqlSession.selectList("match-mapper.selectTeam", gameid);
    }

    public int deleteLeagueEntry(String summonerName) {
        return sqlSession.delete("match-mapper.deleteLeagueEntry", summonerName);
    }

    public int insertLeagueEntry(LeagueEntry leagueEntry) {
        return sqlSession.insert("match-mapper.insertLeagueEntry", leagueEntry);
    }

    public List<MatchKDA> selectMyStat(String summonerName) {

        return sqlSession.selectList("match-mapper.selectMyStat", summonerName);
    }

    public List<Object> selectMostChamp(String summonerName) {
        return sqlSession.selectList("match-mapper.selectMostChamp", summonerName);
    }

    public List<Object> selectMostQueueId(String summonerName) {

        List<Object> list = sqlSession.selectList("match-mapper.selectMostQueueId", summonerName);

        System.out.println(list.toString());

        return list;
    }

    public List<Object> selectMostPosition(String summonerName) {
        List<Object> list = sqlSession.selectList("match-mapper.selectMostPosition", summonerName);
        System.out.println(list.toString());
        return list;

    }


//    public int inesertChampList(StaticChampion staticChampion) {
//        return sqlSession.insert("match-mapper.inesertChampList", staticChampion);
//    }


}
